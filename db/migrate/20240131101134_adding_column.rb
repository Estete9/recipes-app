class AddingColumn < ActiveRecord::Migration[7.1]
  def change
    add_reference :foods, :user, null: false, foreign_key: true
  end
end
