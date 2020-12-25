# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

return if User.exists?
users = User.create!(
  [
    {name: 'Alexey', email: 'test@mail.com', password: '123456'},
    {name: 'Katya', email: 'test1@mail.com', password: '654321'},
    {name: 'Grogu', email: 'padavan@mail.com', password: 'qwerty'}
  ]
)

return if Category.exists?
categories = Category.create!(
  [
    {title: 'Ruby'},
    {title: 'HTML'},
    {title: 'CSS'}
  ]
)

return if Test.exists?
tests = Test.create!(
  [
    {title: 'Ruby on Rails', category_id: categories.first, level: 3, user_id: users.first},
    {title: 'HyperText Markup Language', categories.second, level: 2, user_id: users.second},
    {title: 'Cascading Style Sheets', categories.third, level: 1, user_id: users.third}
  ]
)

return if Question.exists?
questions = Question.create!(
  [
    {boby: 'ROR question 1', test_id: tests.first},
    {boby: 'HTML question 1', test_id: tests.second},
    {boby: 'CSS question 1', test_id: tests.third}
  ]
)

return if Answer.exists?
answers = Answer.create!(
  [
    {body: 'Answer A', question_id: questions.first, correct: true},
    {body: 'Answer B', question_id: questions.first},
    {body: 'Answer C', question_id: questions.first},
    {body: 'Answer A', question_id: questions.second},
    {body: 'Answer B', question_id: questions.second, correct: true},
    {body: 'Answer C', question_id: questions.second},
    {body: 'Answer A', question_id: questions.third},
    {body: 'Answer B', question_id: questions.third},
    {body: 'Answer C', question_id: questions.third, correct: true},
  ]
)
