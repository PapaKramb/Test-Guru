class Test < ApplicationRecord
  # Метод, который возвращает отсортированный по убыванию массив названий всех Тестов
  def self.return_title_tests_categories(category)
    joins('JOIN categories ON tests.category_id = categories.id').where(categories: {title: category}).order(title: :desc)
  end
end
