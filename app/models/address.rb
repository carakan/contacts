class Address < ActiveRecord::Base
  attr_accessible :name, :address

  belongs_to :bussiness_card, :class_name => "BCard", :foreign_key => "contact_id"
end
