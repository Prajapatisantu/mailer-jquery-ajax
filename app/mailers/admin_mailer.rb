class AdminMailer < ApplicationMailer
  def product_order_information(order)
    @order_information = order
    mail(to: "prajapatisantu5765@gmail.com", subject: "Product order information") do |format|
       format.html{ render "product_order_information"}
    end
  end

  def product_csv_infomation(product)
    mail(to: "santu.essence@gmail.com", subject: "product list") do |format|
      format.html{ render "product_csv_infomation"}
    end
  end
end
