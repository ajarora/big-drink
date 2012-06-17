class AddImageToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :drink_image_uid,  :string
  end
end