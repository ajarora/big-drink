class CreateConsumptions < ActiveRecord::Migration
  def change
    create_table :consumptions do |t|
      t.integer :drinker_id
      t.integer :drank_id

      t.timestamps
    end
    
    add_index :consumptions, :drinker_id
    add_index :consumptions, :drank_id
    add_index :consumptions, [:drinker_id, :drank_id], unique: true
  end
end
