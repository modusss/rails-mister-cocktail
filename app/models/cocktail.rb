class Cocktail < ApplicationRecord
  # should destroy child doses when destroying self
  has_many :doses, dependent: :destroy
  # has many ingredients through doses
  has_many :ingredients, :through => :doses
  validates :name, presence: true, uniqueness: true
end
