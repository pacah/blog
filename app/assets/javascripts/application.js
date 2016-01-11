// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require foundation

$(document).ready(function() {
 
$('body').append('<div class="button-up" style="display: none;opacity: 0.7;width: 100px;height:100%;position: fixed;left: 0px;top: 0px;cursor: pointer;text-align: center;line-height: 300px;color: #45688E;">Наверх</div>');
 
$ (window).scroll (function () {
if ($ (this).scrollTop () > 45) {
$ ('.button-up').fadeIn();
} else {
$ ('.button-up').fadeOut();
}
});
 
$('.button-up').click(function(){
$('body,html').animate({
scrollTop: 0
}, 100);
return false;
});
 
$('.button-up').hover(function() {
$(this).animate({
'opacity':'1',
}).css({'background-color':'#E1E7ED','color':'#45688E'});
}, function(){
$(this).animate({
'opacity':'0.7'
}).css({'background':'none','color':'#45688E'});;
});
 
});