class FoodInventory < ApplicationRecord
  belongs_to :inventory
  belongs_to :food

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :inventory_id, presence: true
  validates :food_id, presence: true
end
