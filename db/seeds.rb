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

  work_type1 = WorkType.create! name: 'Budget Type 1'

  question1 = Question.create! name: 'Pregunta 1', translation: 'Question 1', position: 1, work_type: work_type1
  question2 = Question.create! name: 'Pregunta 2', translation: 'Question <User Input> 2', position: 2, work_type: work_type1

  choice11 = Choice.create! name: 'Opcion 11', translation: 'Choice 11', position: 1, question: question1
  choice12 = Choice.create! name: 'Opcion 12', translation: 'Choice 12', position: 2, question: question1
end

if Rails.env.production?
  techo_reparacion =  WorkType.create! name: 'Reparación Techo'

  q = Question.create!  position: 1, name: 'Teja de shingle (asfalto)', work_type: techo_reparacion
      Choice.create! name: '25 años', translation: '3-Tab Asphalt Shingle Roof Work', position: 1, question: q
      Choice.create! name: '30 años', translation: 'Dimensional Asphalt Shingle Roof Work', position: 2, question: q

  q = Question.create!  position: 2,
                        name: 'Cuántos pies cuadrados de teja?',
                        translation: 'Repaired <User Input> sq ft of shingle roof. Removed and replaced as required for proper repair',
                        work_type: techo_reparacion

  q = Question.create!  position: 3, name: 'Se reemplazó papel?', work_type: techo_reparacion
      Choice.create! name: 'Normal', translation: 'Replaced the felt underlayment as required', position: 1, question: q
      Choice.create! name: 'Sintético', translation: 'Replaced synthetic underlayment as required', position: 2, question: q
      Choice.create! name: 'No', position: 3, question: q

  q = Question.create!  position: 4, 
                        name: 'Cuántos pies cuadrados de decking se reemplazó?',
                        translation: 'Removed and replaced <User Input> sq ft of damaged decking with new decking',
                        work_type: techo_reparacion
      
  q = Question.create!  position: 5, 
                        name: 'Cuántos pies lineales de flashing se reemplazó?',
                        translation: 'Replaced <User Input> linear ft of galvanized flashing as required',
                        work_type: techo_reparacion
      
  q = Question.create!  position: 6, 
                        name: 'Cuántos pipas se reemplazaron?',
                        translation: 'Replaced <User Input> pipe(s) and/or roof jack(s) as required. Sealed properly to prevent water intrusion',
                        work_type: techo_reparacion
      
  q = Question.create!  position: 7, 
                        name: 'Cuántas ventanillas se reemplazaron?',
                        translation: 'Replaced <User Input> vent(s) as required. Sealed properly to prevent any water intrusion',
                        work_type: techo_reparacion

  #############

  techo_completo =  WorkType.create! name: 'Techo Completo'

  q = Question.create!  position: 1, name: 'Teja de shingle (asfalto)', work_type: techo_completo
      Choice.create! name: '25 años', translation: '3-Tab Asphalt Shingle Roof Work', position: 1, question: q
      Choice.create! name: '30 años', translation: 'Dimensional Asphalt Shingle Roof Work', position: 2, question: q

  q = Question.create!  position: 2,
                        name: 'Cuántas escuadras?',
                        translation: 'Installed <User Input> squares of asphalt shingle roof. Installed same area of new underlayment as required. All new materials were sealed properly.',
                        work_type: techo_completo

  q = Question.create!  position: 3,
                        name: 'Cuántos pies de Ridge Vent nuevo se hicieron?',
                        translation: 'Sawed <User Input> plywood decking peak to create new vent and installed new ridgevent.',
                        work_type: techo_completo

  q = Question.create!  position: 4,
                        name: 'Cuántos pies de Ridge se cambiaron?',
                        translation: 'Removed and replaced <User Input> linear feet of ridge vent with new.',
                        work_type: techo_completo

  q = Question.create!  position: 5,
                        name: 'Cuántos pies de Ridge se instalaron?',
                        translation: 'Installed <User Input> linear feet or ridge.',
                        work_type: techo_completo

  q = Question.create!  position: 6, name: 'Se usó papel normal o sintético?', work_type: techo_completo
                        Choice.create! name: 'Normal', translation: 'Installed new felt underlayment.', position: 1, question: q
                        Choice.create! name: 'Sintético', translation: 'Installed new synthetic underlayment.', position: 2, question: q
                        Choice.create! name: 'Ninguno', position: 3, question: q

  q = Question.create!  position: 7,
                        name: 'Cuánto flashing?',
                        translation: 'Installed <User Input> linear feet of new flashing.',
                        work_type: techo_completo

  q = Question.create!  position: 8,
                        name: 'Cuántas pipas se cambiaron?',
                        translation: 'Installed <User Input> new pipes and/or roof jacks, all sealed properly to prevent water intrusion.',
                        work_type: techo_completo

  q = Question.create!  position: 9,
                        name: 'Cuántas ventilas se cambiaron?',
                        translation: 'Installed <User Input> roof vents, all sealed properly to prevent water intrusion.',
                        work_type: techo_completo

  q = Question.create!  position: 10, name: 'Se instaló ice shield?', work_type: techo_completo
                        Choice.create! name: 'Sí', translation: 'Installled ice shield around vents to seal and protect properly.', position: 1, question: q
                        Choice.create! name: 'No', position: 2, question: q

  q = Question.create!  position: 11,
                        name: 'Cuántos pies de drip edge se instalaron?',
                        translation: 'Installed <User Input> linear feet of drip edge as required.',
                        work_type: techo_completo

  q = Question.create!  position: 12,
                        name: 'Cuántos pies de decking se cambiaron?',
                        translation: 'Installed <User Input> of new decking as required to install new roofing materials properly.',
                        work_type: techo_completo
end