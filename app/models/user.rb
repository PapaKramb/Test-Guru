class User < ApplicationRecord
  has_many :tests, dependent: :destroy
  has_many :completed_tests, dependent: :destroy # Не совсем понимаю, нужна ли эта связь, когда уже есть :tests_completed?
  has_many :tests_completed, through: :completed_tests, class_name: "CompletedTest", foreign_key: "user_id"

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { in: 6..20 }, presence: true

  def user_tests_level(level)
    tests.where(level: level)
  end
end
