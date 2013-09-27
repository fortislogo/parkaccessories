</div>
<div id="footer-container">
 <?php 
$displayCustomFooter =  $this->config->get('customFooter_status');

// Show custom footer
if($displayCustomFooter == 1) {
?>
<?php
// Show about
if ($this->config->get('about_status') == '1') {
  
  // Twitter
  $TWIITER_USERNAME = $this->config->get('twitter_username');
  
  if($TWIITER_USERNAME <> '')
  {
    $TWITTER_HTML = '<a href="http://twitter.com/'.$TWIITER_USERNAME.'" class="soc-img"><img class="fade-image" src="catalog/view/theme/beautyshop/image/social/twitter.png"></a>';
  }
  else
  {
    $TWITTER_HTML = '';
  }
  
  // Facebook
  $FB_USERNAME = $this->config->get('facebook_id');
  
  if($FB_USERNAME <> '')
  {
    $FB_HTML = '<a href="http://facebook.com/pages/dx/'.$FB_USERNAME.'" class="soc-img"><img class="fade-image" src="catalog/view/theme/beautyshop/image/social/facebook.png"></a>';
  }
  else
  {
    $FB_HTML = '';
  }
  
  // Skype
  $SKYPE_USERNAME = $this->config->get('skype');
  
  if($SKYPE_USERNAME <> '')
  {
    $SKYPE_HTML = '<a href="skype://'.$SKYPE_USERNAME.'" class="soc-img"><img class="fade-image" src="catalog/view/theme/beautyshop/image/social/skype.png"></a>';
  }
  else
  {
    $SKYPE_HTML = '';
  }
  
  // YouYube
  $YOUTUBE_URL = $this->config->get('social_icons_youtube_url');
  
  if($YOUTUBE_URL <> '')
  {
    $YOUTUBE_HTML = '<a href="'.$YOUTUBE_URL.'" class="soc-img"><img class="fade-image" src="catalog/view/theme/beautyshop/image/social/youtube.png"></a>';
  }
  else
  {
    $YOUTUBE_HTML = '';
  }
  
  // Pinterest
  $PINTEREST_URL = $this->config->get('social_icons_pinterest_url');
  
  if($PINTEREST_URL <> '')
  {
    $PINTEREST_HTML = '<a href="'.$PINTEREST_URL.'" class="soc-img"><img class="fade-image" src="catalog/view/theme/beautyshop/image/social/pinterest.png"></a>';
  }
  else
  {
    $PINTEREST_HTML = '';
  }
  
  // Google+
  $GOOGLEPLUS_URL = $this->config->get('social_icons_googleplus_url');
  
  if($GOOGLEPLUS_URL <> '')
  {
    $GOOGLEPLUS_HTML = '<a href="'.$GOOGLEPLUS_URL.'" class="soc-img"><img class="fade-image" src="catalog/view/theme/beautyshop/image/social/google-plus.png"></a>';
  }
  else
  {
    $GOOGLEPLUS_HTML = '';
  }
  
  // RSS
  $RSS_URL = $this->config->get('social_icons_rss_url');
  
  if($RSS_URL <> '')
  {
    $RSS_HTML = '<a href="'.$RSS_URL.'" class="soc-img"><img class="fade-image" src="catalog/view/theme/beautyshop/image/social/rss.png"></a>';
  }
  else
  {
    $RSS_HTML = '';
  }
  
?>
<div class="footer-about">
      <?php
if($this->config->get('about_us_image_status') == '1'){
        echo ' <style type="text/css">.footer-about .text {
	width:435px; } </style>';
	echo '<div class="mini-logo"><img alt ="About" src="image/'.$this->config->get('about_us_image') . '"/></div>';
}
?>
  <div class="text"><h1><?=$this->config->get('about_header');?></h1>
    <?=html_entity_decode($this->config->get('about_text'));?>	
</div>
  <div class="social">
    
    <?=$FB_HTML?>
    <?=$TWITTER_HTML?>
    <?=$PINTEREST_HTML?>
    <?=$GOOGLEPLUS_HTML?>
    <?=$YOUTUBE_HTML?>
    <?=$RSS_HTML?>
    <?=$SKYPE_HTML?>
    <div class="contact">
      <div class="phone"><?php if ($this->config->get('telephone1')) { echo '<b>Phone:</b> '.$this->config->get('telephone1'); }?><?php if ($this->config->get('telephone2')) { echo ', '.$this->config->get('telephone2'); }?></div>
      <div class="fax"><?php if ($this->config->get('fax')) { echo '<b>Fax:</b> '.$this->config->get('fax'); }?></div>
      <div class="email"><?php if ($this->config->get('email1')) { echo '<a href="mailto:'.$this->config->get('email1').'">'.$this->config->get('email1').'</a>'; }?></div>
      <div class="email"><?php if ($this->config->get('email2')) { echo '<a href="mailto:'.$this->config->get('email2').'">'.$this->config->get('email2').'</a>'; }?></div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<? }
