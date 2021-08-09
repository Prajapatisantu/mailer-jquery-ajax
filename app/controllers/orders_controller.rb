class OrdersController < ApplicationController
  def index
     @pagy, @orders = pagy(Order.all) 
  end

  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end

  def create
    @order = current_user.orders.create(order_params)
    if @order.save
      redirect_to root_path
      PostemailJob.perform_later(@order)
      flash[:success] = "Order placed successfully"
    else
      render :new
      flash[:alert] = "something went wrong"
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:payment_type,:order_ref, :user_id,:address, :product_id )
  end
  
end
