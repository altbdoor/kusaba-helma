<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="robots" content="noindex">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Manage Boards</title>
	
	<link rel="shortcut icon" href="{%KU_WEBPATH}/favicon.ico">
	
	{if $useOldCss}
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/old_manage.css">
	{else}
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/common.css">
	<link rel="stylesheet" href="{%KU_WEBPATH}/custom/css/manage.css">
	{/if}
</head>
<body id="page">
	{$includeheader}
	{$page}
	{$footer}
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="{%KU_WEBPATH}/custom/js/manage.js"></script>
</body>
</html>