<!doctype html>
<html class="board-menu bg-light">
<head>
	{include('includes/headMeta.html')}
	
	<title>{%KU_NAME} - Navigation</title>
	
	<link rel="shortcut icon" href="/favicon.ico">
	
	<link rel="stylesheet" href="/custom/css/common.css">
	<link rel="stylesheet" href="/custom/css/board.css">
	
	{include('includes/headStyle.html')}
	
	<base target="board_page">
</head>
<body>
	<h1 id="menu-title" class="bg-dark text-center">{%KU_NAME}</h1>
	
	<ul id="menu-main-list" class="list">
		<li><a href="{%KU_WEBFOLDER}" target="_top">{t}Front Page{/t}</a></li>
		<li>
			<a href="javascript:void(0)" id="menu-site-style">{t}Site Styles{/t}</a>
			<ul id="menu-site-style-list" class="list list-inline" hidden>
				<li>{t}Styles{/t}:</li>
				{loop $styles}
				
				<li>[<a href="javascript:void(0)" title="{$|capitalize}" data-target-id="css-board-{$}">{$|substr:0:1|upper}</a>]</li>
				
				{/loop}
			</ul>
		</li>
		<li><a href="javascript:void(0)" class="toggle" data-target=".menu-board-directory">{t}Toggle Directories{/t}</a></li>
		<li>
			<a href="javascript:void(0)" id="menu-remove-frame" data-alt-text="{t}Frames Removed{/t}">{t}Remove Frames{/t}</a>
		</li>
	</ul>
	
	{if empty($boards)}
		<div id="menu-boards-empty" class="bg-dark">
			{t}No visible boards{/t}
		</div>
	{else}
		{foreach name=sections item=sect from=$boards}
		
		<h2 class="menu-section-title bg-dark toggle toggle-animate" data-target="#menu-section-list-{$.foreach.sections.index}" title="{t}Click to show/hide{/t}">{$sect.name}</h2>
		
		{if count($sect.boards) > 0}
			<ul id="menu-section-list-{$.foreach.sections.index}" class="list menu-section-list">
			
			{foreach name=brds item=brd from=$sect.boards}
			
			<li class="clear">
				<a class="float-left" href="{%KU_BOARDSPATH}/{$brd.name}/">
					<span class="menu-board-directory" hidden>/{$brd.name}/ - </span> {$brd.desc}
				</a>
				{if $brd.locked eq 1}
					<i class="icon icon-lock float-right"></i>
				{/if}
			</li>
			
			{/foreach}
			
			</ul>
		{else}
			<div class="menu-section-empty">
				{t}No visible boards{/t}
			</div>
		{/if}
	{/foreach}
	
	{include('includes/bodyJquery.html')}
	<script src="/custom/js/board.js"></script>
</body>
</html>
