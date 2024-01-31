class CreateFoodsInventoriesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :foods_inventories, id: false do |t|
      t.belongs_to :food
      t.belongs_to :inventory
    end

    add_index :foods_inventories, [:food_id, :inventory_id], unique: true
  end
end
