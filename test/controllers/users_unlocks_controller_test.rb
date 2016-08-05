require 'test_helper'

class Users::UnlocksControllerTest < ActionController::TestCase
  test 'locked user email token' do
    @request.env['devise.mapping'] = Devise.mappings[:user]

    u = User.create!(email: 'locked@example.com', password: '12345678')
    u.confirm
    u.failed_attempts = 20
    u.locked_at = Time.now
    user_token = u.unlock_token = 'abcdefg'
    post :create, params: { users: { email: 'locked@example.com', unlock_token: user_token } }
    u.reload
    assert_equal 0, u.failed_attempts
    assert_equal nil, u.locked_at
  end
end
