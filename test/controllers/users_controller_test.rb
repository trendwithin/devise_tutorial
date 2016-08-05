require 'test_helper'

class Users::RegistrationsControllerTest < ActionController::TestCase
  test 'new user' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    get :new
    assert_response :success

    assert_select 'input#user_username'
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
    u = User.find_by(email: 'test_two@registrations_controller.com')
    assert_redirected_to root_path
    assert_not flash.empty?
    assert_equal "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.", flash['notice']
    assert_equal 'test', u.username 
  end

  test 'create user token matches mailer token' do
    assert_difference('User.count', 1) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      post :create, params: { user: { name: 'test_confirmation', email: 'confirm_user@registrations_controller.com',
                                      password: '12345678' } }
      mail = ActionMailer::Base.deliveries[0]
      token = mail.body.decoded.match(/confirmation_token=([^"]+)/)[1]
      user_token = User.find_by(email: 'confirm_user@registrations_controller.com').confirmation_token
      assert_equal token, user_token
    end
  end
end
