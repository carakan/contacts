class BCard < Contact
  belongs_to :user
  validates_presence_of :company_name

  default_scope :conditions => {:type => 'bussiness'}

  has_many :addressess
  accepts_nested_attributes_for :addressess, :allow_destroy => true

  has_many :phones
  accepts_nested_attributes_for :phones, :allow_destroy => true
end