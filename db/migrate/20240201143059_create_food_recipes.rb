class CreateFoodRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :food_recipes do |t|
      t.integer :quantity
      t.references :food, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
