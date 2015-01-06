<?php
if (function_exists('smarty_block_t')===false)
	$this->getLoader()->loadPlugin('t');
ob_start(); /* template body */ ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title><?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Manage Boards<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?></title>
<!--<link rel="stylesheet" type="text/css" href="<?php echo $this->scope["ku_boardspath"];?>/css/manage.css" title="Manage">-->
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
<?php 
/* -- loop end output */
		$this->setScope($_loop0_scope, true);
	}
}
?>

<style type="text/css">
body, div, td, th, h2, h3, h4 { /* redundant rules for bad browsers */ 
	font-family: verdana,sans-serif;
	font-size:	x-small;
	voice-family: "\"}\"";
	voice-family: inherit;
	font-size: small;
} 
h1,h2 {
	font-family: trebuchet ms;
	font-weight: bold;
	color: #333;
}

h1 {
	font-size: 180%;
	margin: 0;
}

h2 {
	font-size: 140%;
	padding-bottom: 2px;
	border-bottom: 1px solid #CCC;
	margin: 0;
}
br {
	clear: left;
}

label,input {
	display: block;
	width: auto;
	float: left;
	margin-bottom: 10px;
}

label {
	font-size: 12px;
	text-align: right;
	width: 175px;
	padding-right: 20px;
}

.desc {
	text-indent: 5px;
	font-size : 80%;
	/*white-space: nowrap;*/
}
</style>
<link rel="shortcut icon" href="<?php echo KU_WEBPATH;?>/favicon.ico" />
</head>
<body style="min-width: 600px; padding: 1em 20px 3em 20px;">
<?php echo $this->scope["includeheader"];?>

<div id="main">
	<div id="contents">
		<?php echo $this->scope["page"];?>

	</div>
</div>	
<?php echo $this->scope["footer"];?>

</body>
</html><?php  /* end template body */
return $this->buffer . ob_get_clean();
?>