require 'test_helper'

class NotifierMailerTest < ActionMailer::TestCase
  test "order_received" do
    mail = NotifierMailer.order_received(order(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1  *  Programming Ruby  2.3.0p0/, mail.body.encoded
  end

  test "order_shipped" do
    mail = NotifierMailer.order_shipped
    assert_equal "Pragmatic Store Order Confirmation shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match  /<td>1&times;<\/td>\s*<td>Programming Ruby  2.3.0p0<\/td>/  , mail.body.encoded
  end

end
