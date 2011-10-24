class AddColumnInstallDateToUnits < ActiveRecord::Migration
  def self.up
    add_column :units, :install_date, :string
  end

  def self.down
    remove_column :units, :install_date
  end
end
