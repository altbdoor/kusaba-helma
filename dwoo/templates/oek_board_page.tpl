<input type="hidden" id="board-id" value="{$board.id}">

<div>{* original form begin block *}
<input type="hidden" id="board-name" name="board" value="{$board.name}">

{foreach name=thread item=postsa from=$posts}
	{foreach key=postkey item=post from=$postsa}
		{if $post.parentid eq 0}
			<div id="p{$post.id}" class="thread clear">
				<div class="post-file-info thread-hidden-show">
					<span class="post-clone-hide">[
						<a href="javascript:void(0)" class="thread-toggle thread-hidden-hide" title="{t}Hide thread{/t}" data-target="{$post.id}">
							<i class="icon icon-minus"></i>
						</a>
						<a href="javascript:void(0)" class="thread-toggle thread-hidden-show" title="{t}Show thread{/t}" data-target="{$post.id}" hidden>
							<i class="icon icon-plus"></i>
						</a>
					]</span>
					
					<span class="thread-hidden-hide">
						{if $post.videobox}
							YouTube: <a target="_blank" href="https://www.youtube.com/watch?v={$post.file}">{$post.file}</a>
							[<a href="javascript:void(0)" data-target="{$post.id}" class="youtube-resize youtube-resize-reset">Reset</a>]
							[<a href="javascript:void(0)" data-target="{$post.id}" class="youtube-resize" data-res="[1280,720]">720p</a>]
							[<a href="javascript:void(0)" data-target="{$post.id}" class="youtube-resize" data-res="[1920,1080]">1080p</a>]
						{elseif ($post.file neq '' || $post.file_type neq '' ) && (($post.videobox eq '' && $post.file neq '') && $post.file neq 'removed')}
							{if $post.file_type eq 'mp3'}
								{t}Audio{/t}:
							{else}
								{t}File{/t}:
							{/if}
							
							<a {if $post.file_type neq 'jpg' && $post.file_type neq 'gif' && $post.file_type neq 'png' && $post.videobox eq '' && %KU_NEWWINDOW}target="_blank"{/if} href="{$file_path}/src/{$post.file}.{$post.file_type}">
								{if isset($post.id3.comments_html)}
									{if $post.id3.comments_html.artist.0 neq ''}
										{$post.id3.comments_html.artist.0}
										{if $post.id3.comments_html.title.0 neq ''}
											- 
										{/if}
									{/if}
									{if $post.id3.comments_html.title.0 neq ''}
										{$post.id3.comments_html.title.0}
									{/if}
								{else}
									{$post.file}.{$post.file_type}
								{/if}
							</a>
							
							{strip}(
								{$post.file_size_formatted}
								{if $post.id3.comments_html.bitrate neq 0 || $post.id3.audio.sample_rate neq 0}
									{if $post.id3.audio.bitrate neq 0}
										- {round($post.id3.audio.bitrate / 1000)} kbps
										{if $post.id3.audio.sample_rate neq 0}
											- 
										{/if}
									{/if}
									{if $post.id3.audio.sample_rate neq 0}
										{$post.id3.audio.sample_rate / 1000} kHz
									{/if}
								{/if}
								
								{if $post.image_w > 0 && $post.image_h > 0}
									, {$post.image_w}x{$post.image_h}
								{/if}
								{if $post.file_original neq '' && $post.file_original neq $post.file}
									, {$post.file_original}.{$post.file_type}
								{/if}
							){/strip}
							
							{if $post.id3.playtime_string neq ''}
								{t}Length{/t}: {$post.id3.playtime_string}
							{/if}
						{/if}
					</span>
				</div>
				
				{if $post.file eq 'removed'}
					<div class="post-file-link post-file-removed thread-hidden-hide float-left border border-light text-bold text-error-color text-center">
						<i class="icon icon-remove"></i> {t}File Removed{/t}
					</div>
				{elseif $post.videobox eq '' && $post.file neq '' && ( $post.file_type eq 'jpg' || $post.file_type eq 'gif' || $post.file_type eq 'png' )}
					<a class="post-file-link thread-hidden-hide float-left" href="{$file_path}/src/{$post.file}.{$post.file_type}" {if %KU_NEWWINDOW}target="_blank"{/if}>
						<img class="post-file-image" alt="{$post.file_original}.{$post.file_type}"
							width="{$post.thumb_w}" height="{$post.thumb_h}"
							data-thumb-res="[{$post.thumb_w},{$post.thumb_h}]" data-img-res="[{$post.image_w},{$post.image_h}]"
							data-thumb-src="{$file_path}/thumb/{$post.file}s.{$post.file_type}"
							data-img-src="{$file_path}/src/{$post.file}.{$post.file_type}"
							src="{$file_path}/thumb/{$post.file}s.{$post.file_type}"
						>
					</a>
				{elseif $post.videobox}
					<div class="post-file-link thread-hidden-hide float-left">
						{$post.videobox}
					</div>
				{elseif $post.nonstandard_file neq ''}
					<a 
					{if %KU_NEWWINDOW}
						target="_blank" 
					{/if}
					href="{$file_path}/src/{$post.file}.{$post.file_type}">
					<span id="thumb{$post.id}"><img src="{$post.nonstandard_file}" alt="{$post.id}" class="thumb" height="{$post.thumb_h}" width="{$post.thumb_w}" /></span>
					</a>
				{/if}
				
				<div class="post-general-info thread-hidden-show">
					<input type="checkbox" name="post[]" value="{$post.id}" class="thread-hidden-hide">
					
					{if $post.subject neq ''}
						<span class="post-subject text-bold">{$post.subject}</span>
					{/if}
					
					<a class="post-name text-bold 
						{if $post.email && $board.anonymous}
							" href="mailto:{$post.email}
						{else}
							post-name-no-email
						{/if}
					">
					
					{if $post.name eq '' && $post.tripcode eq ''}
						{$board.anonymous}
					{else}
						{$post.name}
					{/if}
					
					</a>
					
					{if $post.tripcode neq ''}
						<span class="post-tripcode">!{$post.tripcode}</span>
					{/if}
					
					{if $post.posterauthority eq 1}
						<span class="post-rank post-rank-admin">
							##&nbsp;{t}Admin{/t}&nbsp;##
						</span>
					{elseif $post.posterauthority eq 4}
						<span class="post-rank post-rank-mod">
							##&nbsp;{t}Super Mod{/t}&nbsp;##
						</span>
					{elseif $post.posterauthority eq 2}
						<span class="post-rank post-rank-mod">
							##&nbsp;{t}Mod{/t}&nbsp;##
						</span>
					{/if}
					
					<span class="post-timestamp" data-epoch="{$post.timestamp}">{$post.timestamp_formatted}</span>
					<span class="post-reference">{$post.reflink}</span>
					
					{if $board.showid}
						<span class="post-user-id thread-hidden-hide">ID:&nbsp;{$post.ipmd5|substr:0:6}</span>
					{/if}
					
					<span class="post-extra-controls post-clone-hide thread-hidden-hide">
						[
						{if $post.locked eq 1}
							<i class="icon icon-lock" title="{t}Locked{/t}"></i> /
						{/if}
						{if $post.stickied eq 1}
							<i class="icon icon-pushpin" title="{t}Stickied{/t}"></i> /
						{/if}
						
						{if $post.file neq '' && $post.file neq 'removed' && ( $post.file_type eq 'jpg' || $post.file_type eq 'gif' || $post.file_type eq 'png')}
							<span class="post-image-search">
								<a href="javascript:void(0)" class="post-image-search-trigger" title="Image search">
									<i class="icon icon-picture"></i>
								</a>
								<ul class="post-image-search-option list bg-dark" hidden>
									<li class="border border-light"><a href="http://www.google.com/searchbyimage?image_url={$file_path}/src/{$post.file}.{$post.file_type}">Google</a></li>
									<li class="border border-light"><a href="http://iqdb.org/?url={$file_path}/src/{$post.file}.{$post.file_type}">iqdb</a></li>
								</ul>
							</span> /
						{/if}
						
						<a href="javascript:void(0)" class="thread-toggle" title="{t}Hide thread{/t}" data-target="{$post.id}">
							<i class="icon icon-minus"></i>
						</a>
						]
					</span>
					
					<span class="post-clone-hide post-respond thread-hidden-hide">
						[<a href="{%KU_BOARDSFOLDER}{$board.name}/res/{if $post.parentid eq 0}{$post.id}{else}{$post.parentid}{/if}.html">{t}Reply{/t}</a>]
						
						{if %KU_FIRSTLAST && (($post.stickied eq 1 && $post.replies + %KU_REPLIESSTICKY > 50) || ($post.stickied eq 0 && $post.replies + %KU_REPLIES > 50))}
							{if (($post.stickied eq 1 && $post.replies + %KU_REPLIESSTICKY > 100) || ($post.stickied eq 0 && $post.replies + %KU_REPLIES > 100))}
								[<a href="{%KU_BOARDSFOLDER}{$board.name}/res/{if $post.parentid eq 0}{$post.id}{else}{$post.parentid}{/if}-100.html">{t}First 100 posts{/t}</a>]
							{/if}
							
							[<a href="{%KU_BOARDSFOLDER}{$board.name}/res/{$post.id}+50.html">{t}Last 50 posts{/t}</a>]
						{/if}
					</span>
					
					<span id="post-reference-backlinks-{$post.id}" class="post-reference-backlinks text-small post-clone-hide thread-hidden-hide"></span>
				</div>
			{*</div>*}
					
