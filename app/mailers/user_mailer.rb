class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.order_information.subject
  #
  def order_information
     mail(to: "santu@yopmail.com", subject: "Order placed successfully") do |format|
        format.html{ render "order_information"}
     end  
  end
end
