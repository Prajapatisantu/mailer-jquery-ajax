class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.product_order_information.subject
  #
  def product_order_information
    mail(to: "prajapatisantu5765@gmail.com", subject: "Product order information") do |format|
       format.html{ render "product_order_information"}
    end
  end
end
