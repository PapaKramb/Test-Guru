class Test < ApplicationRecord
  def self.title_tests_categories(category)
    joins('JOIN categories ON tests.category_id = categories.id').where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
