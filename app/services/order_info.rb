class OrderInfo < ApplicationService
    def initialize(product_id,user_id,address)
       @product = product_id
       @user = user_id
       @address = address
    end

    def order
      order_info_pass
    end

    def order_info_pass
       @product_object = Product.find(@product) 
       @order = Order.create!(payment_type: "Paytm", address: @address, product_id: @product, user_id: @user) 
    end
end