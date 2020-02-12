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

  question1 = Question.create!  main_sentence: 'Haye you done question 1?',
                                quantity_sentence: 'How many?',
                                price_sentence: 'How much of?',
                                translation: 'Question 1 <User Input> answered', 
                                position: 1, 
                                work_type: work_type1

  question2 = Question.create!  main_sentence: 'Haye you done question 2?',
                                quantity_sentence: 'How many?',
                                price_sentence: 'How much of?',
                                translation: 'Question 2 <User Input> answered', 
                                position: 2, 
                                work_type: work_type1

  question3 = Question.create!  main_sentence: 'Haye you done question 3?',
                                quantity_sentence: 'How many?',
                                price_sentence: 'How much of?',
                                translation: 'Question 3 <User Input> answered', 
                                position: 3, 
                                work_type: work_type1

end

if Rails.env.production?
  techo_reparacion =  WorkType.create! name: 'Reparación Techo'

  question1 = Question.create!  main_sentence: '¿Se instaló Teja de shingle (asfalto) 25 años?',
                                quantity_sentence: '¿Cuántos pies cuadrados de teja?',
                                price_sentence: 'Precio por pie cuadrado:',
                                translation: 'Repaired <User Input> sq ft of 3-Tab Asphalt Shingle Roof Work. Removed and replaced as required for proper repair', 
                                position: 1,
                                work_type: techo_reparacion

  question2 = Question.create!  main_sentence: '¿Se instaló Teja de shingle (asfalto) 30 años?',
                                quantity_sentence: '¿Cuántos pies cuadrados de teja?',
                                price_sentence: 'Precio por pie cuadrado:',
                                translation: 'Repaired <User Input> sq ft of Dimensional Asphalt Shingle Roof Work. Removed and replaced as required for proper repair', 
                                position: 2,
                                work_type: techo_reparacion

  question3 = Question.create!  main_sentence: '¿Se reemplazó papel Normal?',
                                quantity_sentence: '¿Cuántos pies cuadrados de papel Normal?',
                                price_sentence: 'Precio por pie cuadrado:',
                                translation: 'Replaced <User Input> sq ft of felt underlayment as required', 
                                position: 3,
                                work_type: techo_reparacion

  question4 = Question.create!  main_sentence: '¿Se reemplazó papel Sintético?',
                                quantity_sentence: '¿Cuántos pies cuadrados de papel Sintético?',
                                price_sentence: 'Precio por pie cuadrado:',
                                translation: 'Replaced <User Input> sq ft of synthetic underlayment as required', 
                                position: 4,
                                work_type: techo_reparacion

  question5 = Question.create!  main_sentence: '¿Se hizo reemplazo de Decking?',
                                quantity_sentence: '¿Cuántos pies cuadrados de decking se reemplazó?',
                                price_sentence: 'Precio por pie cuadrado:',
                                translation: 'Removed and replaced <User Input> sq ft of damaged decking with new decking', 
                                position: 5,
                                work_type: techo_reparacion

  question6 = Question.create!  main_sentence: '¿Se reemplazó flashing?',
                                quantity_sentence: '¿Cuántos pies lineales de flashing se reemplazó?',
                                price_sentence: 'Precio por pie lineal:',
                                translation: 'Replaced <User Input> linear ft of galvanized flashing as required', 
                                position: 6,
                                work_type: techo_reparacion
  
  question7 = Question.create!  main_sentence: '¿Se reemplazaron pipas?',
                                quantity_sentence: '¿Cuántos pipas se reemplazaron?',
                                price_sentence: 'Precio por unidad:',
                                translation: 'Replaced <User Input> pipe(s) and/or roof jack(s) as required. Sealed properly to prevent water intrusion', 
                                position: 7,
                                work_type: techo_reparacion
  
  question8 = Question.create!  main_sentence: '¿Se reemplazaron ventanillas?',
                                quantity_sentence: '¿Cuántas ventanillas se reemplazaron?',
                                price_sentence: 'Precio por unidad:',
                                translation: 'Replaced <User Input> vent(s) as required. Sealed properly to prevent any water intrusion', 
                                position: 8,
                                work_type: techo_reparacion

  #############

  techo_completo =  WorkType.create! name: 'Techo Completo'

  question1 = Question.create!  main_sentence: '¿Se instaló Teja de shingle (asfalto) 25 años?',
                                quantity_sentence: '¿Cuántas escuadras?',
                                price_sentence: 'Precio por escuadra:',
                                translation: 'Installed <User Input> squares of asphalt shingle roof. Installed same area of new underlayment as required. All new materials were sealed properly', 
                                position: 1,
                                work_type: techo_completo

  question2 = Question.create!  main_sentence: '¿Se instaló Teja de shingle (asfalto) 30 años?',
                                quantity_sentence: '¿Cuántas escuadras?',
                                price_sentence: 'Precio por escuadra:',
                                translation: 'Installed <User Input> squares of Dimensional Asphalt Shingle Roof Work. Installed same area of new underlayment as required. All new materials were sealed properly',
                                position: 2,
                                work_type: techo_completo

  question3 = Question.create!  main_sentence: '¿Se hizo nuevo Ridge Vent?',
                                quantity_sentence: '¿Cuántos pies de Ridge Vent nuevo se hicieron?',
                                price_sentence: 'Precio por pie:',
                                translation: 'Sawed <User Input> plywood decking peak to create new vent and installed new ridgevent',
                                position: 3,
                                work_type: techo_completo

  question4 = Question.create!  main_sentence: '¿Se cambió Ridge?',
                                quantity_sentence: '¿Cuántos pies de Ridge se cambiaron?',
                                price_sentence: 'Precio por pie:',
                                translation: 'Removed and replaced <User Input> linear feet of ridge vent with new',
                                position: 4,
                                work_type: techo_completo

  question5 = Question.create!  main_sentence: '¿Se instaló Ridge?',
                                quantity_sentence: '¿Cuántos pies de Ridge se instalaron?',
                                price_sentence: 'Precio por pie:',
                                translation: 'Installed <User Input> linear feet or ridge',
                                position: 5,
                                work_type: techo_completo

  question6 = Question.create!  main_sentence: '¿Se usó papel Normal?',
                                quantity_sentence: '¿Cuántos pies cuadrados de papel Normal?',
                                price_sentence: 'Precio por pie:',
                                translation: 'Installed <User Input> square feets of new felt underlayment',
                                position: 6,
                                work_type: techo_completo

  question7 = Question.create!  main_sentence: '¿Se usó papel Sintético?',
                                quantity_sentence: '¿Cuántos pies cuadrados de papel Sintético?',
                                price_sentence: 'Precio por pie:',
                                translation: 'Installed <User Input> square feets of new synthetic underlayment',
                                position: 7,
                                work_type: techo_completo

  question8 = Question.create!  main_sentence: '¿Se instaló flashing?',
                                quantity_sentence: '¿Cuántos pies lineales de flashing se instaló?',
                                price_sentence: 'Precio por pie lineal:',
                                translation: 'Installed <User Input> linear ft of galvanized flashing as required', 
                                position: 8,
                                work_type: techo_completo

  question9 = Question.create!  main_sentence: '¿Se instalaron pipas?',
                                quantity_sentence: '¿Cuántos pipas se instalaron?',
                                price_sentence: 'Precio por unidad:',
                                translation: 'Installed <User Input> pipe(s) and/or roof jack(s) as required. Sealed properly to prevent water intrusion', 
                                position: 9,
                                work_type: techo_completo

  question10 = Question.create!  main_sentence: '¿Se instalaron ventanillas?',
                                quantity_sentence: '¿Cuántas ventanillas se instalaron?',
                                price_sentence: 'Precio por unidad:',
                                translation: 'Installed <User Input> roof vents, all sealed properly to prevent water intrusion',
                                position: 10,
                                work_type: techo_completo

  question11 = Question.create!  main_sentence: '¿Se instaló ice shield?',
                                quantity_sentence: '¿Cuántos pies cuadrados de ice shield se instaló?',
                                price_sentence: 'Precio por pie cuadrado:',
                                translation: 'Installed ice shield around vents to seal and protect properly',
                                position: 11,
                                work_type: techo_completo

  question12 = Question.create!  main_sentence: '¿Se instaló drip edge?',
                                quantity_sentence: '¿Cuántos pies lineales de drip edge se instalaron?',
                                price_sentence: 'Precio por pie lineal:',
                                translation: 'Installed <User Input> linear feet of drip edge as required',
                                position: 12,
                                work_type: techo_completo

  question13 = Question.create!  main_sentence: '¿Se cambió decking?',
                                quantity_sentence: '¿Cuántos pies de decking se cambiaron?',
                                price_sentence: 'Precio por pie lineal:',
                                translation: 'Installed <User Input> linear feet of new decking as required to install new roofing materials properly',
                                position: 13,
                                work_type: techo_completo

  #############

  techo_completo_contratista =  WorkType.create! name: 'Techo Completo - Contratista'

  question1 = Question.create!  main_sentence: '¿Se instaló Teja de Asfalto?',
                                quantity_sentence: '¿Cuántas escuadras se instalaron?',
                                price_sentence: 'Precio por escuadra:',
                                translation: "Removed and replaced <User Input> squares of composite shingles, along with all roof components as spec'd by GC. All new materials properly sealed.", 
                                position: 1,
                                work_type: techo_completo_contratista

  question2 = Question.create!  main_sentence: '¿Hubo mas de una capa de papel?',
                                quantity_sentence: '¿Cuantas capas mas?',
                                price_sentence: 'Precio por capas de mas:',
                                translation: "Removed an addional <User Input> layers of underlayment.", 
                                position: 2,
                                work_type: techo_completo_contratista

  question3 = Question.create!  main_sentence: '¿El pitch fue mas de 7?',
                                quantity_sentence: '¿De cuanto fue el pitch?',
                                price_sentence: 'Precio por escuadra por pitch:',
                                translation: "Additional fee for having a <User Input> over 12 pitch.", 
                                position: 3,
                                work_type: techo_completo_contratista

  question4 = Question.create!  main_sentence: '¿Se hicieron reparaciones de decking?',
                                quantity_sentence: '¿Cuantas reparaciones de decking?',
                                price_sentence: 'Precio por reparacion:',
                                translation: "Removed and replaced damaged decking with new for a total of <User Input> repairs.", 
                                position: 4,
                                work_type: techo_completo_contratista

  question5 = Question.create!  main_sentence: '¿La propiedad tiene más de un piso?',
                                quantity_sentence: '¿Cuantas escuadras por ser mas de un piso se instalaron?',
                                price_sentence: 'Precio por escuadra por ser mas de un piso:',
                                translation: "Fee for a <User Input> story building.",
                                position: 5,
                                work_type: techo_completo_contratista

  question6 = Question.create!  main_sentence: '¿Se flashearon chimeneas?',
                                quantity_sentence: '¿Cuantas chimeneas flashearon?',
                                price_sentence: 'Precio por chimenea:',
                                translation: "Reflashed <User Input> chimney properly to prevent water intrusion.",
                                position: 6,
                                work_type: techo_completo_contratista

  question7 = Question.create!  main_sentence: '¿Se instalaron nuevos crikets?',
                                quantity_sentence: '¿Cuantos nuevos crikets instalaron?',
                                price_sentence: 'Precio por crikets:',
                                translation: "Installed <User Input> new crickets.",
                                position: 7,
                                work_type: techo_completo_contratista

  question8 = Question.create!  main_sentence: '¿Se quitaron y pusieron gutters?',
                                quantity_sentence: '¿Cuantos pie de gutters quitaron y pusieron?',
                                price_sentence: 'Precio por quitar y poner gutters:',
                                translation: "Detached and reset <User Input> linear feet of gutter.",
                                position: 8,
                                work_type: techo_completo_contratista

  question9 = Question.create!  main_sentence: '¿Se cambió el 1x2?',
                                quantity_sentence: '¿Cuantos pie del 1x2 cambiaron?',
                                price_sentence: 'Precio por cambiar 1x2:',
                                translation: "Installed <User Input> linear feet of  1x2.",
                                position: 9,
                                work_type: techo_completo_contratista

  question10 = Question.create!  main_sentence: '¿Se reparó fascia?',
                                quantity_sentence: '¿Cuantos pie de fascia repararon?',
                                price_sentence: 'Precio por reparacion de fascia:',
                                translation: "Repaired <User Input> linear feet of fascia.",
                                position: 10,
                                work_type: techo_completo_contratista

  question11 = Question.create!  main_sentence: '¿Se subieron escuadras de teja por escalera?',
                                quantity_sentence: '¿Cuantas escuadras de teja subiste por escalera?',
                                price_sentence: 'Precio por subir teja a mano:',
                                translation: "Fee for loading <User Input> squares.",
                                position: 11,
                                work_type: techo_completo_contratista

  question12 = Question.create!  main_sentence: '¿Se subieron escuadras de teja por escalera?',
                                quantity_sentence: '¿Cuantas veces tuviste que ir por material que falto?',
                                price_sentence: 'Precio por ir por mas material:',
                                translation: "Material trip charge fee.",
                                position: 12,
                                work_type: techo_completo_contratista
end