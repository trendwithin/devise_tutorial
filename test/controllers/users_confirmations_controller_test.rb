require 'test_helper'

# TEST: Errors to Reconfirmable.  Researching Solution.
# class Users::ConfirmationsControllerTest < ActionController::TestCase
#   test 'confirmable by email' do
#     @request.env["devise.mapping"] = Devise.mappings[:user]
#     User.create!(email: 'test@confirm_email.com', username: 'confirmable', password: 'password')
#     user_token = User.find_by(email: 'test@confirm_email.com').confirmation_token
#     post :create, params: { users: { confirmation_token: user_token } }
#     byebug
#   end
# end
