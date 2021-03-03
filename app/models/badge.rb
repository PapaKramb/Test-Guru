class Badge < ApplicationRecord

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :rule_type, presence: true
  validates :images, presence: true
  validates :title, presence: true

  enum rule_type: {
    passing_test_on_first_try:       0,
    passing_all_tests_from_category: 1,
    passing_all_tests_by_level:      2
  }.freeze

end
