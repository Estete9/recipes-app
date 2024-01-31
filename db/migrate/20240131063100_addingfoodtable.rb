class Addingfoodtable < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :price
    end
  end
end
    