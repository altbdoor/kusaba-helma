<?php
if (function_exists('Dwoo_Plugin_capitalize')===false)
	$this->getLoader()->loadPlugin('capitalize');
if (function_exists('smarty_block_t')===false)
	$this->getLoader()->loadPlugin('t');
ob_start(); /* template body */ ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><?php echo KU_NAME;?> Navigation</title>
<?php if ((defined("KU_MENUTYPE") ? KU_MENUTYPE : null) == 'normal') {
?>
	<link rel="stylesheet" type="text/css" href="<?php echo $this->scope["boardpath"];?>css/menu_global.css" />
	<?php 
$_loop0_data = (isset($this->scope["styles"]) ? $this->scope["styles"] : null);
$this->globals["loop"]['default'] = array
(
	"iteration"		=> 1,
	"last"		=> null,
	"total"		=> $this->isArray($_loop0_data) ? count($_loop0_data) : 0,
);
$_loop0_glob =& $this->globals["loop"]['default'];
if ($this->isArray($_loop0_data) === true)
{
	foreach ($_loop0_data as $tmp_key => $this->scope["-loop-"])
	{
		$_loop0_glob["last"] = (string) ($_loop0_glob["iteration"] === $_loop0_glob["total"]);
		$_loop0_scope = $this->setScope(array("-loop-"));
/* -- loop start output */
?>
			<link rel="<?php if ($this->scope != (defined("KU_DEFAULTMENUSTYLE") ? KU_DEFAULTMENUSTYLE : null)) {
?>alternate <?php 
}?>stylesheet" type="text/css" href="<?php echo KU_WEBFOLDER;?>css/site_<?php echo $this->scope;?>.css" title="<?php echo Dwoo_Plugin_capitalize($this, $this->scope, false);?>" />
			<link rel="<?php if ($this->scope != (defined("KU_DEFAULTMENUSTYLE") ? KU_DEFAULTMENUSTYLE : null)) {
?>alternate <?php 
}?>stylesheet" type="text/css" href="<?php echo KU_WEBFOLDER;?>css/sitemenu_<?php echo $this->scope;?>.css" title="<?php echo Dwoo_Plugin_capitalize($this, $this->scope, false);?>" />
	<?php 
/* -- loop end output */
		$this->setScope($_loop0_scope, true);
		$_loop0_glob["iteration"]+=1;
	}
}
?>

<?php 
}
else {
?>
	<style type="text/css">body { margin: 0px; } h1 { font-size: 1.25em; } h2 { font-size: 0.8em; font-weight: bold; color: #CC3300; } ul { list-style-type: none; padding: 0px; margin: 0px; } li { font-size: 0.8em; padding: 0px; margin: 0px; }</style>
<?php 
}?>


<script type="text/javascript"><!--
			var style_cookie_site = "kustyle_site";
		//--></script>
<link rel="shortcut icon" href="<?php echo KU_WEBFOLDER;?>favicon.ico" />
<script type="text/javascript" src="<?php echo KU_WEBFOLDER;?>lib/javascript/gettext.js"></script>
<script type="text/javascript" src="<?php echo KU_WEBFOLDER;?>lib/javascript/menu.js"></script>
<script type="text/javascript" src="<?php echo KU_WEBFOLDER;?>lib/javascript/kusaba.js"></script>
<script type="text/javascript"><!--

<?php if ((isset($this->scope["showdirs"]) ? $this->scope["showdirs"] : null) == 0 && (isset($this->scope["files"]["0"]) ? $this->scope["files"]["0"]:null) != (isset($this->scope["files"]["1"]) ? $this->scope["files"]["1"]:null)) {
?>
	if (getCookie(tcshowdirs) == yes) {
		window.location = '<?php echo KU_BOARDSPATH;?>/<?php echo $this->scope["files"]["1"];?>';
	}
<?php 
}?>


function showstyleswitcher() {
		var switcher = document.getElementById('sitestyles');
		switcher.innerHTML = '<?php if ((defined("KU_MENUSTYLESWITCHER") ? KU_MENUSTYLESWITCHER : null) && (defined("KU_MENUTYPE") ? KU_MENUTYPE : null) == 'normal') {
if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Styles<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?>:<?php $_loop1_data = (isset($this->scope["styles"]) ? $this->scope["styles"] : null);$this->globals["loop"]['default'] = array("iteration"		=> 1,"last"		=> null,"total"		=> $this->isArray($_loop1_data) ? count($_loop1_data) : 0,);$_loop1_glob =& $this->globals["loop"]['default'];if ($this->isArray($_loop1_data) === true){foreach ($_loop1_data as $tmp_key => $this->scope["-loop-"]){$_loop1_glob["last"] = (string) ($_loop1_glob["iteration"] === $_loop1_glob["total"]);$_loop1_scope = $this->setScope(array("-loop-"));/* -- loop start output */?>[<a href="#" onclick="javascript:set_stylesheet(\'<?php echo Dwoo_Plugin_capitalize($this, $this->scope, false);?>\', false, true);reloadmain();" style="display: inline;" target="_self"><?php echo mb_strtoupper((string) substr($this->scope, 0, 1), $this->charset);?></a>]<?php if (! (isset($this->globals["loop"]["default"]["last"]) ? $this->globals["loop"]["default"]["last"]:null)) {?> <?php }
/* -- loop end output */$this->setScope($_loop1_scope, true);$_loop1_glob["iteration"]+=1;}}
}?>';

}

