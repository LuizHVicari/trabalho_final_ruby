class User < ApplicationRecord
  enum gender: [:male, :female, :other]
  has_many :lists, dependent: :delete_all
  has_many :products, through: :lists, dependent: :delete_all

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :birth_date

  # 0 -> homem
  # 1 -> mulher
  # 3 -> outro
  validates_numericality_of :gender, greater_than_or_equal_to: 0, less_than: 4, allow_nil: false
end
