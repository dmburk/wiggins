class AddDateColumnToServiceNotes < ActiveRecord::Migration
  def self.up
    add_column :service_notes, :date, :date
  end

  def self.down
    remove_column :service_notes, :date
  end
end
