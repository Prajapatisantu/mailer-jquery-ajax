class ProductsController < ApplicationController
  def index
    # @products = Product.all.limit(14)
    @pagy, @products = pagy(Product.all)
  end

  def new
    @product = Product.new
  end

  def search
    if params[:search].blank?
      redirect_to root_path
      flash[:alert] = "Enter something"
    else
      @search_tag = params[:search].downcase
      @results = Product.all.where("lower(name) LIKE :search", search: @search_tag)
    end
  end

  def create
    @product = Product.create!(prod)

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
    if @product.update(prod)
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
    params.require(:product).permit(:name, :price,:product_image, :category_id, :product_csv)
  end
end
