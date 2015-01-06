<?php
if (function_exists('Dwoo_Plugin_date_format')===false)
	$this->getLoader()->loadPlugin('date_format');
ob_start(); /* template body */ ?><?php echo '<?xml'; ?> version="1.0" encoding="UTF-8" ?>
<rss version="2.0">
<channel>
<title><?php echo KU_NAME;?> - Modlog</title>
<link><?php echo KU_WEBPATH;?></link>
<description>Live view of all moderative actions on <?php echo KU_WEBPATH;?></description>
<language><?php echo KU_LOCALE;?></language>
<?php 
$_fh0_data = (isset($this->scope["entries"]) ? $this->scope["entries"] : null);
if ($this->isArray($_fh0_data) === true)
{
	foreach ($_fh0_data as $this->scope['item'])
	{
/* -- foreach start output */
?>
	<item>
	<title><?php echo Dwoo_Plugin_date_format($this, (isset($this->scope["item"]["timestamp"]) ? $this->scope["item"]["timestamp"]:null), "%a %m/%d %H:%M", null);?></title>
	<description><![CDATA[<?php echo $this->scope["item"]["user"];?> - <?php echo $this->scope["item"]["entry"];?>]]></description>
	</item>
<?php 
/* -- foreach end output */
	}
}?>

</channel>
</rss>
<?php  /* end template body */
return $this->buffer . ob_get_clean();
?>