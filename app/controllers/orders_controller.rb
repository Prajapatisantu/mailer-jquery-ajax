class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create!(order_params)
    if @order.save
      redirect_to orders_path
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:payment_type,:order_ref, product_ids: [].reject!{|a| a.blank?})
  end
  
end
