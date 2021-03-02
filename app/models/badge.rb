class Badge < ApplicationRecord
  BADGES_RULES = %i[first_try all_tests_by_category all_tests_by_level].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :rules, presence: true
  validates :images, presence: true

end
