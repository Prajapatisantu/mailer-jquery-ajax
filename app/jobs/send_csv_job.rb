class SendCsvJob < ApplicationJob
  queue_as :default

  def perform(product)
    AdminMailer.product_csv_infomation(product).deliver_later
  end
end
