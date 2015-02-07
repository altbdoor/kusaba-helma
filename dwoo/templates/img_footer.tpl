	<div class="board-bottom-controls clear">
		{if $replythread eq 0}
		
		<div class="board-page-list float-left bg-dark">
			{if $thispage eq 0}
				[{t}Previous{/t}]
			{else}
				[<a href="{%KU_BOARDSFOLDER}{$board.name}/{$thispage-1}.html">{t}Previous{/t}</a>]
			{/if}
			
			[<a class="{if $thispage eq 0}text-bold{/if}" href="{%KU_BOARDSPATH}/{$board.name}/">0</a>]

			{section name=pages loop=$numpages}
				[<a class="{if $.section.pages.iteration eq $thispage}text-bold{/if}" href="{%KU_BOARDSFOLDER}{$board.name}/{$.section.pages.iteration}.html">
					{$.section.pages.iteration}
				</a>]
			{/section}
			
			{if $thispage eq $numpages}
				[{t}Next{/t}]
			{else}
				[<a href="{%KU_BOARDSFOLDER}{$board.name}/{$thispage+1}.html">{t}Next{/t}</a>]
			{/if}
		</div>
		
		{/if}
		
		{if not $isread}
		
		<div class="board-delete-report text-right float-right">
			<div class="board-delete">
				{t}Delete post{/t} -
				<label>
					[ <input type="checkbox" name="fileonly" value="on"> {t}File Only{/t} ]
				</label>
				
				{t}Password{/t}:
				<input type="password" name="postpassword" class="input postform-postpassword-group" size="8" required>
				<input name="deletepost" value="{t}Delete{/t}" type="submit" class="btn board-delete-btn">
			</div>
			
			{if $board.enablereporting eq 1}
			
			<div class="board-report">
				{t}Report post{t} -
				{t}Reason{/t}:
				<input type="text" name="reportreason" class="input" size="8">
				<input name="reportpost" value="{t}Report{/t}" type="submit" class="btn board-report-btn">	
			</div>
			
			{/if}
		</div>
		
		{/if}
	</div>
</form>

<div class="board-nav clear">
	<div class="float-left">
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
	<div class="float-right">
		[<a href="javascript:void(0)">Settings</a>]
		[<a href="{%KU_WEBPATH}" target="_top">Home</a>]
	</div>
</div>

<div class="text-center text-small">
	- <a href="http://kusabax.cultnet.net/" target="_top">kusaba x {%KU_VERSION}</a>
	{if $executiontime neq ''}- {t}Took{/t} {$executiontime}s{/if} -
</div>
