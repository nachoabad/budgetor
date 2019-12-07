class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.string :sentence
      t.integer :position
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
