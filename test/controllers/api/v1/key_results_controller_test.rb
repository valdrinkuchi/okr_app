# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class KeyResultsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @user = FactoryBot.create(:user)
        post api_v1_sessions_url, params: { email: @user.email, password: @user.password }
        token = JSON.parse(response.body)['data']['token']
        @header = { Authorization: "Bearer #{token}" }
        @goal = FactoryBot.create(:goal, user: @user)
        @key_result_status = FactoryBot.create(:key_result_status, status: 'completed')
        @key_result = FactoryBot.create(:key_result, title: 'Title', goal: @goal, key_result_status: @key_result_status)
      end

      test 'should get index' do
        get api_v1_key_results_url, headers: @header, as: :json
        assert_response :success
      end

      test 'should create key_result' do
        assert_difference('KeyResult.count') do
          post api_v1_key_results_url,
               headers: @header,
               params: {
                 key_result: {
                   goal_id: @key_result.goal_id,
                   key_result_status_id: @key_result.key_result_status_id,
                   title: 'New Title'
                 }
               },
               as: :json
        end

        assert_response 201
      end

      test 'should show key_result' do
        get api_v1_key_result_url(@key_result), headers: @header, as: :json
        assert_response :success
      end

      test 'should update key_result' do
        patch api_v1_key_result_url(@key_result),
              headers: @header,
              params: {
                key_result: {
                  goal_id: @key_result.goal_id,
                  key_result_status_id: @key_result.key_result_status_id,
                  title: @key_result.title
                }
              },
              as: :json
        assert_response 200
      end

      test 'should destroy key_result' do
        assert_difference('KeyResult.count', -1) do
          delete api_v1_key_result_url(@key_result), headers: @header, as: :json
        end

        assert_response 204
      end
    end
  end
end
