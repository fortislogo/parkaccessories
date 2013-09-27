<div class="flexslider" id="flexslider<?php echo $module; ?>">
  <ul class="slides">
    <?php foreach ($banners as $banner) { 
    
    $pos = strpos($banner['title'], "mini");
    $pos2 = strpos($banner['title'], "ads");
    if (($pos === false)&&($pos2 === false)) {
    ?>
    <li>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    </li>
    <? } ?>
    
    <?php } ?>
  </ul>
</div>
<?
$beauty_layout_rightbaners = 'show';

if($this->config->get('beauty_status') == '1') { $beauty_layout_rightbaners = $this->config->get('beauty_layout_rightbaners'); }

if($beauty_layout_rightbaners == 'show') {
?>	
<div class="mini-sliders">
  <?php
  
    $i = 0;
    
    foreach ($banners as $banner) { 
    
    $pos = strpos($banner['title'], "mini");
    
    if ($pos !== false) {
    $i++;
    ?>
  
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img class="fade-image" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
  
    <? } ?>
    
    <?php }
    
    if($i>0)
    {
      echo '<style type="text/css">#flexslider'.$module.' {
	width:603px;float:left;
}

</style>';
    }
    
    ?>
</div>
<div class="clear"></div>

<? } ?>

<?
$beauty_layout_bottombaners = 'show';

if($this->config->get('beauty_status') == '1') { $beauty_layout_bottombaners = $this->config->get('beauty_layout_bottombaners'); }

if($beauty_layout_bottombaners == 'show') {
?>
<div class="mini-ads"><?php
  
    $j = 0;
    
    foreach ($banners as $banner) {     
    $pos = strpos($banner['title'], "ads");
    if ($pos !== false) {
    $j++;
    
    if ($banner['link']) { ?><a href="<?php echo $banner['link']; ?>"><img class="fade-image" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/></a><?php } else { ?><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /><?php } ?><? } }  ?></div><div class="clear"></div>
<? } ?>
<?
$beauty_effects_slideranim = 'fade';

if($this->config->get('beauty_status') == '1') { $beauty_effects_slideranim = $this->config->get('beauty_effects_slideranim'); }

?>
<script type="text/javascript"><!--
$(document).ready(function() {
 	
  $('.flexslider').flexslider({
    animation: "<?=$beauty_effects_slideranim;?>",
    controlNav: true,
    directionNav: false,
    start: function(slider) {
	  
	  
	  if($("body").css('background-image') == 'none')
	  {
	    if(($("#column-left")[0]) || ($("#column-right")[0]))
	    {
	      // nothing
	    }
	    else
	    {
	      $("#slider-bg").hide().css("height",slider.css("height")).fadeIn("slow");
	    }
	  }
	  
      }
  });

     
  
});
--></script>