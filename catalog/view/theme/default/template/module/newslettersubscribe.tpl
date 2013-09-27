
<div class="box newsletter">
  <div class="box-heading">Join Our Email List</div>
  <div class="box-content" style="text-align: center;">
  
  
  <div id="frm_subscribe">
  <form name="subscribe" id="subscribe"   >
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
   <tr>
     <td align="right"><input type="text" width="100%" value="" name="subscribe_email" id="subscribe_email"></td>
   </tr>
   <tr style="display:none;">
     <td align="left"><?php echo $entry_name; ?>&nbsp;<br /><input type="text" value="" name="subscribe_name" id="subscribe_name"> </td>
   </tr>
   <?php 
     for($ns=1;$ns<=$option_fields;$ns++) {
     $ns_var= "option_fields".$ns;
   ?>
   <tr>
    <td>
      <?php 
       if($$ns_var!=""){
         echo($$ns_var."&nbsp;<br/>");
         echo('<input type="text" value="" name="option'.$ns.'" id="option'.$ns.'">');
       }
      ?>
     </td>
   </tr>
   <?php 
     }
   ?>
   <tr>
     <td align="right" style="padding:10px 0px;">
     <a class="button" onclick="email_subscribe()">Submit</a>
     <?php if($option_unsubscribe & 0) { ?>
          <a class="button" onclick="email_unsubscribe()" style="margin-top:4px;"><span><?php echo $entry_unbutton; ?></span></a>
      <?php } ?>    
     </td>
   </tr>
   <tr>
     <td align="left" id="subscribe_result"></td>
   </tr>
  </table>
  </form>
  </div>
  

  </div>
  <div class="bottom">&nbsp;</div>
<script language="javascript">
	
function email_subscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}}); 
}
function email_unsubscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}}); 
}
     
</script>
</div>

