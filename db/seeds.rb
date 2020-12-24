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
    {title: 'Ruby on Rails', category_id: 1, level: 3, user_id: 1},
    {title: 'HyperText Markup Language', category_id: 2, level: 2, user_id: 2},
    {title: 'Cascading Style Sheets', category_id: 3, level: 1, user_id: 3}
  ]
)

return if Question.exists?
questions = Question.create!(
  [
    {boby: 'ROR question 1', test_id: 1},
    {boby: 'HTML question 1', test_id: 2},
    {boby: 'CSS question 1', test_id: 3}
  ]
)

return if Answer.exists?
answers = Answer.create!(
  [
    {body: 'Answer A', question_id: 1, correct: true},
    {body: 'Answer B', question_id: 1},
    {body: 'Answer C', question_id: 1},
    {body: 'Answer A', question_id: 2},
    {body: 'Answer B', question_id: 2, correct: true},
    {body: 'Answer C', question_id: 2},
    {body: 'Answer A', question_id: 3},
    {body: 'Answer B', question_id: 3},
    {body: 'Answer C', question_id: 3, correct: true},
  ]
)
