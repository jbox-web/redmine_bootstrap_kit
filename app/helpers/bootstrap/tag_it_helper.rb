module Bootstrap::TagItHelper

  def tag_it_list(id, list_opts = {}, tag_it_opts = {}, &block)
    data = { toggle: 'tagit' }
    data = data.merge(tag_it_opts)

    options = {}
    options[:id]   = id
    options[:data] = data
    options = options.merge(list_opts)

    if block_given?
      content_tag(:ul, options) do
        yield
      end
    else
      content_tag(:ul, '', options)
    end
  end

end
