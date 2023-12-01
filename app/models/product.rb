class Product < ApplicationRecord
  belongs_to :list

  validates_presence_of :name

  # validates_associated :price, greater_than: 0
end
