class Consumption < ActiveRecord::Base
  attr_accessible :drank_id, :drinker_id
  
  belongs_to :drinker, class_name: "User"
  belongs_to :drank, class_name: "Drink"
  
  validates :drank_id, presence: true
  validates :drinker_id, presence: true
end
