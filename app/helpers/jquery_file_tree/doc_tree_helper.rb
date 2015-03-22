module JqueryFileTree::DocTreeHelper

  def create_doc_tree(id, tree_url, content_url, opts = {})
    create_doc_tree_html(id, tree_url, content_url, opts) + create_doc_tree_js(id)
  end


  def render_doc_tree(parent, dir)
    content_tag(:ul, class: 'jqueryFileTree', style: 'display: none;') do
      render_dir_tree(parent, dir[0]) +
      render_file_tree(parent, dir[1])
    end
  end


  private


    def render_dir_tree(parent, dirs)
      s = ''
      dirs.each do |dir|
        s << content_tag(:li, link_to(dir, '#', rel: "#{parent}#{dir}/"), class: 'directory collapsed')
      end
      s.html_safe
    end


    def render_file_tree(parent, files)
      s = ''
      files.each do |file|
        s << content_tag(:li, link_to(file, '#', rel: "#{parent}#{file}"), class: "file #{file_extension_icon(file)}")
      end
      s.html_safe
    end


    def file_extension_icon(file)
      "ext_#{File.extname(file)[1..-1]}"
    end


    def create_doc_tree_html(id, tree_url, content_url, opts = {})
      options = opts.merge({ id: id, data: { tree_url: tree_url, content_url: content_url } })
      content_tag(:div, '', options)
    end


    def create_doc_tree_js(id)
      content_tag 'script', type: 'text/javascript' do
        raw "
          $(document).ready( function() {
            $('##{id}').fileTree({ root: '', script: $('##{id}').data('tree-url') }, function(file) {
              var url = $('##{id}').data('content-url');
              openFile(url, file);
            });
          });
        "
      end
    end

end
