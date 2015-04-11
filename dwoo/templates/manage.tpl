<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="robots" content="noindex">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Manage Boards</title>
	
	<link rel="shortcut icon" href="/favicon.ico">
	
	{if $useOldCss}
	<link rel="stylesheet" href="/custom/css/old_manage.css">
	{else}
	<link rel="stylesheet" href="/custom/css/common.css">
	<link rel="stylesheet" href="/custom/css/manage.css">
	{/if}
</head>
<body id="page">
	{$includeheader}
	{$page}
	{$footer}
	
	{if not $useOldCss}
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="/custom/js/manage.js"></script>
	{/if}
</body>
</html>
