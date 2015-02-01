<!doctype html>
<html class="board-menu bg-light">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>{%KU_NAME} - Navigation</title>
	
	<link rel="shortcut icon" href="{%KU_WEBPATH}/favicon.ico">
	
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/common.css">
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/board.css">
	
	<script>
		{literal}!function(s){Array.prototype.forEach.call("{/literal}{loop $styles},{$}{/loop}{literal}".substr(1).split(","),function(t){document.write('<link rel="'+(t==s?"":"alternate ")+'stylesheet" href="/custom/css/board_'+t+'.css" id="css-board-'+t+'" class="css-board">')})}(localStorage.getItem("lscache-main-style")||"{/literal}{%KU_DEFAULTSTYLE}");
	</script>
	
	<noscript>
	<link rel="stylesheet" href="/custom/css/board_burichan.css">
	</noscript>
	
	{*
	{loop $styles}
	<link rel="alternate stylesheet" href="{%KU_WEBPATH}/custom/css/board_{$}.css" id="css-board-{$}" class="css-board">
	{/loop}
	
	{literal}
	<script>
		(function (d, selected) {
			Array.prototype.forEach.call('{loop $styles},{$}{/loop}'.substr(1).split(','), function (item) {
				var style = d.createElement('link');
				
				style.rel = (item == selected ? '' : 'alternate ') + 'stylesheet';
				style.href = '/custom/css/board_' + item + '.css';
				style.id = 'css-board-' + item;
				style.className = 'css-board';
				
				d.head.appendChild(style);
			});
		})(document, localStorage.getItem('lscache-main-style') || '{%KU_DEFAULTSTYLE}');
		
		{literal}!function(e,s){Array.prototype.forEach.call("{/literal}{loop $styles},{$}{/loop}{literal}".substr(1).split(","),function(a){var t=e.createElement("link");t.rel=(a==s?"":"alternate ")+"stylesheet",t.href="/custom/css/board_"+a+".css",t.id="css-board-"+a,t.className="css-board",e.head.appendChild(t)})}(document,localStorage.getItem("lscache-main-style")||"{/literal}{%KU_DEFAULTSTYLE}");
		
		// ========================================
		
		(function (selected) {
			Array.prototype.forEach.call('{loop $styles},{$}{/loop}'.substr(1).split(','), function (item) {
				document.write('<link rel="' + (item == selected ? '' : 'alternate ') + 'stylesheet" href="/custom/css/board_' + item + '.css" id="css-board-' + item + '" class="css-board">')
			});
		})(localStorage.getItem('lscache-main-style') || '{%KU_DEFAULTSTYLE}');
		
		{literal}!function(s){Array.prototype.forEach.call("{/literal}{loop $styles},{$}{/loop}{literal}".substr(1).split(","),function(t){document.write('<link rel="'+(t==s?"":"alternate ")+'stylesheet" href="/custom/css/board_'+t+'.css" id="css-board-'+t+'" class="css-board">')})}(localStorage.getItem("lscache-main-style")||"{/literal}{%KU_DEFAULTSTYLE}");
	</script>
	{/literal}
	*}
	
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
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="{%KU_WEBPATH}/custom/js/board.js"></script>
</body>
</html>