// About end
?>


<? }
// Custom footer end
?>


<div id="footer">
  <?php if ($informations) { ?>
  <div class="column">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <?php } ?>
  <div class="column">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  <?php
  // TWITTER WIDGET
  if(($this->config->get('twitter_column_status') == '1')&&($displayCustomFooter == 1)) { ?>
  <div class="column">
  <h3><?php echo $this->config->get('twitter_column_header'); ?></h3>
  <script type="text/javascript">
  function format_twitter(twitters) {
var statusHTML = [];
for (var i=0; i<twitters.length; i++){
var username = twitters[i].user.screen_name;
var status = twitters[i].text.replace(/((https?|s?ftp|ssh)\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!])/g, function(url) {
return '<a href="'+url+'">'+url+'</a>';
}).replace(/\B@([_a-z0-9]+)/ig, function(reply) {
return reply.charAt(0)+'<a href="http://twitter.com/'+reply.substring(1)+'">'+reply.substring(1)+'</a>';
});
statusHTML.push('<li><span>'+status+'</span> <a href="http://twitter.com/'+username+'/statuses/'+twitters[i].id_str+'">'+'</a></li>');
}
return statusHTML.join('');
}
  </script>
  <script type="text/javascript">
jQuery(document).ready(function($){
$.getJSON('http://api.twitter.com/1/statuses/user_timeline/<?php echo $this->config->get('twitter_username') ; ?>.json?count=<?php echo $this->config->get('twitter_number_of_tweets') ; ?>&callback=?', function(tweets){
$("#twitter_update_list").html(format_twitter(tweets));
});
});
</script>
  
    <ul id="twitter_update_list"></ul>
  </div>
  <? } else {  ?>
  <div class="column">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
  <? } ?>
   <?php
if (($this->config->get('facebook_status') == '1')&&($displayCustomFooter == 1)) {
	?>
  <div class="column">
    <h3>FACEBOOK</h3>
  <!-- Facebook -->
    <style type="text/css">
 .facebookOuter {
    background-color:transparent; 
    
    padding:0px;
    
    border:none;
  }
 .facebookInner {
    
    overflow:hidden;
  }
  
</style>

<div class="facebookOuter">
 <div class="facebookInner">
  <div class="fb-like-box" data-href="http://www.facebook.com/pages/dx/<?php echo $this->config->get('facebook_id'); ?>" data-width="200" data-height="100" data-show-faces="false" data-colorscheme="dark" data-stream="false" data-border-color="transparent" data-header="false"></div>       
 </div>
</div>
           
<div id="fb-root"></div>

<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>

    <!-- / Facebook -->
    
  </div>
  <? } else { ?>
  
  <style type="text/css">#footer .column  {
	width:25%; } </style>
  <? }?>
</div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<div id="powered"><?php
if(($this->config->get('beauty_status') == '1')&&(trim($this->config->get('footer_powered_text')) <> '')) {
 echo html_entity_decode($this->config->get('footer_powered_text'));
}
else
{
 echo $powered;
}

?>
</div>
<div id="paymenticons">
<?
if(($this->config->get('beauty_status') == '1')&&($this->config->get('payment_icons_enabled') == 1)) {
?>
<?
if($this->config->get('dx_paymenticon_custom')) {echo '<a target="_blank" href="'.$this->config->get('dx_paymenticon_custom_url').'"><img src="image/'.$this->config->get('dx_paymenticon_image').'" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_paypal')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_paypal_url').'"><img src="catalog/view/theme/beautyshop/image/payment/paypal.gif" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_visa')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_visa_url').'"><img src="catalog/view/theme/beautyshop/image/payment/visa.gif" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_mastercard')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_mastercard_url').'"><img src="catalog/view/theme/beautyshop/image/payment/mastercard.gif" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_discover')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_discover_url').'"><img src="catalog/view/theme/beautyshop/image/payment/discover.gif" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_amex')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_amex_url').'"><img src="catalog/view/theme/beautyshop/image/payment/amex.gif" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_moneybookers')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_moneybookers_url').'"><img src="catalog/view/theme/beautyshop/image/payment/moneybookers.gif" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_westernunion')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_westernunion_url').'"><img src="catalog/view/theme/beautyshop/image/payment/westernunion.gif" align="absmiddle"></a>'; }
?>
<?
}
?>
</div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<div class="clear"></div>
</div>
</div>
</body></html>