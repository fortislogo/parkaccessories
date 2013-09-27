<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><div class="wrapper"><?php echo $content_top; ?>
  
 
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
        <a class="colorbox prettyPhoto" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" id="zoom01" <? if(($this->config->get('beauty_status') == '1') && ($this->config->get('beauty_effects_productimage') == 'zoom')) { echo 'class="cloud-zoom" rel="position:\'right\', adjustX:10, adjustY:0, tint:\'#FFFFFF\', showTitle:false, softFocus:1, smoothMove:5, tintOpacity:0.8"';} else { echo 'rel="prettyPhoto"';} ?>><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
      <div class="zoom"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox prettyPhoto">Zoom</a></div>
      <?php } ?>
      <?php if ($images) { ?>
      <div class="image-additional-wrapper navigate-additional">
        <div class="prev"></div>
        <div class="image-additional caruofredsel-additional">          
          <?php foreach ($images as $image) { ?>
          <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox prettyPhoto" ><img class="fade-image" src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
          <?php } ?>
        </div>
        <div class="next"></div>
      </div>
      <?php } ?>
    </div>
    <?php } ?>
    <div class="right">
    	<?php if ($custom_title_1 || $custom_title_2): ?>
        	<h1><?php echo $custom_title_1; ?>
        	<?php if ($custom_title_2): ?>
        		<br /><?php echo $custom_title_2; ?>
        	<?php endif; ?>
        	</h1>
        <?php else: ?>
    	 	<h1><?php echo $heading_title; ?></h1>
         <?php endif; ?>
      <div class="description">
      	
        <!--<div class="right-rating" onclick="$('a[href=\'#tab-review\']').trigger('click');"><img class="fade-image" src="catalog/view/theme/beautyshop/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /></div>
        <?php if ($manufacturer) { ?>
        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        <?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        <span><?php echo $text_stock; ?></span> <?php echo $stock; ?></div>-->
      
      <div class="price">
        
        <div class="price-tag"><?php if (!$special) { ?>
        <?php echo $price; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span><br />
        <?php } ?>
        
        
        <!--<?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
        <?php } ?> 
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
        <?php } ?> -->
        
        <?php if ($discounts) { ?>
        
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
        <?php } ?>
        
        </div>
        
        <div class="text-description">
        	<?php echo $description; ?>
        </div>
        
      </div> 
      
      
      
      
      
      
          <div class="product-list product-page">
          	<div class="box-product-item">        
          		<div class="product-list-buttons">
                	<div class="input-qty">
                		<label>Qty</label>
	                	<select name="quantity">
    	                <?php for($i=1; $i<=10; $i++): ?>
        	            <?php if ($i == $minimum): ?>
            	        <option value="<?php echo $i; ?>" selected="selected"><?php echo $i; ?></option>
                	    <?php else: ?>
                    	<option value="<?php echo $i; ?>"><?php echo $i; ?></option>
	                    <?php endif; ?>
    	                <?php endfor; ?>
        	            </select>
				         <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                	</div>
                
      		          <?php if ($options) { ?>
      <div class="options">
        <!--<h2><?php echo $text_option; ?></h2> -->
       
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          
          <!--<b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?><?php echo $option['name']; ?>:</b> -->
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
                
            	    <div class="pbuttons buttons-cart" id="button-cart">
                    <?php echo $button_cart; ?>
                    </div>
                
                <!--<div class="pbuttons buttons-compare" onclick="addToCompare('<?php echo $product_id; ?>');"><div class="text"><?php echo $button_compare; ?></div></div> -->
	          </div>
              
              <label id="selected-color"></label>
          
          </div>
          </div>
          
           
      
      
    </div>
    
    	 <?php if ($products) { ?>
   
		   <?php } ?>
   
		   <?php if ($products) { ?>
   
		   <?php } ?>	
    
    	<div class="product-links">
                <ul>
                	<li><!-- AddThis Button BEGIN -->
          <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a></div>
          <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
          <!-- AddThis Button END --> </li>
                    <li><a class="send-to-friend">Send To A Friend</a></li>
                    <li><a href="javascript:addToWishList('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></a></li>
                </ul>
                
                <div id="send-to-friend">
                <form method="post" action="">
                	<input type="hidden" name="productid" value="<?php echo $product_id; ?>">
                	<table cellpadding="0" cellspacing="0" border="0" width="100%">
                    	<tr>
                        	<td><label>Your Name</label><input type="text" name="name"></td>
                            <td><label>Your Email</label><input type="text" name="email"></td>
                        </tr>
                        <tr>
                        	<td><label>Recipients Email</label><input type="text" name="recipients"></td>
                            <td><label>Captcha</label><img src="index.php?route=information/contact/captcha" alt="" align="top" style="margin-right:10px;" /><input type="text" name="captcha" style="width:115px;"></td>
                        </tr>
                        <tr>
                        	<td colspan="2" style="padding:20px 0px;">
                            	<input type="checkbox" name="personal_message"> Add A Personal Message<br />
                                
                                <textarea name="message" rows="10" style="width:99%; display:none"></textarea>
                            </td>                            
                        </tr>
                        <tr>
                        	<td colspan="2" align="right" style="padding:20px 0px;"><input type="submit" value="Send"></td>
                        </tr>
                    </table>
                </form>    
                </div>
          </div>
          
          
          
          
          <div class="product-contacts">
          
          		<ul>
                	<li class="phone"><strong>QUESTIONS?</strong><br />Call our customer care line<br />646-434-2552</li>
                    <li class="email"><a href="<?php echo HTTP_SERVER; ?>?route=information/emailus">Email us</a></li>
          		</ul>
                
          </div>
    
    
  </div>
  
  <!--<div id="tabs" class="htabs"><a href="#tab-description"><?php echo $tab_description; ?></a>
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
  
  
<? }?>-->


  
  
  <?php echo $content_bottom; ?></div>
