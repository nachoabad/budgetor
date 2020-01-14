class BudgetMailer < ApplicationMailer
  def client_email
    @budget = params[:budget]

    attachments["budget-#{@budget.id}.pdf"] =  WickedPdf.new.pdf_from_string(
      render_to_string('/budget_mailer/client_email.html.erb')
    )

    mail(to: @budget.client.email, subject: 'New Estimate')
  end
end
