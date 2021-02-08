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
    {email: 'test@mail.com', password_digest: '123456'},
    {email: 'test1@mail.com', password_digest: '654321'},
    {email: 'padavan@mail.com', password_digest: 'qwerty'}
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
    {title: 'Ruby on Rails', category: categories[0], level: 3, author: users[0]},
    {title: 'HyperText Markup Language', category: categories[1], level: 2, author: users[1]},
    {title: 'Cascading Style Sheets', category: categories[2], level: 1, author: users[2]}
  ]
)

return if Question.exists?
questions = Question.create!(
  [
    {body: 'ROR question 1', test: tests[0]},
    {body: 'HTML question 1', test: tests[1]},
    {body: 'CSS question 1', test: tests[2]}
  ]
)

return if Answer.exists?
answers = Answer.create!(
  [
    {body: 'Answer A', question: questions[0], correct: true},
    {body: 'Answer B', question: questions[0]},
    {body: 'Answer C', question: questions[0]},
    {body: 'Answer A', question: questions[1]},
    {body: 'Answer B', question: questions[1], correct: true},
    {body: 'Answer C', question: questions[1]},
    {body: 'Answer A', question: questions[2]},
    {body: 'Answer B', question: questions[2]},
    {body: 'Answer C', question: questions[2], correct: true},
  ]
)
