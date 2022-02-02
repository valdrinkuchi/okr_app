# frozen_string_literal: true

FactoryBot.define do
  factory :goal do
    user_id { user }
    start_date { Time.parse('2020/01/01').utc }
    end_date { nil }
    title { 'Test Title' }
  end
end
