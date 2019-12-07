class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :sentence
      t.integer :position
      t.references :sector, null: false, foreign_key: true

      t.timestamps
    end
  end
end
