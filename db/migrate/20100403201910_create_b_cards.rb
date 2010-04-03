class CreateBCards < ActiveRecord::Migration
  def self.up
    create_table :b_cards do |t|
      t.string :company
      t.text :description
      t.references :user
      t.timestamps
    end
  end
  
  def self.down
    drop_table :b_cards
  end
end
