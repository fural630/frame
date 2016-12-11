$(document).ready(function () {
        $('body').layout({ 
        	applyDefaultStyles: true,
        	west__size : 214,		//左边宽度
        	west__spacing_open: 8,
        	north__closable : false,
        	north__spacing_open : 2,
        	togglerContent_open:"<div>&lt;$lt;</div>"
         });
         
          $('.menu .nav li:not(".nav-parent") a').click(function() {
			  var $this = $(this);
			  $('.menu .nav .active').removeClass('active');
			  $this.closest('li').addClass('active');
			  var parent = $this.closest('.nav-parent');
			  if(parent.length)
			  {
				  parent.addClass('active');
			  }
		  });
    });