module BootstrapKitAssetsLoader

  REDMINE_BOOTSTRAP_KIT_ASSETS = [
    :redmine_bootstrap_kit,
    :bootstrap_alerts,
    :bootstrap_label,
    :bootstrap_modals,
    :bootstrap_switch,
    :bootstrap_tables,
    :bootstrap_tabs,
    :jquery_dropdown,
    :jquery_tag_it,
    :font_awesome
  ]


  def redmine_bootstrap_kit_load(rbk_module)
    method = "load_#{rbk_module}"
    self.send(method)
  end


  private


    def load_redmine_bootstrap_kit
      rbk_include_js('bootstrap') +
      rbk_include_css('bootstrap_custom') +
      rbk_include_css('bootstrap/bootstrap_custom')
    end


    def load_bootstrap_alerts
      rbk_include_js('plugins/bootstrap_alert') +
      rbk_include_js('plugins/bootstrap_transitions') +
      rbk_include_css('bootstrap/bootstrap_alert') +
      rbk_include_css('bootstrap/bootstrap_animations') +
      rbk_include_css('bootstrap/bootstrap_close')
    end


    def load_bootstrap_label
      rbk_include_css('bootstrap/bootstrap_label')
    end


    def load_bootstrap_modals
      render(partial: 'common/modal_base')
    end


    def load_bootstrap_pagination
      rbk_include_css('bootstrap/bootstrap_pagination')
    end


    def load_bootstrap_switch
      rbk_include_js('plugins/bootstrap_switch') +
      rbk_include_css('bootstrap/bootstrap_switch')
    end


    def load_bootstrap_tables
      rbk_include_css('bootstrap/bootstrap_tables')
    end


    def load_bootstrap_tabs
      rbk_include_css('bootstrap/bootstrap_tabs')
    end


    def load_jquery_dropdown
      rbk_include_js('plugins/jquery_dropdown') +
      rbk_include_css('jquery_dropdown')
    end


    def load_jquery_tag_it
      rbk_include_js('plugins/jquery_tag_it') +
      rbk_include_css('jquery_tag_it')
    end


    def load_font_awesome
      rbk_include_css('font_awesome')
    end


    def load_zero_clipboard
      zero_clipboard_assets + bootstrap_tooltip_assets
    end


    def zero_clipboard_assets
      rbk_include_js('plugins/zero_clipboard_min') +
      rbk_include_css('zero_clipboard')
    end


    def bootstrap_tooltip_assets
      rbk_include_js('plugins/bootstrap_tooltip') +
      rbk_include_css('bootstrap/bootstrap_tooltip')
    end


    def rbk_include_css(css)
      stylesheet_link_tag(css, plugin: 'redmine_bootstrap_kit')
    end


    def rbk_include_js(js)
      javascript_include_tag(js, plugin: 'redmine_bootstrap_kit')
    end

end
