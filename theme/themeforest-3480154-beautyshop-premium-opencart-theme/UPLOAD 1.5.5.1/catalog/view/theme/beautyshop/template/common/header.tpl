<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php if(($this->config->get('beauty_status') != '1')) {?>
<link href='//fonts.googleapis.com/css?family=Oswald:300,400,700&v1' rel='stylesheet' type='text/css'>
<? }?>
<?php if(($this->config->get('beauty_status') == '1')&&( $this->config->get('beauty_header_font') != 'Arial')){	
?>
<link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('beauty_header_font') ?>:<?php echo $this->config->get('beauty_header_font_weight') ?>&subset=<?php echo $this->config->get('beauty_header_font_subset') ?>' rel='stylesheet' type='text/css'>
<?php } ?>
<?php if(($this->config->get('beauty_status') == '1')&&( $this->config->get('beauty_buttons_font') != 'Arial')){	
?>
<link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('beauty_buttons_font') ?>:<?php echo $this->config->get('beauty_buttons_font_weight') ?>&subset=<?php echo $this->config->get('beauty_buttons_font_subset') ?>' rel='stylesheet' type='text/css'>
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/beautyshop/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/beautyshop/stylesheet/flexslider.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/beautyshop/stylesheet/jquery.jqzoom.css" media="screen" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/beautyshop/stylesheet/prettyPhoto.css" />
<?php if($direction == 'rtl')
{
      echo '<link rel="stylesheet" type="text/css" href="catalog/view/theme/beautyshop/stylesheet/rtl.css" />';
}
?>

<?php if(($this->config->get('beauty_status') == '1')&&( $this->config->get('beauty_layout_responsive') == 1)) { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/beautyshop/stylesheet/responsive.css" />
<?
      if($direction == 'rtl')
      {
	    echo '<link rel="stylesheet" type="text/css" href="catalog/view/theme/beautyshop/stylesheet/responsive-rtl.css" />';
      }

} ?>

<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/theme/beautyshop/js/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="catalog/view/theme/beautyshop/js/jquery.ba-throttle-debounce.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/beautyshop/js/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/beautyshop/js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/beautyshop/js/jquery.carouFredSel-6.1.0-packed.js"></script>
<script type="text/javascript" src="catalog/view/theme/beautyshop/js/cloud-zoom.1.0.3.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/beautyshop/js/jquery.qtip-1.0.0-rc3.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/beautyshop/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript">var switchTo5x=true;</script>
<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">stLight.options({publisher: "fdf72e22-4d1c-4270-9aea-a784ad6c30c2"});</script>

<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if lte IE 9]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/beautyshop/stylesheet/ie_all.css" />
<![endif]-->
<!--[if lt IE 7]>
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->

<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>

<?php echo $google_analytics; ?>

<script type="text/javascript"><!--

