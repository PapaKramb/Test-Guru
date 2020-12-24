class Test < ApplicationRecord
  # Метод, который возвращает отсортированный по убыванию массив названий всех Тестов
  def return_title_tests_categories(category)
    joins(:category).where("categories.title = ?", category).order(title: :desc).pluck(:title)
  end
end