class Contact < ActiveRecord::Base
  belongs_to :user

  has_attached_file :photo, :styles => { :small => "80x80>" },
    :url  => "/assets/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  has_and_belongs_to_many(:lists, :join_table => "list_contacts")
end
