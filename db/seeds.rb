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

  client1 = Client.create! name: 'Client 1', user: user1

  budget_type1 = BudgetType.create! name: 'Budget Type 1'

  question1 = Question.create! name: 'Pregunta 1', translation: 'Question 1', position: 1, budget_type: budget_type1
  question2 = Question.create! name: 'Pregunta 2', translation: 'Question <User Input> 2', position: 2, budget_type: budget_type1

  choice11 = Choice.create! name: 'Opcion 11', translation: 'Choice 11', position: 1, question: question1
  choice12 = Choice.create! name: 'Opcion 12', translation: 'Choice 12', position: 2, question: question1
end

if Rails.env.production?
  techo_reparacion =  BudgetType.create! name: 'Reparación Techo'

  q = Question.create!  position: 1, name: 'Teja de shingle (asfalto)', budget_type: techo_reparacion
      Choice.create! name: '25 años', translation: '3-Tab Asphalt Shingle Roof Work', position: 1, question: q
      Choice.create! name: '30 años', translation: 'Dimensional Asphalt Shingle Roof Work', position: 2, question: q

  q = Question.create!  position: 2,
                        name: 'Cuántos pies cuadrados de teja?',
                        translation: 'Repaired <User Input> sq ft of shingle roof. Removed and replaced as required for proper repair',
                        budget_type: techo_reparacion

  q = Question.create!  position: 3, name: 'Se reemplazó papel?', budget_type: techo_reparacion
      Choice.create! name: 'Normal', translation: 'Replaced the felt underlayment as required', position: 1, question: q
      Choice.create! name: 'Sintético', translation: 'Replaced synthetic underlayment as required', position: 2, question: q
      Choice.create! name: 'No', position: 2, question: q

  q = Question.create!  position: 4, 
                        name: 'Cuántos pies cuadrados de decking se reemplazó?',
                        translation: 'Removed and replaced <User Input> sq ft of damaged decking with new decking',
                        budget_type: techo_reparacion
      
  q = Question.create!  position: 5, 
                        name: 'Cuántos pies lineales de flashing se reemplazó?',
                        translation: 'Replaced <User Input> linear ft of galvanized flashing as required',
                        budget_type: techo_reparacion
      
  q = Question.create!  position: 6, 
                        name: 'Cuántos pipas se reemplazaron?',
                        translation: 'Replaced <User Input> pipe(s) and/or roof jack(s) as required. Sealed properly to prevent water intrusion',
                        budget_type: techo_reparacion
      
  q = Question.create!  position: 7, 
                        name: 'Cuántas ventanillas se reemplazaron?',
                        translation: 'Replaced <User Input> vent(s) as required. Sealed properly to prevent any water intrusion',
                        budget_type: techo_reparacion
      
end