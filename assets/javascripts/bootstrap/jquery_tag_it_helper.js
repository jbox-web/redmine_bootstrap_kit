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
