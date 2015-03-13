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
