class RemoveUnitIdFromServiceNotes < ActiveRecord::Migration
  def self.up
    remove_column :service_notes, :unit_id
  end

  def self.down
    add_column :service_notes, :unit_id, :integer
  end
end
