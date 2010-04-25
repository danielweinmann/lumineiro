$('#numbers_menu span a').live('click',function(e){
  e.preventDefault()
  number = this.href.slice(this.href.lastIndexOf('/') + 1)
  if(number == selected_number)
    return
  $('#number_' + selected_number).fadeOut(500, function() {
    $('#numbers_menu span').removeClass('selected')
    $('#show_number_' + number).addClass('selected')
    $('#number_' + number).fadeIn(1000)
    selected_number = number
  })
})

