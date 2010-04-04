class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :name
      t.timestamps
    end

    create_table :list_contacts, :id => false do |t|
      t.integer :list_id, :contact_id
    end
  end
  
  def self.down
    drop_table :lists
    drop_table :list_contacts
  end
end
