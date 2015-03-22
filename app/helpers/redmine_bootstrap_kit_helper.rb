module RedmineBootstrapKitHelper
  include Bootstrap::AssetsLoader
  include Bootstrap::DropdownHelper
  include Bootstrap::FontAwesomeHelper
  include Bootstrap::LabelHelper
  include Bootstrap::SwitchHelper
  include Bootstrap::TabHelper
  include Bootstrap::TagItHelper
  include Bootstrap::WillPaginateHelper

  include CodeMirror::AssetsLoader
  include CodeMirror::ColorizerHelper

  include HighCharts::AssetsLoader

  include JqueryFileTree::AssetsLoader
  include JqueryFileTree::DocTreeHelper

  include ZeroClipboard::AssetsLoader
  include ZeroClipboard::ZeroClipboardHelper

  include Redmine::AjaxHelper
  include Redmine::PresenterHelper


  def rbk_include_js(js)
    javascript_include_tag(js, plugin: 'redmine_bootstrap_kit')
  end


  def rbk_include_css(css)
    stylesheet_link_tag(css, plugin: 'redmine_bootstrap_kit')
  end

end
