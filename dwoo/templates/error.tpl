<!doctype html>
<html class="bg-light">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Error - {%KU_NAME}</title>
	
	<link rel="shortcut icon" href="{%KU_WEBPATH}/favicon.ico">
	
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/common.css">
	
	{if $fromAdmin}
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/manage.css">
	{else}
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/board.css">
	
	{loop $styles}
	<link rel="alternate stylesheet" href="{%KU_WEBPATH}/custom/css/board_{$}.css" id="css-board-{$}" class="css-board">
	{/loop}
	
	{literal}
	<script>
		!function(e,t){var a=localStorage.getItem("lscache-main-style");a&&Array.prototype.forEach.call(e.getElementsByClassName("css-board"),function(e){e.disabled=!0,e.rel="alternate "+t,e.id==a&&(e.disabled=!1,e.rel=t)})}(document,"stylesheet");
	</script>
	{/literal}
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
