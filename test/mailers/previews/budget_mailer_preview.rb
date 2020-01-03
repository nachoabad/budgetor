# Preview all emails at http://localhost:3000/rails/mailers/budget_mailer
class BudgetMailerPreview < ActionMailer::Preview
  def client_email
    BudgetMailer.with(budget: Budget.first).client_email
  end
end
