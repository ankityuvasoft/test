class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :card_number
      t.string :card_code
      t.string :card_month
      t.string :email

      t.timestamps null: false
    end
  end
end
