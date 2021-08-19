class AdminMailer < ApplicationMailer
  def product_order_information(order)
    @order_information = order
    mail(to: "prajapatisantu5765@gmail.com", subject: "Product order information") do |format|
       format.html{ render "product_order_information"}
    end
  end
end
