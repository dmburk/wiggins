class CreateCustomerNotes < ActiveRecord::Migration
  def self.up
    create_table :customer_notes do |t|
      t.string :note
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_notes
  end
end
