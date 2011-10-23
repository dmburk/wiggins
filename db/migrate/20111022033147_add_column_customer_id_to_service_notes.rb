class AddColumnCustomerIdToServiceNotes < ActiveRecord::Migration
  def self.up
    add_column :service_notes, :customer_id, :integer
  end

  def self.down
    remove_column :service_notes, :customer_id
  end
end
