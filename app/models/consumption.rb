# == Schema Information
#
# Table name: consumptions
#
#  id         :integer         not null, primary key
#  drinker_id :integer
#  drank_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Consumption < ActiveRecord::Base
  attr_accessible :drank_id, :drinker_id
  
  belongs_to :drinker, class_name: "User"
  belongs_to :drank, class_name: "Drink"
  
  validates :drank_id, presence: true
  validates :drinker_id, presence: true
end