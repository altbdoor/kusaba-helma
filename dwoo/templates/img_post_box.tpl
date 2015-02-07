<div>
	<b>Links:</b>
	[<a href="http://strikewitches.wikia.com/wiki/Strike_Witches_Wiki" target="_blank">Wiki</a>] 
	[<a href="http://dl.dropbox.com/u/18732903/Links.html" target="_blank">Dropbox</a>] 
	[<a href="http://karlsland.net/sw/" target="_blank">Karlsland.net imageboard</a>]

	<b>Ventrilo:</b> [Texas2.MaxFrag.net 4126 Pass: mikan]
</div>

<hr class="border border-light">

<form id="postform" name="postform" action="{%KU_CGIPATH}/board.php" method="post" enctype="multipart/form-data">
	<input type="text" name="email" hidden>
	<input type="hidden" name="board" value="{$board.name}">
	<input type="hidden" name="replythread" value="<!sm_threadid>">
	
	{if $board.maximagesize > 0}
	<input type="hidden" name="MAX_FILE_SIZE" value="{$board.maximagesize}">
	{/if}
	
	<table id="postform-table">
		{if $board.forcedanon neq 1}
		<tr>
			<td class="postform-table-label bg-darker text-right">
				<label for="postform-name" class="text-bold">{t}Name{/t}</label>
			</td>
			<td>
				<input type="text" name="name" id="postform-name" class="input input-block" tabindex="1">
			</td>
		</tr>
		{/if}
		<tr>
			<td class="postform-table-label bg-darker text-right">
				<label for="postform-em" class="text-bold">{t}Email{/t}</label>
			</td>
			<td>
				<input type="text" name="em" id="postform-em" class="input input-block" tabindex="2">
			</td>
		</tr>
		<tr>
			<td class="postform-table-label bg-darker text-right">
				<label for="postform-subject" class="text-bold">{t}Subject{/t}</label>
			</td>
			<td>
				<input type="text" name="subject" id="postform-subject" class="input input-block" tabindex="3">
			</td>
			<td class="postform-table-btn">
				<input type="submit" class="btn btn-block" value="Post" tabindex="5">
				
				{*
				
				{strip}<input type="submit" value="
				{if %KU_QUICKREPLY && $replythread eq 0}
					{t}Submit{/t}" accesskey="z" />&nbsp;(<span id="posttypeindicator">{t}new thread{/t}</span>)
				{elseif %KU_QUICKREPLY && $replythread neq 0}
					{t}Reply{/t}" accesskey="z" />&nbsp;(<span id="posttypeindicator">{t}reply to{/t} <!sm_threadid></span>)
				{else}
					{t}Submit{/t}" accesskey="z" />
				{/if}{/strip}
				
				*}
			</td>
		</tr>
		<tr>
			<td class="postform-table-label bg-darker text-right">
				<label for="postform-message" class="text-bold">{t}Message{/t}</label>
			</td>
			<td colspan="2">
				<textarea name="message" id="postform-message" class="input input-block" tabindex="4" required></textarea>
			</td>
		</tr>
		{if $board.enablecaptcha eq 1}
		<tr>
			<td class="postform-table-label bg-darker text-right">
				<label class="text-bold">{t}Captcha{/t}</label>
			</td>
			<td colspan="2">{$recaptcha}</td>
		</tr>
		{/if}
		{if $board.uploadtype eq 0 || $board.uploadtype eq 1}
		<tr>
			<td class="postform-table-label bg-darker text-right">
				<label class="text-bold">{t}File{/t}</label>
			</td>
			<td colspan="2">
				<div id="postform-imagefile-wrapper">
					<input type="file" name="imagefile" class="input input-plain" tabindex="6">
					
					<div id="postform-imagefile-other" class="bg-light">
						{if $replythread eq 0 && $board.enablenofile eq 1 }
						<label class="input input-plain">[ <input type="checkbox" name="nofile" tabindex="7"> {t}No File{/t} ]</label>
						{/if}
						
						{if $hasSpoiler}
						<label class="input input-plain">[ <input type="checkbox" name="spoiler" tabindex="7"> {t}Spoiler{/t} ]</label>
						{/if}
					</div>
				</div>
			</td>
		</tr>
		{/if}
		{if ($board.uploadtype eq 1 || $board.uploadtype eq 2) && $board.embeds_allowed neq ''}
		<tr>
			<td class="postform-table-label bg-darker text-right">
				<label for="postform-embed" class="text-bold">{t}Embed{/t}</label>
			</td>
			<td colspan="2">
				<input type="hidden" name="embedtype" value="youtube">
				
				<input type="text" name="embed" id="postform-embed" class="input">
				
				[ <abbr title="YouTube videos only. E.g. https://www.youtube.com/watch?v=HSaqvhvnAgI">?</abbr> ]
				
				{*
				<select name="embedtype" class="input">
				{foreach name=embed from=$embeds item=embed}
					{if in_array($embed.filetype,explode(',' $board.embeds_allowed))}
						<option value="{$embed.name|lower}">{$embed.name}</option>
					{/if}
				{/foreach}
				</select>
				*}
			</td>
		</tr>
		{/if}
		<tr>
			<td class="postform-table-label bg-darker text-right">
				<label for="postform-postpassword" class="text-bold">{t}Password{/t}</label>
			</td>
			<td colspan="2">
				<input type="password" name="postpassword" id="postform-postpassword" class="input postform-postpassword-group" size="8" required>
				[ <abbr title="{t}For post and file deletion{/t}">?</abbr> ]
			</td>
		</tr>
		<tr id="postform-postpassword-mod" hidden>
			<td class="postform-table-label bg-darker text-right">
				<label class="text-bold">Mod</label>
			</td>
			<td colspan="2">
				<input type="text" name="modpassword" class="input" disabled><br>
				
				<label class="input input-plain">[ <input type="checkbox" disabled name="displaystaffstatus" checked> <abbr title="Display staff status (Mod/Admin)">D</abbr> ]</label>
				<label class="input input-plain">[ <input type="checkbox" disabled name="lockonpost"> <abbr title="Lock">L</abbr> ]</label>
				<label class="input input-plain">[ <input type="checkbox" disabled name="stickyonpost"> <abbr title="Sticky">S</abbr> ]</label>
				<label class="input input-plain">[ <input type="checkbox" disabled name="rawhtml"> <abbr title="Raw HTML">R</abbr> ]</label>
				<label class="input input-plain">[ <input type="checkbox" disabled name="usestaffname"> <abbr title="Name">N</abbr> ]</label>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<ul id="postform-rules" class="text-small">
					<li>
						{t}Supported file types are{/t}:
						{if $board.filetypes_allowed neq ''}
							{foreach name=files item=filetype from=$board.filetypes_allowed}
								{$filetype.0|upper}{if $.foreach.files.last}{else}, {/if}
							{/foreach}
						{else}
							{t}None{/t}
						{/if}
					</li>
					<li>{t}Maximum file size allowed is{/t} {math "round(x/1024)" x=$board.maximagesize} KB</li>
					<li>{t 1=%KU_THUMBWIDTH 2=%KU_THUMBHEIGHT}Images greater than %1x%2 pixels will be thumbnailed{/t}</li>
					<li>
						{t 1=$board.uniqueposts}Currently %1 unique user posts{/t}
						{if $board.enablecatalog eq 1} 
							[ <a href="{%KU_BOARDSFOLDER}{$board.name}/catalog.html">{t}View catalog{/t}</a> ]
						{/if}
					</li>
				</ul>
			</td>
		</tr>
	</table>
