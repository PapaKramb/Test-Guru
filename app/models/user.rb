class User < ApplicationRecord
  has_many :tests, dependent: :destroy
  has_many :completed_tests, dependent: :destroy
  has_many :tests, through: :completed_tests, dependent: :destroy

  def user_tests_level(level)
    Test.joins("INNER JOIN completed_tests ON completed_tests.test_id = tests.id").where(completed_tests: {user_id: id}, tests: {level: level})
  end
end
