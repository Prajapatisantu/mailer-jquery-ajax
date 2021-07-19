class ProductMailer < ApplicationMailer
  def product_added_confirmation
    attachments['sample.jpg'] = File.read('app/assets/images/sample.jpg')
    mail(to: "prajapatisantu5765@gmail.com", subject: "Hello Product") do |format|
      format.html { render "product_added_confirmation" }
    end
  end
end
