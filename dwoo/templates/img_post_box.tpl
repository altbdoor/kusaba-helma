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
			<td class="postform-table-label bg-postform text-right">
				<label for="postform-name" class="text-bold">{t}Name{/t}</label>
			</td>
			<td>
				<input type="text" name="name" id="postform-name" class="input input-block" tabindex="1" maxlength="{%KU_MAX_NAME}">
			</td>
		</tr>
		<tr>
			<td class="postform-table-label bg-postform text-right">
				<label for="postform-em" class="text-bold">{t}Email{/t}</label>
			</td>
			<td>
				<input type="text" name="em" id="postform-em" class="input input-block" tabindex="2" maxlength="{%KU_MAX_EMAIL}">
			</td>
		</tr>
		<tr>
			<td class="postform-table-label bg-postform text-right">
				<label for="postform-subject" class="text-bold">{t}Subject{/t}</label>
			</td>
			<td>
				<input type="text" name="subject" id="postform-subject" class="input input-block" tabindex="3" maxlength="{%KU_MAX_SUBJECT}">
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
			<td class="postform-table-label bg-postform text-right">
				<label for="postform-message" class="text-bold">{t}Message{/t}</label>
			</td>
			<td colspan="2">
				<textarea name="message" id="postform-message" class="input input-block" tabindex="4"></textarea>
			</td>
		</tr>
		{if $board.enablecaptcha eq 1}
		<tr>
			<td class="postform-table-label bg-postform text-right">
				<label class="text-bold">{t}Captcha{/t}</label>
			</td>
			<td colspan="2">{$recaptcha}</td>
		</tr>
		{/if}
		{if $board.uploadtype eq 0 || $board.uploadtype eq 1}
		<tr>
			<td class="postform-table-label bg-postform text-right">
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
			<td class="postform-table-label bg-postform text-right">
				<label for="postform-embed" class="text-bold">{t}Embed{/t}</label>
			</td>
			<td colspan="2">
				<input type="hidden" name="embedtype" value="youtube">
				
				<input type="text" name="embed" id="postform-embed" class="input" size="30" placeholder="E.g. https://www.youtube.com/watch?v=HSaqvhvnAgI">
				
				[ <i class="icon icon-question-sign" title="YouTube videos only. E.g. https://www.youtube.com/watch?v=HSaqvhvnAgI"></i> ]
				
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
			<td class="postform-table-label bg-postform text-right">
				<label for="postform-postpassword" class="text-bold">{t}Password{/t}</label>
			</td>
			<td colspan="2">
				<input type="password" name="postpassword" id="postform-postpassword" class="input postform-postpassword-group" size="30" required>
				
				[ <i class="icon icon-question-sign" title="{t}For post and file deletion{/t}"></i> ]
			</td>
		</tr>
		<tr id="postform-postpassword-mod" hidden>
			<td class="postform-table-label bg-postform text-right">
				<label class="text-bold">Mod</label>
			</td>
			<td colspan="2">
				<input type="text" name="modpassword" class="input" size="30" disabled><br>
				
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
