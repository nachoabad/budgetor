class BudgetMailer < ApplicationMailer
  def client_email
    @budget = params[:budget]

    mail(to: @budget.client.email, subject: 'New Estimate')
  end
end
