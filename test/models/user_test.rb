require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user ||= User.new(email: 'user_test@example.com', password: '12345678', username: 'me')
  end

  test "User valid" do
    assert_equal true, @user.valid?
  end

  test 'password < 8 invalid' do
    @user.password = '1234567'
    assert_equal false, @user.valid?
  end

  test 'password > 128 invalid' do
    @user.password = 'a' * 129
    assert_equal false, @user.valid?
  end
end
