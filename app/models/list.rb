class List < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :delete_all
end
