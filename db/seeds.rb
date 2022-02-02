# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

user = User.create!(
  first_name: 'John',
  last_name: 'Doe',
  email: 'john.doe@test.com',
  password: '123456',
  password_confirmation: '123456'
)

user2 = User.create!(
  first_name: 'Emma',
  last_name: 'Doe',
  email: 'emma.doe@test.com',
  password: '123456',
  password_confirmation: '123456'
)

['not started', 'in progress', 'completed'].each do |status|
  KeyResultStatus.create!(status: status)
end

goals = [
  {
    title: 'Speed up rendering time',
    user_id: user.id,
    start_date: 3.weeks.ago,
    end_date: nil
  },
  {
    title: 'Grow Engineering team',
    user_id: user2.id,
    start_date: 4.weeks.ago,
    end_date: nil
  }
]

goals.each do |goal|
  Goal.create!(goal)
end

key_results = [
  {
    title: 'Create Pre-Aggregated Tables',
    goal_id: Goal.find_by(title: 'Speed up rendering time').id,
    key_result_status_id: KeyResultStatus.find_by(status: 'completed').id
  },
  {
    title: 'Improve 3 of the slowest qurries spotted on New Relic',
    goal_id: Goal.find_by(title: 'Speed up rendering time').id,
    key_result_status_id: KeyResultStatus.find_by(status: 'completed').id
  },
  {
    title: 'Hire 1 Backend Engineers',
    goal_id: Goal.find_by(title: 'Grow Engineering team').id,
    key_result_status_id: KeyResultStatus.find_by(status: 'in progress').id
  },
  {
    title: 'Hire 1 Frontend Engineers',
    goal: Goal.find_by(title: 'Grow Engineering team'),
    key_result_status_id: KeyResultStatus.find_by(status: 'completed').id
  }
]

key_results.each do |key_result|
  KeyResult.create!(key_result)
end
