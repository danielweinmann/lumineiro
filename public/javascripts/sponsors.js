$(window).load(function () {
  $('.sponsors a').hover(function() {
    $(this).children('sponsor_pb').hide()
    $(this).children('sponsor').show()
  }, function() {
    $(this).children('sponsor').hide()
    $(this).children('sponsor_pb').show()
  })
});

