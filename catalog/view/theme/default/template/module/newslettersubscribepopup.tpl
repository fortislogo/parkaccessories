<?php if (!isset($_COOKIE["pursub"]) || 1): ?>

<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/fancybox/newslettersubscribepopup.css" media="screen" />

<script type="text/javascript" src="catalog/view/javascript/jquery/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<a id="subscribepopup" href="#subscribeformpopup"></a>



<div style="display:none">
<form id="subscribeformpopup" name="subscribeformpopup" method="post" action="">
<div class="newspopup">

	<div class="line1"><?php echo $popupline1; ?></div>
	<div class="line2"><?php echo str_replace("\n", "<br />", $popupline2); ?></div>

	<div style="text-align:center"> 
		<span><label><?php echo $entry_name; ?></label><input type="text" id="subscribe_name" name="subscribe_name"></span>		
		<span><label><?php echo $entry_email; ?></label><input type="text" id="subscribe_email" name="subscribe_email"></span>
	</div>
	
 


<p>
<?php 
     for($ns=1;$ns<=$option_fields;$ns++) {
     $ns_var= "option_fields".$ns;
   ?>

      <?php 
       if($$ns_var!=""){
         echo($$ns_var."&nbsp;");

         echo('<input type="text" value="" size="50" name="option'.$ns.'" id="option'.$ns.'">');
echo "<br />";
       }
      ?>
     
   <?php 
     }
   ?>
   
</p><div style="text-align:center"> 
		
		<input type="submit" value="<?php echo $entry_button; ?>">
</div>


</div>




</form>
</div>
<?php if ($popupdisplay==1): ?>
<?php setcookie("pursub","pursub", time()+3600*24*7); ?>
  <?php endif; ?>

<script type="text/javascript">jQuery(document).ready(function() {
															   
   
     
    
    setTimeout( function() {$("#subscribepopup").trigger('click'); },<?php echo $popupdelay; ?>);
   });  

<?php if ($force==1): ?>
$("#subscribepopup").fancybox({
    'scrolling'        : 'no',
    'titleShow'        : false,
'modal' :true,
});
<?php elseif ($force==0): ?>
$("#subscribepopup").fancybox({
    'scrolling'        : 'no',
    'titleShow'        : false,

});
<?php else : ?>
$("#subscribepopup").fancybox({
    'scrolling'        : 'no',
    'titleShow'        : false,
      'hideOnOverlayClick':false,
      'hideOnContentClick':false
});
<?php endif; ?>


$("#subscribeformpopup").bind("submit", function() {
  $.post('<?php echo $home; ?>', { subscribe_email: $('#subscribeformpopup input[name="subscribe_email"]').val(), subscribe_name: $('#subscribeformpopup input[name="subscribe_name"]').val()}, function(data) {
      if (data) {
        if (data.type == 'success') {
          $('#subscribeformpopup input[name="subscribe_email"]').val('');
          $('#subscribeformpopup input[name="subscribe_name"]').val('');
 
        }
        $('#subscribeformpopup').before('<div class="' + data.type + '">' + data.message + '</div>');
        $('div.' + data.type).delay(3000).slideUp(400, function(){if($(this).hasClass('success')){$.fancybox.close();}$(this).remove();});
     	
 //$.cookie('pursub', 'pursub', { expires: 7 });
 

	 } else {
        $('#subscribeformpopup input[name="subscribe_email"]').focus();
      }
    }, "json");

  return false;
});

$('.newspopup input').bind('click, focus', function()
{
	var par = $(this).parent().find('label').hide();
});

$('.newspopup input').bind('mouseout', function()
{
	if ($(this).val() == '')
		$(this).parent().find('label').show();
});


</script>
<?php endif; ?>