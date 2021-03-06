class OrdersController < ApplicationController
  load_and_authorize_resource param_method: :order_params
  
  def index
     @pagy, @orders = pagy(Order.all) 
  end

  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
    @order_id = Order.new
  end

  def create
    @order = current_user.orders.create(order_params)
    if @order.save
      PostemailJob.perform_later(@order)
      redirect_to root_path
      flash[:success] = "Order placed successfully"
    else
      render :new
      flash[:alert] = "something went wrong"
    end
  end

  def show
    @order = Order.find(params[:id])
  end
  
  private

  def order_params
    params.require(:order).permit(:payment_type,:order_ref, :user_id,:address, :product_id)
  end

end
