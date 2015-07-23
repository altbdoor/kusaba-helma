// https://github.com/pamelafox/lscache
!function(n,e){"function"==typeof define&&define.amd?define([],e):"undefined"!=typeof module&&module.exports?module.exports=e():n.lscache=e()}(this,function(){function n(){var n="__lscachetest__",t=n;if(void 0!==h)return h;try{u(n,t),a(n),h=!0}catch(r){h=e(r)?!0:!1}return h}function e(n){return n&&"QUOTA_EXCEEDED_ERR"===n.name||"NS_ERROR_DOM_QUOTA_REACHED"===n.name||"QuotaExceededError"===n.name?!0:!1}function t(){return void 0===p&&(p=null!=window.JSON),p}function r(n){return n.replace(/[-[\]{}()*+?.,\\^$|#\s]/g,"\\$&")}function o(n){return n+m}function i(){return Math.floor((new Date).getTime()/w)}function c(n){return localStorage.getItem(g+E+n)}function u(n,e){localStorage.removeItem(g+E+n),localStorage.setItem(g+E+n,e)}function a(n){localStorage.removeItem(g+E+n)}function f(n){for(var e=new RegExp("^"+g+r(E)+"(.*)"),t=localStorage.length-1;t>=0;--t){var i=localStorage.key(t);i=i&&i.match(e),i=i&&i[1],i&&i.indexOf(m)<0&&n(i,o(i))}}function l(n){var e=o(n);a(n),a(e)}function s(n){var e=o(n),t=c(e);if(t){var r=parseInt(t,v);if(i()>=r)return a(n),a(e),!0}}function d(n,e){S&&"console"in window&&"function"==typeof window.console.warn&&(window.console.warn("lscache - "+n),e&&window.console.warn("lscache - The error was: "+e.message))}var h,p,g="lscache-",m="-cacheexpiration",v=10,w=6e4,y=Math.floor(864e13/w),E="",S=!1,x={set:function(r,s,h){if(n()){if("string"!=typeof s){if(!t())return;try{s=JSON.stringify(s)}catch(p){return}}try{u(r,s)}catch(p){if(!e(p))return void d("Could not add item with key '"+r+"'",p);var g,m=[];f(function(n,e){var t=c(e);t=t?parseInt(t,v):y,m.push({key:n,size:(c(n)||"").length,expiration:t})}),m.sort(function(n,e){return e.expiration-n.expiration});for(var w=(s||"").length;m.length&&w>0;)g=m.pop(),d("Cache is full, removing item with key '"+r+"'"),l(g.key),w-=g.size;try{u(r,s)}catch(p){return void d("Could not add item with key '"+r+"', perhaps it's too big?",p)}}h?u(o(r),(i()+h).toString(v)):a(o(r))}},get:function(e){if(!n())return null;if(s(e))return null;var r=c(e);if(!r||!t())return r;try{return JSON.parse(r)}catch(o){return r}},remove:function(e){n()&&l(e)},supported:function(){return n()},flush:function(){n()&&f(function(n){l(n)})},flushExpired:function(){n()&&f(function(n){s(n)})},setBucket:function(n){E=n},resetBucket:function(){E=""},enableWarnings:function(n){S=n}};return x});

(function (d, w, cache) {
	// flush expired cache
	cache.flushExpired();
	
	// variables
	/*var changeStyle = function (targetStyle) {
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
			w.parent.board_page.jQuery(name).each(fn);
		}
		
		if (w.parent.board_menu) {
			w.parent.board_menu.jQuery(name).each(fn);
		}
		
		cache.set('main-style', targetStyle);
	};
	
	
	// get default style
	if (cache.get('main-style')) {
		changeStyle(cache.get('main-style'));
	}*/
	
	// toggler
	/*$('.toggle').each(function () {
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
	});*/
	
	// change style
	$('#menu-change-style').one('click', function () {
		alert('Still under development');
		/*$(this).hide();
		
		$('#menu-site-style-list').show().find('a').on('click', function () {
			//changeStyle($(this).data('target-id'));
			
			var targetId = $(this).data('target-id');
			
			$('.css-board').each(changeStyle);
			
			if (w.parent.board_page) {
				w.parent.board_page.jQuery('.css-board').each(changeStyle);
			}
			
			cache.set('main-style', targetId);
		});*/
	});
	
	/*function changeStyle (targetStyle) {
		
		item.disabled = true;
		item.rel = 'alternate stylesheet';
		
		if (item.id == targetId) {
			item.disabled = false;
			item.rel = 'stylesheet';
		}
	};*/
	
	// remove frame
	$('#menu-remove-frame').one('click', function () {
		$(this).parent().empty().text('Frames removed');
		$('.menu-section-list > li > a').attr('target', '_top');
	});
	
	// toggle dir
	$('#menu-toggle-directory').on('click', function () {
		$('.menu-board-directory').toggle();
	});
})(document, window, lscache);