function toggle(button, area) {
	var tog=document.getElementById(area);
	if(tog.style.display)	{
		tog.style.display="";
	} else {
		tog.style.display="none";
	}
	button.innerHTML=(tog.style.display)?'+':'&minus;';
	set_cookie('nav_show_'+area, tog.style.display?'0':'1', 30);
}

function removeframes() {
	var boardlinks = document.getElementsByTagName("a");
	for(var i=0;i<boardlinks.length;i++) if(boardlinks[i].className == "boardlink") boardlinks[i].target = "_top";

	document.getElementById("removeframes").innerHTML = '<?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Frames removed<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?>.';

	return false;
}
function reloadmain() {
	if (parent.main) {
		parent.main.location.reload();
	}
}

function hidedirs() {
	set_cookie('tcshowdirs', '', 30);
	<?php if ((isset($this->scope["files"]["0"]) ? $this->scope["files"]["0"]:null) == (isset($this->scope["files"]["1"]) ? $this->scope["files"]["1"]:null)) {
?>
		location.reload(true)
	<?php 
}
else {
?>
		window.location = '<?php echo KU_WEBFOLDER;
echo $this->scope["files"]["0"];?>';
	<?php 
}?>

}
function showdirs() {
	set_cookie('tcshowdirs', 'yes', 30);
	<?php if ((isset($this->scope["files"]["0"]) ? $this->scope["files"]["0"]:null) == (isset($this->scope["files"]["1"]) ? $this->scope["files"]["1"]:null)) {
?>
		location.reload(true)
	<?php 
}
else {
?>
		window.location = '<?php echo KU_WEBFOLDER;
echo $this->scope["files"]["1"];?>';
	<?php 
}?>

}
//--></script>
<base target="main" />
</head>
<body>
<h1><?php echo KU_NAME;?></h1>
<ul>
<li><a href="<?php echo KU_WEBFOLDER;?>" target="_top"><?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Front Page<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?></a></li>
<?php if ((defined("KU_MENUSTYLESWITCHER") ? KU_MENUSTYLESWITCHER : null) && (defined("KU_MENUTYPE") ? KU_MENUTYPE : null) == 'normal') {
?>
	<li id="sitestyles"><a onclick="javascript:showstyleswitcher();" href="#" target="_self">[<?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Site Styles<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?>]</a></li>
<?php 
}?>

<?php if ((isset($this->scope["showdirs"]) ? $this->scope["showdirs"] : null) == 0) {
?>
	<li><a onclick="javascript:showdirs();" href="<?php echo $this->scope["files"]["1"];?>" target="_self">[<?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Show Directories<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?>]</a></li>
<?php 
}
else {
?>
	<li><a onclick="javascript:hidedirs();" href="<?php echo $this->scope["files"]["0"];?>" target="_self">[<?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Hide Directories<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?>]</a></li>
<?php 
}?>

<?php if ((defined("KU_MENUTYPE") ? KU_MENUTYPE : null) == 'normal') {
?>
	<li id="removeframes"><a href="#" onclick="javascript:return removeframes();" target="_self">[<?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Remove Frames<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?>]</a></li>
<?php 
}?>

