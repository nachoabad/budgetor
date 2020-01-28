class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :address
      t.integer :status, default: 0
      t.string :purchase_order
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
