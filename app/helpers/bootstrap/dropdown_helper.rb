module Bootstrap::DropdownHelper

  def dropdown_menu(id, &block)
    content_tag(:div, id: id, class: 'dropdown dropdown-tip dropdown-relative') do
      content_tag(:ul, class: 'dropdown-menu') do
        yield block
      end
    end
  end


  def dropdown_button(target, opts = {})
    options = opts.merge({type: 'button', data: { dropdown: "##{target}" }})
    content = '&nbsp;'.html_safe
    button_tag(content, options)
  end

end
