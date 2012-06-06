# == Schema Information
#
# Table name: venues
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  foursquareID    :string(255)
#  lat             :float
#  long            :float
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  slug            :string(255)
#  venue_image_uid :string(255)
#  address         :string(255)
#  city            :string(255)
#  state           :string(255)
#  postalCode      :string(255)
#

class Venue < ActiveRecord::Base
  extend FriendlyId
  
  has_many :drinks, dependent: :destroy
  attr_accessible :name, :foursquareID, :lat, :long, :address, :city, :state, :postalCode, :venue_image
    
  before_save { |venue| venue.foursquareID = foursquareID.downcase }
  
  friendly_id :name, use: :slugged
  image_accessor :venue_image
  acts_as_gmappable lat: 'lat', lng: 'long', process_geocoding: false
  
  validates :name,  presence: true, length: { maximum: 75 }
  validates :foursquareID, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :lat,  presence: true
  validates :long, presence: true
  
  def gmaps4rails_title
    self.name
  end

end
