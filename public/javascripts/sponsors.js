$(window).load(function () {
  $('.sponsor').hover(function() {
    $(this).attr('src', $(this).attr('src').replace('_pb', ''))
  }, function() {
    $(this).attr('src', $(this).attr('src').replace('.jpg', '_pb.jpg'))
  })
});

