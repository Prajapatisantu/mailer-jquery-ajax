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


  def self.to_csv
    attributes = %w{id name category_id price}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |product|
        csv << [product.id,
        product.name,
        product.category_id,
        product.price]
      end
    end
  end

end
