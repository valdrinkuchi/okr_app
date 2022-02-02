require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = FactoryBot.create(:user)
    @status = FactoryBot.create(:key_result_status, status: 'completed')
    @goal = FactoryBot.create(:goal, user: @user)
    @key_result = FactoryBot.create(:key_result, title: 'Test Title', goal: @goal, key_result_status: @status)
  end
  test 'Should return key_results of the user' do
    assert_equal 1, @user.key_results.size
    assert_equal 'Test Title', @user.key_results.flatten.first.title
  end
end
