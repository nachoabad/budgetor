module InvoicesHelper
  def status_button(status = 1)
    status =  case status
              when 1
                {name: 'No Enviado',  color: 'warning'}
              when 2
                {name: 'Enviado',     color: 'info'}
              when 3
                {name: 'Aprobado',    color: 'success'}
              end

    link_to status[:name], root_path, class: "btn btn-sm btn-#{status[:color]}"
    
  end
end
