class BCard < ActiveRecord::Base
  attr_accessible :company, :description

  belongs_to :user
end
