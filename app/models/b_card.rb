class BCard < Contact
  belongs_to :user
  validates_presence_of :company_name

  default_scope :conditions => {:type_name => 'bussiness'}

  has_many :addresses, :foreign_key => "contact_id"
  accepts_nested_attributes_for :addresses, :allow_destroy => true

  has_many :phones, :foreign_key => "contact_id"
  accepts_nested_attributes_for :phones, :allow_destroy => true

  before_create :assing_to_card


  private
  def assing_to_card
    self.type_name = "bussiness"
  end
end