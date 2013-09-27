<?php echo $header; ?>
<div id="content" class="contact-us"><div class="wrapper"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  
  <h1><?php echo $heading_title; ?></h1>
  
  <div class="contact-location">
  
  	<?php echo $column_left; ?><?php echo $column_right; ?>
  
  </div>
  
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    
    
    
    
<?
if(($this->config->get('beauty_status') == '1')&&($this->config->get('layout_product_customcontactblock'))) { 
  echo '<div class="contact-info">
     <div class="content">'.html_entity_decode($this->config->get('layout_product_customcontactblock_content')).'</div>
    </div>';
}
?>

     <div class="content">
     
    	<div class="left">
        	<h2>Send Us A Message</h2>
             <p>Use the form on the right to send us a message. We will get back to you within 24 hours. Thank you! </p>
        </div>
        
        <div class="right">
        
        	<table cellpadding="0" cellspacing="0" border="0" width="100%">
            
            	<tr>
                	<td width="30%">First *</td>
                    <td><input type="text" name="firstname" value="<?php echo $firstname; ?>">
                    <?php if ($error_firstname) { ?>
					    <span class="error"><?php echo $error_firstname; ?></span>
    					<?php } ?></td>
                </tr>
                
                <tr>
                	<td>Last *</td>
                    <td><input type="text" name="lastname" value="<?php echo $lastname; ?>">
                    <?php if ($error_lastname) { ?>
					    <span class="error"><?php echo $error_lastname; ?></span>
    					<?php } ?></td>
                </tr>
                
               
                
                <tr>
                	<td>Phone *</td>
                    <td><input type="text" name="phone" value="<?php echo $phone ?>">
                    <?php if ($error_phone) { ?>
					    <span class="error"><?php echo $error_phone; ?></span>
    					<?php } ?></td>
                </tr>
                
                <tr>
                	<td>Email *</td>
                    <td>
                    	<input type="text" name="email" value="<?php echo $email; ?>">
                        <?php if ($error_email) { ?>
					    <span class="error"><?php echo $error_email; ?></span>
    					<?php } ?>
                    </td>
                </tr>
                
                <tr>
                	<td>Message *</td>
                    <td>
                    	<textarea name="enquiry" rows="10"><?php echo $enquiry; ?></textarea>
                        <?php if ($error_enquiry) { ?>
				    	<span class="error"><?php echo $error_enquiry; ?></span>
					    <?php } ?>
                    </td>
                </tr>
                
                <tr>
                	<td colspan="2">
                    	Type the characters you see in the picture:<br /><br />
                        <img src="index.php?route=information/contact/captcha" alt="" style="margin-right:10px; vertical-align:top;" /><input type="text" name="captcha" style="width:100px;" value="<?php echo $captcha; ?>" />
                        <?php if ($error_captcha) { ?>
				    	<span class="error"><?php echo $error_captcha; ?></span>
					    <?php } ?>
                    </td>
                    
                </tr>
            
            </table>
			
            
		      <input type="submit" value="Submit" class="button" />
		    
        
        </div>
    </div>
    
    
    
  </form>
  <?php echo $content_bottom; ?></div></div>
<script type="text/javascript"><!--
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=222' ,
		dataType: 'json',		
		success: function(json) {
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') 
			{

				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
//--></script>   


<script language="javascript1.1">  
$(document).ready(function()
{						   
	$('.contact-location a.emailus').fancybox(
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