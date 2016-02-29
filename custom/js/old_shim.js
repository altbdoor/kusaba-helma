(function (d, w) {
	d.addEventListener('DOMContentLoaded', function () {
		var body = d.querySelector('body'),
			
			xhr,
			sidebarHtml = null,
			hasStorage = false;
		
		// style the body
		body.style.position = 'relative';
		body.style.paddingLeft = '248px';
		
		// try to get localstorage
		try {
			localStorage.setItem('test-localstorage-helma', 'helma');
			localStorage.removeItem('test-localstorage-helma');
			
			sidebarHtml = localStorage.getItem('helma-sidebar-content');
			hasStorage = true;
		}
		catch (e) { }
		
		// check if sidebar is still valid
		if (hasStorage && sidebarHtml != null) {
			var sidebarExpire = localStorage.getItem('helma-sidebar-expire');
			
			if (sidebarExpire != null) {
				if (Date.now() > sidebarExpire) {
					sidebarHtml = null;
					localStorage.removeItem('helma-sidebar-expire');
				}
			}
		}
		
		// process the sidebar html
		function processSidebar (html, isCache) {
			var iframe = d.createElement('iframe'),
				iframeDoc,
				temp;
			
			// prep the iframe
			iframe.setAttribute('frameborder', '0');
			iframe.style.display = 'none';
			iframe.style.position = 'fixed';
			iframe.style.top = '0';
			iframe.style.left = '0';
			iframe.style.bottom = '0';
			iframe.style.width = '240px';
			iframe.style.height = '100%';
			iframe.style.boxShadow = '0 0 10px rgba(0,0,0,0.3)';
			
			if (isCache) {
				iframe.setAttribute('data-cache', 'true');
			}
			
			// prevent fouc
			iframe.onload = function () {
				iframe.style.display = 'block';
			};
			
			// partay
			body.appendChild(iframe);
			
			iframeDoc = iframe.contentWindow.document;
			iframeDoc.open();
			iframeDoc.write(html);
			iframeDoc.close();
			
			// manually open the sidebar
			temp = iframeDoc.querySelector('body');
			temp.className = 'sidebar open';
			
			// change base target
			temp = iframeDoc.querySelector('base');
			temp.setAttribute('target', '_top');
			
			// hide overflow on the html element
			iframeDoc.documentElement.style.overflowY = 'auto';
		}
		
		// if we don't cache it, we request it
		if (sidebarHtml == null) {
			xhr = new XMLHttpRequest();
			xhr.open('GET', '/menu.php', true);
			
			xhr.onload = function () {
				if (this.status >= 200 && this.status < 400) {
					if (hasStorage) {
						localStorage.setItem('helma-sidebar-content', this.response);
						localStorage.setItem('helma-sidebar-expire', Date.now() + 86400000);
					}
					
					processSidebar(this.response, false);
				}
			};
			xhr.send();
		}
		else {
			processSidebar(sidebarHtml, true);
		}
	}, false);
})(document, window);
