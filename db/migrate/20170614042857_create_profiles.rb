class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :contact_no
      t.integer :age
      t.string :gender

      t.timestamps null: false
    end
  end
end
