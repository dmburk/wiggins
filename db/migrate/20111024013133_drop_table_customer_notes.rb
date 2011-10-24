class DropTableCustomerNotes < ActiveRecord::Migration
  def self.up
    drop_table :customer_notes
  end

  def self.down
  end
end
