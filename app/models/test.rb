class Test < ApplicationRecord
  belongs_to :users
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :completed_tests, dependent: :destroy
  has_many :users, through: :completed_tests, dependent: :destroy

  def self.title_tests_categories(category)
    joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
