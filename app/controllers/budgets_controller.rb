class BudgetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_budget, only: [:show, :email, :invoice, :edit, :update, :destroy]
  before_action :set_clients, only: [:new, :edit]

  def index
    @budgets = current_user.budgets
  end

  def show
    @line_items = @budget.line_items
  end

  def email
    @budget.update status: 'sent'
    
    BudgetMailer.with(budget: @budget).client_email.deliver_later

    redirect_to @budget, notice: 'Estimado enviado al cliente'
  end

  def invoice
    @budget.update status: 'approved'

    invoice = Invoice.new @budget.attributes.slice('address', 'client_id')
    invoice.line_items.build @budget.line_items.map(&:attributes).map {|li| li.slice('description', 'price')}
    if invoice.save
      redirect_to invoice, notice: 'Estimado convertido en Factura'
    else
      render :show
    end
  end
  
  def new
    @budget = current_user.budgets.new
  end
 
  def create
    @budget = current_user.budgets.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to new_line_item_url(line_itemable_id: @budget.id, line_itemable_type: Budget) }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to @budget, notice: 'Estimado actualizado' }
        format.js { @budgets = current_user.budgets }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Estimado eliminado' }
      format.json { head :no_content }
    end
  end

  private
    def set_budget
      @budget = current_user.budgets.find(params[:id])
    end

    def set_clients
      @clients = current_user.clients
    end

    def budget_params
      params.require(:budget).permit(:address, :client_id, :status)
    end
end
