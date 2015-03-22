module JqueryFileTree::AssetsLoader

  def jquery_file_tree_load_base
    jft_include_js('jquery_file_tree') +
    jft_include_js('jquery_easing') +
    jft_include_js('helper') +
    jft_include_css('jquery_file_tree')
  end


  private


    def jft_include_js(js)
      rbk_include_js("jquery_file_tree/#{js}")
    end


    def jft_include_css(css)
      rbk_include_css("jquery_file_tree/#{css}")
    end

end
