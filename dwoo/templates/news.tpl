<!doctype html>
<html class="bg-main">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>{$KU_NAME} - News</title>
	
	<link rel="shortcut icon" href="{%KU_WEBPATH}/favicon.ico">
	
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/common.css">
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/board.css">
	
	{loop $styles}
	<link rel="{if $ neq %KU_DEFAULTMENUSTYLE}alternate {/if}stylesheet" href="{%KU_WEBPATH}/custom/css/board_{$}.css" id="css-board-{$}" class="css-board">
	{/loop}
</head>
<body>
	<div id="news-container">
		<div id="news-title" class="text-center">
			<h1>{$dwoo.const.KU_NAME}</h1>
			{if $dwoo.const.KU_SLOGAN neq ''}<h3>{$dwoo.const.KU_SLOGAN}</h3>{/if}
		</div>
		
		<ul id="news-tab" class="list list-float text-center border-sub">
			<li class="bg-main border-sub {if $dwoo.get.p eq ''}active{/if}">
				<a href="{$KU_WEBPATH}/news.php">{t}News{/t}</a>
			</li>
			<li class="bg-main border-sub {if $dwoo.get.p eq 'faq'}active{/if}">
				<a href="{$KU_WEBPATH}/news.php?p=faq">{t}FAQ{/t}</a>
			</li>
			<li class="bg-main border-sub {if $dwoo.get.p eq 'rules'}active{/if}">
				<a href="{$KU_WEBPATH}/news.php?p=rules">{t}Rules{/t}</a>
			</li>
		</ul>
		
		<ul id="news-entry" class="list">
			{foreach item=entry from=$entries}
			
			<li>
				<div class="news-entry-title bg-sub clear">
					<span class="float-left">
						{$entry.subject|stripslashes}
						
						{if $dwoo.get.p eq ''}
							by {$entry.poster|stripslashes} - {$entry.timestamp|date_format:"%D @ %I:%M %p %Z"}
						{/if} 
					</span>
					
					<a href="#{$entry.id}" class="float-right" title="Permalink">#</a>
				</div>
				
				<div class="news-entry-content">
					{$entry.message|stripslashes}
				</div>
			</li>
			
			{/foreach}
		</ul>
	</div>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="{%KU_WEBPATH}/custom/js/board.js"></script>
</body>
</html>