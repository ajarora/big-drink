class AddAddressToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :venue_image_uid,  :string
    add_column :venues, :address,  :string
    add_column :venues, :city,  :string
    add_column :venues, :state,  :string
    add_column :venues, :postalCode,  :string
  end
end