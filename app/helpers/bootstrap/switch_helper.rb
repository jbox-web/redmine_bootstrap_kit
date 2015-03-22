module Bootstrap::SwitchHelper

  def bootstrap_switch_tag(opts = {}, &block)
    css_class = opts.delete(:class){ '' }
    options   = { data: bootstrapswitch_default_data }
    options   = options.deep_merge(opts)
    options[:class] = ['bootstrap-switch', 'switch-small'].push(css_class)
    content_tag(:span, options) do
      yield if block_given?
    end
  end


  def bootstrapswitch_default_data
    { 'on' => 'primary', 'off' => 'default', 'on-label' => l(:label_yes), 'off-label' => l(:label_no) }
  end

end