$(document).ready(function() {
      
      <?php
      if(($this->config->get('beauty_status') == '1'))
      {
	    $tooltip_color = '#'.$this->config->get('beauty_color_buttonbg');
      }
      else
      {
	    $tooltip_color = '#B6A7A4';
      }
      
      
      ?>
      /* tooltips */
      $('.box-product-buttons .buttons-cart, .box-product-buttons .buttons-wish, .box-product-buttons .buttons-compare, .box-product-buttons .buttons-more').qtip({
	    textAlign: 'center',
	    show: 'mouseover',
	    hide: 'mouseout',
	    position: {
		  corner: {
		     target: 'topMiddle',
		     tooltip: 'bottomMiddle'
		  }
	       },
	       style: {
		  border: {
	
			color: '<?=$tooltip_color?>'
		     },
		  name: 'light',
		  tip: 'bottomMiddle'
		  
	       },
	       padding: 5
	 });
	       
      <?
      if(($this->config->get('beauty_status') == '1'))
      {
	echo html_entity_decode($this->config->get('beauty_custom_js'));
      }
      ?>
      // Show shadow if background image exists
      if($("body").css('background-image') !== 'none')
      {
        $("#box-shadow").addClass("shadow");
        $("#powered").css("padding-left","20px");
        $("#paymenticons").css("padding-right","20px");
	
      }
      else
      {
        $("#container").css("padding","0");
        $("#footer-container").css("width","980px");
      }

      // Image animation
      $(".fade-image, .box-category .menuopen, .box-category .menuclose").live({
        mouseenter:
           function()
           {
				$(this).stop().fadeTo(300, 0.6);
           },
        mouseleave:
           function()
           {
				$(this).stop().fadeTo(300, 1);
           }
       }
    );
      
       $(".box-category div.menuopen").live('click', function(event) {
	 
		event.preventDefault();
		
		$('.box-category a + ul').slideUp();
		$('+ a + ul', this).slideDown();
		
		$('.box-category ul li div.menuclose').removeClass("menuclose").addClass("menuopen");
		$(this).removeClass("menuopen").addClass("menuclose");
		
		$('.box-category ul li a.active').removeClass("active");
		$('+ a', this).addClass("active");
	});
       
       var mobilemenuOpened = false;
       
       $(".mobile-menu-toggle").live('click', function(event) {

	    if(mobilemenuOpened == false)
	    {
		  $(".mobile-menu").slideDown();
		  
		  mobilemenuOpened = true;
	    }
	    else
	    {
		  $(".mobile-menu").slideUp();
		  
		  mobilemenuOpened = false;
	    }
	});

   
});

