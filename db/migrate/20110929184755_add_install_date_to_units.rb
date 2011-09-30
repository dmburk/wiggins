class AddInstallDateToUnits < ActiveRecord::Migration
  def self.up
    add_column :units, :install_date, :date
  end

  def self.down
    remove_column :units, :install_date
  end
end
