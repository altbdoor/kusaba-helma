(function (d, w) {
	var menuPostingPasswordInput = $('#menu-posting-password-input'),
		moveThreadReturn = $('#move-thread-return');
	
	// add css ready
	$(d.documentElement).addClass('css-ready');
	
	// toggler
	$('.toggle').each(function () {
		$(this).on('click', function (e) {
			e.preventDefault();
			
			$($(this).data('target')).finish().slideToggle(200);
		});
	});
	
	// highlight posting password
	$('#menu-posting-password-trigger').add(menuPostingPasswordInput).on('click', function () {
		$(menuPostingPasswordInput).trigger('select');
	});
	
	$('#menu-posting-password-btn').on('click', function () {
		var modPasswordVal = $(menuPostingPasswordInput).val(),
			modPasswordInput = '#postform-modpassword';
		
		if (w.top.manage_page && w.top.manage_page.$(modPasswordInput).length > 0) {
			w.top.manage_page.$(modPasswordInput).val(modPasswordVal);
		}
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
	
	// mod move thread
	if ($(moveThreadReturn).length > 0) {
		$('#threadId').val($(moveThreadReturn).data('thread-id'));
		$('#board_from').val($(moveThreadReturn).data('board-name'));
		
		$(moveThreadReturn).on('click', function () {
			var parentJquery = w.parent.$;
			
			parentJquery('#modal-wrapper').hide();
			parentJquery('#modal-mod-move-wrapper').hide().empty();
		});
	}
	
	$('.move-thread-redirect').on('click', function (e) {
		e.preventDefault();
		w.parent.location.href = $(this).attr('href');
	});
	
})(document, window);
