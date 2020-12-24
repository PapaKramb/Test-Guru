class User < ApplicationRecord
  # Метод, который принимает в качестве аргумента уровень сложности и возвращает список тестов из таблицы tests
  def user_tests_level(level)
    Test.joins('JOIN users ON tests.user_id = user.id').where(tests: {level: level})
  end
end
