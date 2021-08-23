class Product < ApplicationRecord
  # after_create :simple
  belongs_to :category
  validates :price, presence: true
  validates :name, presence: true
  has_many :orders
  has_one_attached :product_image
  has_one_attached :product_csv
  has_rich_text :review

  private

  def simple
    self.update(name: "gaming pc") 
  end
end
