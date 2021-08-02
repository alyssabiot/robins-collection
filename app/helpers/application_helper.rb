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
end
