module InvoicesHelper
  def invoice_status_button(invoice)
    status =  case invoice.status
              when 'created'
                {name: 'Creada',  color: 'danger'}
              when 'sent'
                {name: 'Enviada', color: 'warning'}
              when 'paid'
                {name: 'Pagada',  color: 'success'}
              end

    link_to status[:name], invoice_path(invoice, {invoice: {status: next_invoice_status(invoice)}}), class: "btn btn-sm btn-#{status[:color]}", remote: true, method: :put
    
  end

  def next_invoice_status(invoice)
    case invoice.status
    when 'created'
      'sent'
    when 'sent'
      'paid'
    when 'paid'
      'created'
    end
  end
end
