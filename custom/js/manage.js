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
