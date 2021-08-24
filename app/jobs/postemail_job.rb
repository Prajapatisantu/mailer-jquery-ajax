class PostemailJob < ApplicationJob
  queue_as :default

  def perform(order)
    ProductHandle.call(order)
  end
  
end
