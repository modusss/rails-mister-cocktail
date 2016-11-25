class Dose < ApplicationRecord
  belongs_to :cocktail, dependent: :destroy
  # if we delete ingredient we delete it's respective dose
  belongs_to :ingredient, dependent: :destroy
  # we need to have the description
  validates :description, presence: true
  # is unique for a given cocktail/ingredient couple
  validates :cocktail, uniqueness: { scope: :ingredient }
end
