class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_itemable_type = params[:line_itemable_type]
    
    if line_itemable_id = params[:line_itemable_id]
      klass = params[:line_itemable_type].constantize
      @line_itemable = klass.find line_itemable_id
      @client_id = @line_itemable.client.id
      @work_type = WorkType.find params[:work_type] if params[:work_type].present?
    else
      @client_id = params[:client]
      @address = params[:address]
      @work_type = WorkType.find params[:work_type]
    end

    @questions = @work_type.questions.to_json if @work_type
  end

  def edit
  end

  def create
    line_itemable_type = params[:line_itemable][:type].pluralize.downcase
    @line_itemable = eval("current_user.#{line_itemable_type}.find params[:line_itemable][:id]")

    ActiveRecord::Base.transaction do
      params[:line_itemable][:answers].each do |answer_json|
        answer    = JSON.parse answer_json
        question  = Question.find answer['id']
        
        line_item             = @line_itemable.line_items.new
        line_item.price       = (answer['price'].to_i * answer['quantity'].to_i)
        line_item.description = question.translation.gsub("<User Input>", answer['quantity'])
        line_item.save!
      end
    end

    redirect_to @line_itemable, notice: 'Línea de Estimado creada'
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
      format.html { redirect_to budgets_url, notice: 'Línea de estimado eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    def set_line_item
      @line_item = current_user.line_items.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:description, :price, :budget_id)
    end
end
