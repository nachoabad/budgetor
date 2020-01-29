class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:show, :email, :edit, :update, :destroy]

  def index
    @invoices = current_user.invoices
  end

  def show
    @line_items = @invoice.line_items
  end

  def email
    @invoice.update status: 'sent'

    InvoiceMailer.with(invoice: @invoice).client_email.deliver_later

    redirect_to @invoice, notice: 'Factura enviado al cliente'
  end

  def new
    @invoice = current_user.invoices.new
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to new_line_item_url(line_itemable_id: @invoice.id, line_itemable_type: Invoice) }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Factura actualizada' }
        format.js { @invoices = current_user.invoices }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Factura eliminada' }
      format.json { head :no_content }
    end
  end

  private
    def set_invoice
      @invoice = current_user.invoices.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:address, :purchase_order, :client_id)
    end
end
