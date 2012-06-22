# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  fb_uid          :string(255)
#  fb_access_token :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  slug            :string(255)
#  admin           :boolean         default(FALSE)
#

class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :email, :fb_access_token, :fb_uid, :name
  
  has_many :consumptions, foreign_key: "drinker_id", dependent: :destroy
  has_many :drank_drinks, through: :consumptions, source: :drank
  
  validates :name, presence: true, uniqueness: true
  validates :fb_uid, presence: true, uniqueness: true
  validates :fb_access_token, presence: true
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.fb_uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.fb_access_token = auth["credentials"]["token"]
    end
  end
  
  def drank?(drink)
    consumptions.find_by_drank_id(drink.id)
  end

  def drink!(drink)
    consumptions.create!(drank_id: drink.id)
  end
  
  def undrink!(drink)
    consumptions.find_by_drank_id(drink.id).destroy
  end
end
