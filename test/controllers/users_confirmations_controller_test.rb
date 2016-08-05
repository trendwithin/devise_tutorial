require 'test_helper'
# Test Still Failing: Research Issue
# class Users::ConfirmationsControllerTest < ActionController::TestCase
#   test 'confirmable by email' do
#     @request.env["devise.mapping"] = Devise.mappings[:user]
#     u = User.create!(email: 'test@confirm_email.com', username: 'confirmable', password: 'password')
#     user_token = User.find_by(email: 'test@confirm_email.com').confirmation_token
#     post :create, params: { users: { email: 'test@confirm_email.com', confirmation_token: user_token } }
#     u.reload
#     byebug
#   end
# end
