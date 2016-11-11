(function (d, w) {
	// toggler
	$('.toggle').each(function () {
		$(this).on('click', function (e) {
			var target = $(this).data('target');
			
			e.preventDefault();
			
			$(target).finish().slideToggle(200);
		});
	});
	
	// img graph error
	$('.img-graph').on('error', function () {
		$(this).hide().parent().append('<p class="text-red text-bold">Failed to load data</p>');
	});
	
	// ban proxy list
	$('#image-file-input').on('change', function () {
		var self = this;
		$('#image-file-desc').text(
			(self.files[0]) ? self.files[0].name : 'No file selected'
		);
	});
	
	// helper for custom config
	var customEditConfigHelper = $('.custom-edit-configuration-helper'); 
	
	if ($(customEditConfigHelper).length > 1) {
		$(customEditConfigHelper).each(function (index, item) {
			var key = $(item).text();
			
			if (w.helpText[key]) {
				$(item).append(
					'<br><small>' + w.helpText[key] + '</small>'
				);
			}
		});
	}
	
	// continuous rebuild
	var rebuildContinuousFlag = false;
	var rebuildContinuousLog = $('#rebuild-continuous-log');
	var rebuildContinuousInterval;
	
	function padTime (val) {
		return (val < 10 ? '0' : '') + val;
	}
	
	function getRebuildLogTime () {
		var time = new Date();
		var date = padTime(time.getDate());
		var month = padTime(time.getMonth() + 1);
		var year = time.getFullYear();
		var hour = padTime(time.getHours());
		var minute = padTime(time.getMinutes());
		var second = padTime(time.getSeconds());
		
		return [date, month, year].join('/') + ' ' + [hour, minute, second].join(':');
	}
	
	$('#rebuild-continuous-trigger').on('click', function () {
		$(rebuildContinuousLog).removeAttr('hidden');
		
		if (rebuildContinuousFlag) {
			clearInterval(rebuildContinuousInterval);
			$(rebuildContinuousLog).html('Continuous Rebuild Stopped');
		}
		else {
			$(rebuildContinuousLog).html('Continuous Rebuild Started<br>');
			
			rebuildContinuousInterval = setInterval(function () {
				$(rebuildContinuousLog).append('Rebuilding... ').scrollTop(function () {
					return this.scrollHeight;
				});
				
				$.get('/manage_page.php?action=rebuildall&continuous=yes', function () {
					
					
					$(rebuildContinuousLog).append(
						'OK [' + getRebuildLogTime() + ']<br>'
					);
				});
			}, 5000);
		}
		
		rebuildContinuousFlag = !rebuildContinuousFlag;
	});
})(document, window);
