class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    ActiveRecord::Base.transaction do
      if params[:budget][:id].present?
        @budget = current_user.budgets.find params[:budget][:id]
      else
        client = current_user.clients.find params[:budget][:client_id]
        @budget = client.budgets.create!
      end

      @line_item = @budget.line_items.new
      @line_item.price = params[:line_item][:price]
      
      description = ''

      questions = Question.where(budget_type_id: params[:budget][:type_id]).order(:position)

      questions.each_with_index do |question, index|
        if question.choices.exists?
          description << Choice.find(params[:budget][:answers][index]).translation
        else
          description << question.translation.gsub("<userinput>", params[:budget][:answers][index])
        end
      end

      @line_item.description = description

      respond_to do |format|
        if @line_item.save
          format.html { redirect_to @line_item.budget, notice: 'Linea de Presupuesto creada' }
          format.json { render :show, status: :created, location: @line_item }
        else
          format.html { render :new }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:description, :price, :budget_id)
    end
end
