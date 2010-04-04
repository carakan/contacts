class List < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many(:contacts, :join_table => "list_contacts")

  belongs_to :user
end
