/*! jquery.cookie v1.4.1 | MIT */
!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof exports?a(require("jquery")):a(jQuery)}(function(a){function b(a){return h.raw?a:encodeURIComponent(a)}function c(a){return h.raw?a:decodeURIComponent(a)}function d(a){return b(h.json?JSON.stringify(a):String(a))}function e(a){0===a.indexOf('"')&&(a=a.slice(1,-1).replace(/\\"/g,'"').replace(/\\\\/g,"\\"));try{return a=decodeURIComponent(a.replace(g," ")),h.json?JSON.parse(a):a}catch(b){}}function f(b,c){var d=h.raw?b:e(b);return a.isFunction(c)?c(d):d}var g=/\+/g,h=a.cookie=function(e,g,i){if(void 0!==g&&!a.isFunction(g)){if(i=a.extend({},h.defaults,i),"number"==typeof i.expires){var j=i.expires,k=i.expires=new Date;k.setTime(+k+864e5*j)}return document.cookie=[b(e),"=",d(g),i.expires?"; expires="+i.expires.toUTCString():"",i.path?"; path="+i.path:"",i.domain?"; domain="+i.domain:"",i.secure?"; secure":""].join("")}for(var l=e?void 0:{},m=document.cookie?document.cookie.split("; "):[],n=0,o=m.length;o>n;n++){var p=m[n].split("="),q=c(p.shift()),r=p.join("=");if(e&&e===q){l=f(r,g);break}e||void 0===(r=f(r))||(l[q]=r)}return l};h.defaults={},a.removeCookie=function(b,c){return void 0===a.cookie(b)?!1:(a.cookie(b,"",a.extend({},c,{expires:-1})),!a.cookie(b))}});

(function (d, w) {
	// add css ready
	$(d.documentElement).addClass('css-ready');
	
	// toggler
	$('.toggle').each(function () {
		$(this).on('click', function (e) {
			var target = $(this).data('target');
			
			e.preventDefault();
			
			$(target).finish().addClass('no-transition').slideToggle(200, function () {
				$(this).removeClass('no-transition');
			});
		});
	});
	
	// highlight posting password
	$('#menu-posting-password-input').on('click', function () {
		$(this).trigger('select');
	});
	
	// img graph error
	$('.img-graph').on('error', function () {
		$(this).hide().parent().append('<p class="text-red text-bold">Failed to load data</p>');
	});
	
	// ban proxy list
	$('#image-file-input').on('change', function () {
		$('#image-file-desc').text(
			(this.files[0]) ? this.files[0].name : 'No file selected'
		);
	});
})(document, window);


/*
	<script>
			function toggle(button, area) {
				var tog=document.getElementById(area);
				if(tog.style.display)	{
					tog.style.display="";
				} else {
					tog.style.display="none";
				}
				button.innerHTML=(tog.style.display)?'+':'&minus;';
				createCookie('nav_show_'+area, tog.style.display?'0':'1', 365);
			}
		</script>
*/