# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    {name: 'Alexey', email: 'test@mail.com', password: '123456'},
    {name: 'Katya', email: 'test1@mail.com', password: '654321'},
    {name: 'Grogu', email: 'padavan@mail.com', password: 'qwerty'}
  ]
)

Category.create!(
  [
    {title: 'Ruby'},
    {title: 'HTML'},
    {title: 'CSS'}
  ]
)

Test.create!(
  [
    {title: 'Ruby on Rails', category: Category.first, level: 3, user: User.first},
    {title: 'HyperText Markup Language', category: Category.second, level: 2, user: User.second},
    {title: 'Cascading Style Sheets', category: Category.third, level: 1, user: User.third}
  ]
)

Question.create!(
  [
    {boby: 'ROR question 1', test: Test.first},
    {boby: 'HTML question 1', test: Test.second},
    {boby: 'CSS question 1', test: Test.third}
  ]
)

Answer.create!(
  [
    {body: 'Answer A', question: Question.first, correct: true},
    {body: 'Answer B', question: Question.first},
    {body: 'Answer C', question: Question.first},
    {body: 'Answer A', question: Question.second},
    {body: 'Answer B', question: Question.second, correct: true},
    {body: 'Answer C', question: Question.second},
    {body: 'Answer A', question: Question.third},
    {body: 'Answer B', question: Question.third},
    {body: 'Answer C', question: Question.third, correct: true},
  ]
)