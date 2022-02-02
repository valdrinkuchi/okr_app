# frozen_string_literal: true

class Goal < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :user
  has_many :key_results
  validates :title, presence: true, uniqueness: true

  def progress
    "#{completed_percentage}%"
  end

  private

  def completed_percentage
    status = KeyResultStatus.where(status: 'completed').first
    completed = key_results.where(key_result_status: status).count
    result = completed / key_results.size.to_f * 100
    number_with_precision(result, precision: 2)
  end
end
