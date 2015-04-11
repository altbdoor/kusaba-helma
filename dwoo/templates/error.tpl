<!doctype html>
<html class="bg-light">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Error - {%KU_NAME}</title>
	
	<link rel="shortcut icon" href="/favicon.ico">
	
	<link rel="stylesheet" href="/custom/css/common.css">
	
	{if $fromAdmin}
		<link rel="stylesheet" href="/custom/css/manage.css">
	{else}
		<link rel="stylesheet" href="/custom/css/board.css">
		
		<script>
			{literal}!function(s){Array.prototype.forEach.call("{/literal}{loop $styles},{$}{/loop}{literal}".substr(1).split(","),function(t){document.write('<link rel="'+(t==s?"":"alternate ")+'stylesheet" href="/custom/css/board_'+t+'.css" id="css-board-'+t+'" class="css-board">')})}(localStorage.getItem("lscache-main-style")||"{/literal}{%KU_DEFAULTSTYLE}");
		</script>
		
		<noscript>
		<link rel="stylesheet" href="/custom/css/board_burichan.css">
		</noscript>
	{/if}
</head>
<body>
	<div {if $fromAdmin}id="error-page"{/if} class="text-center">
		<h1>An Error Occured</h1>
		<ul class="list">
			<li>{$errormsg}</li>
			<li>{$errormsgext}</li>
		</ul>
		<br>
		- <a href="http://kusabax.cultnet.net/" target="_top">kusaba x {%KU_VERSION}</a> -
	</div>
</body>
</html>
