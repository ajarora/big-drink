# == Schema Information
#
# Table name: venues
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  foursquareID :string(255)
#  lat          :float
#  long         :float
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  slug         :string(255)
#

class Venue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :drinks, dependent: :destroy
  
  attr_accessible :name, :foursquareID, :lat, :long
  
  before_save { |venue| venue.foursquareID = foursquareID.downcase }
  
  validates :name,  presence: true, length: { maximum: 75 }
  validates :foursquareID, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :lat,  presence: true
  validates :long, presence: true
  
  acts_as_gmappable lat: 'lat', lng: 'long', process_geocoding: false
  
  def gmaps4rails_title
    self.name
  end

end