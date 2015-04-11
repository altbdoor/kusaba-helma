// https://github.com/carhartl/jquery-cookie
!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):e("object"==typeof exports?require("jquery"):jQuery)}(function(e){function n(e){return u.raw?e:encodeURIComponent(e)}function o(e){return u.raw?e:decodeURIComponent(e)}function i(e){return n(u.json?JSON.stringify(e):String(e))}function r(e){0===e.indexOf('"')&&(e=e.slice(1,-1).replace(/\\"/g,'"').replace(/\\\\/g,"\\"));try{return e=decodeURIComponent(e.replace(c," ")),u.json?JSON.parse(e):e}catch(n){}}function t(n,o){var i=u.raw?n:r(n);return e.isFunction(o)?o(i):i}var c=/\+/g,u=e.cookie=function(r,c,a){if(arguments.length>1&&!e.isFunction(c)){if(a=e.extend({},u.defaults,a),"number"==typeof a.expires){var f=a.expires,s=a.expires=new Date;s.setTime(+s+864e5*f)}return document.cookie=[n(r),"=",i(c),a.expires?"; expires="+a.expires.toUTCString():"",a.path?"; path="+a.path:"",a.domain?"; domain="+a.domain:"",a.secure?"; secure":""].join("")}for(var d=r?void 0:{},p=document.cookie?document.cookie.split("; "):[],m=0,x=p.length;x>m;m++){var l=p[m].split("="),g=o(l.shift()),k=l.join("=");if(r&&r===g){d=t(k,c);break}r||void 0===(k=t(k))||(d[g]=k)}return d};u.defaults={},e.removeCookie=function(n,o){return void 0===e.cookie(n)?!1:(e.cookie(n,"",e.extend({},o,{expires:-1})),!e.cookie(n))}});

// https://github.com/pamelafox/lscache
!function(a,b){"function"==typeof define&&define.amd?define([],b):"undefined"!=typeof module&&module.exports?module.exports=b():a.lscache=b()}(this,function(){function a(){var a="__lscachetest__",c=a;if(void 0!==m)return m;try{g(a,c),h(a),m=!0}catch(d){m=b(d)?!0:!1}return m}function b(a){return a&&"QUOTA_EXCEEDED_ERR"===a.name||"NS_ERROR_DOM_QUOTA_REACHED"===a.name||"QuotaExceededError"===a.name?!0:!1}function c(){return void 0===n&&(n=null!=window.JSON),n}function d(a){return a+p}function e(){return Math.floor((new Date).getTime()/r)}function f(a){return localStorage.getItem(o+t+a)}function g(a,b){localStorage.removeItem(o+t+a),localStorage.setItem(o+t+a,b)}function h(a){localStorage.removeItem(o+t+a)}function i(a){for(var b=new RegExp("^"+o+t+"(.*)"),c=localStorage.length-1;c>=0;--c){var e=localStorage.key(c);e=e&&e.match(b),e=e&&e[1],e&&e.indexOf(p)<0&&a(e,d(e))}}function j(a){var b=d(a);h(a),h(b)}function k(a){var b=d(a),c=f(b);if(c){var g=parseInt(c,q);if(e()>=g)return h(a),h(b),!0}}function l(a,b){u&&"console"in window&&"function"==typeof window.console.warn&&(window.console.warn("lscache - "+a),b&&window.console.warn("lscache - The error was: "+b.message))}var m,n,o="lscache-",p="-cacheexpiration",q=10,r=6e4,s=Math.floor(864e13/r),t="",u=!1,v={set:function(k,m,n){if(a()){if("string"!=typeof m){if(!c())return;try{m=JSON.stringify(m)}catch(o){return}}try{g(k,m)}catch(o){if(!b(o))return void l("Could not add item with key '"+k+"'",o);var p,r=[];i(function(a,b){var c=f(b);c=c?parseInt(c,q):s,r.push({key:a,size:(f(a)||"").length,expiration:c})}),r.sort(function(a,b){return b.expiration-a.expiration});for(var t=(m||"").length;r.length&&t>0;)p=r.pop(),l("Cache is full, removing item with key '"+k+"'"),j(p.key),t-=p.size;try{g(k,m)}catch(o){return void l("Could not add item with key '"+k+"', perhaps it's too big?",o)}}n?g(d(k),(e()+n).toString(q)):h(d(k))}},get:function(b){if(!a())return null;if(k(b))return null;var d=f(b);if(!d||!c())return d;try{return JSON.parse(d)}catch(e){return d}},remove:function(b){a()&&j(b)},supported:function(){return a()},flush:function(){a()&&i(function(a){j(a)})},flushExpired:function(){a()&&i(function(a){k(a)})},setBucket:function(a){t=a},resetBucket:function(){t=""},enableWarnings:function(a){u=a}};return v});

// just to polyfill
function highlight () {};

(function (d, w, cache) {
	// extend
	$.fn.extend({
		/*hasAttr: function (name) {
			return this.attr(name) !== undefined;
		},
		hasData: function (name) {
			return this.attr('data-' + name) !== undefined;
		},
		isVisible: function () {
			var docViewTop = $(w).scrollTop(),
				docViewBottom = docViewTop + $(w).height(),
				elemTop = $(this).offset().top,
				elemBottom = elemTop + $(elem).height();
			
			return ((elemBottom < docViewBottom) && (elemTop > docViewTop));
		}*/
	});

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
		
		_CURRENTMAINSTYLE = cache.get(_CACHEMAINSTYLE),
		_CURRENTPOSTPASSWORD = cache.get(_CACHEPOSTPASSWORD),
		
		_YOUTUBERES = JSON.parse($('#youtube-res').val() || '[]'),
		
		_BOARDID = $('#board-id').val(),
		_BOARDNAME = $('#board-name').val(),
		_BOARDISOEKAKI = ($('#board-is-oekaki').length == 1),
		
		_MODCOOKIE = $.cookie('kumod'),
		
		_ISADMIN = false,
	
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
	
	postformQuick = $('#postform-quick'),
	postformQuickMessage = $('#postform-quick-message'),
	
	postformPostPassword = $('#postform-postpassword');
	
	// toggler
	$('.toggle').each(function (index, item) {
		$(item).on('click', function (e) {
			var target = $(item).data('target');
			
			e.preventDefault();
			
			if ($(item).hasClass('toggle-animate')) {
				$(target).finish().slideToggle(200);
				//$(target).finish().addClass('no-transition').slideToggle(200, function () {
					//$(this).removeClass('no-transition');
				//});
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
	
	// fix oekaki view animation links
	if (_BOARDISOEKAKI) {
		$('a[href*="animation.php"]').each(function (index, item) {
			var parent = $(item).parent(),
				href = $(item).attr('href')/*,
				board = href.match(/board=([a-z0-9]+)/i)[1],
				id = href.match(/id=([0-9]+)/)[1]*/;
			
			$(parent).html('<br><i class="icon icon-warning-sign"></i> Animation is currently broken.')
				.addClass('post-oekaki-notice text-error-color');
		});
	}
	
	// init password value
	if (!_CURRENTPOSTPASSWORD) {
		_CURRENTPOSTPASSWORD = kShuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.split('')).join('').substr(0, 8);
	}
	
	cache.set(_CACHEPOSTPASSWORD, _CURRENTPOSTPASSWORD, _CACHEONEMONTH);
	$(postformPostPassword).val(_CURRENTPOSTPASSWORD);
	
	// refresh style validity
	if (_CURRENTMAINSTYLE) {
		cache.set(_CACHEMAINSTYLE, _CURRENTMAINSTYLE, _CACHEONEMONTH);
	}
	
	// toggle threads
	$('.thread-toggle').on('click', function () {
		$('#p' + $(this).data('target')).toggleClass('thread-hidden');
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
	
	// youtube resize
	$('.youtube-resize').on('click', function () {
		var targetId = $(this).data('target'),
			target = $('#post-file-youtube-' + targetId),
			contentParent = $('#p' + targetId).children('.post-content-wrapper').first(),
			res = $(this).data('res') || _YOUTUBERES,
			operand = 'addClass';
		
		$(target).attr({
			width: res[0],
			height: res[1]
		});
		
		if ($(this).hasClass('youtube-resize-reset')) {
			operand = 'removeClass';
		}
		
		if ($(contentParent).length != 0) {
			$(contentParent)[operand]('post-content-wrapper-block');
		}
		
		$(target).parent()[operand]('post-file-link-block');
	});
	
	// fix blockquote references
	$('blockquote > a[class^="ref|"]').each(function (index, item) {
		var referredInfo = $(item).attr('class').split('|'),
			referredBoardName = referredInfo[1],
			referredPostId = referredInfo[3],
			referredBacklink = $('#post-reference-backlinks-' + referredPostId),
			
			currentHref = $(item).attr('href'),
			currentId = $(item).parent().data('post-id'),
			
			referredBacklinkId = 'post-reference-backlinks-quote-' + referredPostId + '-' + currentId;
		
		$(item).removeAttr('onclick').attr({
			href: currentHref.replace(/\#(\d+)/, '#p$1'),
			class: 'post-reference-quote'
		}).data({
			'ref-board-name': referredBoardName,
			'ref-post-id': referredPostId
		});
		
		if (referredPostId == $(item).parent().data('parent-id')) {
			$(item).html(function (index, content) {
				return content + ' (OP)';
			});
		}
		
		if (referredBoardName == _BOARDNAME && $(referredBacklink).length > 0 && $('#' + referredBacklinkId).length == 0) {
			$(d.createElement('a')).attr({
				id: referredBacklinkId,
				href: currentHref.replace(/\#(\d+)/, '#p' + currentId)
			}).data({
				'ref-board-name': referredBoardName,
				'ref-post-id': currentId
			}).addClass('post-reference-backlinks-quote').html('>>' + currentId).appendTo(referredBacklink);
		}
	});
	
	// reference hovers
	$('.post-reference-quote, .post-reference-backlinks-quote').each(function (index, item) {
		var referredPostId = $(item).data('ref-post-id');
		
		$(item).on('mouseover', function () {
			var referredBoardName = $(item).data('ref-board-name'),
				referredPost = $('#p' + referredPostId);
			
			if ((referredBoardName == _BOARDNAME) && ($(referredPost).length > 0)) {
				var clonePost = $('#post-clone-' + referredPostId),
					offset,
					positionTop,
					positionLeft;
				
				if ($(clonePost).length == 0) {
					var targetContentWrapper = $(referredPost).children('.post-content-wrapper').first(),
						targetGeneralInfo = $(referredPost).children('.post-general-info').first().clone(),
						targetFileInfo = $(referredPost).children('.post-file-info').first().clone(),
						targetFile, targetText, targetFileChild;
					
					clonePost = d.createElement('div');
					
					if ($(targetContentWrapper).length == 0) {
						targetFile = $(referredPost).children('.post-file-link');
						targetText = $(referredPost).children('blockquote');
					}
					else {
						targetFile = $(targetContentWrapper).find('.post-file-link');
						targetText = $(targetContentWrapper).find('blockquote');
					}
					
					targetFile = $(targetFile).first().clone().removeClass('post-file-link-block');
					targetFileChild = $(targetFile).children().first();
					
					if ($(targetFileChild)[0]) {
						var match = $(targetFileChild)[0].className.match(/(^| )post-file-(youtube|image)($| )/),
							res;
						
						if (match && match[2]) {
							if (match[2] == 'youtube') {
								res = _YOUTUBERES;
							}
							else if (match[2] == 'image') {
								res = $(targetFileChild).data('thumb-res');
								$(targetFileChild).attr('src', $(targetFileChild).data('thumb-src'));
							}
							
							$(targetFileChild).attr({
								width: res[0],
								height: res[1]
							});
						}
					}
					
					$(clonePost).attr('id', 'post-clone-' + referredPostId).appendTo(d.body)
						.addClass('post-clone bg-dark border border-light clear')
						.append(targetGeneralInfo)
						.append(targetFileInfo)
						.append(targetFile)
						.append($(targetText).first().clone())
						.find('[id]').removeAttr('id');
				}
				
				offset = $(item).offset();
				positionTop = (offset.top - ($(clonePost).height() / 2)) + 'px';
				
				if (offset.left > ($(w).width() / 2)) {
					positionLeft = (offset.left - $(clonePost).outerWidth() - 8) + 'px';
				}
				else {
					positionLeft = (offset.left + $(item).width() + 8) + 'px';
				}
				
				$(clonePost).removeClass('post-clone-hidden').css({
					top: positionTop,
					left: positionLeft
				});
			}
		}).on('mouseout', function () {
			$('#post-clone-' + referredPostId).addClass('post-clone-hidden');
		});
	});
	
	// expand image
	$('.post-file-image').each(function (index, item) {
		var parent = $(item).parent();
		
		$(parent).on('click', function (e) {
			e.preventDefault();
			
			var contentWrapper = $(parent).parent().parent(),
				classStr = 'post-file-link-block',
				attrStr = 'img-',
				src,
				res;
			
			if ($(parent).hasClass(classStr)) {
				attrStr = 'thumb-';
			}
			
			res = $(item).data(attrStr + 'res');
			src = $(item).data(attrStr + 'src');
			
			$(item).attr({
				width: res[0],
				height: res[1],
				src: src
			});
			
			$(parent).toggleClass(classStr);
			
			classStr = 'post-content-wrapper';
			
			if ($(contentWrapper).hasClass(classStr)) {
				$(contentWrapper).toggleClass(classStr + '-block');
			}
		});
	});
	
	// postform quick draggable
	$('#postform-quick-title').on('mousedown', function (e) {
		var offset = $(postformQuick)[0].getBoundingClientRect(),
			
			maxX = $(w).width() - $(postformQuick).width(),
			maxY = $(w).height() - $(postformQuick).height(),
			
			initialX = e.clientX - offset.left,
			initialY = e.clientY - offset.top,
			
			body = $(d.body);
		
		e.preventDefault();
		
		$(postformQuick).add(body).addClass('draggable');
		
		$(w).on('mousemove', function (e) {
			var posX = Math.max( 0, Math.min( maxX, parseInt(e.clientX - initialX)) );
				posY = Math.max( 0, Math.min( maxY, parseInt(e.clientY - initialY)) );
			
			$(postformQuick).css({
				right: 'auto',
				left: posX + 'px',
				top: posY + 'px'
			});
		}).add(this).on('mouseup', function () {
			$(postformQuick).add(body).removeClass('draggable');
			$(w).off('mousemove');
		});
	});
	
	// postform quick close
	$('#postform-quick-close').on('click', function () {
		$(postformQuick).hide();
	});
	
	// postform quick inject password and check image
	$(postformQuick).on('submit', function (e) {
		//e.preventDefault();
		
		var newPassword = $(postformPostPassword).val();
		
		$('#postform-quick-postpassword').val(newPassword);
		cache.set(_CACHEPOSTPASSWORD, newPassword, _CACHEONEMONTH);
	});
	
	// input file shift click and hide embed
	$('#postform-quick-imagefile, #postform-imagefile').on('click', function (e) {
		if (e.shiftKey) {
			e.preventDefault();
			$(this).val('');
		}
	});
	
	// hashchange
	$(w).on('hashchange', function () {
		var hash = location.hash,
			target = '#p' + hash.substr(2),
			classStr = 'post-content-active';
		
		if (/^\#p\d+$/.test(hash) && $(target).length != 0) {
			$('.' + classStr).removeClass(classStr);
			
			if (!$(target).hasClass('thread')) {
				$(target).addClass(classStr);
			}
		}
	});
	
	if (location.hash != '') {
		$(w).trigger('hashchange');
	}
	
	// insert quote into quick reply
	$('.post-reference-reply').on('click', function (e) {
		var hash = $(this).attr('href').split('#p')[1];
		
		if ($(postformQuick).length != 0) {
			e.preventDefault();
			
			$(postformQuick).show();
			$(postformQuickMessage).trigger('focus').val(function (index, content) {
				return content + '>>' + hash + '\n';
			});
		}
	});
	
	// hide quick reply on esc
	$(postformQuickMessage).on('keyup', function (e) {
		if (e.keyCode == 27) {
			$(postformQuick).hide();
		}
	});
	
	// mod controls
	if (_MODCOOKIE) {
		if (_MODCOOKIE == 'allboards' || ($.inArray(_BOARDNAME, _MODCOOKIE.split('|')) !== -1)) {
			_ISADMIN = true;
			
			$('#postform-postpassword-mod').show().find('input').removeAttr('disabled');
			$('#board-delete-report').hide().find('input').attr('disabled', 'disabled');
			$('#board-mod-delete-ban').show().find('input').removeAttr('disabled');
		}
	}
	
	// board mod ban
	$('#board-mod-ban').on('click', function () {
		
	});
	
})(document, window, lscache);
