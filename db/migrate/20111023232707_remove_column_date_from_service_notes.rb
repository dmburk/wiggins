class RemoveColumnDateFromServiceNotes < ActiveRecord::Migration
  def self.up
    remove_column :service_notes, :date
  end

  def self.down
    add_column :service_notes, :date
  end
end
