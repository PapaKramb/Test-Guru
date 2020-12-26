class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :completed_tests
  has_many :users, through: :completed_tests

  def self.title_tests_categories(category)
    joins('JOIN categories ON tests.category_id = categories.id').where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
