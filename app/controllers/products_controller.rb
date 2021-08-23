class ProductsController < ApplicationController
  include Searching
  load_and_authorize_resource param_method: :prod  #cancan not directly use private method specify required

  def index
    @pagy, @products = pagy(Product.all, link_extra: 'data-remote="true"')
  end

  def new
    @product = Product.new
  end

  def search
    search_product
    # @products = Product.all
    # @search_tag = params[:search].downcase
    # @results = Product.all.where("lower(name) LIKE :search", search: @search_tag)
    # respond_to do |format|
    #   format.json
    #   format.js
    # end
  end

  def create
    @product = ProductCreator.prd(prod)
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path }
        format.js {redirect_to root_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update!(review: params[:review])
      flash[:notice] = "Product updated successfully"
      redirect_to products_path
    end
  end

  def show
     @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product updated successfully"
    redirect_to products_path
  end

  private

  def prod
    params.require(:product).permit(:name, :price,:product_image, :category_id, :product_csv, :review)
  end
end
