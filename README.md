## Redmine Bootstrap Kit

As Redmine does not support asset pipeline, we need to install JQuery plugins as Redmine plugins to load them globally.

It includes :

* [BootstrapSwitch 1.8](https://github.com/nostalgiaz/bootstrap-switch)
* [JQuery UI Bootstrap 0.5](http://jquery-ui-bootstrap.github.io/jquery-ui-bootstrap/) - 2014-04-19
* [JQuery TagIt](http://aehlke.github.io/tag-it/)
* [FontAwesome 4.3.0](http://fortawesome.github.io/Font-Awesome/)
* [ZeroClipboard 2.2.0](https://github.com/zeroclipboard/zeroclipboard)

And a set of various helper methods.

Just clone it in your Redmine plugins directory :

    cd REDMINE_ROOT/plugins
    git clone https://github.com/jbox-web/redmine_bootstrap_kit.git

Now, within another Redmine plugins, you can call Bootstrap Kit elements :

```
<% content_for :header_tags do %>
  <%= stylesheet_link_tag 'font_awesome',                    :plugin => 'redmine_bootstrap_kit' %>
  <%= stylesheet_link_tag 'bootstrap_custom',                :plugin => 'redmine_bootstrap_kit' %>
  <%= stylesheet_link_tag 'bootstrap/bootstrap_alert',       :plugin => 'redmine_bootstrap_kit' %>
  <%= stylesheet_link_tag 'bootstrap/bootstrap_animations',  :plugin => 'redmine_bootstrap_kit' %>
  <%= stylesheet_link_tag 'bootstrap/bootstrap_close',       :plugin => 'redmine_bootstrap_kit' %>
  <%= stylesheet_link_tag 'bootstrap/bootstrap_custom',      :plugin => 'redmine_bootstrap_kit' %>
  <%= stylesheet_link_tag 'bootstrap/bootstrap_label',       :plugin => 'redmine_bootstrap_kit' %>
  <%= stylesheet_link_tag 'bootstrap/bootstrap_pagination',  :plugin => 'redmine_bootstrap_kit' %>
  <%= stylesheet_link_tag 'bootstrap/bootstrap_tables',      :plugin => 'redmine_bootstrap_kit' %>
  <%= stylesheet_link_tag 'bootstrap/bootstrap_tabs',        :plugin => 'redmine_bootstrap_kit' %>
  <%= stylesheet_link_tag 'bootstrap/bootstrap_tooltip',     :plugin => 'redmine_bootstrap_kit' %>

  <%= javascript_include_tag 'plugins/bootstrap_alert',       :plugin => 'redmine_bootstrap_kit' %>
  <%= javascript_include_tag 'plugins/bootstrap_tooltip',     :plugin => 'redmine_bootstrap_kit' %>
  <%= javascript_include_tag 'plugins/bootstrap_transitions', :plugin => 'redmine_bootstrap_kit' %>
<% end %>
```

## To create BootstrapSwitch buttons

In your controllers :

```
class MyPluginController < ApplicationController
  ...

  helper :bootstrap_switch

end
```

In your views :

```
<% content_for :header_tags do %>
  <%= stylesheet_link_tag    'bootstrap/bootstrap_switch', plugin: 'redmine_bootstrap_kit' %>
  <%= javascript_include_tag 'plugins/bootstrap_switch',   plugin: 'redmine_bootstrap_kit' %>
  <%= javascript_include_tag 'bootstrap',                  plugin: 'redmine_bootstrap_kit' %>
<% end %>

<p>
  <label>This is a switch button</label>
  <%= bootstrap_switch_tag do %>
    <%= hidden_field_tag "extra[enable]", "false" %>
    <%= check_box_tag "extra[enable]" %>
  <% end %>
</p>

<%= javascript_tag do %>
  $(document).ready(function() {
    $('.bootstrap-switch').each(function(index, element) {
      installBootstrapSwitch(element);
    });
  });
<% end %>
```

## To create TagIt lists

In your controllers :

```
class MyPluginController < ApplicationController
  ...

  helper :tag_it

end
```

In your views :

```
<% content_for :header_tags do %>
  <%= stylesheet_link_tag    'jquery_tag_it', plugin: 'redmine_bootstrap_kit' %>
  <%= javascript_include_tag 'jquery_tag_it', plugin: 'redmine_bootstrap_kit' %>
  <%= javascript_include_tag 'bootstrap',     plugin: 'redmine_bootstrap_kit' %>
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
  $(document).ready(function() {
    setTagIt();
  });
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