--></script>
<? if($this->config->get('beauty_status') == '1') {
      
   // custom css
  
   $beauty_layout_theight = $this->config->get('beauty_layout_theight');
   
   if(!$beauty_layout_theight)
   {
      $beauty_layout_theight = 204;
   }
    ?>	
<style type="text/css">
    
      <?
      if(($this->config->get('beauty_status') == '1'))
      {
	echo html_entity_decode($this->config->get('beauty_custom_css'));
      }
      ?>
      /* backgrounds */
      body {
	background-color: #<?php echo $this->config->get('beauty_color_body_bg') ?>;
      }
      
      input[type='text'], input[type='password'], textarea, select, #header #search input {
	background-color: #<?php echo $this->config->get('beauty_color_formbg') ?>;
      }
      
      #header-menu-bg{
	background-color: #<?php echo $this->config->get('beauty_color_headermenu_bg') ?>;
      }
      
      #cboxContent, #box-shadow, #container, #header #cart .content, .htabs a.selected, .box .box-content, .mini-sliders, .mini-ads a {
	background-color: #<?php echo $this->config->get('beauty_color_content_bg') ?>;
      }
      
      #slider-bg, #header #cart .icon:hover, #header #cart .heading, .pagination .links a, a.button, input.button, .product-list .box-product-item .product-list-buttons .pbuttons:hover, .product-list .box-product-item .product-list-buttons .pbuttons .img, .manufacturer-heading, .product-filter .display a, .product-compare, .box-product-buttons .buttons-cart, .box-product-buttons .buttons-wish, .box-product-buttons .buttons-compare, .box-product-buttons .buttons-more  {
	background-color: #<?php echo $this->config->get('beauty_color_buttonbg') ?>;
      }
      
      #currency a, .product-list .box-product-item .product-list-buttons .pbuttons {
	background-color: #<?php echo $this->config->get('beauty_color_buttontextbg') ?>;
      }
      
      #currency a:hover, #currency .active, #currency .active:hover, #header #cart .icon, .pagination .links a:hover, .pagination .links b, a.button:hover, input.button:hover, .product-list .box-product-item .product-list-buttons .pbuttons .img2, .box-product-item .name a, .product-filter .display .active, .product-filter .display a:hover, .product-info .zoom a:hover, .image-additional-wrapper .prev:hover, .image-additional-wrapper .next:hover, .box-heading .prev:hover, .box-heading .next:hover, .box-product-buttons div:hover, .jcarousel-prev-horizontal:hover, .jcarousel-next-horizontal:hover, .flex-control-paging li a:hover, .flex-control-paging li a.flex-active {
	background-color: #<?php echo $this->config->get('beauty_color_buttonhoverbg') ?>;
      }
      .product-list .box-product-item .name a {
	background:none;
      }
      #menu, .htabs a, .box-category > ul > li > a, #menu > ul > li, .mobile-menu-toggle {
	background: #<?php echo $this->config->get('beauty_color_topmenu_end') ?>; /* Old browsers */
	background: -moz-linear-gradient(top,  #<?php echo $this->config->get('beauty_color_topmenu_start') ?> 0%, #<?php echo $this->config->get('beauty_color_topmenu_end') ?> 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#<?php echo $this->config->get('beauty_color_topmenu_start') ?>), color-stop(100%,#<?php echo $this->config->get('beauty_color_topmenu_end') ?>)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  #<?php echo $this->config->get('beauty_color_topmenu_start') ?> 0%,#<?php echo $this->config->get('beauty_color_topmenu_end') ?> 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  #<?php echo $this->config->get('beauty_color_topmenu_start') ?> 0%,#<?php echo $this->config->get('beauty_color_topmenu_end') ?> 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  #<?php echo $this->config->get('beauty_color_topmenu_start') ?> 0%,#<?php echo $this->config->get('beauty_color_topmenu_end') ?> 100%); /* IE10+ */
	background: linear-gradient(to bottom,  #<?php echo $this->config->get('beauty_color_topmenu_start') ?> 0%,#<?php echo $this->config->get('beauty_color_topmenu_end') ?> 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#<?php echo $this->config->get('beauty_color_topmenu_start') ?>', endColorstr='#<?php echo $this->config->get('beauty_color_topmenu_end') ?>',GradientType=0 ); /* IE6-9 */
      }
      
      #menu > ul > li > div {
	background-color: #<?php echo $this->config->get('beauty_color_topmenu_start') ?>;
      }
      
      #menu > ul > li ul > li > a:hover {
	background-color: #<?php echo $this->config->get('beauty_color_topmenu_end') ?>;
      }
      
      table.list thead td, table.radio tr.highlight:hover td, .image-additional-wrapper .prev, .image-additional-wrapper .next, .attribute thead td, .attribute thead tr td:first-child, .compare-info thead td, .compare-info thead tr td:first-child, .wishlist-info thead td, .order-detail, .cart-info thead td, .checkout-heading, .checkout-product thead td, .box-heading .prev, .box-heading .next, .jcarousel-next-horizontal, .jcarousel-prev-horizontal, .flex-control-paging li a {
	background-color:#<?php echo $this->config->get('beauty_color_border') ?>;
      }
      
      .box-product-item, .product-list .box-product-item .image, .product-info .zoom a {
	background-color:#<?php echo $this->config->get('beauty_color_imagebg') ?>;
      }
      
      #footer {
	background-color:#<?php echo $this->config->get('beauty_color_footerbg') ?>;
      }
      
      .footer-about {
	background-color:#<?php echo $this->config->get('beauty_color_aboutbg') ?>;
      }
      
      <?php 
      if ($this->config->get('dx_bg_image') == '1') {
      ?>
      body{
	background-image:url("<?php echo 'image/' . $this->config->get('dx_image') ?>");
      } 	
      <?php   }
	else if ($this->config->get('beauty_body_bg_pattern')!= "no_pattern") { 
      ?>
      body {
	background-image:url("catalog/view/theme/beautyshop/image/bg/<?php echo $this->config->get('beauty_body_bg_pattern');?>.png");
      }
      <?php } ?>
	
	
      <?php 
      if ($this->config->get('dx_full_bg_image') == '1') {
      ?>
      body {
	background:url("<?php echo 'image/' . $this->config->get('dx_full_image') ?>") repeat fixed center top transparent;
      } 	
      <?php   } ?>
      
      <?php 
	
      if ($this->config->get('beauty_transparent_content') == '1') {
          
      ?>
      #container, .box .box-content, .mini-sliders {
	background:none;
	
      }
      #box-shadow, #header #cart .content, .htabs a.selected {
	background:url("catalog/view/theme/beautyshop/image/transparent_bg.png") transparent repeat;
	
      }
      <?php }  ?>
      
      /* font size */
      body, td, th, input, textarea, select, a,#header .links a,.product-info .price-tax, .product-info .price .reward small, .product-info .price .discount, #twitter_update_list {
	font-size:<?php echo $this->config->get('beauty_body_fontsize') ?>px;
      }
      
      .product-info .minimum {
	font-size:<?php echo ($this->config->get('beauty_body_fontsize')-1) ?>px;
      }
      #menu > ul > li > a,.htabs a {
	font-size:<?php echo ($this->config->get('beauty_body_fontsize')+1) ?>px;
      }
      .attribute thead td, .attribute thead tr td:first-child, .compare-info thead td, .compare-info thead tr td:first-child {
	font-size:<?php echo ($this->config->get('beauty_body_fontsize')+2) ?>px;
      }
      .help {
	font-size:<?php echo ($this->config->get('beauty_body_fontsize')-2) ?>px;
      }
      h1, .welcome, .box .box-heading  {
	font-size:<?php echo $this->config->get('beauty_header_fontsize') ?>px;
      }
      #footer h3 {
	font-size:<?php echo ($this->config->get('beauty_header_fontsize')-12) ?>px;
      }
      .manufacturer-heading {
	font-size:<?php echo ($this->config->get('beauty_header_fontsize')-13) ?>px;
      }
      .checkout-heading {
	font-size:<?php echo ($this->config->get('beauty_header_fontsize')-15) ?>px;
      }
      h2, #header #phone b {
	font-size:<?php echo ($this->config->get('beauty_header_fontsize')-10) ?>px;
      }
      .footer-about .text h1, .footer-about .social h1 {
	font-size:<?php echo ($this->config->get('beauty_header_fontsize')-6) ?>px;
      }
      .product-list .box-product-item .name a, .product-list .box-product-item .price {
	font-size:<?php echo ($this->config->get('beauty_buttons_fontsize')+9) ?>px;
      }
      .box-product .name a, .box-product .price {
	font-size:<?php echo ($this->config->get('beauty_buttons_fontsize')+4) ?>px;
      }
      .box-product .price-old {
	font-size:<?php echo ($this->config->get('beauty_buttons_fontsize')+2) ?>px;
      }
      .product-list .box-product-item .product-list-buttons .pbuttons .text,.product-info .zoom a {
	font-size:<?php echo $this->config->get('beauty_buttons_fontsize') ?>px;
      }
      .product-list .box-product-item .price2, .product-info .price {
	font-size:<?php echo ($this->config->get('beauty_buttons_fontsize')+7) ?>px;
      }
      /* font family */
      body, .product-info .price-tax, .product-info .price .reward small, .product-info .price .discount,.htabs a, input {
	font-family:<?php echo $this->config->get('beauty_body_font') ?>;
      }
      
      a.button, input.button,.product-info .zoom a,.product-list .box-product-item .product-list-buttons .pbuttons .text,.box-product .name a, .box-product .price, .product-list .box-product-item .price, .product-info .price {
	font-family:<?php echo $this->config->get('beauty_buttons_font') ?>;
	<?
	$buttons_font_weight = str_replace("italic","",$this->config->get('beauty_buttons_font_weight'));
	if(strlen($buttons_font_weight) < strlen($this->config->get('beauty_buttons_font_weight')))
	{
	  echo 'font-style: italic';
	}
	?>
	font-weight:<?=$buttons_font_weight?>;
	text-transform: <?php echo $this->config->get('beauty_bfonts_transform') ?>;
      }
      
      h1, .welcome, h2,.box .box-heading,#footer h3,.footer-about .social h1 {
	font-family:"<?php echo $this->config->get('beauty_header_font') ?>";
	
	<?
	$header_font_weight = str_replace("italic","",$this->config->get('beauty_header_font_weight'));
	if(strlen($header_font_weight) < strlen($this->config->get('beauty_header_font_weight')))
	{
	  echo 'font-style: italic';
	}
	?>
	font-weight:<?=$header_font_weight?>;
	text-transform: <?php echo $this->config->get('beauty_fonts_transform') ?>;
      }
      /* image sizes */
      .box-product .image {
	height:<?=$this->config->get('beauty_layout_theight')?>px;
      }
      .box-product-item {
	height:<?=($this->config->get('beauty_layout_theight')+79)?>px;
      }
      /* colors */
      body, input, select, textarea, #header #phone span, .mini-cart-info td, .mini-cart-info .name small, table.form > * > * > td, table.list thead td a, .list thead td, .product-filter .sort, .product-filter .limit, .product-info .description, .product-info .price .discount, .product-info .options, .product-info .cart, .product-info .cart div > span, .product-info .review, .footer-about, .footer-about .contact {
	color: #<?=$this->config->get('beauty_color_text')?>;
      }
      
      h1, .welcome {
	color: #<?=$this->config->get('beauty_color_header')?>;
      }
      
      a, a:visited, a b, #header #phone b,.product-list .box-product-item .name a {
	color: #<?=$this->config->get('beauty_color_link')?>;
      }
      
      .product-list .box-product-item .name a:hover  {
	color: #<?=$this->config->get('beauty_color_linkhover')?>;
      }
      
      #header_menu a {
	color: #<?=$this->config->get('beauty_color_headermenu_link')?>;
      }
      
      #currency a, #header #cart .heading a, #header #cart .heading a:hover, .pagination .links a, .pagination .links a:hover, .pagination .links b, a.button, input.button,.product-list .box-product-item .product-list-buttons .pbuttons .text,.box-product .name a, .product-filter .display a, .product-compare a, .product-info .zoom a:hover {
	color: #<?=$this->config->get('beauty_color_buttontext')?>;
      }
      
      .mini-cart-total td, .product-list .box-product-item .price {
	color: #<?=$this->config->get('beauty_color_price')?>;
      }
      
      #menu > ul > li > a, .htabs a, .box-category > ul > li > a, .mobile-menu-toggle {
	color: #<?=$this->config->get('beauty_color_topmenu_link')?>;
      }
      
      #menu > ul > li > a:hover, #menu > ul > li ul > li > a, .htabs a:hover,.htabs a.selected, .box-category > ul > li > a:hover, .box-category > ul > li ul > li > a:hover, .mobile-menu-toggle:hover {
	color: #<?=$this->config->get('beauty_color_topmenu_linkhover')?>;
      }
      
      .box .box-heading {
	color: #<?=$this->config->get('beauty_color_moduleheader')?>;
      }
      
      .box-product .price {
	color: #<?=$this->config->get('beauty_color_pricegrid')?>;
      }
      
      .box-product .price-old, .product-info .price-old, .product-info .price-tax,.product-info .price .reward small, .product-info .minimum, .compare-info .price-old {
	color: #<?=$this->config->get('beauty_color_priceold')?>;
      }
      
      .product-info .zoom a {
	color: #<?=$this->config->get('beauty_color_buttonlink')?>;
      }
      
      #footer h3 {
	color: #<?=$this->config->get('beauty_color_footerheader')?>;
      }
      
      #footer .column a {
	color: #<?=$this->config->get('beauty_color_footerlink')?>;
      }
      
      .footer-about .text h1, .footer-about .social h1 {
	color: #<?=$this->config->get('beauty_color_aboutheader')?>;
      }
      
      #footer {
	color: #<?=$this->config->get('beauty_color_footertext')?>;
      }
      
      #footer #twitter_update_list {
	color: #<?=$this->config->get('beauty_color_footertext')?>;
      }
      
      /* borders */
      input[type='text'], input[type='password'], textarea, select, .welcome-buttons, .footer-about .text, .mini-cart-info td, #menu, #menu > ul > li > div, #menu > ul > li ul > li > a, table.list, table.list td, table.list thead td, .pagination, .buttons, .htabs, .htabs a, .tab-content, .product-list .box-product-item, .box-category, .box-category > ul > li, .box-category > ul > li > ul, .box-category > ul > li ul > li a, #content .content, .manufacturer-list, .product-filter, .product-info .description, .product-info .price, .product-info .options, .product-info .cart, .product-info .review, .product-info .review > div, .review-list, .attribute,.attribute td, .compare-info, .compare-info td, .wishlist-info table, .wishlist-info thead td, .wishlist-info tbody td, .order-list .order-content, .return-list .return-content, .download-list .download-content,.cart-info table, .cart-info thead td, .cart-info tbody td, .cart-total,.checkout-heading,.checkout-product table,.checkout-product thead td,.checkout-product tbody td,.checkout-product tfoot td,.mini-ads a,.box-product-buttons .buttons-cart,.box-product-buttons .buttons-wish,.box-product-buttons .buttons-compare, .mobile-menu-toggle {
	border-color:#<?=($this->config->get('beauty_color_border'))?>;
      }
      
      #menu .separator {
	border-right-color:#<?=($this->config->get('beauty_color_border'))?>;
      }
      #menu .separator {
	border-left-color:#<?=($this->config->get('beauty_color_topmenu_start'))?>;
      }
      #header #cart .content, .product-page .input-qty input {
	border-color:#<?=$this->config->get('beauty_color_buttonbg')?>;
      }
      #menu > ul > li:hover > a, #menu > ul > li ul > li > a:hover, .box-category > ul > li > a:hover {
	border-color:#<?=$this->config->get('beauty_color_link')?>;
      }
      
      /* Custom block */
      
      #menu .custom-topmenu-block {
	width:<?=$this->config->get('beauty_layout_custommenu_block_width')?>px;
	
      }
      
      .sale-badge {
	    background:#<?=$this->config->get('layout_product_showsalebadge_color')?>;
      }
      <?
      $beauty_effects_carousel = $this->config->get('beauty_effects_carousel');

      if($beauty_effects_carousel !== 'enable')
      {
	?>
	.navigate  {
		display:none;
	  
	}
	.caruofredsel {
		height:auto;
	}
	.caruofredsel .box-product-item {
		margin-bottom:10px;
	}
	<?
      }
      ?>
      
      <?
      if($this->config->get('beauty_layout_donthidesliderimages'))
      {
      ?>
      #column-left + #content .mini-ads, #column-right + #content .mini-ads {
	display:block;
      }
      
      #column-left + #content .mini-sliders, #column-right + #content .mini-sliders {
	      display:block;
      }
      
      #column-left + #content .mini-ads, #column-right + #content .mini-ads {
	      display:block;
      }
      
      #column-left + #content .flexslider, #column-right + #content .flexslider {
	      width:492px;
      }
      <?
      }
      ?>
      
       <?
      if($this->config->get('beauty_layout_donthidewelcomeimages'))
      {
      ?>
      #column-left + #column-right + #content .welcome-buttons a:last-child, #column-left + #content .welcome-buttons a:last-child, #column-right + #content .welcome-buttons a:last-child {
	      display: block;
      }
      <?
      }
      ?>
      
      
      <?
      if($this->config->get('beauty_layout_mainmenu_border') == 1)
      {
      ?>
      #menu, #menu > ul > li > div {
	      border-style: dotted;
      }
      <?
      }
      ?>
      
      <?
      if($this->config->get('beauty_layout_mainmenu_border') == 2)
      {
      ?>
      #menu, #menu > ul > li > div {
	      border-style: dashed;
      }
      <?
      }
      ?>
      