<script type="text/javascript">  
$('.product-info a.prettyPhoto').colorbox({rel:'prettyPhoto', width:1209, title: false});
$('.email a').fancybox();
</script>
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
				
				if (cart_status == 1) cart_status = 0;
				
				$('a .cart-total').trigger('click');
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

<script language="javascript1.1">
var send_to_friend_status = 'close';
$('select[name=quantity]').selectbox();
$('#send-to-friend input[type=checkbox]').bind('change', function()
{
	if ($(this).is(':checked'))
	{
		$('#send-to-friend textarea[name=message]').show();		
	}
	else
	{
		$('#send-to-friend textarea[name=message]').hide();		
	}
});	
$('.send-to-friend').bind('click', function()
{
	if (send_to_friend_status == 'close')
	{
		$(this).parent().attr('class', 'active');
		send_to_friend_status = 'open';
		$('#send-to-friend').show();
	}
	else
	{
		send_to_friend_status = 'close';
		$(this).parent().removeAttr('class');
		$('#send-to-friend').hide();
	}
});	
$('#send-to-friend input[type=submit]').bind('click', function()
{
	var params = $('#send-to-friend form').serialize();
	$('#send-to-friend span.error').remove();
	$(this).after('<img id="loading" src="/newstore/catalog/view/theme/default/image/loading.gif">');
	$.ajax(
	{
		url: '/newstore/index.php?route=product/product/tellafriend',
		data: params,
		type: 'post',
		dataType: 'json',
		success: function(data)
		{
			$('#loading').remove();
			
			if (data.success)
			{
				alert(data.success);
				send_to_friend_status = 'close';
				$('.send-to-friend').parent().removeAttr('class');
				$('#send-to-friend').hide();
			}
			
			if (data.error_name)
			{
				$('input[name=name]').after('<span class="error">' + data.error_name + '</span>');
			}
			
			if (data.error_email)
			{
				$('input[name=email]').after('<span class="error">' + data.error_email + '</span>');
			}
			
			if (data.error_recipients)
			{
				$('input[name=recipients]').after('<span class="error">' + data.error_recipients + '</span>');
			}
			
			if (data.error_captcha)
			{
				$('input[name=captcha]').after('<span class="error">' + data.error_captcha + '</span>');
			}
		}
	});
	return false;
});		

$(document).ready(function()
			{
				$this = $('.colors ul li').first();	
				var color = $this.css('background-color');
				$this.parent().parent().find('select').val($this.attr('option-value'));
				change_color(color,$this.attr('title'));
			});
</script>
<?php echo $footer; ?>