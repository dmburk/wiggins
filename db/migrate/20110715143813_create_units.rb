class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.string :model
      t.string :serial_number
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :units
  end
end
