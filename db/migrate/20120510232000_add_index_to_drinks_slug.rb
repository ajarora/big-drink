class AddIndexToDrinksSlug < ActiveRecord::Migration
  def change
    add_column :drinks, :slug, :string
    add_index :drinks, :slug, unique: true
  end
end