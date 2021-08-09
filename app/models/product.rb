class Product < ApplicationRecord
  belongs_to :category
  validates :price, numericality: { less_than_or_equal_to: 100 }
  validates :price, presence: {message: "please enter"}
  validates :name, presence: {message: "please enter"}
  has_many :orders
  # after_create :simple
  has_one_attached :product_image

  private

  def simple
    self.update(name: "gaming pc") 
  end
end
