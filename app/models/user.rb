class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = 'login'
  end

  has_many :contacts
  has_many :bussiness_cards, :class_name => 'BCard'
  has_many :lists
end
