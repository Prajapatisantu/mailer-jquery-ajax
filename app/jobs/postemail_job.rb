class PostemailJob < ApplicationJob
  queue_as :default

  def perform(order)
    UserMailer.order_information(order).deliver_later
    AdminMailer.product_order_information(order).deliver_later
  end
end
