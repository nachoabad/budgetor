class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.string :address
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
