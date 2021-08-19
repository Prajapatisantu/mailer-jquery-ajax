class ProductHandle < ApplicationService
    def initialize(order)
      @order = order
    end

    def call
      made
    end

    def made
      UserMailer.order_information(@order).deliver_later
      AdminMailer.product_order_information(@order).deliver_later
    end
end