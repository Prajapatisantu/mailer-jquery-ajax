class ProductCreator < ApplicationService
    def initialize(prod)
      @prod = prod
    end

    def prd
      new_product
    end

    def new_product
      Product.create!(@prod)
    end
end