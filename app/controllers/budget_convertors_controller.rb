class BudgetConvertorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_budget, only: [:new, :create]

  def create
    @budget.update status: 'approved'

    invoice = Invoice.new @budget.attributes.slice('address', 'client_id')
    invoice.purchase_order = params[:purchase_order]
    invoice.line_items.build @budget.line_items.map(&:attributes).map {|li| li.slice('description', 'price')}
    if invoice.save
      redirect_to invoice, notice: 'Estimado convertido en Factura'
    else
      render :new
    end
  end

  private
    def set_budget
      @budget = current_user.budgets.find(params[:budget_id])
    end
end
