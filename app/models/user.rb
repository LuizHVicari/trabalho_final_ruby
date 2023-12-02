class User < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :products, through: :lists, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :birth_date

  before_save :capitalize_name

  def capitalize_name
    self.name = self.name.capitalize
  end

end
