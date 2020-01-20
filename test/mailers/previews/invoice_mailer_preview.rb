# Preview all emails at http://localhost:3000/rails/mailers/budget_mailer
class InvoiceMailerPreview < ActionMailer::Preview
  def client_email
    InvoiceMailer.with(invoice: Invoice.first).client_email
  end
end
