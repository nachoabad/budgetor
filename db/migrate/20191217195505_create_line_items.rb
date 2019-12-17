class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.text :description
      t.decimal :price
      t.references :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