</form>

<hr class="border border-light">

{*

<a name="TOP"></a>
<b>Links:</b> [<a href="http://strikewitches.wikia.com/wiki/Strike_Witches_Wiki" target="_blank">Wiki</a>] 
[<a href="http://dl.dropbox.com/u/18732903/Links.html" target="_blank">Dropbox</a>] 
[<a href="http://karlsland.net/sw/" target="_blank">Karlsland.net imageboard</a>]
<b>Ventrilo:</b> [Texas2.MaxFrag.net 4126 Pass: mikan] 
<HR>
</body>
<div class="postarea">
<a id="postbox"></a>
<form name="postform" id="postform" action="{%KU_CGIPATH}/board.php" method="post" enctype="multipart/form-data"
{if $board.enablecaptcha eq 1}
	onsubmit="return checkcaptcha('postform');"
{/if}
>
<input type="hidden" name="board" value="{$board.name}" />
<input type="hidden" name="replythread" value="<!sm_threadid>" />
{if $board.maximagesize > 0}
	<input type="hidden" name="MAX_FILE_SIZE" value="{$board.maximagesize}" />
{/if}
<input type="text" name="email" size="28" maxlength="75" value="" style="display: none;" />
<table class="postform">
	<tbody>
	{if $board.forcedanon neq 1}
		<tr>
			<td class="postblock">
				{t}Name{/t}</td>
			<td>
				<input type="text" name="name" size="28" maxlength="75" accesskey="n" />
			</td>
		</tr>
	{/if}
	<tr>
		<td class="postblock">
			{t}Email{/t}</td>
		<td>
			<input type="text" name="em" size="28" maxlength="75" accesskey="e" />
		</td>
	</tr>
	<tr>
		<td class="postblock">
			{t}Subject{/t}
		</td>
		<td>
			{strip}<input type="text" name="subject" size="35" maxlength="75" accesskey="s" />&nbsp;<input type="submit" value="
			{if %KU_QUICKREPLY && $replythread eq 0}
				{t}Submit{/t}" accesskey="z" />&nbsp;(<span id="posttypeindicator">{t}new thread{/t}</span>)
			{elseif %KU_QUICKREPLY && $replythread neq 0}
				{t}Reply{/t}" accesskey="z" />&nbsp;(<span id="posttypeindicator">{t}reply to{/t} <!sm_threadid></span>)
			{else}
				{t}Submit{/t}" accesskey="z" />
			{/if}{/strip}
		</td>
	</tr>
	<tr>
		<td class="postblock">
			{t}Message{/t}
		</td>
		<td>
			<textarea name="message" cols="48" rows="4" accesskey="m"></textarea>
		</td>
	</tr>
	{if $board.enablecaptcha eq 1}
		<tr>
			<td class="postblock">{t}Captcha{/t}</td>
			<td colspan="2">{$recaptcha}</td>
		</tr>
	{/if}
	{if $board.uploadtype eq 0 || $board.uploadtype eq 1}
		<tr>
			<td class="postblock">
				{t}File{/t}
			</td>
			<td>
			<input type="file" name="imagefile" size="35" accesskey="f" />
			{if $replythread eq 0 && $board.enablenofile eq 1 }
[<input type="checkbox" name="nofile" id="nofile" accesskey="q" /><label for="nofile"> {t}No File{/t}</label>] {/if} {if $board.name eq 'sw' || $board.name eq 'cr' || $board.name eq 'ot'} <input type="checkbox" name="spoiler" id="spoiler" /><label for="spoiler">{t}Spoiler{/t}</label> {/if} </td>
			</td>
		</tr>
	{/if}
	{if ($board.uploadtype eq 1 || $board.uploadtype eq 2) && $board.embeds_allowed neq ''}
		<tr>
			<td class="postblock">
				{t}Embed{/t}
			</td>
			<td>
				<input type="text" name="embed" size="28" maxlength="75" accesskey="e" />&nbsp;<select name="embedtype">
				{foreach name=embed from=$embeds item=embed}
					{if in_array($embed.filetype,explode(',' $board.embeds_allowed))}
						<option value="{$embed.name|lower}">{$embed.name}</option>
					{/if}
				{/foreach}
				</select>
				<a class="rules" href="#postbox" onclick="window.open('{%KU_WEBPATH}/embedhelp.php','embedhelp','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,width=300,height=210');return false;">Help</a>
			</td>
		</tr>
	{/if}
		<tr>
			<td class="postblock">
				{t}Password{/t}
			</td>
			<td>
				<input type="password" name="postpassword" size="8" accesskey="p" />&nbsp;{t}(for post and file deletion){/t}
			</td>
		</tr>
		<tr id="passwordbox"><td></td><td></td></tr>
		<tr>
			<td colspan="2" class="rules">
				<ul style="margin-left: 0; margin-top: 0; margin-bottom: 0; padding-left: 0;">
					<li>{t}Supported file types are{/t}:
					{if $board.filetypes_allowed neq ''}
						{foreach name=files item=filetype from=$board.filetypes_allowed}
							{$filetype.0|upper}{if $.foreach.files.last}{else}, {/if}
						{/foreach}
					{else}
						{t}None{/t}
					{/if}
					</li>
					<li>{t}Maximum file size allowed is{/t} {math "round(x/1024)" x=$board.maximagesize} KB.</li>
					<li>{t 1=%KU_THUMBWIDTH 2=%KU_THUMBHEIGHT}Images greater than %1x%2 pixels will be thumbnailed.{/t}</li>
					<li>{t 1=$board.uniqueposts}Currently %1 unique user posts.{/t}
					{if $board.enablecatalog eq 1} 
						<a href="{%KU_BOARDSFOLDER}{$board.name}/catalog.html">{t}View catalog{/t}</a>
					{/if}
					</li>
				</ul>
			{if %KU_BLOTTER && $blotter}
				<br />
				<ul style="margin-left: 0; margin-top: 0; margin-bottom: 0; padding-left: 0;">
				<li style="position: relative;">
					<span style="color: red;">
				{t}Blotter updated{/t}: {$blotter_updated|date_format:"%Y-%m-%d"}
				</span>
					<span style="color: red;text-align: right;position: absolute;right: 0px;">
						<a href="#" onclick="javascript:toggleblotter(true);return false;">{t}Show/Hide{/t}</a> <a href="{%KU_WEBPATH}/blotter.php">{t}Show All{/t}</a>
					</span>
				</li>
				{$blotter}
				</ul>
				<script type="text/javascript"><!--
				if (getCookie('ku_showblotter') == '1') {
					toggleblotter(false);
				}
				<!--</script>
			{/if}
			</td>
		</tr>
	</tbody>

</table>
</form>
<hr />-->
{if $topads neq ''}
	<div class="content ads">
		<center> 
			{$topads}
		</center>
	</div>
	<hr />
{/if}
</div>
<script type="text/javascript"><!--
				set_inputs("postform");
				//--></script>

*}