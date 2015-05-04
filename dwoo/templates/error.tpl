<!doctype html>
<html class="bg-light">
<head>
	{include('includes/headMeta.html')}
	
	<title>Error - {%KU_NAME}</title>
	
	<link rel="shortcut icon" href="/favicon.ico">
	
	<link rel="stylesheet" href="/custom/css/common.css">
	
	{if $fromAdmin}
		<link rel="stylesheet" href="/custom/css/manage.css">
	{else}
		<link rel="stylesheet" href="/custom/css/board.css">
		
		{include('includes/headStyle.html')}
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
