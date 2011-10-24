class AddColumnDateToServiceNotes < ActiveRecord::Migration
  def self.up
    add_column :service_notes, :date, :string
  end

  def self.down
    remove_column :service_notes, :date
  end
end
