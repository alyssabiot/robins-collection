module ApplicationHelper
  def active_class(path)
    if request.path == path
      return 'active'
    else
      return ''
    end
  end

  def display_boolean(value)
    value ? "<i class='fa fa-check green'></i>".html_safe : "<i class='fa fa-times red'></i>".html_safe
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def display_order_arrow(column)
    if params[:direction] == 'desc'
      "#{column} <i class='fa fa-angle-down'></i>".html_safe
    else
      "#{column} <i class='fa fa-angle-up'></i>".html_safe
    end
end
end
