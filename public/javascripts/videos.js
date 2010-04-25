$('#videos_menu span a').live('click',function(e){
  e.preventDefault()
  video = this.href.slice(this.href.lastIndexOf('/') + 1)
  if(video == selected_video)
    return
  $('#video_' + selected_video).hide()
  $('#videos_menu span').removeClass('selected')
  $('#show_video_' + video).addClass('selected')
  $('#video_' + video).show()
  selected_video = video
})

