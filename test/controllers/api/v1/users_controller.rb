# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      setup do
        @user_params = {
          email: 'testing@test.com',
          password: '123456',
          password_confirmation: '123456',
          first_name: 'Test',
          last_name: 'User'
        }
        @user = FactoryBot.create(:user)
      end
      test 'creates user' do
        post api_v1_users_url, params: { user: @user_params }, as: :json
        assert_response :success
      end

      test 'update user' do
        post api_v1_sessions_url, params: { email: @user.email, password: @user.password }
        token = JSON.parse(response.body)['data']['token']
        @header = { Authorization: "Bearer #{token}" }
        user_params = JSON.parse(@user.to_json)
        user_params[:first_name] = 'New First Name'
        patch api_v1_user_url(@user), headers: @header, params: { user: user_params }, as: :json
        assert_equal 'New First Name', User.find(@user.id).first_name
        assert_response :success
      end
    end
  end
end
