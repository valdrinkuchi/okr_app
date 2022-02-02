# frozen_string_literal: true

FactoryBot.define do
  factory :key_result do
    goal { goal }
    title { title }
    key_result_status { status }
  end
end
