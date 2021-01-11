class CompletedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test

  scope :completed, -> { where(completed: true) }
end
