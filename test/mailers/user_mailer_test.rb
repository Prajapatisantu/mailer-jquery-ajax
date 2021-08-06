require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "order_information" do
    mail = UserMailer.order_information
    assert_equal "Order information", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
