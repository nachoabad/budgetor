json.extract! invoice, :id, :address, :purchase_order, :client_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
