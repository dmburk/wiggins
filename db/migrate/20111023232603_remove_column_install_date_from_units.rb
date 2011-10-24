class RemoveColumnInstallDateFromUnits < ActiveRecord::Migration
  def self.up
    remove_column :units, :install_date
  end

  def self.down
    add_column :units, :install_date
  end
end
