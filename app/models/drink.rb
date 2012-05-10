# == Schema Information
#
# Table name: drinks
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  venue_id    :integer
#  image_url   :string(255)
#  description :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Drink < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :venue
  
  attr_accessible :name, :venue_id, :description, :image_url

  validates :name,  presence: true, length: { maximum: 75 }
  validates :venue_id, presence: true
  validates :description, length: { maximum: 500 }
  validates :image_url, length: { maximum: 500 }
  
  default_scope order: 'drinks.created_at DESC'
end
