class Product < ApplicationRecord
  # after_create :simple
  belongs_to :category
  validates :price, numericality: { less_than_or_equal_to: 100 }
  validates :price, presence: {message: "please enter"}
  validates :name, presence: {message: "please enter"}
  has_many :orders
  has_one_attached :product_image
  has_one_attached :product_csv

  private

  def simple
    self.update(name: "gaming pc") 
  end
end