</style> 
    <? } ?>
</head>
<body>
  
<?
if(($this->config->get('beauty_status') == '1')&&($this->config->get('beauty_layout_sliderbg') == 'show')&&($this->config->get('beauty_layout_responsive') == 0)) {
?>  
<div id="slider-bg"></div>
<? } ?>
<div id="header-menu-bg"></div>
<div id="header_menu"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a><?php echo $currency; ?></div>
<div id="box-shadow">
<div id="container">
<div id="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  <?
      if(($this->config->get('beauty_status') == '1')&&($this->config->get('contact_status') == 1))
      {
	$contact_subheader = $this->config->get('contact_subheader');
       
	if(empty($contact_subheader))
	{
	  $contact_subheader = 'Call us Monday - Saturday: 8:30 am - 6:00 pm';
	}
	
	$telephone1 = $this->config->get('telephone1');
       
	if(empty($telephone1))
	{
	  $telephone1 = '8(802)234-5678';
	}
	
	echo '<div id="phone"><b>'.$telephone1.'</b><br><span>'.$contact_subheader.'</span></div>';
      }
      
  ?>
 
  
  <div id="search">
 
    <input type="text" name="search" value="<?php echo $text_search; ?>" onclick="this.value = ''" onblur ="this.value = '<?php echo $text_search; ?>'"; />
    
  </div>
  <?php echo $cart; ?>
  
  <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
  <?php echo $language; ?>
