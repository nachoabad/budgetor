class InvoiceMailer < ApplicationMailer
  def client_email
    @invoice = params[:invoice]

    attachments["invoive-#{@invoice.id}.pdf"] =  WickedPdf.new.pdf_from_string(
      render_to_string('/invoice_mailer/client_email.html.erb')
    )

    mail(to: @invoice.client.email, subject: 'New Invoice')
  end
end
