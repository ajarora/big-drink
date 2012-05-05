class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :foursquareID
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
