<!doctype html>
<html class="board-page bg-light">
<head>
	{include('includes/headMeta.html')}

	<title>{%KU_NAME} - News</title>
	
	<link rel="shortcut icon" href="/favicon.ico">
	
	<link rel="stylesheet" href="/custom/css/common.css">
	<link rel="stylesheet" href="/custom/css/board.css">
	
	{include('includes/headStyle.html')}
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
	
	{include('includes/bodyJquery.html')}
	<script src="/custom/js/board.js"></script>
</body>
</html>
