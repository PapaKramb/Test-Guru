require 'digest/sha1'

class User < ApplicationRecord

  has_many :completed_tests
  has_many :tests, through: :completed_tests
  has_many :authored_tests, class_name: 'Test'

  has_secure_password

  # validates :email, uniqueness: true, presence: true
  # validates :password, length: { in: 6..20 }, presence: true, if: Proc.new { |u| u.password_digest.blank? }
  # validates :password, confirmation: true

  def user_tests_level(level)
    tests.where(level: level)
  end

  def completed_test(test)
    completed_tests.order(id: :desc).find_by(test: test)
  end

end
