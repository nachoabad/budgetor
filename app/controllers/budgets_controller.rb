class BudgetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_budget, only: [:show, :edit, :update, :destroy]
  before_action :set_clients, only: [:new, :edit]

  def index
    @budgets = current_user.budgets
  end

  def show
  end

  def new
    @budget = current_user.budgets.new
    client_id, sector_id = params[:client], params[:sector]

    if client_id && sector_id
      sector = Sector.find sector_id
      @questions = sector.questions.to_json(include: :choices)
    end
  end

  def edit
  end

  def create
    @budget = current_user.budgets.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to @budget, notice: 'Budget was successfully created.' }
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
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
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
      format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
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
      params.require(:budget).permit(:client_id)
    end
end
