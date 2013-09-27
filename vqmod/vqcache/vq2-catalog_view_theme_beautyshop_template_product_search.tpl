<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><div class="wrapper"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>

  <div class="content">
    <p><?php echo $entry_search; ?>
      <?php if ($search) { ?>
      <input type="text" name="search" value="<?php echo $search; ?>" />
      <?php } else { ?>
      <input type="text" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
      <?php } ?>
      <select name="category_id">
        <option value="0"><?php echo $text_category; ?></option>
        <?php foreach ($categories as $category_1) { ?>
        <?php if ($category_1['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_1['children'] as $category_2) { ?>
        <?php if ($category_2['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_2['children'] as $category_3) { ?>
        <?php if ($category_3['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <?php } ?>
      </select>
      <?php if ($sub_category) { ?>
      <input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
      <?php } else { ?>
      <input type="checkbox" name="sub_category" value="1" id="sub_category" />
      <?php } ?>
      <label for="sub_category"><?php echo $text_sub_category; ?></label>
    </p>
    <?php if ($description) { ?>
    <input type="checkbox" name="description" value="1" id="description" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="description" value="1" id="description" />
    <?php } ?>
    <label for="description"><?php echo $entry_description; ?></label>
  </div>
  <div class="buttons">
    <div class="right"><input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" /></div>
  </div>
  
  <h2><?php echo $text_search; ?></h2>
  <?php if ($products) { ?>
  

  <div class="product-list box-product">
    <?php foreach ($products as $product) { ?>
    
      <div class="box-product-item">
        <div class="view-first">
        
        <div class="view-content">  
          <?php if ($product['thumb']) { ?>
          <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
          <?php } ?>
          <div class="name name1"><a href="<?php echo $product['href']; ?>"><?php

              if (!($this->config->get('beauty_layout_shortenby'))) {
		$shortenby = 23;
	      }
              else
              {
                $shortenby = $this->config->get('beauty_layout_shortenby');
              }
              mb_internal_encoding("UTF-8");
          if(strlen($product['name']) > $shortenby) { $productname = mb_substr($product['name'],0,$shortenby).'...'; echo $productname; } else { echo $product['name']; }  ?></a></div>
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
            
			<div class="pbuttons buttons-cart" onclick="addToCart('<?php echo $product['product_id']; ?>'); _gaq.push(['_trackEvent', 'Search Page', 'Add to Cart', '<?php echo htmlspecialchars($product['name'],ENT_QUOTES); ?>']);">
			<div class="img"></div><div class="text"><?php echo $button_cart; ?></div><div class="img2"></div></div>
			<div class="pbuttons buttons-wish" onclick="addToWishList('<?php echo $product['product_id']; ?>'); _gaq.push(['_trackEvent', 'Search Page', 'Add to Wishlist', '<?php echo htmlspecialchars($product['name'],ENT_QUOTES); ?>']);">
			<div class="img"></div><div class="text"><?php echo $button_wishlist; ?></div><div class="img2"></div></div>
			<div class="pbuttons buttons-compare" onclick="addToCompare('<?php echo $product['product_id']; ?>'); _gaq.push(['_trackEvent', 'Search Page', 'Add to Compare', '<?php echo htmlspecialchars($product['name'],ENT_QUOTES); ?>']);">
			<div class="img"></div><div class="text"><?php echo $button_compare; ?></div><div class="img2"></div></div>
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
	  
        </div>
        
    
      </div>
   
    <?php } ?>
  </div>
 
  <?php } ?>
  <?php if ( !$products) { ?>
  <div class="content"><div class="wrapper"><?php echo $text_empty; ?></div></div>
 
  <?php } ?>

         <?php if($blogStatus) { ?>
            <div id="blogSearch">
               <h2><?php echo $text_search_blog; ?></h2>
               <div class="blogSearch">
                  <?php if ($articles) { ?>
                     <?php if ($searchDisplay == 'plain') { ?>
                        <ul class="plain">
                        <?php foreach ($articles as $article) { ?>
                           <li>
                              <a href="<?php echo $article['link']; ?>" title="<?php echo $article['title']; ?>" class="title"><?php echo $article['title']; ?></a>
                              <span class="info"><?php echo $article['author']; ?><?php echo $article['created']; ?>.</span>
                           </li>
                        <?php } ?>
                        </ul>
                     <?php } ?>
                     <?php if ($searchDisplay == 'compact') { ?>
                        <ul class="compact">
                        <?php foreach ($articles as $article) { ?>
                           <li>
                              <?php if ($article['image']) { ?>
                                 <a href="<?php echo $article['link']; ?>" title="<?php echo $article['title']; ?>"><img src="<?php echo $article['image']; ?>" alt="<?php echo $article['title']; ?>" /></a>
                                 <div>
                              <?php } else { ?>
                                 <div style="margin-left:0;">
                              <?php } ?>
                                    <a href="<?php echo $article['link']; ?>" title="<?php echo $article['title']; ?>" class="title"><?php echo $article['title']; ?></a>
                                    <span class="info"><?php echo $article['author']; ?><?php echo $article['created']; ?>.</span>
                                    <p><?php echo $article['descCompact']; ?> <a href="<?php echo $article['link']; ?>" title="<?php echo $article['title']; ?>" class="readmore"><?php echo $text_search_more; ?></a></p>
                                 </div>
                           </li>
                        <?php } ?>
                        </ul>
                     <?php } ?>
                     <?php if ($searchDisplay == 'grid') { ?>
                        <div class="grid">
                        <?php foreach ($articles as $article) { ?>
                           <div style="width:<?php echo (100/$searchGrid)-2.4 . '%';?>; padding:0 1%;">
                              <?php if ($article['image']) { ?>
                                 <a href="<?php echo $article['link']; ?>" title="<?php echo $article['title']; ?>"><img src="<?php echo $article['image']; ?>" alt="<?php echo $article['title']; ?>" /></a>
                              <?php } ?>
                              <div>
                                 <a href="<?php echo $article['link']; ?>" title="<?php echo $article['title']; ?>" class="title"><?php echo $article['title']; ?></a>
                                 <span class="info"><?php echo $article['author']; ?><?php echo $article['created']; ?>.</span>
                                 <p><?php echo $article['descGrid']; ?> <a href="<?php echo $article['link']; ?>" title="<?php echo $article['title']; ?>" class="readmore"><?php echo $text_search_more; ?></a></p>
                              </div>
                           </div>
                        <?php } ?>
                        </div>
                     <?php } ?>
                  <?php } else { ?>
                     <div class="content"><?php echo $text_search_result; ?></div>
                  <?php } ?>
               </div>
            </div>
         <?php } ?>
         
  <?php echo $content_bottom; ?></div></div>
<script type="text/javascript"><!--

$('#content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').attr('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').attr('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

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
display('grid');
//--></script> 
<?php echo $footer; ?>