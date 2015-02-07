// https://github.com/carhartl/jquery-cookie
!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):e("object"==typeof exports?require("jquery"):jQuery)}(function(e){function n(e){return u.raw?e:encodeURIComponent(e)}function o(e){return u.raw?e:decodeURIComponent(e)}function i(e){return n(u.json?JSON.stringify(e):String(e))}function r(e){0===e.indexOf('"')&&(e=e.slice(1,-1).replace(/\\"/g,'"').replace(/\\\\/g,"\\"));try{return e=decodeURIComponent(e.replace(c," ")),u.json?JSON.parse(e):e}catch(n){}}function t(n,o){var i=u.raw?n:r(n);return e.isFunction(o)?o(i):i}var c=/\+/g,u=e.cookie=function(r,c,a){if(arguments.length>1&&!e.isFunction(c)){if(a=e.extend({},u.defaults,a),"number"==typeof a.expires){var f=a.expires,s=a.expires=new Date;s.setTime(+s+864e5*f)}return document.cookie=[n(r),"=",i(c),a.expires?"; expires="+a.expires.toUTCString():"",a.path?"; path="+a.path:"",a.domain?"; domain="+a.domain:"",a.secure?"; secure":""].join("")}for(var d=r?void 0:{},p=document.cookie?document.cookie.split("; "):[],m=0,x=p.length;x>m;m++){var l=p[m].split("="),g=o(l.shift()),k=l.join("=");if(r&&r===g){d=t(k,c);break}r||void 0===(k=t(k))||(d[g]=k)}return d};u.defaults={},e.removeCookie=function(n,o){return void 0===e.cookie(n)?!1:(e.cookie(n,"",e.extend({},o,{expires:-1})),!e.cookie(n))}});

// https://github.com/pamelafox/lscache
!function(a,b){"function"==typeof define&&define.amd?define([],b):"undefined"!=typeof module&&module.exports?module.exports=b():a.lscache=b()}(this,function(){function a(){var a="__lscachetest__",c=a;if(void 0!==m)return m;try{g(a,c),h(a),m=!0}catch(d){m=b(d)?!0:!1}return m}function b(a){return a&&"QUOTA_EXCEEDED_ERR"===a.name||"NS_ERROR_DOM_QUOTA_REACHED"===a.name||"QuotaExceededError"===a.name?!0:!1}function c(){return void 0===n&&(n=null!=window.JSON),n}function d(a){return a+p}function e(){return Math.floor((new Date).getTime()/r)}function f(a){return localStorage.getItem(o+t+a)}function g(a,b){localStorage.removeItem(o+t+a),localStorage.setItem(o+t+a,b)}function h(a){localStorage.removeItem(o+t+a)}function i(a){for(var b=new RegExp("^"+o+t+"(.*)"),c=localStorage.length-1;c>=0;--c){var e=localStorage.key(c);e=e&&e.match(b),e=e&&e[1],e&&e.indexOf(p)<0&&a(e,d(e))}}function j(a){var b=d(a);h(a),h(b)}function k(a){var b=d(a),c=f(b);if(c){var g=parseInt(c,q);if(e()>=g)return h(a),h(b),!0}}function l(a,b){u&&"console"in window&&"function"==typeof window.console.warn&&(window.console.warn("lscache - "+a),b&&window.console.warn("lscache - The error was: "+b.message))}var m,n,o="lscache-",p="-cacheexpiration",q=10,r=6e4,s=Math.floor(864e13/r),t="",u=!1,v={set:function(k,m,n){if(a()){if("string"!=typeof m){if(!c())return;try{m=JSON.stringify(m)}catch(o){return}}try{g(k,m)}catch(o){if(!b(o))return void l("Could not add item with key '"+k+"'",o);var p,r=[];i(function(a,b){var c=f(b);c=c?parseInt(c,q):s,r.push({key:a,size:(f(a)||"").length,expiration:c})}),r.sort(function(a,b){return b.expiration-a.expiration});for(var t=(m||"").length;r.length&&t>0;)p=r.pop(),l("Cache is full, removing item with key '"+k+"'"),j(p.key),t-=p.size;try{g(k,m)}catch(o){return void l("Could not add item with key '"+k+"', perhaps it's too big?",o)}}n?g(d(k),(e()+n).toString(q)):h(d(k))}},get:function(b){if(!a())return null;if(k(b))return null;var d=f(b);if(!d||!c())return d;try{return JSON.parse(d)}catch(e){return d}},remove:function(b){a()&&j(b)},supported:function(){return a()},flush:function(){a()&&i(function(a){j(a)})},flushExpired:function(){a()&&i(function(a){k(a)})},setBucket:function(a){t=a},resetBucket:function(){t=""},enableWarnings:function(a){u=a}};return v});

(function (d, w, cache) {
	// add css ready
	$(d.documentElement).addClass('css-ready');
	
	// flush expired cache
	cache.flushExpired();
	
	// setup cookie
	$.cookie.defaults = {
		expires: 30
	};
	
	// variables
	var _CACHEONEMONTH = 43200,
		
		_CACHEMAINSTYLE = 'main-style',
		_CACHEPOSTPASSWORD = 'post-password',
	
	changeStyle = function (targetStyle) {
		var name = '.css-board',
			fn = function (index, item) {
				item.disabled = true;
				item.rel = 'alternate stylesheet';
				
				if (item.id == targetStyle) {
					item.disabled = false;
					item.rel = 'stylesheet';
				}
			};
		
		$(name).each(fn);
		
		if (w.parent.board_page) {
			w.parent.board_page.$(name).each(fn);
		}
		
		if (w.parent.board_menu) {
			w.parent.board_menu.$(name).each(fn);
		}
		
		cache.set(_CACHEMAINSTYLE, targetStyle.substr(10), _CACHEONEMONTH);
	},
	kShuffle = function (data) {
		var index = data.length,
			temp, rand;
		
		while (index != 0) {
			rand = Math.floor(Math.random() * index);
			index--;
			
			temp = data[index];
			data[index] = data[rand];
			data[rand] = temp;
		}
		
		return data;
	},
	getPassword = function () {
		var pw = cache.get(_CACHEPOSTPASSWORD);
		
		if (!pw) {
			pw = kShuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.split('')).join('').substr(0, 8);
		}
		
		cache.set(_CACHEPOSTPASSWORD, pw, _CACHEONEMONTH);
		
		return pw;
	};
	
	// toggler
	$('.toggle').each(function () {
		$(this).on('click', function (e) {
			var target = $(this).data('target');
			
			e.preventDefault();
			
			if ($(this).hasClass('toggle-animate')) {
				$(target).finish().addClass('no-transition').slideToggle(200, function () {
					$(this).removeClass('no-transition');
				});
			}
			else {
				$(target).toggle();
			}
		});
	});
	
	// change style
	$('#menu-site-style').one('click', function () {
		$(this).hide();
		
		$('#menu-site-style-list').show().find('a').on('click', function () {
			changeStyle($(this).data('target-id'));
		});
	});
	
	// remove frame
	$('#menu-remove-frame').one('click', function () {
		var text = $(this).data('alt-text');
		
		$(this).parent().empty().text(text);
		
		$('.menu-section-list > li > a').attr('target', '_top');
	});
	
	// ========================================
	
	// init form values
	$('.postform-postpassword-group').val(getPassword());
	
	// refresh style validity
	if (cache.get(_CACHEMAINSTYLE)) {
		cache.set(_CACHEMAINSTYLE, cache.get(_CACHEMAINSTYLE), _CACHEONEMONTH);
	}
	
	// toggle threads
	$('.thread-toggle').on('click', function () {
		$('#thread-' + $(this).data('target')).toggleClass('thread-hidden');
	});
	
	// image search toggle
	$('.post-image-search-trigger').on('click', function () {
		var classStr = 'post-image-search-show',
			others = $('.' + classStr);
		
		if ($(others).length > 0 && !$(others).first().is($(this).parent())) {
			$(others).removeClass(classStr);
		}
		
		$(this).parent().toggleClass(classStr);
	});
	
	// body click handler to hide image search
	$(d.body).on('click', function (e) {
		var target = $(e.target),
			classStr = 'post-image-search-trigger';
		
		if (!$(target).hasClass(classStr) && !$(target).parent().hasClass(classStr)) {
			classStr = 'post-image-search-show';
			$('.' + classStr).removeClass(classStr);
		}
	});
	
	
})(document, window, lscache);
