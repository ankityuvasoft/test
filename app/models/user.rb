class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_one :profile, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook,:twitter,:google_oauth2,:linkedin]


	def self.from_omniauth(auth)
    debugger
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if auth.provider == "twitter"
        user.email = "#{auth.info.nickname}@example.com"
      else
        user.email = auth.info.email
      end  
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        user.avatar = auth.info.image.gsub("http","https")
      # assuming the user model has an image
    end
  end         
end
