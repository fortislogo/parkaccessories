<?php echo $header; ?>
<div id="content"><div class="wrapper"><?php echo $content_top; ?>
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php echo $column_left; ?><?php echo $column_right; ?>
  <div class="description">
  	 <h1><?php echo $heading_title; ?></h1>	
	  <?php echo $description; ?>
  </div>    
  
  
  <?php echo $content_bottom; ?></div></div>
  
<script language="javascript1.1">  
$(document).ready(function()
{						   
	$('.email').fancybox(
	{
		maxWidth	: 800,
		maxHeight	: 600,
		fitToView	: false,
		width		: '70%',
		height		: '70%',
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	});
});
</script>
  
<?php echo $footer; ?>