# frozen_string_literal: true

class KeyResultStatus < ApplicationRecord
  has_many :key_results
  validates :status, presence: true, uniqueness: true
end
