class Badge < ApplicationRecord
  
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  enum rule: { first_try: 0, all_tests_by_category: 1, all_tests_by_level: 2 }

  validates :rule, presence: true
  validates :value, presence: true
  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true

end
