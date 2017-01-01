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
