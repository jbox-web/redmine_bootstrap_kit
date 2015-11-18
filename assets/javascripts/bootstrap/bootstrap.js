/*
BootstrapSwitch
*/
function setBootstrapSwitch() {
  $('.bootstrap-switch').each(function(index, element) {
    installBootstrapSwitch(element);
  });
}

function installBootstrapSwitch(element) {
  $(element).bootstrapSwitch();
  $(element).on('switch-change', function (e, data) {
    var element = $(data.el);
    var value   = data.value;
    element.val(value);
  });
}


/*
BootstrapAlert
*/
function setBootstrapAlert(){
  $('.alert').each(function(index, element){
    $(element).alert();
  });
}

function addAlertMessage(object){
  $(object.target)
    .append(
      $('<div>')
        .attr('class', 'alert fade in ' + object.type)
        .html(object.message)
        .prepend(
          $('<button>')
            .attr('class', 'close')
            .attr('type', 'button')
            .attr('data-dismiss', 'alert')
            .html('&times;')
        )
    )

  setBootstrapAlert();
}


/*
BootstrapTooltips
*/
function setBootstrapToolTips(){
  $('.tooltips').tooltip({
    position: {
      my: "left+15 left",
      at: "right center",
      using: function( position, feedback ) {
        $(this).css(position);
        $('<div>')
          .addClass( 'arrow left' )
          .addClass( feedback.vertical )
          .addClass( feedback.horizontal )
          .appendTo( this );
      }
    }
  });
}


/*
JQueryModalBox
*/
$(window).resize(function() {
  $(".ui-dialog-content").dialog("option", "position", ['center', 'center']);
});


// Transform div in Dialog box
function initModalBoxes(modals){

  $(modals.modal_list).each(function() {

    var buttons_list = {};

    if (this.mode == 'standard'){
      buttons_list[modals.label_save]   = function(){$(this).find('form').submit();};
      buttons_list[modals.label_cancel] = function(){$(this).dialog('close');};
    } else if (this.mode == 'close-only'){
      buttons_list[modals.label_ok] = function(){$(this).dialog('close');};
    }

    $(this.target).dialog({
      resizable: false,
      autoOpen: false,
      height: 'auto',
      width: 'auto',
      modal: true,
      hide: {
        effect: "fade",
        duration: 500
      },
      buttons: buttons_list,
    });

    setUpModalBox(this.source, this.target);
  });
}


// Bind links on Dialog box
function setUpModalBox(source, target) {
  $(source).each(function() {
    $(this).on('click', function() {
      var title = $(this).html();
      $.get($(this).attr('href'), function(data){
        $(target).html(data);
        $(target).dialog('option', 'title', title);
        $(target).dialog('open');
      });
      return false;
    });
  });
}


if (!Array.prototype.remove) {
  Array.prototype.remove = function(val) {
    var i = this.indexOf(val);
    return i>-1 ? this.splice(i, 1) : [];
  };
}


function constantize(str) {
  if (typeof str !== 'string') {
    throw new TypeError('must pass in type of string');
  }

  if (str.match(/\W|\d/)) {
    throw new SyntaxError('must pass in a valid Javascript name');
  }

  var constant
  eval("constant = " + str);
  return constant;
};


/*
JQueryTagIt
*/
function setTagIt(){
  $('[data-toggle="tagit"]').each(function(){

    var data_source = $(this).data('source');
    var callback_after_add = $(this).data('after-add');
    var callback_after_del = $(this).data('after-delete');

    if (data_source != undefined) {
      data_source = constantize(data_source);
      var source_options = {
        afterTagAdded: function(event, ui) {
          var value = ui.tag.children('input:hidden').val();
          data_source.remove(value);
          if (callback_after_add != undefined) { eval(callback_after_add); }
        },
        afterTagRemoved: function(event, ui) {
          var value = ui.tag.children('input:hidden').val();
          data_source.push(value);
          if (callback_after_del != undefined) { eval(callback_after_del); }
        },
        autocomplete: {
          source: function(request, resolve) {
            resolve(data_source);
          }
        }
      }
    } else {
      var source_options = {};
    }

    var default_options = {
      showAutocompleteOnFocus: true,
      placeholderText:         $(this).data('placeholder'),
      allowDuplicates:         false,
      caseSensitive:           false,
      fieldName:               $(this).attr('name')
    }

    tagit_options = $.extend({}, source_options, default_options);
    $(this).tagit(tagit_options);
  });
}


function setZeroClipBoard(element){
  var client = new ZeroClipboard($(element));

  client.on('ready', function() {
    $('#global-zeroclipboard-html-bridge').tooltip({
      title:     $(element).data('label-to-copy'),
      placement: 'right'
    });

    client.on('beforecopy', function() {
      $('#global-zeroclipboard-html-bridge').tooltip('show');
    });

    client.on('aftercopy', function() {
      $('.tooltip .tooltip-inner').text($(element).data('label-copied'));
    });
  });
}


// Return a helper with preserved width of cells
var fixHelper = function(e, ui) {
  ui.children().each(function() {
    $(this).width($(this).width());
  });
  return ui;
};


function setSortableElement(element, form) {
  $(element).sortable({
    helper: fixHelper,
    axis: 'y',
    update: function(event, ui) {
      $.post($(form).data('update-url'), $(this).sortable('serialize'), null, 'script');
    }
  });
}
