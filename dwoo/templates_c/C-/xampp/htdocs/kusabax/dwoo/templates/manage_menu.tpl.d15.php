<?php
if (function_exists('smarty_block_t')===false)
	$this->getLoader()->loadPlugin('t');
ob_start(); /* template body */ ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Manage Boards<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?></title>
<?php 
$_loop0_data = (isset($this->scope["styles"]) ? $this->scope["styles"] : null);
if ($this->isArray($_loop0_data) === true)
{
	foreach ($_loop0_data as $tmp_key => $this->scope["-loop-"])
	{
		$_loop0_scope = $this->setScope(array("-loop-"));
/* -- loop start output */
?>
	<link rel="<?php if ($this->scope != (defined("KU_DEFAULTSTYLE") ? KU_DEFAULTSTYLE : null)) {
?>alternate <?php 
}?>stylesheet" type="text/css" href="<?php echo KU_WEBPATH;?>/css/site_<?php echo $this->scope;?>.css" />
	<link rel="<?php if ($this->scope != (defined("KU_DEFAULTSTYLE") ? KU_DEFAULTSTYLE : null)) {
?>alternate <?php 
}?>stylesheet" type="text/css" href="<?php echo KU_WEBPATH;?>/css/sitemenu_<?php echo $this->scope;?>.css" />
<?php 
/* -- loop end output */
		$this->setScope($_loop0_scope, true);
	}
}
?>

<link rel="shortcut icon" href="<?php echo KU_WEBPATH;?>/favicon.ico" />

<script type="text/javascript">
function toggle(button, area) {
	var tog=document.getElementById(area);
	if(tog.style.display)	{
		tog.style.display="";
	} else {
		tog.style.display="none";
	}
	button.innerHTML=(tog.style.display)?'+':'&minus;';
	createCookie('nav_show_'+area, tog.style.display?'0':'1', 365);
}
</script>

<base target="manage_main" />
</head>
<body>
<h1><?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Manage Boards<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?></h1>
<ul>
	<?php echo $this->scope["links"];?>

</ul>
</body>
</html><?php  /* end template body */
return $this->buffer . ob_get_clean();
?>