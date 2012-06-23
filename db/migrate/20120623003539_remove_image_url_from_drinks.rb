class RemoveImageUrlFromDrinks < ActiveRecord::Migration
  def up
    remove_column :drinks, :image_url
      end

  def down
    add_column :drinks, :image_url, :string
  end
end
