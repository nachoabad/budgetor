module BudgetsHelper
  def budget_status_button(budget)
    status =  case budget.status
              when 'created'
                {name: 'Creado',  color: 'danger'}
              when 'sent'
                {name: 'Enviado',  color: 'warning'}
              when 'approved'
                {name: 'Aprobado', color: 'success'}
              end

    link_to status[:name], budget_path(budget, {budget: {status: next_budget_status(budget)}}), class: "btn btn-sm btn-#{status[:color]}", remote: true, method: :put
    
  end

  def next_budget_status(budget)
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