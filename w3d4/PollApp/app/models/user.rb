class User < ActiveRecord::Base
  validates :user_name, presence: true
  validates :user_name, uniqueness: true

  has_many :responses,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Response

  has_many :polls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Poll

    
end
