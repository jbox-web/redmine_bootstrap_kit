module Bootstrap::TabHelper

  def tab_content(&block)
    content_tag(:div, class: 'tab-content') do
      content_tag(:div, class: 'tab-pane active') do
        yield block
      end
    end
  end

end