</ul>
<?php if (empty($this->scope["boards"])) {
?>
	<ul>
		<li><?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>No visible boards<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?></li>
	</ul>
<?php 
}
else {
?>

	<?php 
$_fh1_data = (isset($this->scope["boards"]) ? $this->scope["boards"] : null);
if ($this->isArray($_fh1_data) === true)
{
	foreach ($_fh1_data as $this->scope['sect'])
	{
/* -- foreach start output */
?>
	
		<?php if ((defined("KU_MENUTYPE") ? KU_MENUTYPE : null) == 'normal') {
?>
			<h2>
		<?php 
}
else {
?>
			<h2 style="display: inline;"><br />
		<?php 
}?>

		<?php if ((defined("KU_MENUTYPE") ? KU_MENUTYPE : null) == 'normal') {
?>
			<span class="plus" onclick="toggle(this, '<?php echo $this->scope["sect"]["abbreviation"];?>');" title="<?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Click to show/hide<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?>"><?php if ((isset($this->scope["sect"]["hidden"]) ? $this->scope["sect"]["hidden"]:null) == 1) {
?>+<?php 
}
else {
?>&minus;<?php 
}?></span>&nbsp;
		<?php 
}?>

		<?php echo $this->scope["sect"]["name"];?></h2>
		<?php if ((defined("KU_MENUTYPE") ? KU_MENUTYPE : null) == 'normal') {
?>
			<div id="<?php echo $this->scope["sect"]["abbreviation"];?>"<?php if ((isset($this->scope["sect"]["hidden"]) ? $this->scope["sect"]["hidden"]:null) == 1) {
?> style="display: none;"<?php 
}?>>
		<?php 
}?>

		<ul>
		<?php if (count((isset($this->scope["sect"]["boards"]) ? $this->scope["sect"]["boards"]:null)) > 0) {
?>
			<?php 
$_fh0_data = (isset($this->scope["sect"]["boards"]) ? $this->scope["sect"]["boards"]:null);
if ($this->isArray($_fh0_data) === true)
{
	foreach ($_fh0_data as $this->scope['brd'])
	{
/* -- foreach start output */
?>
				<li><a href="<?php echo KU_BOARDSPATH;?>/<?php echo $this->scope["brd"]["name"];?>/" class="boardlink<?php if ((isset($this->scope["brd"]["trial"]) ? $this->scope["brd"]["trial"]:null) == 1) {
?> trial<?php 
}
if ((isset($this->scope["brd"]["popular"]) ? $this->scope["brd"]["popular"]:null) == 1) {
?> pop<?php 
}?>">
				<?php if ((isset($this->scope["showdirs"]) ? $this->scope["showdirs"] : null) == 1) {
?>
					/<?php echo $this->scope["brd"]["name"];?>/ - 
				<?php 
}?>

				<?php echo $this->scope["brd"]["desc"];?>

				<?php if ((isset($this->scope["brd"]["locked"]) ? $this->scope["brd"]["locked"]:null) == 1) {
?>
					<img src="<?php echo KU_BOARDSPATH;?>/css/locked.gif" border="0" alt="<?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>Locked<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?>">
				<?php 
}?>

				</a></li>
			<?php 
/* -- foreach end output */
	}
}?>

		<?php 
}
else {
?>
			<li><?php  if (!isset($_tag_stack)){ $_tag_stack = array(); } $_tag_stack[] = array(); $_block_repeat=true; smarty_block_t($_tag_stack[count($_tag_stack)-1], null, $this, $_block_repeat); while ($_block_repeat) { ob_start();?>No visible boards<?php  $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t($_tag_stack[count($_tag_stack)-1], $_block_content, $this, $_block_repeat); } array_pop($_tag_stack);?></li>
		<?php 
}?>

		</ul>
		<?php if ((defined("KU_MENUTYPE") ? KU_MENUTYPE : null) == 'normal') {
?>
			</div>
		<?php 
}?>

	<?php 
/* -- foreach end output */
	}
}?>

<?php 
}?>

<?php if ((defined("KU_IRC") ? KU_IRC : null)) {
?>
	<?php if ((defined("KU_MENUTYPE") ? KU_MENUTYPE : null) == 'normal') {
?>
		<h2>
	<?php 
}
else {
?>
		<h2 style="display: inline;"><br />
	<?php 
}?>

	&nbsp;IRC</h2>
	<ul>
		<li><?php echo KU_IRC;?></li>
	</ul>
<?php 
}?>

</body>
</html>


<?php  /* end template body */
return $this->buffer . ob_get_clean();
?>