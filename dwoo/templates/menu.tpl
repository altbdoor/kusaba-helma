<!doctype html>
<html class="no-overflow">
<head>
	{include('includes/headMeta.html')}
	<title>{%KU_NAME}</title>
	
	<link rel="shortcut icon" href="/favicon.ico">
	
	<link rel="stylesheet" href="/custom/css/common.css">
	<link rel="stylesheet" href="/custom/css/board.css">
	
	{* include temporarily *}
	<link rel="stylesheet" href="/custom/css/board_burichan.css">
	
	<base target="main">
</head>
<body>
	<div id="menu-container">
		<h3 id="menu-title" class="text-center">{%KU_NAME}</h3>
		<ul class="list">
			<li><a href="/" target="_top">Front Page</a></li>
			<li>
				<a href="javascript:void(0)" id="menu-change-style">Site Styles</a>
			</li>
			<li><a href="javascript:void(0)" id="menu-toggle-directory">Toggle Directory</a></li>
			<li><a href="javascript:void(0)" id="menu-remove-frame">Remove Frames</a></li>
		</ul>
		
		{foreach name=sections item=sect from=$boards}
			{if count($sect.boards) > 0}
				<h3 class="menu-section-title">{$sect.name}</h3>
				<ul class="list menu-section-list">
				
					{foreach name=brds item=brd from=$sect.boards}
					
					<li>
						<a href="/{$brd.name}">
							<span class="menu-board-directory" hidden>/{$brd.name}/ - </span> {$brd.desc}
						</a>
						{if $brd.locked eq 1}
							<i class="icon icon-lock" title="Board is locked"></i>
						{/if}
					</li>
					
					{/foreach}
					
				</ul>
			{/if}
		{/foreach}
	</div>
	
	{include('includes/bodyJquery.html')}
	<script src="/custom/js/board.js"></script>
</body>
</html>
