	<link rel="stylesheet" href="/custom/css/board.css">
	
	{if %KU_RSS neq ''}
	<link rel="alternate" type="application/rss+xml" title="RSS" href="{%KU_BOARDSPATH}/{$board.name}/rss.xml">
	{/if}
	
	{include('includes/headStyle.html')}
</head>
<body class="board-page board-page-thread boxed">
	<!--[if lt IE 9]>
	<div class="error text-center">
		<i class="icon icon-warning-sign"></i> Your browser is out of date. It has known security flaws and may not display all features of this and other websites.
	</div>
	<![endif]-->
	
	<div id="modal-wrapper" hidden>
		<div id="modal-box" hidden>
			
		</div>
		
		<div id="modal-mod-move-wrapper" hidden></div>
	</div>
	
	<div id="board-nav-top" class="board-nav clear">
		<div class="board-nav-list float-left">
			{if %KU_GENERATEBOARDLIST}
				{foreach name=sections item=sect from=$boardlist}
				
				[ {foreach name=brds item=brd from=$sect}
					<a title="{$brd.desc}" href="{%KU_BOARDSFOLDER}{$brd.name}/">{$brd.name}</a>{if $.foreach.brds.last}{else} / {/if}
				{/foreach} ]
				
				{/foreach}
			{else}
				{if is_file($boardlist)}
					{include $boardlist}
				{/if}
			{/if}
		</div>
		<div class="board-nav-misc-link float-right">
			[<a href="{%KU_WEBPATH}/manage.php" target="_top">Manage</a>]
			{*[<a href="javascript:void(0)" class="board-settings">Settings</a>]*}
			[<a href="{%KU_WEBPATH}" target="_top">Home</a>]
		</div>
	</div>
	
	<div id="board-logo" class="text-center text-title-color">
		{if %KU_HEADERURL neq '' && $board.image eq ''}
			<img alt="{t}Logo{/t}" class="boxed border border-light" src="{%KU_HEADERURL}">
		{elseif $board.image neq '' && $board.image neq "none"}
			<img alt="{t}Logo{/t}" class="boxed border border-light" src="{$board.image}">
		{/if}
		
		<h1>{if %KU_DIRTITLE}/{$board.name}/ - {/if}{$board.desc}</h1>
	</div>
	
	<hr class="border border-light">