{*
			<span id="unhidethread{$post.id}{$board.name}" style="display: none;">
			{t}Thread{/t} <a href="{%KU_BOARDSFOLDER}{$board.name}/res/{$post.id}.html">{$post.id}</a> {t}hidden.{/t}
			<a href="#" onclick="javascript:togglethread('{$post.id}{$board.name}');return false;" title="{t}Un-Hide Thread{/t}">
				<img src="{$cwebpath}css/icons/blank.gif" border="0" class="unhidethread" alt="{t}Un-Hide Thread{/t}" />
			</a>
	</span>
	<div id="thread{$post.id}{$board.name}">
	<script type="text/javascript"><!--
		if (hiddenthreads.toString().indexOf('{$post.id}{$board.name}')!==-1) {
			document.getElementById('unhidethread{$post.id}{$board.name}').style.display = 'block';
			document.getElementById('thread{$post.id}{$board.name}').style.display = 'none';
		}
		//--></script>
			<a name="s{$.foreach.thread.iteration}"></a>
			
			{if ($post.file neq '' || $post.file_type neq '' ) && (($post.videobox eq '' && $post.file neq '') && $post.file neq 'removed')}
				<span class="filesize">
				{if $post.file_type eq 'mp3'}
					{t}Audio{/t}
				{else}
					{t}File{/t}
				{/if}
				{if $post.file_type neq 'jpg' && $post.file_type neq 'gif' && $post.file_type neq 'png' && $post.videobox eq ''}
					<a 
					{if %KU_NEWWINDOW}
						target="_blank" 
					{/if}
					href="{$file_path}/src/{$post.file}.{$post.file_type}">
				{else}
					<a href="{$file_path}/src/{$post.file}.{$post.file_type}" onclick="javascript:expandimg('{$post.id}', '{$file_path}/src/{$post.file}.{$post.file_type}', '{$file_path}/thumb/{$post.file}s.{$post.file_type}', '{$post.image_w}', '{$post.image_h}', '{$post.thumb_w}', '{$post.thumb_h}');return false;">
				{/if}
				{if isset($post.id3.comments_html)}
					{if $post.id3.comments_html.artist.0 neq ''}
					{$post.id3.comments_html.artist.0}
						{if $post.id3.comments_html.title.0 neq ''}
							- 
						{/if}
					{/if}
					{if $post.id3.comments_html.title.0 neq ''}
						{$post.id3.comments_html.title.0}
					{/if}
					</a>
				{else}
					{$post.file}.{$post.file_type}</a>
				{/if}
				- ({$post.file_size_formatted}
				{if $post.id3.comments_html.bitrate neq 0 || $post.id3.audio.sample_rate neq 0}
					{if $post.id3.audio.bitrate neq 0}
						- {round($post.id3.audio.bitrate / 1000)} kbps
						{if $post.id3.audio.sample_rate neq 0}
							- 
						{/if}
					{/if}
					{if $post.id3.audio.sample_rate neq 0}
						{$post.id3.audio.sample_rate / 1000} kHz
					{/if}
				{/if}
				{if $post.image_w > 0 && $post.image_h > 0}
					, {$post.image_w}x{$post.image_h}
				{/if}
				{if $post.file_original neq '' && $post.file_original neq $post.file}
					, {$post.file_original}.{$post.file_type}
				{/if}
				)
				{if $post.id3.playtime_string neq ''}
					{t}Length{/t}: {$post.id3.playtime_string}
				{/if}
				</span>
				{if %KU_THUMBMSG}
					<span class="thumbnailmsg"> 
					{if $post.file_type neq 'jpg' && $post.file_type neq 'gif' && $post.file_type neq 'png' && $post.videobox eq ''}
						{t}Extension icon displayed, click image to open file.{/t}
					{else}
						{t}Thumbnail displayed, click image for full size.{/t}
					{/if}
					</span>
				{/if}
				<br />
			{/if}
			{if $post.videobox eq '' && $post.file neq '' && ( $post.file_type eq 'jpg' || $post.file_type eq 'gif' || $post.file_type eq 'png')}
				{if $post.file eq 'removed'}
					<div class="nothumb">
						{t}File<br />Removed{/t}
					</div>
				{else}
					<a 
					{if %KU_NEWWINDOW}
						target="_blank" 
					{/if}
					href="{$file_path}/src/{$post.file}.{$post.file_type}">
					<span id="thumb{$post.id}"><img src="{$file_path}/thumb/{$post.file}s.{$post.file_type}" alt="{$post.id}" class="thumb" height="{$post.thumb_h}" width="{$post.thumb_w}" /></span>
					</a>
				{/if}
			{elseif $post.nonstandard_file neq ''}
				{if $post.file eq 'removed'}
					<div class="nothumb">
						{t}File<br />Removed{/t}
					</div>
				{else}
					<a 
					{if %KU_NEWWINDOW}
						target="_blank" 
					{/if}
					href="{$file_path}/src/{$post.file}.{$post.file_type}">
					<span id="thumb{$post.id}"><img src="{$post.nonstandard_file}" alt="{$post.id}" class="thumb" height="{$post.thumb_h}" width="{$post.thumb_w}" /></span>
					</a>
				{/if}
			{/if}
			<a name="{$post.id}"></a>
			<label>
			<input type="checkbox" name="post[]" value="{$post.id}" />
			{if $post.subject neq ''}
				<span class="filetitle">
					{$post.subject}
				</span>
			{/if}
			{strip}
				<span class="postername">
				
				{if $post.email && $board.anonymous}
					<a href="mailto:{$post.email}">
				{/if}
				{if $post.name eq '' && $post.tripcode eq ''}
					{$board.anonymous}
				{elseif $post.name eq '' && $post.tripcode neq ''}
				{else}
					{$post.name}
				{/if}
				{if $post.email neq '' && $board.anonymous neq ''}
					</a>
				{/if}

				</span>

				{if $post.tripcode neq ''}
					<span class="postertrip">!{$post.tripcode}</span>
				{/if}
			{/strip}
			{if $post.posterauthority eq 1}
				<span class="admin">
					&#35;&#35;&nbsp;{t}Admin{/t}&nbsp;&#35;&#35;
				</span>
			{elseif $post.posterauthority eq 4}
				<span class="mod">
					&#35;&#35;&nbsp;{t}Super Mod{/t}&nbsp;&#35;&#35;
				</span>
			{elseif $post.posterauthority eq 2}
				<span class="mod">
					&#35;&#35;&nbsp;{t}Mod{/t}&nbsp;&#35;&#35;
				</span>
			{/if}
			{$post.timestamp_formatted}
			</label>
			<span class="reflink">
				{$post.reflink}
			</span>
			{if $board.showid}
				ID: {$post.ipmd5|substr:0:6}
			{/if}
			<span class="extrabtns">
			{if $post.locked eq 1}
				<img style="border: 0;" src="{$boardpath}css/locked.gif" alt="{t}Locked{/t}" />
			{/if}
			{if $post.stickied eq 1}
				<img style="border: 0;" src="{$boardpath}css/sticky.gif" alt="{t}Stickied{/t}" />
			{/if}
			<span id="hide{$post.id}"><a href="#" onclick="javascript:togglethread('{if $post.parentid eq 0}{$post.id}{else}{$post.parentid}{/if}{$board.name}');return false;" title="Hide Thread"><img src="{$boardpath}css/icons/blank.gif" border="0" class="hidethread" alt="hide" /></a></span>
			{if %KU_WATCHTHREADS}
				<a href="#" onclick="javascript:addtowatchedthreads('{if $post.parentid eq 0}{$post.id}{else}{$post.parentid}{/if}','{$board.name}');return false;" title="Watch Thread"><img src="{$boardpath}css/icons/blank.gif" border="0" class="watchthread" alt="watch" /></a>
			{/if}
			{if %KU_EXPAND && $post.replies && ($post.replies + %KU_REPLIES) < 300}
				<a href="#" onclick="javascript:expandthread('{if $post.parentid eq 0}{$post.id}{else}{$post.parentid}{/if}','{$board.name}');return false;" title="Expand Thread"><img src="{$boardpath}css/icons/blank.gif" border="0" class="expandthread" alt="expand" /></a>
			{/if}
			{if %KU_QUICKREPLY}
				<a href="#postbox" onclick="javascript:quickreply('{if $post.parentid eq 0}{$post.id}{else}{$post.parentid}{/if}');" title="{t}Quick Reply{/t}"><img src="{$boardpath}css/icons/blank.gif" border="0" class="quickreply" alt="quickreply" /></a>
			{/if}
			</span>
			<span id="dnb-{$board.name}-{$post.id}-y"></span>
			[<a href="{%KU_BOARDSFOLDER}{$board.name}/res/{if $post.parentid eq 0}{$post.id}{else}{$post.parentid}{/if}.html">{t}Reply{/t}</a>]
			{if %KU_FIRSTLAST && (($post.stickied eq 1 && $post.replies + %KU_REPLIESSTICKY > 50) || ($post.stickied eq 0 && $post.replies + %KU_REPLIES > 50))}
				{if (($post.stickied eq 1 && $post.replies + %KU_REPLIESSTICKY > 100) || ($post.stickied eq 0 && $post.replies + %KU_REPLIES > 100))}
					[<a href="{%KU_BOARDSFOLDER}{$board.name}/res/{if $post.parentid eq 0}{$post.id}{else}{$post.parentid}{/if}-100.html">{t}First 100 posts{/t}</a>]
				{/if}
				[<a href="{%KU_BOARDSFOLDER}{$board.name}/res/{$post.id}+50.html">{t}Last 50 posts{/t}</a>]
			{/if}
			<br />
*}
		{else}
			<div class="post-wrapper boxed">
				<div class="post-arrow">>></div>
				
				<div id="p{$post.id}" class="post-content bg-dark boxed float-left">
					<div class="post-general-info">
						<input type="checkbox" name="post[]" value="{$post.id}">
						
						{if $post.subject neq ''}
							<span class="post-subject text-bold">{$post.subject}</span>
						{/if}
						
						<a class="post-name text-bold 
							{if $post.email && $board.anonymous}
								" href="mailto:{$post.email}
							{else}
								post-name-no-email
							{/if}
						">
						
						{if $post.name eq '' && $post.tripcode eq ''}
							{$board.anonymous}
						{else}
							{$post.name}
						{/if}
						
						</a>
						
						{if $post.tripcode neq ''}
							<span class="post-tripcode">!{$post.tripcode}</span>
						{/if}
						
						{if $post.posterauthority eq 1}
							<span class="post-rank post-rank-admin">
								##&nbsp;{t}Admin{/t}&nbsp;##
							</span>
						{elseif $post.posterauthority eq 4}
							<span class="post-rank post-rank-mod">
								##&nbsp;{t}Super Mod{/t}&nbsp;##
							</span>
						{elseif $post.posterauthority eq 2}
							<span class="post-rank post-rank-mod">
								##&nbsp;{t}Mod{/t}&nbsp;##
							</span>
						{/if}
						
						<span class="post-timestamp" data-epoch="{$post.timestamp}">{$post.timestamp_formatted}</span>
						<span class="post-reference">{$post.reflink}</span>
						
						{if $board.showid}
							<span class="post-user-id">ID:&nbsp;{$post.ipmd5|substr:0:6}</span>
						{/if}
						
						{if $post.file neq '' && $post.file neq 'removed' && ( $post.file_type eq 'jpg' || $post.file_type eq 'gif' || $post.file_type eq 'png')}
							<span class="post-extra-controls post-clone-hide">
								[ <div class="post-image-search">
									<a href="javascript:void(0)" class="post-image-search-trigger" title="Image search">
										<i class="icon icon-picture"></i>
									</a>
									<ul class="post-image-search-option list bg-dark" hidden>
										<li class="border border-light"><a href="http://www.google.com/searchbyimage?image_url={$file_path}/src/{$post.file}.{$post.file_type}">Google</a></li>
										<li class="border border-light"><a href="http://iqdb.org/?url={$file_path}/src/{$post.file}.{$post.file_type}">iqdb</a></li>
									</ul>
								</div> ]
							</span>
						{/if}
						
						<span id="post-reference-backlinks-{$post.id}" class="post-reference-backlinks text-small post-clone-hide thread-hidden-hide"></span>
					</div>
					
					<div class="post-file-info">
						{if $post.videobox}
							YouTube: <a target="_blank" href="https://www.youtube.com/watch?v={$post.file}">{$post.file}</a>
							[<a class="youtube-resize youtube-resize-reset" href="javascript:void(0)" data-target="{$post.id}" data-res="[{%KU_YOUTUBEWIDTH},{%KU_YOUTUBEHEIGHT}]">Reset</a>]
							[<a class="youtube-resize" href="javascript:void(0)" data-target="{$post.id}" data-res="[1280,720]">720p</a>]
							[<a class="youtube-resize" href="javascript:void(0)" data-target="{$post.id}" data-res="[1920,1080]">1080p</a>]
						{elseif ($post.file neq '' || $post.file_type neq '' ) && (($post.videobox eq '' && $post.file neq '') && $post.file neq 'removed')}
							{if $post.file_type eq 'mp3'}
								{t}Audio{/t}:
							{else}
								{t}File{/t}:
							{/if}
							
							<a {if $post.file_type neq 'jpg' && $post.file_type neq 'gif' && $post.file_type neq 'png' && $post.videobox eq '' && %KU_NEWWINDOW}target="_blank"{/if} href="{$file_path}/src/{$post.file}.{$post.file_type}">
								{if isset($post.id3.comments_html)}
									{if $post.id3.comments_html.artist.0 neq ''}
										{$post.id3.comments_html.artist.0}
										{if $post.id3.comments_html.title.0 neq ''}
											- 
										{/if}
									{/if}
									{if $post.id3.comments_html.title.0 neq ''}
										{$post.id3.comments_html.title.0}
									{/if}
								{else}
									{$post.file}.{$post.file_type}
								{/if}
							</a>
							
							{strip}(
								{$post.file_size_formatted}
								{if $post.id3.comments_html.bitrate neq 0 || $post.id3.audio.sample_rate neq 0}
									{if $post.id3.audio.bitrate neq 0}
										- {round($post.id3.audio.bitrate / 1000)} kbps
										{if $post.id3.audio.sample_rate neq 0}
											- 
										{/if}
									{/if}
									{if $post.id3.audio.sample_rate neq 0}
										{$post.id3.audio.sample_rate / 1000} kHz
									{/if}
								{/if}
								
								{if $post.image_w > 0 && $post.image_h > 0}
									, {$post.image_w}x{$post.image_h}
								{/if}
								{if $post.file_original neq '' && $post.file_original neq $post.file}
									, {$post.file_original}.{$post.file_type}
								{/if}
							){/strip}
							
							{if $post.id3.playtime_string neq ''}
								{t}Length{/t}: {$post.id3.playtime_string}
							{/if}
						{/if}
					</div>
					
					<div class="post-content-wrapper">
						<div class="post-content-file">
							{if $post.file eq 'removed'}
								<div class="post-file-link post-file-removed border border-light text-bold text-error-color text-center">
									<i class="icon icon-remove"></i> {t}File Removed{/t}
								</div>
							{elseif $post.videobox eq '' && $post.file neq '' && ( $post.file_type eq 'jpg' || $post.file_type eq 'gif' || $post.file_type eq 'png')}
								<a class="post-file-link" href="{$file_path}/src/{$post.file}.{$post.file_type}" {if %KU_NEWWINDOW}target="_blank"{/if}>
									<img class="post-file-image" alt="{$post.file_original}.{$post.file_type}"
										width="{$post.thumb_w}" height="{$post.thumb_h}"
										data-thumb-res="[{$post.thumb_w},{$post.thumb_h}]" data-img-res="[{$post.image_w},{$post.image_h}]"
										data-thumb-src="{$file_path}/thumb/{$post.file}s.{$post.file_type}"
										data-img-src="{$file_path}/src/{$post.file}.{$post.file_type}"
										src="{$file_path}/thumb/{$post.file}s.{$post.file_type}"
									>
								</a>
							{elseif $post.videobox}
								<div class="post-file-link">
									{$post.videobox}
								</div>
							{elseif $post.nonstandard_file neq ''}
								<a 
								{if %KU_NEWWINDOW}
									target="_blank" 
								{/if}
								href="{$file_path}/src/{$post.file}.{$post.file_type}">
								<span id="thumb{$post.id}"><img src="{$post.nonstandard_file}" alt="{$post.id}" class="thumb" height="{$post.thumb_h}" width="{$post.thumb_w}" /></span>
								</a>
							{/if}
						</div>
						
						<div class="post-content-text">
			{*			</div>
					</div>
				</div>
			</div>
			*}
			
