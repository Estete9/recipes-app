# frozen_string_literal: true

class Inventory < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
end
