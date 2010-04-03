class RenameReservedName < ActiveRecord::Migration
  def self.up
    remove_column :contacts, :type
    add_column :contacts, :type_name, :string
  end

  def self.down
    add_column :contacts, :type, :string
    remove_column :contacts, :type_name
  end
end
