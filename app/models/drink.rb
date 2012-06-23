# == Schema Information
#
# Table name: drinks
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  venue_id        :integer
#  description     :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  slug            :string(255)
#  drink_image_uid :string(255)
#

class Drink < ActiveRecord::Base
  extend FriendlyId
  
  belongs_to :venue
  attr_accessible :name, :venue_id, :description, :drink_image,
                  :liquor_list, :tag_list, :green_list, :mixer_list
  
  friendly_id :name, use: :slugged
  image_accessor :drink_image

  validates :name,  presence: true, length: { maximum: 75 }
  validates :venue_id, presence: true
  validates :description, length: { maximum: 500 }
  validates :drink_image, presence: true
  
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
