module ZeroClipboard::AssetsLoader

  def zero_clipboard_load_base
    zc_include_js('clipboard.min') +
    zc_include_js('clipboard_helper') +
    zc_include_css('clipboard')
  end


  private


    def zc_include_js(js)
      rbk_include_js("clipboard/#{js}")
    end


    def zc_include_css(css)
      rbk_include_css("clipboard/#{css}")
    end

end
