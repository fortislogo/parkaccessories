<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><?php echo $entry_unsubscribe; ?></td>
          <td><select name="option_unsubscribe">
              <?php if ($option_unsubscribe) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>

              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_mail; ?> </td>
          <td><select name="newslettersubscribe_mail_status">
              <?php if ($newslettersubscribe_mail_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select> </td>
        </tr>

        <tr>
          <td><?php echo $entry_registered; ?>
          <span class="help"> When you enable this option open cart registered users also can subscribe or un subscribe using this.
          
          </span>
          </td>
          <td><select name="newslettersubscribe_registered">
              <?php if ($newslettersubscribe_registered) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>

<tr>
              <td><?php echo $entry_force; ?></td>
          <td><select name="newslettersubscribe_force">
              <?php if ($newslettersubscribe_force) { ?>
             <option value='1' <?php if ($newslettersubscribe_force == '1') { echo "selected"; } ?>><?php echo $text_yes?></option>
              <option value='0' <?php if ($newslettersubscribe_force == '0') { echo "selected"; } ?>><?php echo $text_no?></option>
		   <option value='2' <?php if ($newslettersubscribe_force == '2') { echo "selected"; } ?>><?php echo $text_closebutton?></option>
              <?php } else { ?>
             <option value="1"><?php echo $text_yes?></option>
              <option value="0" selected="selected"><?php echo $text_no?></option>
		  <option value="2"><?php echo $text_closebutton?></option>
             


              <?php } ?>
            </select> </td>
 </tr> 

<tr>
          <td><?php echo $entry_popupdisplay; ?> </td>
          <td><select name="newslettersubscribe_popupdisplay">
              <?php if ($newslettersubscribe_popupdisplay) { ?>
              <option value="1" selected="selected"><?php echo $text_onetime?>
              <option value="0"><?php echo $text_always?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_onetime?></option>
              <option value="0" selected="selected"><?php echo $text_always?></option>
              <?php } ?>
            </select> </td>
        </tr>
<tr>
          <td><?php echo $entry_popupdelay; ?> </td>
 <td><input type="text" name="newslettersubscribe_popupdelay" value="<?php echo $newslettersubscribe_popupdelay; ?>" /></td>
            </tr>

<tr>
          <td><?php echo $entry_popupheaderimage; ?> </td>
<td><input type="text" name="newslettersubscribe_popupheaderimage" value="<?php echo $newslettersubscribe_popupheaderimage; ?>" /></td>
            </tr>
<tr>

              <td><?php echo $entry_popupline1; ?></td>
<td><textarea name="newslettersubscribe_popupline1" cols="60" rows="3"><?php echo $newslettersubscribe_popupline1; ?></textarea></td>
            </tr> 
<tr>
              <td><?php echo $entry_popupline2; ?></td>
<td><textarea name="newslettersubscribe_popupline2" cols="60" rows="3"><?php echo $newslettersubscribe_popupline2; ?></textarea></td>
            </tr> 
 


        <tr>
          <td><?php echo($entry_options); ?> </td>
          <td> 
          <?php 
            $tmp_option_list = array('Select','1','2','3','4','5','6');
          ?>
          <select name="newslettersubscribe_option_field" onchange="load_options(this.value)">  
              <?php  
                foreach($tmp_option_list as $key=>$opt) {
                  if($newslettersubscribe_option_field == $key){
                    echo("<option value='".$key."' selected='selected'>".$opt."</option>");
                  }else{
                    echo("<option value='".$key."'>".$opt."</option>");
                  }
                }
              ?>                 
                </select> 
          </td>
        </tr>

        <tfoot>
         <?php  for($l=1;$l<=$newslettersubscribe_option_field;$l++){ 
            $field_var = "newslettersubscribe_option_field".$l;
         ?>
            <tr>
              <td> <?php echo("Option".$l); ?> </td>
              <td> 
              <input type='text' name='newslettersubscribe_option_field<?php echo($l); ?>' value='<?php echo($$field_var); ?>'>
               </td>
            </tr>
			


          <?php  }  ?>
        </tfoot>
					
<tr>
          <td><?php echo $entry_msync; ?> </td>
          <td><select name="newslettersubscribe_mailchimp_msync">
              <?php if ($newslettersubscribe_mailchimp_msync) { ?>
              <option value="1" selected="selected"><?php echo $text_yes?>
              <option value="0"><?php echo $text_no?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_yes?></option>
              <option value="0" selected="selected"><?php echo $text_no?></option>
              <?php } ?>
            </select> </td>
        </tr>
		<tr>
          <td><?php echo $entry_mapi; ?> </td>
 <td><input type="text" name="newslettersubscribe_mailchimp_api" value="<?php echo $newslettersubscribe_mailchimp_api; ?>" /></td>
            </tr>
			
			<tr>
          <td><?php echo $entry_mid; ?> </td>
 <td><input type="text" name="newslettersubscribe_mailchimp_fid" value="<?php echo $newslettersubscribe_mailchimp_fid; ?>" /></td>
            </tr>
			<tr>
          <td><?php echo $entry_double_optin; ?> </td>
           <td><select name="newslettersubscribe_mailchimp_optin">
              <?php if ($newslettersubscribe_mailchimp_optin) { ?>
		<option value="1" selected="selected"><?php echo $text_yes?>
              <option value="0"><?php echo $text_no?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_yes?></option>
              <option value="0" selected="selected"><?php echo $text_no?></option>
            <?php } ?>
            </select> </td>          
		  </tr>
			<tr>
          <td><?php echo $entry_mwelcome; ?> </td>
		<td><select name="newslettersubscribe_mailchimp_mwelcome">
              <?php if ($newslettersubscribe_mailchimp_mwelcome) { ?>
              <option value="1" selected="selected"><?php echo $text_yes?>
              <option value="0"><?php echo $text_no?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_yes?></option>
              <option value="0" selected="selected"><?php echo $text_no?></option>
              <?php } ?>
            </select> </td>
          </tr>
			
 <tr>
          <?php echo $text_info; ?> </tr>

      </table>
      <table id="module" class="list">
        <thead>
          <tr><td class="left">type</td>
            <td class="left"><?php echo $entry_layout; ?></td>

            <td class="left"><?php echo $entry_position; ?></td>
            <td class="left"><?php echo $entry_status; ?></td>
            <td class="right"><?php echo $entry_sort_order; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
        <tbody id="module-row<?php echo $module_row; ?>">
          <tr> 

<td class="left"><select name="newslettersubscribe_module[<?php echo $module_row; ?>][type]">
                <?php if ($module['type'] == 'thickbox') { ?>
                <option value="thickbox" selected="selected">thickbox</option>
                <?php } else { ?>
                <option value="thickbox">thickbox</option>
                <?php } ?>
                <?php if ($module['type'] == 'popup') { ?>
                <option value="popup" selected="selected">popup</option>
                <?php } else { ?>
                <option value="popup">popup</option>
                <?php } ?>
                <?php if ($module['type'] == 'normal') { ?>
                <option value="normal" selected="selected">normal</option>
                <?php } else { ?>
                <option value="normal">normal</option>
                <?php } ?>
                <?php if ($module['type'] == 'footer') { ?>
                <option value="footer" selected="selected">footer</option>
                <?php } else { ?>
                <option value="footer">footer</option>
                <?php } ?>

                <?php if ($module['type'] == 'footer2') { ?>
                <option value="footer2" selected="selected">footer2</option>
                <?php } else { ?>
                <option value="footer2">footer2</option>
                <?php } ?>
<?php if ($module['type'] == 'slideright') { ?>
                <option value="slideright" selected="selected">slideright</option>
                <?php } else { ?>
                <option value="slideright">slideright</option>
                <?php } ?>

<?php if ($module['type'] == 'slideleft') { ?>
                <option value="slideleft" selected="selected">slideleft</option>
                <?php } else { ?>
                <option value="slideleft">slideleft</option>
                <?php } ?>

              </select></td>



            <td class="left"><select name="newslettersubscribe_module[<?php echo $module_row; ?>][layout_id]">
                <?php foreach ($layouts as $layout) { ?>
                <?php if($layout['layout_id'] == $module['layout_id']){ ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            <td class="left"><select name="newslettersubscribe_module[<?php echo $module_row; ?>][position]">
                <?php if ($module['position'] == 'content_top') { ?>
                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                <?php } else { ?>
                <option value="content_top"><?php echo $text_content_top; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_bottom') { ?>
                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                <?php } else { ?>
                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_left') { ?>
                <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                <?php } else { ?>
                <option value="column_left"><?php echo $text_column_left; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_right') { ?>
                <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                <?php } else { ?>
                <option value="column_right"><?php echo $text_column_right; ?></option>
                <?php } ?>
              </select></td>
            <td class="left"><select name="newslettersubscribe_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
            <td class="right"><input type="text" name="newslettersubscribe_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order'];  ?>" size="3" /></td>
            <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
          </tr>
        </tbody>
        <?php $module_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="5"></td>
            <td class="left"><a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></td>
          </tr>
        </tfoot>
      </table>
    </form>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
html += '  <tr>';
html += '    <td class="left"><select name="newslettersubscribe_module[' + module_row + '][type]">';
	html += '      <option value="thickbox">thickbox</option>';
	html += '      <option value="popup">popup</option>';
	html += '      <option value="normal">normal</option>';
	html += '      <option value="footer">footer</option>';
	html += '      <option value="footer2">footer2</option>';
html += '      <option value="slideleft">slideleft</option>';
 html += '      <option value="slideright">slideright</option>';
	html += '    </select></td>';

	
	html += '    <td class="left"><select name="newslettersubscribe_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="newslettersubscribe_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="newslettersubscribe_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="newslettersubscribe_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}

$('#form').bind('submit', function() {
	var module = new Array(); 

	$('#module tbody').each(function(index, element) {
		module[index] = $(element).attr('id').substr(10);
	});
	
	$('input[name=\'newslettersubscribe_module\']').attr('value', module.join(','));
});
//--></script>
<script language="javascript">
function load_options(cnt) {
   var html="";
   for(i=1;i<=cnt;i++) {
     html = html + "<tr> <td> Option"+i+"</td><td> <input type='text' name='newslettersubscribe_option_field"+i+"' value=''></td></tr>";
   }	
  $('.form tfoot').html(html);
}
</script>
 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs();
//--></script> 

