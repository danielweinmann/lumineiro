function addImg(item) {
  if( item.children('.photo').length == 0 ) {
    src = item.children('input').val()
    img = $('<img class="photo hide" src="/foto/?url=' + escape(src) + '" />')
    img.load(imgLoad)
    item.append(img)
    return true
  }
  return false
}

function imgLoad() {
  $(this).parent().children('.loading').fadeOut(300, function() {
    $(this).parent().children('.photo').fadeIn(500)
    //$('#slider ul li').each(function() {
    //  if(addImg($(this))) {
    //    return
    //  }
    //})
  })
}

function beforeSlide(dir) {
  if(dir == 'next') {
    diff = 1
  } else {
    diff = -1
  }
  list = $('#slider ul')
  number = (list.css("margin-left").replace('-', '').replace('px', '') / 800) + 1 + diff
  if(number > total) {
    number = 1
  } else if(number < 1) {
    number = total
  }
  addImg($(list.children('li')[number]))
}

function afterSlide() {
  list = $('#slider ul')
  number = (list.css("margin-left").replace('-', '').replace('px', '') / 800) + 1
}

$(document).ready(function(){

	$("#slider").easySlider({
		continuous: true,
		prevText: '«',
		nextText: '»',
		controlsBefore: '<div class="navigation">',
		controlsAfter: '</div>',
		beforeSlide: beforeSlide,
		afterSlide: afterSlide
	});
  list = $('#slider ul')
  number = (list.css("margin-left").replace('-', '').replace('px', '') / 800) + 1
  addImg($(list.children('li')[number]))

});

