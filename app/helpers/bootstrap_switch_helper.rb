module BootstrapSwitchHelper

  def bootstrapswitch_button(&block)
    content_tag(:span, class: 'bootstrap-switch switch-small', data: bootstrapswitch_default_data) do
      yield
    end
  end


  def bootstrapswitch_default_data
    { 'on' => 'primary', 'off' => 'default', 'on-label' => l(:label_yes), 'off-label' => l(:label_no) }
  end

end
