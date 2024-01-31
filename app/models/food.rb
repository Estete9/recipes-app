class Food < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :inventories
  validates :quantity, presence: true
end
