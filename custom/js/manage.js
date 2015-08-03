(function (d, w) {
	// toggler
	$('.toggle').each(function () {
		$(this).on('click', function (e) {
			var target = $(this).data('target');
			
			e.preventDefault();
			
			$(target).finish().slideToggle(200);
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
	
	// helper for custom config
	if ($('.custom-edit-configuration-helper').length > 1) {
		var helpText = {
			'protectPassword': 'The password for the board protection.',
			'protectDuration': 'The duration for which the password remains valid for the user. If zero, user has to login again when the browser is closed. Value is in seconds, and as a protip, 1 day = 86400 seconds.'
		};
		
		$('.custom-edit-configuration-helper').each(function (index, item) {
			var key = $(item).text();
			
			if (helpText[key]) {
				$(item).append(
					'<br><small>' + helpText[key] + '</small>'
				);
			}
		});
	}
})(document, window);
