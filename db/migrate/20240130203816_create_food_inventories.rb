class CreateFoodInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :food_inventories do |t|
      t.integer :quantity
      t.references :inventory, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
