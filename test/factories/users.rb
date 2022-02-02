# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { 'test1234' }
    first_name { 'Test' }
    last_name { 'Example' }
  end
end
