require "test_helper"

class AdminMailerTest < ActionMailer::TestCase
  test "product_order_information" do
    mail = AdminMailer.product_order_information
    assert_equal "Product order information", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
