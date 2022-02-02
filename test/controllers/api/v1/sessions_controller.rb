# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class SessionsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @user = FactoryBot.create(:user)
      end

      test 'creates session' do
        user_params = { email: @user.email, password: @user.password }
        post api_v1_sessions_path, params: user_params
        assert_response :success
      end

      test 'destroys session' do
        user_params = { email: @user.email, password: @user.password }
        post api_v1_sessions_path, params: user_params
        assert_response :success
      end
    end
  end
end
