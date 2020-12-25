class User < ApplicationRecord
  def user_tests_level(level)
    Test.joins("INNER JOIN completed_tests ON completed_tests.test_id = tests.id").where(tests: {level: level}).pluck(:level)
  end
end
