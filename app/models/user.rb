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
#

class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :email, :fb_access_token, :fb_uid, :name
  
  validates :name, presence: true, uniqueness: true
  validates :fb_uid, presence: true, uniqueness: true
  validates :fb_access_token, presence: true
end