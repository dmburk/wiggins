class CreateServiceNotes < ActiveRecord::Migration
  def self.up
    create_table :service_notes do |t|
      t.string :note
      t.integer :unit_id

      t.timestamps
    end
  end

  def self.down
    drop_table :service_notes
  end
end
