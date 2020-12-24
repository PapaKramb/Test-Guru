class User < ApplicationRecord
  # Метод, который принимает в качестве аргумента уровень сложности и возвращает список тестов из таблицы tests
  def user_tests_level(level)
    tests.where(level: level)
  end
end
