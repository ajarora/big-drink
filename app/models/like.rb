class Like < ActiveRecord::Base
  attr_accessible :liker_id, :liked_id
  
  belongs_to :liker, class_name: "User"
  belongs_to :liked, class_name: "Drink"
  
  validates :liker_id, presence: true
  validates :liked_id, presence: true
end