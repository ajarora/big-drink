class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :venue_id
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
