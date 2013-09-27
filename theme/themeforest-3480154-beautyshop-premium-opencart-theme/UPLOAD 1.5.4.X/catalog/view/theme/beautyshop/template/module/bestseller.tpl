<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?><div class="navigate navigate-bestseller"><div class="prev"></div><div class="next"></div></div></div>
  <div class="clear"></div>
  <div class="box-content">
    <div class="box-product caruofredsel caruofredsel-bestseller">
      <?php foreach ($products as $product) { ?>
      <div class="box-product-item">
        <div class="view-first">
        
        <div class="view-content">  
          <?php if ($product['thumb']) { ?>
          <div class="image">
	    <? if(($product['special'])&&($this->config->get('beauty_status') == '1')&&($this->config->get('layout_product_showsalebadge'))) { ?>
	    <div class="sale-badge"><?=$this->config->get('layout_product_showsalebadge_title');?></div>
	    <? } ?>
	    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
          <?php } ?>
          <div class="name"><a href="<?php echo $product['href']; ?>">
	  <?php

              if (!($this->config->get('beauty_layout_shortenby'))) {
		$shortenby = 23;
	      }
              else
              {
                $shortenby = $this->config->get('beauty_layout_shortenby');
              }
	      
	  if(strlen($product['name']) > $shortenby) { $product['name'] = substr($product['name'],0,$shortenby).'...'; } echo $product['name']; ?></a></div>
          <?php if ($product['price']) { ?>
          <div class="price">
            <?php if (!$product['special']) { ?>
            <?php echo $product['price']; ?>
            <?php } else { ?>
            <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
          
	      <div class="box-product-buttons"><div class="buttons-cart" onclick="addToCart('<?php echo $product['product_id']; ?>');"></div><div class="buttons-wish" onclick="addToWishList('<?php echo $product['product_id']; ?>');"></div><div class="buttons-compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');"></div><div class="buttons-more" onclick="location.href='<?php echo $product['href']; ?>'"></div></div>
              
	     <?php if ($product['rating']) { ?>
              <div class="box-product-rating"><img src="catalog/view/theme/beautyshop/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
              <?php } ?>
	  
               
           
        </div>
        
        
      </div>
      <?php } ?>
    </div>
  </div>
</div>
<div class="clear"></div>
<?
if($this->config->get('beauty_status') == '1') {$beauty_effects_carousel = $this->config->get('beauty_effects_carousel');} else {$beauty_effects_carousel = 'enable';}

if($beauty_effects_carousel == 'enable')
{
?>
<script type="text/javascript"><!--
$(document).ready(function() {
      
	// Using default configuration
	$(".caruofredsel-bestseller").carouFredSel({
      
                  infinite: false,
		  width : "100%",
                  auto 	: false,
                  prev	: {	
                          button	: ".navigate-bestseller .prev",
                          key		: "left"
                  },
                  next	: { 
                          button	: ".navigate-bestseller .next",
                          key		: "right"
                  }
                  ,swipe           : {
                      onTouch     : true,
                      onMouse     : false
                  }
		  ,onCreate : function(data) { $(this).css("height","auto");  }	
        
        })

});

--></script>
<? } ?>