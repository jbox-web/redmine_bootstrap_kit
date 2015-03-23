module AssetsLoaderBase

  def rbk_include_js(js)
    javascript_include_tag(js, plugin: 'redmine_bootstrap_kit')
  end


  def rbk_include_css(css)
    stylesheet_link_tag(css, plugin: 'redmine_bootstrap_kit')
  end

end
