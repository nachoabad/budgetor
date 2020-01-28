module BudgetsHelper
  def budget_status_button(budget)
    status =  case budget.status
              when 'created'
                {name: 'Creado',  color: 'warning'}
              when 'sent'
                {name: 'Enviado',     color: 'info'}
              when 'approved'
                {name: 'Aprobado',    color: 'success'}
              end

    link_to status[:name], budget_path(budget, {budget: {status: next_status(budget)}}), class: "btn btn-sm btn-#{status[:color]}", remote: true, method: :put
    
  end

  def next_status(budget)
    case budget.status
    when 'created'
      'sent'
    when 'sent'
      'approved'
    when 'approved'
      'created'
    end
  end
end