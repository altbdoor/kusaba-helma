	<div id="board-extra-controls" class="clear">
		{if $replythread eq 0}
		
		<div id="board-page-list" class="float-left bg-dark">
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
		
		{else}
		
		<div class="board-reply-controls float-left">
			[<a href="{%KU_WEBFOLDER}{$board.name}/">{t}Return{/t}</a>]
			[<a href="{%KU_WEBFOLDER}{$board.name}/catalog.html">{t}Catalog{/t}</a>]
			{if %KU_FIRSTLAST && ( count($posts) > 50 || $replycount > 50)}
				[<a href="{%KU_WEBFOLDER}{$board.name}/res/{$posts.0.id}.html">{t}Entire thread{/t}</a>] 
				[<a href="{%KU_WEBFOLDER}{$board.name}/res/{$posts.0.id}+50.html">{t}Last 50 posts{/t}</a>]
				{if ( count($posts) > 100 || $replycount > 100) }
					[<a href="{%KU_WEBFOLDER}{$board.name}/res/{$posts.0.id}-100.html">{t}First 100 posts{/t}</a>]
				{/if}
			{/if}
			[<a href="javascript:void(0)" class="">Update</a>]
			[<label class="">
				<input type="checkbox">
				Auto
			</label>]
		</div>
		
		{/if}
		
		{if not $isread}
		
		<div id="board-delete-report" class="board-delete text-right float-right">
			<div>
				{t}Delete post{/t} -
				<label>
					[ <input type="checkbox" name="fileonly" value="on"> {t}File Only{/t} ]
				</label>
				
				<input name="deletepost" value="{t}Delete{/t}" type="submit" class="btn">
			</div>
			
			{if $board.enablereporting eq 1}
			
			<div>
				{t}Report post{t} -
				<input type="text" name="reportreason" class="input" size="8" placeholder="Reason">
				<input name="reportpost" value="{t}Report{/t}" type="submit" class="btn">
			</div>
			
			{/if}
		</div>
		
		<div id="board-mod-delete-ban" class="board-delete text-right float-right" hidden>
			<!--[<input type="checkbox" name="fileonly" id="fileonly" value="on" /><label for="fileonly">File Only</label>] <input name="moddelete" onclick="return confirm(_(\'Are you sure you want to delete these posts?\'))" value="'+_('Delete')+'" type="submit" /> <input name="modban" value="'+_('Ban')+'" onclick="this.form.action=\''+ ku_cgipath + '/manage_page.php?action=bans\';" type="submit" />-->
			
			<div>
				{t}Delete post{/t} -
				<label>
					[ <input type="checkbox" name="fileonly" value="on" disabled> {t}File Only{/t} ]
				</label>
				
				<input name="moddelete" value="{t}Delete{/t}" type="submit" onclick="return confirm('Are you sure you want to delete these posts?')" class="btn" disabled>
			</div>
			
			<div>
				{t}Ban post{t} -
				<input type="text" name="reportreason" class="input" size="8" placeholder="Reason" disabled>
				<input name="modban" value="{t}Ban{/t}" type="submit" class="btn" disabled>
			</div>
		</div>
		
		{/if}
	</div>
</form>

<div id="board-nav-bottom" class="board-nav clear">
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

<div id="board-generate-info" class="text-center text-small">
	- <a href="http://kusabax.cultnet.net/" target="_top">kusaba x {%KU_VERSION}</a>
	{if $executiontime neq ''}- {t}Took{/t} {$executiontime}s{/if} -
</div>
