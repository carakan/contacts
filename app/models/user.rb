class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = 'login'
  end

  has_many :contacts
  has_many :b_cards
  
end
