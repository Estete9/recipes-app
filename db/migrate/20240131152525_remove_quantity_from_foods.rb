class RemoveQuantityFromFoods < ActiveRecord::Migration[7.1]
  def change
    remove_column :foods, :quantity, :integer
  end
end
