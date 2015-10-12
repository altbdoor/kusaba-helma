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
	
	var customEditConfigHelper = $('.custom-edit-configuration-helper'); 
	
	// helper for custom config
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
})(document, window);
