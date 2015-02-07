<!doctype html>
<html class="board-page bg-light">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>{%KU_NAME} - News</title>
	
	<link rel="shortcut icon" href="{%KU_WEBPATH}/favicon.ico">
	
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/common.css">
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/board.css">
	
	<script>
		{literal}!function(s){Array.prototype.forEach.call("{/literal}{loop $styles},{$}{/loop}{literal}".substr(1).split(","),function(t){document.write('<link rel="'+(t==s?"":"alternate ")+'stylesheet" href="/custom/css/board_'+t+'.css" id="css-board-'+t+'" class="css-board">')})}(localStorage.getItem("lscache-main-style")||"{/literal}{%KU_DEFAULTSTYLE}");
	</script>
	
	<noscript>
	<link rel="stylesheet" href="/custom/css/board_burichan.css">
	</noscript>
</head>
<body>
	<div id="news-container">
		<div id="news-title" class="text-center text-title-color">
			<h1>{$dwoo.const.KU_NAME}</h1>
			{if $dwoo.const.KU_SLOGAN neq ''}<h3>{$dwoo.const.KU_SLOGAN}</h3>{/if}
		</div>
		
		<!--[if lt IE 9]>
		<div class="error text-center">
			<i class="icon icon-warning-sign"></i> Your browser is out of date. It has known security flaws and may not display all features of this and other websites.
		</div>
		<![endif]-->
		
		<ul id="news-tab" class="list list-float text-center border border-light">
			<li class="bg-light border border-light {if $dwoo.get.p eq ''}active{/if}">
				<a href="{$KU_WEBPATH}/news.php">{t}News{/t}</a>
			</li>
			<li class="bg-light border border-light {if $dwoo.get.p eq 'links'}active{/if}">
				<a href="{$KU_WEBPATH}/news.php?p=links">{t}Links{/t}</a>
			</li>
			<li class="bg-light border border-light {if $dwoo.get.p eq 'rules'}active{/if}">
				<a href="{$KU_WEBPATH}/news.php?p=rules">{t}Rules{/t}</a>
			</li>
		</ul>
		
		<ul id="news-entry" class="list">
			{foreach item=entry from=$entries}
			
			<li>
				<div class="news-entry-title bg-dark clear">
					<span class="float-left">
						{$entry.subject|stripslashes}
						
						{if $dwoo.get.p eq ''}
							by {$entry.poster|stripslashes} - {$entry.timestamp|date_format:"%D @ %I:%M %p %Z"}
						{/if} 
					</span>
					
					<a href="#{$entry.id}" class="float-right">#</a>
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
