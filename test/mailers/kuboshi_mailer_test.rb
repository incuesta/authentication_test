require 'test_helper'

class KuboshiMailerTest < ActionMailer::TestCase
  test "new_shiorichan" do
    mail = KuboshiMailer.new_shiorichan
    assert_equal "New shiorichan", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
