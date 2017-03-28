module ZeroClipboard::ZeroClipboardHelper

  def zero_clipboard_button_for(target)
    render_zero_clipboard_button(target) + render_zero_clipboard_javascript(target)
  end


  private


    def render_zero_clipboard_button(target)
      opts = { id: "zc_#{target}", class: 'clipboard_button', data: zero_clipboard_options.merge('clipboard-target' => "##{target}") }
      content_tag(:div, image_tag('paste.png', plugin: 'redmine_bootstrap_kit'), opts)
    end


    def render_zero_clipboard_javascript(target)
      javascript_tag("setZeroClipBoard('#zc_#{target}');")
    end


    def zero_clipboard_options
      { 'label-copied'  => l(:label_copied_to_clipboard), 'label-to-copy' => l(:label_copy_to_clipboard) }
    end

end
