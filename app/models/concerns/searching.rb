module Searching 
    extend ActiveSupport::Concern
    def search_product
        @products = Product.all
        @search_tag = params[:search].downcase
        @results = Product.all.where("lower(name) LIKE :search", search: @search_tag)
        respond_to do |format|
          format.json
          format.js
        end 
    end
end