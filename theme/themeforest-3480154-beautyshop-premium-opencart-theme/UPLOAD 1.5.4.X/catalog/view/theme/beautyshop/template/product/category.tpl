<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  
  <h1><?php echo $heading_title; ?></h1>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($thumb || $description) { ?>
  <div class="category-info">
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if($this->config->get('beauty_layout_refsearch')) { ?>
  <?php if ($categories) { ?>
  <h2><?php echo $text_refine; ?></h2>
  <div class="category-list">
    <?php if (count($categories) <= 5) { ?>
    <ul>
      <?php foreach ($categories as $category) { ?>
      <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) { ?>
    <ul>
      <?php $j = $i + ceil(count($categories) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($categories[$i])) { ?>
      <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php } ?>
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="display"><b><?php echo $text_display; ?></b> <a title="<?php echo $text_list; ?>" class="active"><?php echo $text_list; ?></a><a title="<?php echo $text_grid; ?>" onclick="display('grid');"><?php echo $text_grid; ?></a><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
    
    <div class="limit"><b><?php echo $text_limit; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><b><?php echo $text_sort; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>

  <div class="product-list box-product">
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
          <div class="name name1"><a href="<?php echo $product['href']; ?>"><?php

              if (!($this->config->get('beauty_layout_shortenby'))) {
		$shortenby = 23;
	      }
              else
              {
                $shortenby = $this->config->get('beauty_layout_shortenby');
              }
              
          if(strlen($product['name']) > $shortenby) { $productname = substr($product['name'],0,$shortenby).'...'; echo $productname; } else { echo $product['name']; }  ?></a></div>
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
	      <div class="box-product-buttons"><div class="buttons-cart" onclick="addToCart('<?php echo $product['product_id']; ?>');"></div><div class="buttons-wish" onclick="addToWishList('<?php echo $product['product_id']; ?>');"></div><div class="buttons-compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');"></div><div class="buttons-more" onclick="location.href='<?php echo $product['href']; ?>'"></div></div>
              
	     <?php if ($product['rating']) { ?>
              <div class="box-product-rating"><img src="catalog/view/theme/beautyshop/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
              <?php } ?>
	  
        </div>
        
    
      </div>
   
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list box-product');
		  
		$('.display').html('<b><?php echo $text_display; ?></b> <a title="<?php echo $text_list; ?>" class="active"><?php echo $text_list; ?></a><a title="<?php echo $text_grid; ?>" onclick="display(\'grid\');"><?php echo $text_grid; ?></a><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>');
		
		$.cookie('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid box-product');
		
                
		$('.display').html('<b><?php echo $text_display; ?></b> <a title="<?php echo $text_list; ?>" onclick="display(\'list\');"><?php echo $text_list; ?></a><a class="active" title="<?php echo $text_grid; ?>" ><?php echo $text_grid; ?></a><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>');
		
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
if (view) {
	display(view);
} else {
	display('<?=$beauty_layout_pdisplay?>');
}
//--></script> 
<?php echo $footer; ?>