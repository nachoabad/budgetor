class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    budgets = current_user.budgets
    invoices = current_user.invoices
    @docs = (budgets + invoices)
  end
end
