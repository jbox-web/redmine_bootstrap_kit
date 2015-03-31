module CodeMirror::AssetsLoader

  def code_mirror_load_base
    cm_include_js('codemirror') +
    cm_include_css('codemirror')
  end


  def code_mirror_load_addon(cm_addon)
    method = "load_cm_addon_#{cm_addon}"
    self.send(method)
  end


  def code_mirror_load_language(cm_lang)
    cm_include_js("mode/#{cm_lang}/#{cm_lang}")
  end


  def code_mirror_load_full_editor
    code_mirror_load_base +
    code_mirror_load_addon(:keymap_extra) +
    code_mirror_load_addon(:active_line) +
    code_mirror_load_addon(:matchbrackets) +
    code_mirror_load_addon(:closebrackets) +
    code_mirror_load_addon(:fullscreen) +
    code_mirror_load_addon(:comment)
  end


  private


    def cm_include_js(js)
      rbk_include_js("codemirror/#{js}")
    end


    def cm_include_css(css)
      rbk_include_css("codemirror/#{css}")
    end


    def load_cm_addon_keymap_extra
      cm_include_js('keymap/extra')
    end


    def load_cm_addon_active_line
      cm_include_js('addon/selection/active-line')
    end


    def load_cm_addon_matchbrackets
      cm_include_js('addon/edit/matchbrackets')
    end


    def load_cm_addon_closebrackets
      cm_include_js('addon/edit/closebrackets')
    end


    def load_cm_addon_fullscreen
      cm_include_js('addon/display/fullscreen') +
      cm_include_css('addon/display/fullscreen')
    end


    def load_cm_addon_comment
      cm_include_js('addon/comment/comment')
    end

end
