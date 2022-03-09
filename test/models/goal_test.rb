require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  setup do
    @user = FactoryBot.create(:user)
    @status = FactoryBot.create(:key_result_status, status: 'completed')
    @status2 = FactoryBot.create(:key_result_status, status: 'in progress')
    @goal = FactoryBot.create(:goal, user: @user)
    @key_result = FactoryBot.create(:key_result, title: 'Test Title', goal: @goal, key_result_status: @status)
    @key_result = FactoryBot.create(:key_result, title: 'Test Title2', goal: @goal, key_result_status: @status2)
  end
  test 'Should return goal progress' do
    assert_equal '50.00%', @goal.progress
  end
end
