class Order < ApplicationRecord
    has_and_belongs_to_many :products
    belongs_to :user
    after_create :generate_value

    private

    def generate_value
           self.update(order_ref:rand(1..500000000000))
    end
end
