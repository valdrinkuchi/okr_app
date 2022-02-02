# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true
  has_many :goals, dependent: :destroy

  def key_results
    goals.map(&:key_results)
  end
end
