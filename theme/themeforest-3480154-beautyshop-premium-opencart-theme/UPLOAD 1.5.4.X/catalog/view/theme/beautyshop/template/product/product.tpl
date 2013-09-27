<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  
  <h1><?php echo $heading_title; ?></h1>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="product-info">
    <?php if ($thumb || $images) { ?>
    <div class="left">
      <?php if ($thumb) { ?>
      <div class="image">
        <? if(($special)&&($this->config->get('beauty_status') == '1')&&($this->config->get('layout_product_showsalebadge'))) { ?>
	    <div class="sale-badge"><?=$this->config->get('layout_product_showsalebadge_title');?></div>
	    <? } ?>
        <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox imageZoom" rel="prettyPhoto"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
      <div class="zoom"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="prettyPhoto"><img src="catalog/view/theme/beautyshop/image/zoom.png" title="Zoom" alt="Zoom" align="absmiddle"/> Click to Zoom image</a></div>
      <?php } ?>
      <?php if ($images) { ?>
      <div class="image-additional-wrapper navigate-additional">
        <div class="prev"></div>
        <div class="image-additional caruofredsel-additional">
          <?php foreach ($images as $image) { ?>
          <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="prettyPhoto[pp_gal]"><img class="fade-image" src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
          <?php } ?>
        </div>
        <div class="next"></div>
      </div>
      <?php } ?>
    </div>
    <?php } ?>
    <div class="right">
      <div class="description">
        <div class="right-rating" onclick="$('a[href=\'#tab-review\']').trigger('click');"><img class="fade-image" src="catalog/view/theme/beautyshop/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /></div>
        <?php if ($manufacturer) { ?>
        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        <?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        <span><?php echo $text_stock; ?></span> <?php echo $stock; ?></div>
      <?php if ($price) { ?>
      <div class="price"><?php echo $text_price; ?>
        <?php if (!$special) { ?>
        <?php echo $price; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span><br />
        <?php } ?>
        
        <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
        <?php } ?>
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
        <?php } ?>
        <?php if ($discounts) { ?>
        
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($options) { ?>
      <div class="options">
        <h2><?php echo $text_option; ?></h2>
       
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?><?php echo $option['name']; ?>:</b>
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?><?php echo $option['name']; ?>:</b>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?><?php echo $option['name']; ?>:</b>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?><?php echo $option['name']; ?>:</b>
          <table class="option-image">
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <tr>
              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label></td>
            </tr>
            <?php } ?>
          </table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?><?php echo $option['name']; ?>:</b>
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
         
          <b> <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?><?php echo $option['name']; ?>:</b>
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?><?php echo $option['name']; ?>:</b>
          <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
         
          <b> <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?><?php echo $option['name']; ?>:</b>
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?><?php echo $option['name']; ?>:</b>
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
         
          <b> <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?><?php echo $option['name']; ?>:</b>
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
        <br />
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
      
          <div class="product-list product-page">
          <div class="box-product-item">        
          <div class="product-list-buttons">
                <div class="input-qty"><input type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" />
          <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                </div><div class="pbuttons buttons-cart" id="button-cart"><div class="img"></div><div class="text"><?php echo $button_cart; ?></div><div class="img2"></div></div><div class="pbuttons buttons-wish" onclick="addToWishList('<?php echo $product_id; ?>');"><div class="img"></div><div class="text"><?php echo $button_wishlist; ?></div><div class="img2"></div></div><div class="pbuttons buttons-compare" onclick="addToCompare('<?php echo $product_id; ?>');"><div class="img"></div><div class="text"><?php echo $button_compare; ?></div><div class="img2"></div></div>
          </div>
          </div>
          </div>
     
        <?php if ($minimum > 1) { ?>
            <div class="minimum"><?php echo $text_minimum; ?></div>
          <?php } ?>
      
      
      <?php if ($review_status) { ?>
      <div class="review">
        <span class='st_sharethis_hcount' displayText='ShareThis'></span>
<span class='st_fblike_hcount' displayText='Facebook Like'></span>
<span class='st_twitter_hcount' displayText='Tweet'></span>
<span class='st_pinterest_hcount' displayText='Pinterest'></span>
<span class='st_plusone_hcount' displayText='Google +1'></span>
      </div>
      <?php } ?>
    </div>
  </div>
  <div id="tabs" class="htabs"><a href="#tab-description"><?php echo $tab_description; ?></a>
    <?php if ($attribute_groups) { ?>
    <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($review_status) { ?>
    <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
    
<?
if($this->config->get('beauty_status') == '1') { $beauty_layout_related = $this->config->get('beauty_layout_related');} else {$beauty_layout_related = 'tab';}

if($beauty_layout_related == 'tab')
{
?>
    
    <?php if ($products) { ?>
    <a href="#tab-related"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
    <?php } ?>
<? } ?>

<?
if(($this->config->get('beauty_status') == '1')&&($this->config->get('layout_product_customtab'))) { 
  echo '<a href="#tab-customtab">'.$this->config->get('layout_product_customtab_title').'</a>';
}
?>

  </div>
  <div id="tab-description" class="tab-content"><?php echo $description; ?></div>
  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
  <?php if ($review_status) { ?>
  <div id="tab-review" class="tab-content">
    <div id="review"></div>
    <h2 id="review-title"><?php echo $text_write; ?></h2>
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="" />
    <br />
    <br />
    <b><?php echo $entry_review; ?></b>
    <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
    <br />
    <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp;<span><?php echo $entry_good; ?></span><br />
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="" />
    <br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  </div>
  <?php } ?>

<?
if($this->config->get('beauty_status') == '1') { $beauty_layout_related = $this->config->get('beauty_layout_related');} else {$beauty_layout_related = 'tab';}

if($beauty_layout_related == 'tab')
{
?>
  
  <?php if ($products) { ?>
  <div id="tab-related" class="tab-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div class="box-product-item">
        <div class="view-first">
        
        <div class="view-content">  
          <?php if ($product['thumb']) { ?>
          <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
          <?php } ?>
          <div class="name"><a href="<?php echo $product['href']; ?>"><?php if(strlen($product['name']) > 23) { $product['name'] = substr($product['name'],0,23).'...'; } echo $product['name']; ?></a></div>
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
  <?php } ?>
  
  
<? }?>

<?
if(($this->config->get('beauty_status') == '1')&&($this->config->get('layout_product_customtab'))) { 
  echo '<div id="tab-customtab" class="tab-content">'.html_entity_decode($this->config->get('layout_product_customtab_content')).'</div>';
}
?>

<?
if($this->config->get('beauty_status') == '1') { $beauty_layout_related = $this->config->get('beauty_layout_related');} else {$beauty_layout_related = 'tab';}

if(($beauty_layout_related == 'carousel')&&($products))
{
?>
  <div class="box">
  <div class="box-heading"><?php echo $tab_related; ?><div class="navigate navigate-related"><div class="prev"></div><div class="next"></div></div></div>
  <div class="clear"></div>
  <div class="box-product">
    <div class="caruofredsel caruofredsel-related">
      <?php foreach ($products as $product) { ?>
      <div class="box-product-item">
        <div class="view-first">
        
        <div class="view-content">  
          <?php if ($product['thumb']) { ?>
          <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
          <?php } ?>
          <div class="name"><a href="<?php echo $product['href']; ?>"><?php if(strlen($product['name']) > 23) { $product['name'] = substr($product['name'],0,23).'...'; } echo $product['name']; ?></a></div>
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

<script type="text/javascript"><!--
$(document).ready(function() {
      
        
	// Using default configuration
	$(".caruofredsel-related").carouFredSel({
      
                  infinite: false,
                  auto 	: false,
		  width : "100%",
                  prev	: {	
                          button	: ".navigate-related .prev",
                          key		: "left"
                  },
                  next	: { 
                          button	: ".navigate-related .next",
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
  
  <?php if ($tags) { ?>
  <div class="tags content"><img src="catalog/view/theme/beautyshop/image/tags.png" align="absmiddle"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
 $("a[rel^='prettyPhoto']").prettyPhoto();
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
if ($.browser.msie && $.browser.version == 6) {
	$('.date, .datetime, .time').bgIframe();
}

$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});


$(document).ready(function(){
  
<?
  if(($this->config->get('beauty_status') == '1') && ($this->config->get('beauty_effects_productimage') == 'zoom')) {
?>      
        var options = {  
                zoomType: 'standard',  
                lens:true,  
                preloadImages: true,  
                alwaysOn:false,  
                zoomWidth: 250,  
                zoomHeight: 271,  
                xOffset:10,  
                yOffset:00,  
                position:'right',
                title:false
             
        };  
        $('.imageZoom').jqzoom(options);
<?
} else {
?>
  $('.zoom').hide();
<? } ?>
    });  
//--></script>


<script type="text/javascript"><!--
$(document).ready(function() {
    
    // Google Chrome fix
	$.browser.chrome = /chrome/.test(navigator.userAgent.toLowerCase());
	// Safari fix
	$.browser.safari = ($.browser.webkit && !(/chrome/.test(navigator.userAgent.toLowerCase())));
	
	if((!$.browser.chrome)&&(!$.browser.safari)){

	  // Using default configuration
	  $(".caruofredsel-additional").carouFredSel({
	
		    infinite: false,
		    auto 	: false,
		    prev	: {	
			    button	: ".navigate-additional .prev",
			    key		: "left"
		    },
		    next	: { 
			    button	: ".navigate-additional .next",
			    key		: "right"
		    }
		    ,swipe           : {
			onTouch     : true,
			onMouse     : false
		    }
		    ,width:185
		    
		    ,onCreate : function(data) { $(".image-additional-wrapper").css("height","85px");  }
	  });
      
	  $(".image-additional-wrapper").css("height","85px");
	}
	else
	{
	  $(".image-additional-wrapper .prev,.image-additional-wrapper .next").hide();
	  $(".product-info .caroufredsel_wrapper, .product-info .image-additional-wrapper").css("height","auto");
	  $(".product-info .caruofredsel-additional").css("width","250px");
	  $(".product-info .image-additional a").css("margin-left","3px");
	  
	}


});

--></script>

<?php echo $footer; ?>