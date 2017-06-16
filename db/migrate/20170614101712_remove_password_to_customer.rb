class RemovePasswordToCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :password, :string
    add_column :customers, :price, :string
  end
end
