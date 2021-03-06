class Contact < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => {:scope => :user_id}

belongs_to :owner,
primary_key: :id,
foreign_key: :user_id,
class_name: :User


end
