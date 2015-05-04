<!doctype html>
<html class="board-menu bg-light">
<head>
	{include('includes/headMeta.html')}
	
	<title>Banned - {%KU_NAME}</title>
	
	<link rel="shortcut icon" href="/favicon.ico">
	
	<link rel="stylesheet" href="/custom/css/common.css">
	<link rel="stylesheet" href="/custom/css/board.css">
	
	{include('includes/headStyle.html')}
</head>
<body class="text-center">
	<h1>You Are Banned</h1>
	
	<div>
		<img src="/custom/img/youarebanned.jpg" class="img" alt=":'(">
	</div>
	
	{foreach name=bans item=ban from=$bans}
		{if not $.foreach.bans.first}
			{t}Additionally{/t},
		{/if}
		
		{if $ban.expired eq 1}
			{t}You were banned from posting on{/t}
		{else}
			{t}You have been banned from posting on{/t}
		{/if} 
		<br>
		<b>
			{if $ban.globalban eq 1}
				{t}All boards{/t}
			{else}
				/{implode('/, /', explode('|', $ban.boards))}/
			{/if}
		</b>
		
		<br><br>
		
		{t}for the following reason(s){/t}:<br>
		<b>{$ban.reason}</b><br><br>
		
		{t}Your ban was placed on{/t}<br>
		<b>{date_format $ban.at "%B %e, %Y, %I:%M %p %Z"}</b><br><br>
		
		{t}and{/t}
		
		{if $ban.expired eq 1}
			{t}expired on{/t}<br>
			<b>{date_format $ban.until "%B %e, %Y, %I:%M %p %Z"}</b><br><br>
			{t}This ban has already expired, this message is for your information only and will not be displayed again{/t}
		{else}
			{if $ban.until > 0}
				{t}will expire on{/t}<br>
				<b>{date_format $ban.until "%B %e, %Y, %I:%M %p %Z"}</b>
			{else}
				<b>{t}will not expire{/t}</b>
			{/if}
		{/if}
		
		<br><br>
		
		{*
		{if %KU_APPEAL neq '' && $ban.expired eq 0}
			{if $ban.appealat eq 0}
				{t}You may <b>not</b> appeal this ban.{/t}
			{elseif $ban.appealat eq -1}
				{t}Your appeal is currently pending review.{/t}<br>
				{t}For reference, your appeal message is{/t}:<br>
				<b>{$ban.appeal}</b>
			{elseif $ban.appealat eq -2}
				{t}Your appeal was reviewed and denied. You may <b>not</b> appeal this ban again.{/t}
				{t}For reference, your appeal message was{/t}:<br>
				<b>{$ban.appeal}</b>
			{else}
				{if $ban.appealat < $.now}
					{t}You may now appeal this ban.{/t}
					<br><br>
					<form action="{%KU_BOARDSPATH}/banned.php" method="post">
						<input type="hidden" name="banid" value="{$ban.id}">
						<label for="appealmessage">{t}Appeal Message{/t}:</label>
						<br />
						<textarea name="appealmessage" rows="10" cols="50"></textarea>
						<br /><input type="submit" value="{t}Send Appeal{/t}" />
					</form>
				{else}
					{t}You may appeal this ban in{/t} <strong>{$ban.appealin}</strong>.
				{/if}
			{/if}
			<br><br>
		{/if}
		*}
		
		{if $.foreach.bans.last}
			{t}Your IP address is{/t} <b>{$.server.REMOTE_ADDR}</b>.<br><br>
		{/if}
		
		{if count($bans) > 1 && not $.foreach.bans.last}
			<hr>
		{/if}
	{/foreach}
	
	<h2><a href="http://helma.us/">helma.us</a></h2>
</body>
</html>
