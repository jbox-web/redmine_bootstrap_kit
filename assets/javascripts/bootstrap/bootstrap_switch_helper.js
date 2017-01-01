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
