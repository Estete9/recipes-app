class CreateFoodInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :food_inventories do |t|
      t.integer :quantity
      t.references :inventory, null: false, foreign_key: { to_table: :inventories, on_delete: :cascade }
      t.references :food, null: false, foreign_key: { to_table: :foods, on_delete: :cascade }

      t.timestamps
    end
  end
end
