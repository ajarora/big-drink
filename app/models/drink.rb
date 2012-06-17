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
#  slug        :string(255)
#

class Drink < ActiveRecord::Base
  extend FriendlyId
  
  belongs_to :venue
  attr_accessible :name, :venue_id, :description, :image_url, :drink_image
  
  friendly_id :name, use: :slugged
  image_accessor :drink_image

  validates :name,  presence: true, length: { maximum: 75 }
  validates :venue_id, presence: true
  validates :description, length: { maximum: 500 }
  validates :image_url, length: { maximum: 500 }
  
  default_scope order: 'drinks.created_at DESC'
  
  has_many :consumptions, foreign_key: "drank_id", dependent: :destroy
  has_many :drinkers, through: :reverse_consumptions, source: :drinker
  
  acts_as_taggable
  acts_as_taggable_on :liquors, :tags, :greens, :mixers
  
  def drank_by?(user)
    consumptions.find_by_drinker_id(user.id)
  end
  
  def drink!(user)
    consumptions.create!(drinker_id: user.id)
  end

end
