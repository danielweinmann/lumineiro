$('#name, #email').keypress(function(e) {
  if (e.keyCode == '13') {
     $('#submit').click()
   }
});

$('#submit').click(function() {
  re = /^[a-z0-9\._-]+@([a-z0-9][a-z0-9-_]*[a-z0-9-_]\.)+([a-z-_]+\.)?([a-z-_]+)$/
  if(!$('#email').val().match(re)) {
    $('#flash').html("Por favor, preencha corretamente o e-mail.").addClass('failure').removeClass('success').slideDown();
    $('#email').focus();
    return false;
  }
  $('#flash').slideUp(function(){
    $('#flash').removeClass('failure').removeClass('success')
  });
  $('#submit').attr('disabled', true)
  $('#loading_off').hide()
  $('#loading').show()
  $.getJSON('/mailee', { name: $('#name').val(), email: $('#email').val() }, function(response) {
    $('#submit').attr('disabled', false)
    $('#loading').hide()
    $('#loading_off').show()
    if(response.ok) {
      $('#flash').html(response.msg).addClass('success').removeClass('failure').slideDown();
    } else {
      $('#flash').html(response.msg).addClass('failure').removeClass('success').slideDown();
    }
  })
})

