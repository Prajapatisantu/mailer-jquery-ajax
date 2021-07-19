class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create!(prod)

    respond_to do |format|
      if @product.save
        ProductMailer.product_added_confirmation.deliver_now
        format.html { redirect_to products_path }
        format.js
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
    params.require(:product).permit(:name, :price, :category_id, order_ids: [])
  end
end
