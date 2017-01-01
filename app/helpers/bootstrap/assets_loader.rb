module Bootstrap::AssetsLoader

  def bootstrap_load_base
    rbk_include_css('bootstrap_custom') +
    bs_include_css('bootstrap_custom')
  end


  def bootstrap_load_module(bs_module)
    method = "load_bs_module_#{bs_module}"
    self.send(method)
  end


  private


    def bs_include_js(js)
      rbk_include_js("bootstrap/#{js}")
    end


    def bs_include_css(css)
      rbk_include_css("bootstrap/#{css}")
    end


    def load_bs_module_alerts
      bs_include_js('bootstrap_alert') +
      bs_include_js('bootstrap_alert_helper') +
      bs_include_js('bootstrap_transitions') +
      bs_include_css('bootstrap_alert') +
      bs_include_css('bootstrap_animations') +
      bs_include_css('bootstrap_close')
    end


    def load_bs_module_label
      bs_include_css('bootstrap_label')
    end


    def load_bs_module_modals
      bs_include_js('bootstrap_modal')
    end


    def load_bs_module_pagination
      bs_include_css('bootstrap_pagination')
    end


    def load_bs_module_sortable
      bs_include_js('bootstrap_sortable_helper')
    end


    def load_bs_module_switch
      bs_include_js('bootstrap_switch') +
      bs_include_js('bootstrap_switch_helper') +
      bs_include_css('bootstrap_switch')
    end


    def load_bs_module_tables
      bs_include_css('bootstrap_tables')
    end


    def load_bs_module_tabs
      bs_include_css('bootstrap_tabs')
    end


    def load_bs_module_font_awesome
      rbk_include_css('font-awesome')
    end


    def load_bs_module_dropdown
      bs_include_js('jquery_dropdown') +
      bs_include_css('jquery_dropdown')
    end


    def load_bs_module_tooltip
      bs_include_js('bootstrap_tooltip') +
      bs_include_js('bootstrap_tooltip_helper') +
      bs_include_css('bootstrap_tooltip')
    end


    def load_bs_module_notify
      bs_include_js('bootstrap_notify') +
      bs_include_css('animate')
    end


    def load_bs_module_tag_it
      bs_include_js('jquery_tag_it') +
      bs_include_js('jquery_tag_it_helper') +
      bs_include_css('jquery_tag_it')
    end

end
