if Rails.env.development?
  AdminUser.create!(email: 'admin1@mail.com', password: 'adminadmin', password_confirmation: 'adminadmin')

  user1 = User.create! email: 'user1@mail.com', password: 'useruser', password_confirmation: 'useruser'
  user2 = User.create! email: 'user2@mail.com', password: 'useruser', password_confirmation: 'useruser'

  client1 = Client.create! name: 'Client 1', user: user1

  work_type1 = WorkType.create! name: 'MultiLine', form_type: 'multi_line'

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

  work_type2 = WorkType.create! name: 'OneLine', form_type: 'one_line'

  question1 = Question.create! main_sentence: 'Pregunta 1', translation: 'Question 1', position: 1, work_type: work_type2
  choice11  = Choice.create! name: 'Opcion 11', translation: 'Choice 11', position: 1, question: question1	
  choice12  = Choice.create! name: 'Opcion 12', translation: 'Choice 12', position: 2, question: question1
  question2 = Question.create! main_sentence: 'Pregunta 2', translation: 'Question <User Input> 2', position: 2, work_type: work_type2

end

if Rails.env.production?
  techo_reparacion =  WorkType.create! name: 'Reparación Techo', form_type: 'one_line'

  q = Question.create!  position: 1, main_sentence: 'Teja de shingle (asfalto)', work_type: techo_reparacion
      Choice.create! name: '25 años', translation: '3-Tab Asphalt Shingle Roof Work', position: 1, question: q
      Choice.create! name: '30 años', translation: 'Dimensional Asphalt Shingle Roof Work', position: 2, question: q

  q = Question.create!  position: 2,
                        main_sentence: 'Cuántos pies cuadrados de teja?',
                        translation: 'Repaired <User Input> sq ft of shingle roof. Removed and replaced as required for proper repair',
                        work_type: techo_reparacion

  q = Question.create!  position: 3, main_sentence: 'Se reemplazó papel?', work_type: techo_reparacion
      Choice.create! name: 'Normal', translation: 'Replaced the felt underlayment as required', position: 1, question: q
      Choice.create! name: 'Sintético', translation: 'Replaced synthetic underlayment as required', position: 2, question: q
      Choice.create! name: 'No', position: 3, question: q

  q = Question.create!  position: 4,
                        main_sentence: 'Cuántos pies cuadrados de decking se reemplazó?',
                        translation: 'Removed and replaced <User Input> sq ft of damaged decking with new decking',
                        work_type: techo_reparacion

  q = Question.create!  position: 5,
                        main_sentence: 'Cuántos pies lineales de flashing se reemplazó?',
                        translation: 'Replaced <User Input> linear ft of galvanized flashing as required',
                        work_type: techo_reparacion

  q = Question.create!  position: 6,
                        main_sentence: 'Cuántos pipas se reemplazaron?',
                        translation: 'Replaced <User Input> pipe(s) and/or roof jack(s) as required. Sealed properly to prevent water intrusion',
                        work_type: techo_reparacion

  q = Question.create!  position: 7,
                        main_sentence: 'Cuántas ventanillas se reemplazaron?',
                        translation: 'Replaced <User Input> vent(s) as required. Sealed properly to prevent any water intrusion',
                        work_type: techo_reparacion

  #############

  techo_completo =  WorkType.create! name: 'Techo Completo', form_type: 'one_line'

  q = Question.create!  position: 1, main_sentence: 'Teja de shingle (asfalto)', work_type: techo_completo
      Choice.create! name: '25 años', translation: '3-Tab Asphalt Shingle Roof Work', position: 1, question: q
      Choice.create! name: '30 años', translation: 'Dimensional Asphalt Shingle Roof Work', position: 2, question: q

  q = Question.create!  position: 2,
                        main_sentence: 'Cuántas escuadras?',
                        translation: 'Installed <User Input> squares of asphalt shingle roof. Installed same area of new underlayment as required. All new materials were sealed properly',
                        work_type: techo_completo

  q = Question.create!  position: 3,
                        main_sentence: 'Cuántos pies de Ridge Vent nuevo se hicieron?',
                        translation: 'Sawed <User Input> plywood decking peak to create new vent and installed new ridgevent',
                        work_type: techo_completo

  q = Question.create!  position: 4,
                        main_sentence: 'Cuántos pies de Ridge se cambiaron?',
                        translation: 'Removed and replaced <User Input> linear feet of ridge vent with new',
                        work_type: techo_completo

  q = Question.create!  position: 5,
                        main_sentence: 'Cuántos pies de Ridge se instalaron?',
                        translation: 'Installed <User Input> linear feet or ridge',
                        work_type: techo_completo

  q = Question.create!  position: 6, main_sentence: 'Se usó papel normal o sintético?', work_type: techo_completo
                        Choice.create! name: 'Normal', translation: 'Installed new felt underlayment', position: 1, question: q
                        Choice.create! name: 'Sintético', translation: 'Installed new synthetic underlayment', position: 2, question: q
                        Choice.create! name: 'Ninguno', position: 3, question: q

  q = Question.create!  position: 7,
                        main_sentence: 'Cuánto flashing?',
                        translation: 'Installed <User Input> linear feet of new flashing',
                        work_type: techo_completo

  q = Question.create!  position: 8,
                        main_sentence: 'Cuántas pipas se cambiaron?',
                        translation: 'Installed <User Input> new pipes and/or roof jacks, all sealed properly to prevent water intrusion',
                        work_type: techo_completo

  q = Question.create!  position: 9,
                        main_sentence: 'Cuántas ventilas se cambiaron?',
                        translation: 'Installed <User Input> roof vents, all sealed properly to prevent water intrusion',
                        work_type: techo_completo

  q = Question.create!  position: 10, main_sentence: 'Se instaló ice shield?', work_type: techo_completo
                        Choice.create! name: 'Sí', translation: 'Installled ice shield around vents to seal and protect properly', position: 1, question: q
                        Choice.create! name: 'No', position: 2, question: q

  q = Question.create!  position: 11,
                        main_sentence: 'Cuántos pies de drip edge se instalaron?',
                        translation: 'Installed <User Input> linear feet of drip edge as required',
                        work_type: techo_completo

  q = Question.create!  position: 12,
                        main_sentence: 'Cuántos pies de decking se cambiaron?',
                        translation: 'Installed <User Input> of new decking as required to install new roofing materials properly',
                        work_type: techo_completo

  #############

  techo_completo_contratista =  WorkType.create! name: 'Techo Completo - Contratista', form_type: 'multi_line'

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
                                translation: "Fee for a 2 story building.",
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

  question12 = Question.create!  main_sentence: '¿Tuviste que ir por material que falto?',
                                quantity_sentence: '¿Cuantas veces tuviste que ir por material que falto?',
                                price_sentence: 'Precio por ir por mas material:',
                                translation: "Material trip charge fee.",
                                position: 12,
                                work_type: techo_completo_contratista
end