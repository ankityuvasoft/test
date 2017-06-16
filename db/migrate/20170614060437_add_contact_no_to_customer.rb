class AddContactNoToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :contact_no, :string
    add_column :customers, :card_no, :integer
    add_column :customers, :cvv, :integer
    add_column :customers, :date, :string
  end
end

