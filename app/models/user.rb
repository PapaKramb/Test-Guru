class User < ApplicationRecord
  def user_tests_level(level)
    Test.joins('JOIN users ON tests.user_id = user.id').where(tests: {level: level}).pluck(:level)
  end
end
