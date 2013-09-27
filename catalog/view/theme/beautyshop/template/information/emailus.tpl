


<div id="content" class="emailus">
  
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
   
    <div class="content">
    	<table cellpadding="0" cellspacing="0" border="0" width="100%">
        	<tr>
            	<td>
                	<b><?php echo $entry_name; ?></b><br />
	    			<input type="text" name="name" value="<?php echo $name; ?>" />
                    <input type="hidden" name="sentTo" value="<?php echo $sentTo; ?>">
                    <?php if ($error_name) { ?>
				    <span class="error"><?php echo $error_name; ?></span>
				    <?php } ?>
                </td>    
                <td>
                	<b><?php echo $entry_email; ?></b><br />
				    <input type="text" name="email" value="<?php echo $email; ?>" />
				    <?php if ($error_email) { ?>
				    <span class="error"><?php echo $error_email; ?></span>
				    <?php } ?>
                </td>
            </tr>
            <tr>
            	<td colspan="2">
                	<b><?php echo $entry_enquiry; ?></b><br />
				    <textarea name="enquiry" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
				    <?php if ($error_enquiry) { ?>
				    <span class="error"><?php echo $error_enquiry; ?></span>
				    <?php } ?>
                </td>
            </tr>
            <tr>
            	<td colspan="2">
                	<b><?php echo $entry_captcha; ?></b><br />
				    <img src="index.php?route=information/contact/captcha" alt="" align="top" /> <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
				    <?php if ($error_captcha) { ?>
				    <span class="error"><?php echo $error_captcha; ?></span>
				    <?php } ?>
                </td>
            </tr>
            <tr>
            	<td colspan="2" style="padding:10px 0px; text-align:right;">
                	<input type="submit" value="<?php echo $button_continue; ?>" class="button" />
                </td>
            </tr>
        </table>
    
    </div>
  </form>
</div>
<script language="javascript1.1">
$(document).ready(function() 
{
    $(".emailus form").ajaxForm({
        success: function(responseText){
            $.fancybox({
                'content' : responseText
            });
        }
    }); 
});
</script>