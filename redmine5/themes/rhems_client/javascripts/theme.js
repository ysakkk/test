$(document).on('ready', function () {
	$('#projects-index ul li.root').each(function () {
		var find = $(this).find('a.project').html();
		if (find == 'RHEMS Japan') {
			$(this).prependTo("#projects-index > ul");
			$(this).addClass('rj_project');
		}
	});


var myStorage = window.localStorage;
var menuSaveName = 'rm_menu'

var rm_menu = myStorage.getItem(menuSaveName);



	$('#account .my-account').html('&nbsp;');
	$('#header').append('<div id="switch"></div>')


if(rm_menu == 'true'){
	$('#switch').addClass('open');
	$('#sidebar').addClass('acive');
}


	if(! $('#sidebar').html().match(/\</) ){
		$('#switch').css('display','none');
	}
  
//


	$('#switch').on('click',function(){

		if( $('#switch').hasClass('open')  ){
			myStorage.setItem(menuSaveName,'false');
			$('#switch').removeClass('open');
			$('#sidebar').removeClass('acive');

		}else{

			myStorage.setItem(menuSaveName,'true');
			$('#switch').addClass('open');
			$('#sidebar').addClass('acive');

		}

	});
})

$(document).on('ready', function () {
	var hd = document.getElementsByTagName('head')[0];
	var _link = document.createElement('link');
	_link.href='https://use.fontawesome.com/releases/v5.5.0/css/all.css';
	_link.rel = "stylesheet";
	hd.appendChild(_link);
});
window.addEventListener('contextmenu', function(e){
			$('#context-menu').css('transform','translate3d(0,-'+$('#content').offset().top+'px,0)')
})

//20181130add
$(document).on('ready', function () {
	$("#header h1").prepend("<em class='logo'><img src='/themes/rhems_client/images/client_logo.png'/></em>");
	$("#header h1 > span").wrapAll('<p class="child-project"></p>');
});
