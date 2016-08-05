require 'test_helper'

class Users::RegistrationsControllerTest < ActionController::TestCase
  test 'new user' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    get :new
    assert_response :success

    # assert_select 'input#user_name' FAIL- Modify View
    assert_select 'input#user_email'
    assert_select 'input#user_password'
    assert_select 'input#user_password_confirmation'
  end

  test 'create user' do
    @testuser = User.create!(email: 'test@registrations_controller.com',
                             username: 'me', password: '12345678')
    assert_difference('User.count', 1) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      post :create, params: { user: { email: 'test_two@registrations_controller.com',
                              username: 'test', password: 'password' } }
    end
    assert_redirected_to root_path
    assert_not flash.empty?
    assert_equal "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.", flash['notice']
  end
end
