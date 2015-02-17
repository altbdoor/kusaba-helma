<div class="board-reply-mode text-center text-bold bg-reply">
	{if not $isread}
		{t}Posting mode: Reply{/t}
		{if $modifier eq 'first100'}
			[{t}First 100 posts{/t}]
		{elseif $modifier eq 'last50'}
			[{t}Last 50 posts{/t}]
		{/if}
	{else}
		[<a href="{%KU_WEBFOLDER}{$board.name}/res/{$posts.0.id}.html">{t}Entire thread{/t}</a>]
	{/if}
</div>

{*<div class="board-reply-controls">
	[<a href="{%KU_WEBFOLDER}{$board.name}/">{t}Return{/t}</a>]
	[<a href="{%KU_WEBFOLDER}{$board.name}/catalog.html">{t}Catalog{/t}</a>]
	{if %KU_FIRSTLAST && ( count($posts) > 50 || $replycount > 50)}
		[<a href="{%KU_WEBFOLDER}{$board.name}/res/{$posts.0.id}.html">{t}Entire thread{/t}</a>] 
		[<a href="{%KU_WEBFOLDER}{$board.name}/res/{$posts.0.id}+50.html">{t}Last 50 posts{/t}</a>]
		{if ( count($posts) > 100 || $replycount > 100) }
			[<a href="{%KU_WEBFOLDER}{$board.name}/res/{$posts.0.id}-100.html">{t}First 100 posts{/t}</a>]
		{/if}
	{/if}
</div>*}
