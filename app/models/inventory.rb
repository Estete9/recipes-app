class Inventory < ApplicationRecord
  belongs_to :user

    has_many :food_inventories
    has_many :foods, through: :food_inventories

  validates :name, presence: true
end
