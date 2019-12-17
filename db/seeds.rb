# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  AdminUser.create!(email: 'admin1@mail.com', password: 'adminadmin', password_confirmation: 'adminadmin')

  user1 = User.create! email: 'user1@mail.com', password: 'useruser', password_confirmation: 'useruser'
  user2 = User.create! email: 'user2@mail.com', password: 'useruser', password_confirmation: 'useruser'

  budget_type1 = BudgetType.create! name: 'Budget Type 1'

  question1 = Question.create! name: 'Question 1', position: 1, budget_type: budget_type1
  question2 = Question.create! name: 'Question 2', position: 2, budget_type: budget_type1

  choice11 = Choice.create! name: 'Choice 11', position: 1, question: question1
  choice12 = Choice.create! name: 'Choice 12', position: 2, question: question1
end