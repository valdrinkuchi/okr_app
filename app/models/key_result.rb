# frozen_string_literal: true

class KeyResult < ApplicationRecord
  belongs_to :goal
  belongs_to :key_result_status

  validates :title, presence: true, uniqueness: true
end
