class Inventory < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :foods
  validates :name, presence: true
end