</div>
<?
// custom menu show instead
if(($this->config->get('beauty_status') == '1')&&($this->config->get('beauty_layout_custommenu') == 1)&&($this->config->get('beauty_layout_custommenu_position') == 0))
{
?>
<div id="menu" class="clearfix">
      <?
  // custom block
if(($this->config->get('beauty_status') == '1')&&($this->config->get('beauty_layout_custommenu_block') == 1)&&($this->config->get('beauty_layout_custommenu_block_position') == 0))
{

if($this->config->get('beauty_layout_custommenu_block_title')<>'') echo '<li class="li-custom-block"><a>'.$this->config->get('beauty_layout_custommenu_block_title').'</a><div class="custom-topmenu-block"><ul><li>'.html_entity_decode($this->config->get('beauty_layout_custommenu_block_content')).'</li></ul></div></li><li class="separator"></li>';

}
    ?>
  <ul>
<?
if($this->config->get('beauty_layout_custommenu_item1_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item1_url').'">'.$this->config->get('beauty_layout_custommenu_item1_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item2_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item2_url').'">'.$this->config->get('beauty_layout_custommenu_item2_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item3_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item3_url').'">'.$this->config->get('beauty_layout_custommenu_item3_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item4_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item4_url').'">'.$this->config->get('beauty_layout_custommenu_item4_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item5_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item5_url').'">'.$this->config->get('beauty_layout_custommenu_item5_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item6_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item6_url').'">'.$this->config->get('beauty_layout_custommenu_item6_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item7_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item7_url').'">'.$this->config->get('beauty_layout_custommenu_item7_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item8_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item8_url').'">'.$this->config->get('beauty_layout_custommenu_item8_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item9_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item9_url').'">'.$this->config->get('beauty_layout_custommenu_item9_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item10_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item10_url').'">'.$this->config->get('beauty_layout_custommenu_item10_text').'</a></li><li class="separator"></li>';

?>
<?
  // custom block
if(($this->config->get('beauty_status') == '1')&&($this->config->get('beauty_layout_custommenu_block') == 1)&&($this->config->get('beauty_layout_custommenu_block_position') == 1))
{

if($this->config->get('beauty_layout_custommenu_block_title')<>'') echo '<li class="li-custom-block"><a>'.$this->config->get('beauty_layout_custommenu_block_title').'</a><div class="custom-topmenu-block"><ul><li>'.html_entity_decode($this->config->get('beauty_layout_custommenu_block_content')).'</li></ul></div></li><li class="separator"></li>';

}
    ?>
  </ul>
</div>
<?
}
else
{
?>
<?php if ($categories) { ?>
<div id="menu" class="clearfix">
  <ul>
      <?
  // custom block
if(($this->config->get('beauty_status') == '1')&&($this->config->get('beauty_layout_custommenu_block') == 1)&&($this->config->get('beauty_layout_custommenu_block_position') == 0))
{

if($this->config->get('beauty_layout_custommenu_block_title')<>'') echo '<li class="li-custom-block"><a>'.$this->config->get('beauty_layout_custommenu_block_title').'</a><div class="custom-topmenu-block"><ul><li>'.html_entity_decode($this->config->get('beauty_layout_custommenu_block_content')).'</li></ul></div></li><li class="separator"></li>';

}
    ?>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li><li class="separator"></li>
    <?php } ?>
  <?
  // append top menu
if(($this->config->get('beauty_status') == '1')&&($this->config->get('beauty_layout_custommenu') == 1)&&($this->config->get('beauty_layout_custommenu_position') == 1))
{

if($this->config->get('beauty_layout_custommenu_item1_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item1_url').'">'.$this->config->get('beauty_layout_custommenu_item1_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item2_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item2_url').'">'.$this->config->get('beauty_layout_custommenu_item2_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item3_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item3_url').'">'.$this->config->get('beauty_layout_custommenu_item3_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item4_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item4_url').'">'.$this->config->get('beauty_layout_custommenu_item4_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item5_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item5_url').'">'.$this->config->get('beauty_layout_custommenu_item5_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item6_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item6_url').'">'.$this->config->get('beauty_layout_custommenu_item6_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item7_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item7_url').'">'.$this->config->get('beauty_layout_custommenu_item7_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item8_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item8_url').'">'.$this->config->get('beauty_layout_custommenu_item8_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item9_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item9_url').'">'.$this->config->get('beauty_layout_custommenu_item9_text').'</a></li><li class="separator"></li>';
if($this->config->get('beauty_layout_custommenu_item10_text')<>'') echo '<li><a href="'.$this->config->get('beauty_layout_custommenu_item10_url').'">'.$this->config->get('beauty_layout_custommenu_item10_text').'</a></li><li class="separator"></li>';


}
    ?>
    <?
  // custom block
if(($this->config->get('beauty_status') == '1')&&($this->config->get('beauty_layout_custommenu_block') == 1)&&($this->config->get('beauty_layout_custommenu_block_position') == 1))
{

if($this->config->get('beauty_layout_custommenu_block_title')<>'') echo '<li class="li-custom-block"><a>'.$this->config->get('beauty_layout_custommenu_block_title').'</a><div class="custom-topmenu-block"><ul><li>'.html_entity_decode($this->config->get('beauty_layout_custommenu_block_content')).'</li></ul></div></li><li class="separator"></li>';

}
    ?>
  </ul>
</div>
<?php } ?>
<? } //end custom menu?>

<?php if ($categories) { ?>
<div class="mobile-menu-toggle" style="display: none;">Menu <img src="catalog/view/theme/beautyshop/image/toggle.png"></div>
<div class="box mobile-menu" style="display: none;">
  <div class="box-content">
    <div class="box-category">
      <ul>
        <?php foreach ($categories as $category) { ?>
        <li>
        
        
          <?php if ($category['children']) { echo '<div class="menuopen"></div>';}?><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
         
          <?php if ($category['children']) { ?>
          <ul>
            <?php foreach ($category['children'] as $child) { ?>
            <li>
             
              <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
            
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
<?php } ?>

<div id="notification"></div>
