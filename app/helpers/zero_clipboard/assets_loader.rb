module ZeroClipboard::AssetsLoader

  def zero_clipboard_load_base
    zc_include_js('zero_clipboard_min') +
    zc_include_css('zero_clipboard')
  end


  private


    def zc_include_js(js)
      rbk_include_js("zero_clipboard/#{js}")
    end


    def zc_include_css(css)
      rbk_include_css("zero_clipboard/#{css}")
    end

end
