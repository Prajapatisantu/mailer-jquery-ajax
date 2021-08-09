class UserMailer < ApplicationMailer

  def order_information(order)
     @order_information = order
      mail(to: "santu@yopmail.com", subject: "Order placed successfully") do |format|
        format.html{ render "order_information"}
     end  
  end
end