{*
			<table>
				<tbody>
				<tr>
					<td class="doubledash">
						&gt;&gt;
					</td>
					<td class="reply" id="reply{$post.id}">
						<a name="{$post.id}"></a>
						<label>
						<input type="checkbox" name="post[]" value="{$post.id}" />
						
						
						{if $post.subject neq ''}
							<span class="filetitle">
								{$post.subject}
							</span>
						{/if}
						{strip}
								<span class="postername">
								
								{if $post.email && $board.anonymous}
									<a href="mailto:{$post.email}">
								{/if}
								{if $post.name eq '' && $post.tripcode eq ''}
									{$board.anonymous}
								{elseif $post.name eq '' && $post.tripcode neq ''}
								{else}
									{$post.name}
								{/if}
								{if $post.email neq '' && $board.anonymous neq ''}
									</a>
								{/if}

								</span>

							{if $post.tripcode neq ''}
								<span class="postertrip">!{$post.tripcode}</span>
							{/if}
						{/strip}
						{if $post.posterauthority eq 1}
							<span class="admin">
								&#35;&#35;&nbsp;{t}Admin{/t}&nbsp;&#35;&#35;
							</span>
						{elseif $post.posterauthority eq 4}
							<span class="mod">
								&#35;&#35;&nbsp;{t}Super Mod{/t}&nbsp;&#35;&#35;
							</span>
						{elseif $post.posterauthority eq 2}
							<span class="mod">
								&#35;&#35;&nbsp;{t}Mod{/t}&nbsp;&#35;&#35;
							</span>
						{/if}

						{$post.timestamp_formatted}
						</label>

						<span class="reflink">
							{$post.reflink}
						</span>
						{if $board.showid}
							ID: {$post.ipmd5|substr:0:6}
						{/if}
						<span class="extrabtns">
						{if $post.locked eq 1}
							<img style="border: 0;" src="{$boardpath}css/locked.gif" alt="{t}Locked{/t}" />
						{/if}
						{if $post.stickied eq 1}
							<img style="border: 0;" src="{$boardpath}css/sticky.gif" alt="{t}Stickied{/t}" />
						{/if}
						</span>
						<span id="dnb-{$board.name}-{$post.id}-n"></span>
						{if ($post.file neq '' || $post.file_type neq '' ) && (( $post.videobox eq '' && $post.file neq '') && $post.file neq 'removed')}
							<br /><span class="filesize">
							{if $post.file_type eq 'mp3'}
								{t}Audio{/t}
							{else}
								{t}File{/t}
							{/if}
							{if $post.file_type neq 'jpg' && $post.file_type neq 'gif' && $post.file_type neq 'png' && $post.videobox eq ''}
								<a 
								{if %KU_NEWWINDOW}
									target="_blank" 
								{/if}
								href="{$file_path}/src/{$post.file}.{$post.file_type}">
							{else}
								<a href="{$file_path}/src/{$post.file}.{$post.file_type}" onclick="javascript:expandimg('{$post.id}', '{$file_path}/src/{$post.file}.{$post.file_type}', '{$file_path}/thumb/{$post.file}s.{$post.file_type}', '{$post.image_w}', '{$post.image_h}', '{$post.thumb_w}', '{$post.thumb_h}');return false;">
							{/if}
							{if isset($post.id3.comments_html)}
								{if $post.id3.comments_html.artist.0 neq ''}
								{$post.id3.comments_html.artist.0}
									{if $post.id3.comments_html.title.0 neq ''}
										- 
									{/if}
								{/if}
								{if $post.id3.comments_html.title.0 neq ''}
									{$post.id3.comments_html.title.0}
								{/if}
								</a>
							{else}
								{$post.file}.{$post.file_type}</a>
							{/if}
							- ({$post.file_size_formatted}
							{if $post.id3.comments_html.bitrate neq 0 || $post.id3.audio.sample_rate neq 0}
								{if $post.id3.audio.bitrate neq 0}
									- {round($post.id3.audio.bitrate / 1000)} kbps
									{if $post.id3.audio.sample_rate neq 0}
										- 
									{/if}
								{/if}
								{if $post.id3.audio.sample_rate neq 0}
									{$post.id3.audio.sample_rate / 1000} kHz
								{/if}
							{/if}
							{if $post.image_w > 0 && $post.image_h > 0}
								, {$post.image_w}x{$post.image_h}
							{/if}
							{if $post.file_original neq '' && $post.file_original neq $post.file}
								, {$post.file_original}.{$post.file_type}
							{/if}
							)
							{if $post.id3.playtime_string neq ''}
								{t}Length{/t}: {$post.id3.playtime_string}
							{/if}
							</span>
							{if %KU_THUMBMSG}
								<span class="thumbnailmsg"> 
								{if $post.file_type neq 'jpg' && $post.file_type neq 'gif' && $post.file_type neq 'png' && $post.videobox eq ''}
									{t}Extension icon displayed, click image to open file.{/t}
								{else}
									{t}Thumbnail displayed, click image for full size.{/t}
								{/if}
								</span>
							{/if}

						{/if}
						{if $post.videobox eq '' && $post.file neq '' && ( $post.file_type eq 'jpg' || $post.file_type eq 'gif' || $post.file_type eq 'png')}
							<br />
							{if $post.file eq 'removed'}
								<div class="nothumb">
									{t}File<br />Removed{/t}
								</div>
							{else}
								<a 
								{if %KU_NEWWINDOW}
									target="_blank" 
								{/if}
								href="{$file_path}/src/{$post.file}.{$post.file_type}">
								<span id="thumb{$post.id}"><img src="{$file_path}/thumb/{$post.file}s.{$post.file_type}" alt="{$post.id}" class="thumb" height="{$post.thumb_h}" width="{$post.thumb_w}" /></span>
								</a>
							{/if}
						{elseif $post.nonstandard_file neq ''}
							<br />
							{if $post.file eq 'removed'}
								<div class="nothumb">
									{t}File<br />Removed{/t}
								</div>
							{else}
								<a 
								{if %KU_NEWWINDOW}
									target="_blank" 
								{/if}
								href="{$file_path}/src/{$post.file}.{$post.file_type}">
								<span id="thumb{$post.id}"><img src="{$post.nonstandard_file}" alt="{$post.id}" class="thumb" height="{$post.thumb_h}" width="{$post.thumb_w}" /></span>
								</a>
							{/if}
						{/if}
*}
		{/if}
		
		{*
		{if $post.file_type eq 'mp3'}
			<!--[if !IE]> -->
			<object type="application/x-shockwave-flash" data="{%KU_WEBPATH}/inc/player/player.swf?playerID={$post.id}&amp;soundFile={$file_path}/src/{$post.file|utf8_encode|urlencode}.mp3{if $post.id3.comments_html.artist.0 neq ''}&amp;artists={$post.id3.comments_html.artist.0}{/if}{if $post.id3.comments_html.title.0 neq ''}&amp;titles={$post.id3.comments_html.title.0|html_entity_decode|utf8_encode|urlencode}{/if}&amp;wmode=transparent" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,22,87" width="290" height="24">
			<param name="wmode" value="transparent" />
			<!-- <![endif]-->
			<!--[if IE]>
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,22,87" width="290" height="24">
				<param name="movie" value="{%KU_WEBPATH}/inc/player/player.swf?playerID={$post.id}&amp;soundFile={$file_path}/src/{$post.file|utf8_encode|urlencode}.mp3{if $post.id3.comments_html.artist.0 neq ''}&amp;artists={$post.id3.comments_html.artist.0}{/if}{if $post.id3.comments_html.title.0 neq ''}&amp;titles={$post.id3.comments_html.title.0|html_entity_decode|utf8_encode|urlencode}{/if}&amp;wmode=transparent" />
				<param name="wmode" value="transparent" />
			<!-->
			</object>
			<!-- <![endif]-->
		{/if}
		*}
		
		<blockquote data-post-id="{$post.id}" data-parent-id="{$post.parentid}" class="thread-hidden-hide">
			{$post.message}
		</blockquote>
		
		{if $post.parentid eq 0}
			{if not $post.stickied && (($board.maxage > 0 && ($post.timestamp + ($board.maxage * 3600)) < (time() + 7200 ) ) || ($post.deleted_timestamp > 0 && $post.deleted_timestamp <= (time() + 7200)))}
				<div class="thread-deletion text-bold text-error-color">
					{t}Thread is marked for deletion{/t}
				</div>
			{/if}
			
			<div class="thread-hidden-hide">
			{if $post.replies}
				<div class="thread-summary">
					{$post.replies} post(s)
					
					{if $post.images > 0}
						{t}and{/t} {$post.images} image(s)	
					{/if}
					
					{t}omitted{/t}. {t}Click Reply to view.{/t}
				</div>
			{/if}
		{else}
		
						</div>
					</div>
				</div>
			</div>
		
		{/if}
	{/foreach}
			</div>
		</div>
		
		<hr class="border border-light">
{/foreach}
