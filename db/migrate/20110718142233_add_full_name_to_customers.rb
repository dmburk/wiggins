class AddFullNameToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :full_name, :string
  end

  def self.down
    remove_column :customers, :full_name
  end
end
