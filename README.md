## Redmine Bootstrap Kit

As Redmine does not support asset pipeline, we need to install JQuery plugins as Redmine plugins to load them globally.

It includes :

* [BootstrapSwitch 1.8](https://github.com/nostalgiaz/bootstrap-switch)
* [CodeMirror 3.2](https://github.com/codemirror/codemirror)
* [jQuery FileTree](https://github.com/daverogers/jQueryFileTree)
* [jQuery TagIt](http://aehlke.github.io/tag-it/)
* [jQuery UI Bootstrap 0.5](http://jquery-ui-bootstrap.github.io/jquery-ui-bootstrap/) - 2014-04-19
* [FontAwesome 4.3.0](http://fortawesome.github.io/Font-Awesome/)
* [Highcharts 4.1.4](https://github.com/highslide-software/highcharts.com)
* [ZeroClipboard 2.2.0](https://github.com/zeroclipboard/zeroclipboard)

And a set of various Rails helper methods (see below).

## Installation

Just clone it in your Redmine plugins directory :

    cd REDMINE_ROOT/plugins
    git clone https://github.com/jbox-web/redmine_bootstrap_kit.git

## What's included?

It provides the following Rails helper methods :

#### BootstrapKit assets loader :

    bootstrap_load_module(rbk_module)

This method loads all JS and CSS files needed by the required module.

The following modules are available :

* alerts
* label
* modals
* pagination
* switch
* tables
* tabs
* font_awesome
* dropdown
* tooltip
* notify
* tag_it

#### BootstrapSwitch :

    bootstrap_switch_tag(opts = {}, &block)

#### FontAwesome :

    fa_icon(icon, opts = {})
    label_with_icon(label, icon, icon_opts = {})

#### AjaxHelper :

    render_flash_messages_as_js(target = '#flash-messages', opts = {})
    js_render_template(target, template, opts = {})
    js_render_partial(target, partial, opts = {})
    js_render(target, content, opts = {})

#### PresenterHelper :

    present(object, klass = nil, *args)

#### JQuery TagIt :

    tag_it_list(id, list_opts = {}, tag_it_opts = {}, &block)

#### WillPaginateHelper :

    paginate(collection, opts = {})

#### ZeroClipboardHelper:

    zero_clipboard_button_for(target)

## How to use?

To use Redmine Bootstrap Kit helper methods you must first add ```:redmine_bootstrap_kit``` helper in your controller :

```
class MyPluginController < ApplicationController
  ...

  helper :redmine_bootstrap_kit

end
```

Then with the ```bootstrap_load_module``` method you can load the desired assets in your views :

```
<% content_for :header_tags do %>
  <%= bootstrap_load_base %>
  <%= bootstrap_load_module(:alerts) %>
  <%= bootstrap_load_module(:label) %>
  <%= bootstrap_load_module(:modals) %>
  <%= bootstrap_load_module(:pagination) %>
  <%= bootstrap_load_module(:switch) %>
  <%= bootstrap_load_module(:tables) %>
  <%= bootstrap_load_module(:tabs) %>
  <%= bootstrap_load_module(:font_awesome) %>
  <%= bootstrap_load_module(:dropdown) %>
  <%= bootstrap_load_module(:tooltip) %>
  <%= bootstrap_load_module(:notify) %>
  <%= bootstrap_load_module(:tag_it) %>
<% end %>
```

The ```bootstrap_load_base``` method call is needed if you want to use provided JS helpers (see below).


## To create BootstrapSwitch buttons

In your views :

```
<% content_for :header_tags do %>
  <%= bootstrap_load_base %>
  <%= bootstrap_load_module(:switch) %>
<% end %>

<p>
  <label>This is a switch button</label>
  <%= bootstrap_switch_tag do %>
    <%= hidden_field_tag "extra[enable]", "false" %>
    <%= check_box_tag "extra[enable]" %>
  <% end %>
</p>

<%= javascript_tag do %>
  $(document).ready(function() { setBootstrapSwitch(); });
<% end %>
```

## To create TagIt lists

In your views :

```
<% content_for :header_tags do %>
  <%= bootstrap_load_base %>
  <%= bootstrap_load_module(:tag_it) %>
<% end %>

<p>
  <label>This is a TagIt list</label>
</p>

<%= tag_it_list 'plugin_emails_list',
                { name: 'plugin[emails_list][]' },
                { placeholder: '+ add email' } do %>
  <li>john@doe.com</li>
  <li>jane@doe.com</li>
<% end %>

<%= javascript_tag do %>
  $(document).ready(function() { setTagIt(); });
<% end %>
```

## Copyrights & License

Redmine Bootstrap Kit is completely free and open source and released under the [MIT License](https://github.com/jbox-web/redmine_bootstrap_kit/blob/devel/LICENSE).

Copyright (c) 2013-2015 Nicolas Rodriguez (nrodriguez@jbox-web.com), JBox Web (http://www.jbox-web.com) [![endorse](https://api.coderwall.com/n-rodriguez/endorsecount.png)](https://coderwall.com/n-rodriguez)

## Contribute

You can contribute to this plugin in many ways such as :
* Helping with documentation
* Contributing code (features or bugfixes)
* Reporting a bug
* Submitting translations

You can also donate :)

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=FBT7E7DAVVEEU)
