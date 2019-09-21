require 'test_helper'

class JoinMailerTest < ActionMailer::TestCase
  test "join" do
    mail = JoinMailer.join
    assert_equal "Join", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
