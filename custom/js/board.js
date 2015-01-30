// https://github.com/pamelafox/lscache
!function(a,b){"function"==typeof define&&define.amd?define([],b):"undefined"!=typeof module&&module.exports?module.exports=b():a.lscache=b()}(this,function(){function a(){var a="__lscachetest__",c=a;if(void 0!==m)return m;try{g(a,c),h(a),m=!0}catch(d){m=b(d)?!0:!1}return m}function b(a){return a&&"QUOTA_EXCEEDED_ERR"===a.name||"NS_ERROR_DOM_QUOTA_REACHED"===a.name||"QuotaExceededError"===a.name?!0:!1}function c(){return void 0===n&&(n=null!=window.JSON),n}function d(a){return a+p}function e(){return Math.floor((new Date).getTime()/r)}function f(a){return localStorage.getItem(o+t+a)}function g(a,b){localStorage.removeItem(o+t+a),localStorage.setItem(o+t+a,b)}function h(a){localStorage.removeItem(o+t+a)}function i(a){for(var b=new RegExp("^"+o+t+"(.*)"),c=localStorage.length-1;c>=0;--c){var e=localStorage.key(c);e=e&&e.match(b),e=e&&e[1],e&&e.indexOf(p)<0&&a(e,d(e))}}function j(a){var b=d(a);h(a),h(b)}function k(a){var b=d(a),c=f(b);if(c){var g=parseInt(c,q);if(e()>=g)return h(a),h(b),!0}}function l(a,b){u&&"console"in window&&"function"==typeof window.console.warn&&(window.console.warn("lscache - "+a),b&&window.console.warn("lscache - The error was: "+b.message))}var m,n,o="lscache-",p="-cacheexpiration",q=10,r=6e4,s=Math.floor(864e13/r),t="",u=!1,v={set:function(k,m,n){if(a()){if("string"!=typeof m){if(!c())return;try{m=JSON.stringify(m)}catch(o){return}}try{g(k,m)}catch(o){if(!b(o))return void l("Could not add item with key '"+k+"'",o);var p,r=[];i(function(a,b){var c=f(b);c=c?parseInt(c,q):s,r.push({key:a,size:(f(a)||"").length,expiration:c})}),r.sort(function(a,b){return b.expiration-a.expiration});for(var t=(m||"").length;r.length&&t>0;)p=r.pop(),l("Cache is full, removing item with key '"+k+"'"),j(p.key),t-=p.size;try{g(k,m)}catch(o){return void l("Could not add item with key '"+k+"', perhaps it's too big?",o)}}n?g(d(k),(e()+n).toString(q)):h(d(k))}},get:function(b){if(!a())return null;if(k(b))return null;var d=f(b);if(!d||!c())return d;try{return JSON.parse(d)}catch(e){return d}},remove:function(b){a()&&j(b)},supported:function(){return a()},flush:function(){a()&&i(function(a){j(a)})},flushExpired:function(){a()&&i(function(a){k(a)})},setBucket:function(a){t=a},resetBucket:function(){t=""},enableWarnings:function(a){u=a}};return v});

(function (d, w, cache) {
	// add css ready
	$(d.documentElement).addClass('css-ready');
	
	// flush expired cache
	cache.flushExpired();
	
	// variables
	var changeStyle = function (targetStyle) {
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
	}
	
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
			
			/*var targetId = $(this).data('target-id');
			
			$('.css-board').each(changeStyle);
			
			if (w.parent.board_page) {
				w.parent.board_page.jQuery('.css-board').each(changeStyle);
			}
			
			cache.set('main-style', targetId);*/
		});
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
		var text = $(this).data('alt-text');
		
		$(this).parent().empty().text(text);
		
		$('.menu-section-list > li > a').attr('target', '_top');
	});
})(document, window, lscache);
