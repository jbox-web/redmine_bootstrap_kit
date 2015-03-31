module Bootstrap::LabelHelper

  def label_with_tag(label, opts = {})
    opts[:class] = opts[:class].push('label')
    content_tag(:span, label, opts)
  end


  def label_with_default_tag(label = '', opts = {}, &block)
    label = yield if block_given?
    opts = opts.merge(class: ['label-default'])
    label_with_tag(label, opts)
  end


  def label_with_success_tag(label = '', opts = {}, &block)
    label = yield if block_given?
    opts = opts.merge(class: ['label-success'])
    label_with_tag(label, opts)
  end


  def label_with_info_tag(label = '', opts = {}, &block)
    label = yield if block_given?
    opts = opts.merge(class: ['label-info'])
    label_with_tag(label, opts)
  end


  def label_with_danger_tag(label = '', opts = {}, &block)
    label = yield if block_given?
    opts = opts.merge(class: ['label-important'])
    label_with_tag(label, opts)
  end


  def label_with_warning_tag(label = '', opts = {}, &block)
    label = yield if block_given?
    opts = opts.merge(class: ['label-warning'])
    label_with_tag(label, opts)
  end


  def label_with_primary_tag(label = '', opts = {}, &block)
    label = yield if block_given?
    opts = opts.merge(class: ['label-primary'])
    label_with_tag(label, opts)
  end

end
