<input type="hidden" id="youtube-res" value="[{%KU_YOUTUBEWIDTH},{%KU_YOUTUBEHEIGHT}]">
<input type="hidden" id="board-id" value="{$board.id}">

<form id="thread-master-form" action="{%KU_CGIPATH}/board.php" method="post">
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
									<li class="border border-light">
										<a target="_blank" href="http://www.google.com/searchbyimage?image_url={$file_path}/src/{$post.file}.{$post.file_type}">Google</a>
									</li>
									<li class="border border-light">
										<a target="_blank" href="http://iqdb.org/?url={$file_path}/src/{$post.file}.{$post.file_type}">iqdb</a>
									</li>
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
										<li class="border border-light">
											<a target="_blank" href="http://www.google.com/searchbyimage?image_url={$file_path}/src/{$post.file}.{$post.file_type}">Google</a>
										</li>
										<li class="border border-light">
											<a target="_blank" href="http://iqdb.org/?url={$file_path}/src/{$post.file}.{$post.file_type}">iqdb</a>
										</li>
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
