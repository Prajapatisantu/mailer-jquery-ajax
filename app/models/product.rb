class Product < ApplicationRecord
  belongs_to :category
  validates :price, numericality: { less_than_or_equal_to: 100 }
  validates :price, presence: {message: "please enter"}
  validates :name, presence: {message: "please enter"}
  has_and_belongs_to_many :orders
  # after_create :simple

  private

  def simple
    self.update(name: "gaming pc") 
  end
end
