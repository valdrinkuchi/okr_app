require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  setup do
    @user = FactoryBot.create(:user)
    @status = FactoryBot.create(:key_result_status, status: 'completed')
    @goal = FactoryBot.create(:goal, user: @user)
    @key_result = FactoryBot.create(:key_result, title: 'Test Title', goal: @goal, key_result_status: @status)
  end
  test 'Should return progress progress' do
    assert_equal '100.00%', @goal.progress
  end
end
