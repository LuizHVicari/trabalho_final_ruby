class List < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

  before_save :check_bought

  accepts_nested_attributes_for :products, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true

  def check_bought
    self.bought = products.map(&:bought).all?(true)
  end
end
