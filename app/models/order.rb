class Order < ApplicationRecord
    belongs_to :product
    belongs_to :user
    after_create :generate_value

    private

    def generate_value
        self.update(order_ref:rand(1..5000000))
    end
end
