class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :main_sentence
      t.string :quantity_sentence
      t.string :price_sentence
      t.string :translation
      t.integer :position
      t.references :work_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
