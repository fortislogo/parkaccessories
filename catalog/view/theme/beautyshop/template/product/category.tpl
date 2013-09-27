<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><div class="wrapper"><?php echo $content_top; ?>
  
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  
  
  
  <?php if ($products) { ?>
  
  

  <div class="product-list box-product">
    <?php foreach ($products as $product) { ?>
    
      <div class="box-product-item">
        <div class="view-first">
        
        <div class="view-content">  
          <?php if ($product['thumb']) { ?>
          <div class="image">
	    
	    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" style="width:<?php echo $this->config->get('config_image_product_width'); ?>px; height:auto;" /></a></div>
          <?php } ?>
          <div class="name name1"><a href="<?php echo $product['href']; ?>"><?php echo $product['name'];  ?></a></div>
          <div class="name name2"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
          <div class="price2">
            <?php if (!$product['special']) { ?>
            <?php echo $product['price']; ?>
            <?php } else { ?>
            <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
            <?php } ?>
          </div>
          <div class="description"><?php echo $product['description']; ?><?php if ($product['rating']) { ?>
              <div class="box-product-rating2"><img src="catalog/view/theme/beautyshop/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
              <?php } ?></div>
          
          <div class="product-list-buttons">
            <div class="pbuttons buttons-cart" onclick="addToCart('<?php echo $product['product_id']; ?>');"><div class="img"></div><div class="text"><?php echo $button_cart; ?></div><div class="img2"></div></div><div class="pbuttons buttons-wish" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><div class="img"></div><div class="text"><?php echo $button_wishlist; ?></div><div class="img2"></div></div><div class="pbuttons buttons-compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');"><div class="img"></div><div class="text"><?php echo $button_compare; ?></div><div class="img2"></div></div>
</div>
          <?php if ($product['price']) { ?>
          <div class="price">
            <?php if (!$product['special']) { ?>
            <?php echo $product['price']; ?>
            <?php } else { ?>
            <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
            <?php } ?>
          </div>
       
        <?php } ?>
           </div>
	      
	      
	     <?php if ($product['rating']) { ?>
              <div class="box-product-rating"><img src="catalog/view/theme/beautyshop/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
              <?php } ?>
	  
        </div>
        
    
      </div>
   
    <?php } ?>
  </div>
  
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div></div>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list box-product');
		  
		$('.display').html('<b><?php echo $text_display; ?></b> <a title="<?php echo $text_list; ?>" class="active"><?php echo $text_list; ?></a><a title="<?php echo $text_grid; ?>" onclick="display(\'grid\');"><?php echo $text_grid; ?></a><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>');
		
		$.cookie('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid box-product');
		
                
		$('.display').html('<a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>');
		
		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');

<?

  if(($this->config->get('beauty_status') == '1')&&(($this->config->get('beauty_layout_pdisplay')))<>'')
  {
    $beauty_layout_pdisplay = $this->config->get('beauty_layout_pdisplay');
  }
  else
  {
    $beauty_layout_pdisplay = 'list';
  }
?>
var view = 'grid';
if (view) {
	display(view);
} else {
	display('<?=$beauty_layout_pdisplay?>');
}
//--></script> 
<?php echo $footer; ?>