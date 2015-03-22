module HighCharts::AssetsLoader

  def high_charts_load_base
    hc_include_js('highcharts')
  end


  def high_charts_load_module(hc_module)
    method = "load_hc_module_#{hc_module}"
    self.send(method)
  end


  private


    def hc_include_js(js)
      rbk_include_js("highcharts/#{js}")
    end


    def hc_include_css(css)
      rbk_include_css("highcharts/#{css}")
    end


    def load_hc_module_drilldown
      hc_include_js('modules/drilldown')
    end

end
