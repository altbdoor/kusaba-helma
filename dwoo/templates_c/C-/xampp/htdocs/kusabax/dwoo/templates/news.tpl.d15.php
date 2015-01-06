<?php
if (function_exists('Dwoo_Plugin_capitalize')===false)
	$this->getLoader()->loadPlugin('capitalize');
if (function_exists('smarty_block_t')===false)
	$this->getLoader()->loadPlugin('t');
if (function_exists('Dwoo_Plugin_date_format')===false)
	$this->getLoader()->loadPlugin('date_format');
ob_start(); /* template body */ ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
<head>
	<title><?php echo KU_NAME;?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<?php 
$_for0_from = (isset($this->scope["styles"]) ? $this->scope["styles"] : null);
$_for0_to = null;
$_for0_step = abs(1);
if (is_numeric($_for0_from) && !is_numeric($_for0_to)) { $this->triggerError('For requires the <em>to</em> parameter when using a numerical <em>from</em>'); }
$tmp_shows = $this->isArray($_for0_from, true) || (is_numeric($_for0_from) && (abs(($_for0_from - $_for0_to)/$_for0_step) !== 0 || $_for0_from == $_for0_to));
if ($tmp_shows)
{
	if ($this->isArray($_for0_from, true)) {
		$_for0_to = is_numeric($_for0_to) ? $_for0_to - $_for0_step : count($_for0_from) - 1;
		$_for0_from = 0;
	}
	if ($_for0_from > $_for0_to) {
		$tmp = $_for0_from;
		$_for0_from = $_for0_to;
		$_for0_to = $tmp;
	}
	for ($this->scope['style'] = $_for0_from; $this->scope['style'] <= $_for0_to; $this->scope['style'] += $_for0_step)
	{
/* -- for start output */
?>
				<link rel="<?php if ($this->readVar("styles.".(isset($this->scope["style"]) ? $this->scope["style"] : null)) != (defined("KU_DEFAULTMENUSTYLE") ? KU_DEFAULTMENUSTYLE : null)) {
?>alternate <?php 
}?>stylesheet" type="text/css" href="<?php echo KU_WEBFOLDER;?>css/site_<?php echo $this->readVar("styles.".(isset($this->scope["style"]) ? $this->scope["style"] : null));?>.css" title="<?php echo Dwoo_Plugin_capitalize($this, $this->readVar("styles.".(isset($this->scope["style"]) ? $this->scope["style"] : null)), false);?>" />
	<?php /* -- for end output */
	}
}
?>

<script type="text/javascript"><!--
	var style_cookie_site = "kustyle_site";
//--></script>
<link rel="shortcut icon" href="<?php echo KU_WEBFOLDER;?>favicon.ico" />
<script type="text/javascript" src="<?php echo KU_WEBFOLDER;?>lib/javascript/gettext.js"></script>
<script type="text/javascript" src="<?php echo KU_WEBFOLDER;?>lib/javascript/kusaba.js"></script></head>
<body>
	<h1><?php echo KU_NAME;?></h1>
	<?php if ((defined("KU_SLOGAN") ? KU_SLOGAN : null) != '') {
?><h3><?php echo KU_SLOGAN;?></h3><?php 
}?>

	
	<div class="menu" id="topmenu">
		<?php echo $this->scope["topads"];?>

		<ul><li class="<?php if ((isset($_GET['p'])?$_GET['p']:null) == '') {?>current <?php }
else {?>tab <?php }?>first"><?php if ((isset($_GET['p'])?$_GET['p']:null) != '') {?><a href="<?php echo $this->scope["ku_webpath"];?>news.php"><?php }
if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>News<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);
if ((isset($_GET['p'])?$_GET['p']:null) != '') {?></a><?php }?></li><li class="<?php if ((isset($_GET['p'])?$_GET['p']:null) == 'faq') {?>current<?php }
else {?>tab<?php }?>"><?php if ((isset($_GET['p'])?$_GET['p']:null) != 'faq') {?><a href="<?php echo $this->scope["ku_webpath"];?>news.php?p=faq"><?php }
if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>FAQ<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);
if ((isset($_GET['p'])?$_GET['p']:null) != 'faq') {?></a><?php }?></li><li class="<?php if ((isset($_GET['p'])?$_GET['p']:null) == 'rules') {?>current<?php }
else {?>tab<?php }?>"><?php if ((isset($_GET['p'])?$_GET['p']:null) != 'rules') {?><a href="<?php echo $this->scope["ku_webpath"];?>news.php?p=rules"><?php }
if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Rules<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);
if ((isset($_GET['p'])?$_GET['p']:null) != 'rules') {?></a><?php }?></li></ul>
		<br />
	</div>
<?php 
$_fh0_data = (isset($this->scope["entries"]) ? $this->scope["entries"] : null);
if ($this->isArray($_fh0_data) === true)
{
	foreach ($_fh0_data as $this->scope['entry'])
	{
/* -- foreach start output */
?>
	<div class="content">
		<h2><span class="newssub"><?php echo stripslashes((isset($this->scope["entry"]["subject"]) ? $this->scope["entry"]["subject"]:null));
if ((isset($_GET['p'])?$_GET['p']:null) == '') {
?> by <?php if ((isset($this->scope["entry"]["email"]) ? $this->scope["entry"]["email"]:null) != '') {
?><a href="mailto:<?php echo stripslashes((isset($this->scope["entry"]["email"]) ? $this->scope["entry"]["email"]:null));?>"><?php 
}
echo stripslashes((isset($this->scope["entry"]["poster"]) ? $this->scope["entry"]["poster"]:null));
if ((isset($this->scope["entry"]["email"]) ? $this->scope["entry"]["email"]:null) != '') {
?></a><?php 
}?> - <?php echo Dwoo_Plugin_date_format($this, (isset($this->scope["entry"]["timestamp"]) ? $this->scope["entry"]["timestamp"]:null), "%D @ %I:%M %p %Z", null);

}?></span>
		<span class="permalink"><a href="#<?php echo $this->scope["entry"]["id"];?>">#</a></span></h2>
		<?php echo stripslashes((isset($this->scope["entry"]["message"]) ? $this->scope["entry"]["message"]:null));?>

	</div><br />
<?php 
/* -- foreach end output */
	}
}?>

	<?php echo $this->scope["botads"];?>

</body>
</html><?php  /* end template body */
return $this->buffer . ob_get_clean();
?>