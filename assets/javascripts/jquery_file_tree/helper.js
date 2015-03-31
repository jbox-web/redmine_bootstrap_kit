function openFile(url, file) {
  $.ajax({
    type: 'POST',
    url:  url,
    data: { filename: file },
    dataType: 'script'
  })
}
