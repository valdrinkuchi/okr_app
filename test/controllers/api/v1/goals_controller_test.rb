# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class GoalsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @user = FactoryBot.create(:user)
        post api_v1_sessions_url, params: { email: @user.email, password: @user.password }
        token = JSON.parse(response.body)['data']['token']
        @header = { Authorization: "Bearer #{token}" }
        @goal = FactoryBot.create(:goal, user: @user)
      end

      test 'should get index' do
        get api_v1_goals_url, headers: @header, as: :json
        assert_response :success
      end

      test 'should create goal' do
        assert_difference('Goal.count') do
          post api_v1_goals_url,
               headers: @header,
               params: {
                 goal: {
                   end_date: @goal.end_date,
                   start_date: @goal.start_date,
                   title: 'New Goal',
                   user_id: @goal.user.id
                 }
               },
               as: :json
        end

        assert_response 201
      end

      test 'should show goal' do
        get api_v1_goal_url(@goal), headers: @header, as: :json
        assert_response :success
      end

      test 'should update goal' do
        patch api_v1_goal_url(@goal),
              headers: @header,
              params: {
                goal: {
                  end_date: @goal.end_date,
                  start_date: @goal.start_date + 1.week,
                  title: @goal.title,
                  user_id: @goal.user_id
                }
              },
              as: :json
        assert_response 200
      end

      test 'should destroy goal' do
        assert_difference('Goal.count', -1) do
          delete api_v1_goal_url(@goal), headers: @header, as: :json
        end

        assert_response 204
      end
    end
  end
end
