class Dose < ApplicationRecord
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  belongs_to :ingredient
  belongs_to :cocktail
  validates :cocktail, uniqueness: { scope: :ingredient, message: "unique for a given cocktail/ingredient couple" }
end
