class RemoveBCardAndAddRelationships < ActiveRecord::Migration
  def self.up
    drop_table(:b_cards)
    add_column :contacts, :company_name, :string
    add_column :contacts, :type, :string

    add_column :addresses, :contact_id, :id
    add_column :phones, :contact_id, :id
    
  end

  def self.down
  end
end
