class PhoneNumber < ActiveRecord::Base
  def generate_pin
  self.pin = rand(0000..9999).to_s.rjust(4, "0")
  save
  end
    def verify(entered_pin)
    update(verified: true) if self.pin == entered_pin
  end
  def twilio_client
  Twilio::REST::Client.new('AC4bd74d3fe3588b36cfb9ab9e1758dba0','98a150ea79a26d593965e7a411457d2d')
  end
  def send_pin
    twilio_client.messages.create(
    to: "+91#{phone_number}",
    from: +12568672955,
    body: "Your PIN is #{pin}"
    )
  end

end
