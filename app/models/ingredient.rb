class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses, dependent: :destroy

  before_destroy :check
  def check
   # will always be true since all grandchildren have already been destroyed at this stage
   return self.doses.still_there.empty?
  end
  
end
