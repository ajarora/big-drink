class AddIndexToVenuesFoursquareId < ActiveRecord::Migration
  def change
    add_index :venues, :foursquareID, unique: true
  end
end
