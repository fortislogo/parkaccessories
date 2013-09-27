<?php
// ------------------------------------------
// Follow Me for Opencart v1.5.2+ 
// Original by KangDJ
// Updated by villagedefrance (V2) 
// Updated by HelderIM (V3) 
// ------------------------------------------
?>

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
		<div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
			<a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a>
		</div>
	</div>
	<div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<table class="form">
			<?php foreach ($languages as $language) { ?>
				<tr>
					<td><?php echo $entry_title; ?></td>
					<td colspan="4"> 
						<input type="text" name="followme_title<?php echo $language['language_id']; ?>" id="followme_title<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'followme_title' . $language['language_id']}; ?>" />
						<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
					</td>
				</tr>
			<?php } ?>
				<tr>
					<td><?php echo $entry_header; ?></td>
					<td colspan="4"> 
						<?php if($followme_header) {
						$checked1 = ' checked="checked"';
						$checked0 = '';
						} else {
						$checked1 = '';
						$checked0 = ' checked="checked"';
						} ?>
						<label for="followme_header_1"><?php echo $entry_yes; ?></label>
						<input type="radio"<?php echo $checked1; ?> id="followme_header_1" name="followme_header" value="1" />
						<label for="followme_header_0"><?php echo $entry_no; ?></label>
						<input type="radio"<?php echo $checked0; ?> id="followme_header_0" name="followme_header" value="0" />
					</td>
				</tr>
				<tr> 
					<td><?php echo $entry_icon; ?></td> 
					<td colspan="4">  
						<?php if($followme_icon) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="followme_icon_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="followme_icon_1" name="followme_icon" value="1" /> 
					<label for="followme_icon_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="followme_icon_0" name="followme_icon" value="0" /> 
					</td> 
				</tr>
				<tr> 
					<td><?php echo $entry_box; ?></td> 
					<td> 
						<?php if($followme_box) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="followme_box_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="followme_box_1" name="followme_box" value="1" /> 
					<label for="followme_box_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="followme_box_0" name="followme_box" value="0" /> 
					</td> 
					<td colspan="2">
						<?php echo $entry_box_usage; ?>
					</td> 
				</tr>
                
                <tr>
					<td><?php echo $entry_instagram; ?></td>
					<td><input name="followme_instagram" type="text" size="40" maxlength="40" value="<?php echo $followme_instagram; ?>"> 
					</td>
					<td>
                    	<div class="image"><img src="<?php echo $followme_instagram_thumb; ?>" alt="" id="followme_instagram_thumb" /><br />
                  		<input type="hidden" name="followme_instagram_image" value="<?php echo $followme_instagram_image; ?>" id="followme_instagram_image" />
                  		<a onclick="image_upload('followme_instagram_image', 'followme_instagram_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#followme_instagram_thumb').attr('src', '<?php echo $no_image; ?>'); $('#followme_instgram_image').attr('value', '');"><?php echo $text_clear; ?></a></div>
                    </td>
					<td><?php echo $entry_instagram_usage; ?></td> 
					<td> 
						<?php if($followme_instagram_usage) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="followme_instagram_usage_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="followme_instagram_usage_1" name="followme_instagram_usage" value="1" /> 
					<label for="followme_instagram_usage_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="followme_instagram_usage_0" name="followme_instagram_usage" value="0" /> 
					</td> 
				</tr>
				
                <tr>
					<td><?php echo $entry_facebook; ?></td>
					<td><input name="followme_facebook" type="text" size="40" maxlength="40" value="<?php echo $followme_facebook; ?>"> 
					</td>
					<td>
                    	<div class="image"><img src="<?php echo $followme_facebook_thumb; ?>" alt="" id="followme_facebook_thumb" /><br />
                  		<input type="hidden" name="followme_facebook_image" value="<?php echo $followme_facebook_image; ?>" id="followme_facebook_image" />
                  		<a onclick="image_upload('followme_facebook_image', 'followme_facebook_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#followme_facebook_thumb').attr('src', '<?php echo $no_image; ?>'); $('#followme_facebook_image').attr('value', '');"><?php echo $text_clear; ?></a></div>
                    </td>
					<td><?php echo $entry_facebook_usage; ?></td> 
					<td> 
						<?php if($followme_facebook_usage) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="followme_facebook_usage_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="followme_facebook_usage_1" name="followme_facebook_usage" value="1" /> 
					<label for="followme_facebook_usage_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="followme_facebook_usage_0" name="followme_facebook_usage" value="0" /> 
					</td> 
				</tr>
                
				<tr>
					<td><?php echo $entry_twitter; ?></td>
					<td><input name="followme_twitter" type="text" size="40" maxlength="40" value="<?php echo $followme_twitter; ?>"> 
					</td>
					<td>
                    	<div class="image"><img src="<?php echo $followme_twitter_thumb; ?>" alt="" id="followme_twitter_thumb" /><br />
                  		<input type="hidden" name="followme_twitter_image" value="<?php echo $followme_twitter_image; ?>" id="followme_twitter_image" />
                  		<a onclick="image_upload('followme_twitter_image', 'followme_twitter_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#followme_twitter_thumb').attr('src', '<?php echo $no_image; ?>'); $('#followme_twitter_image').attr('value', '');"><?php echo $text_clear; ?></a></div>
                    </td>
					<td><?php echo $entry_twitter_usage; ?></td> 
					<td> 
						<?php if($followme_twitter_usage) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="followme_twitter_usage_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="followme_twitter_usage_1" name="followme_twitter_usage" value="1" /> 
					<label for="followme_twitter_usage_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="followme_twitter_usage_0" name="followme_twitter_usage" value="0" /> 
					</td> 
				<tr>
				<tr>
					<td><?php echo $entry_google; ?></td>
					<td><input name="followme_google" type="text" size="40" maxlength="40" value="<?php echo $followme_google; ?>"> 
					</td>
					<td>
                    	<div class="image"><img src="<?php echo $followme_google_thumb; ?>" alt="" id="followme_google_thumb" /><br />
                  		<input type="hidden" name="followme_google_image" value="<?php echo $followme_google_image; ?>" id="followme_google_image" />
                  		<a onclick="image_upload('followme_google_image', 'followme_google_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#followme_google_thumb').attr('src', '<?php echo $no_image; ?>'); $('#followme_google_image').attr('value', '');"><?php echo $text_clear; ?></a></div>
                    </td>
					<td><?php echo $entry_gplus_usage; ?></td> 
					<td> 
						<?php if($followme_gplus_usage) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="followme_gplus_usage_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="followme_gplus_usage_1" name="followme_gplus_usage" value="1" /> 
					<label for="followme_gplus_usage_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="followme_gplus_usage_0" name="followme_gplus_usage" value="0" /> 
					</td> 
				<tr>
				<tr>
					<td><?php echo $entry_linkedin; ?></td>
					<td><input name="followme_linkedin" type="text" size="40" maxlength="40" value="<?php echo $followme_linkedin; ?>"> 
					</td>
					<td>
                    	<div class="image"><img src="<?php echo $followme_linkedin_thumb; ?>" alt="" id="followme_linkedin_thumb" /><br />
                  		<input type="hidden" name="followme_linkedin_image" value="<?php echo $followme_linkedin_image; ?>" id="followme_linkedin_image" />
                  		<a onclick="image_upload('followme_linkedin_image', 'followme_linkedin_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#followme_linkedin_thumb').attr('src', '<?php echo $no_image; ?>'); $('#followme_linkedin_image').attr('value', '');"><?php echo $text_clear; ?></a></div>
                    </td>
					<td><?php echo $entry_linkedin_usage; ?></td> 
					<td> 
						<?php if($followme_linkedin_usage) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="followme_linkedin_usage_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="followme_linkedin_usage_1" name="followme_linkedin_usage" value="1" /> 
					<label for="followme_linkedin_usage_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="followme_linkedin_usage_0" name="followme_linkedin_usage" value="0" /> 
					</td> 
				<tr>
				<tr>
					<td><?php echo $entry_pinterest; ?></td>
					<td><input name="followme_pinterest" type="text" size="40" maxlength="40" value="<?php echo $followme_pinterest; ?>"> 
					</td>
					<td>
                    	<div class="image"><img src="<?php echo $followme_pinterest_thumb; ?>" alt="" id="followme_pinterest_thumb" /><br />
                  		<input type="hidden" name="followme_pinterest_image" value="<?php echo $followme_pinterest_image; ?>" id="followme_pinterest_image" />
                  		<a onclick="image_upload('followme_pinterest_image', 'followme_pinterest_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#followme_pinterest_thumb').attr('src', '<?php echo $no_image; ?>'); $('#followme_pinterest_image').attr('value', '');"><?php echo $text_clear; ?></a></div>
                    </td>
					<td><?php echo $entry_pinterest_usage; ?></td> 
					<td> 
						<?php if($followme_pinterest_usage) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="followme_pinterest_usage_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="followme_pinterest_usage_1" name="followme_pinterest_usage" value="1" /> 
					<label for="followme_pinterest_usage_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="followme_pinterest_usage_0" name="followme_pinterest_usage" value="0" /> 
					</td> 
				<tr>
				<tr>
					<td><?php echo $entry_hyves; ?></td>
					<td><input name="followme_hyves" type="text" size="40" maxlength="40" value="<?php echo $followme_hyves; ?>"> 
					</td>
					<td>
                    	<div class="image"><img src="<?php echo $followme_hyves_thumb; ?>" alt="" id="followme_hyves_thumb" /><br />
                  		<input type="hidden" name="followme_hyves_image" value="<?php echo $followme_hyves_image; ?>" id="followme_hyves_image" />
                  		<a onclick="image_upload('followme_hyves_image', 'followme_hyves_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#followme_hyves_thumb').attr('src', '<?php echo $no_image; ?>'); $('#followme_hyves_image').attr('value', '');"><?php echo $text_clear; ?></a></div>
                    </td>
					<td><?php echo $entry_hyves_usage; ?></td> 
					<td> 
						<?php if($followme_hyves_usage) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="followme_hyves_usage_1"><?php echo $entry_yes; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="followme_hyves_usage_1" name="followme_hyves_usage" value="1" /> 
					<label for="followme_hyves_usage_0"><?php echo $entry_no; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="followme_hyves_usage_0" name="followme_hyves_usage" value="0" /> 
					</td> 
				<tr>
				<tr>
					<td><?php echo $entry_template; ?></td>
					<td colspan="4"> 
						<?php foreach ($templates as $template) { ?>
							<?php if ($template == $config_template) { ?>
								<span style='color: #336600; padding: 0 5px;'><b><?php echo $template; ?></b></span> 
							<?php } ?>
						<?php } ?>	
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<b><?php echo $text_module_settings; ?></b>
					</td>
				</tr>
		</table>
        
		<table id="module" class="list">
			<thead>
				<tr>
					<td class="left"><?php echo $entry_layout; ?></td>
					<td class="left"><?php echo $entry_position; ?></td>
					<td class="left"><?php echo $entry_status; ?></td>
					<td class="center"><?php echo $entry_sort_order; ?></td>
					<td></td>
				</tr>
			</thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
			<tbody id="module-row<?php echo $module_row; ?>">
				<tr>
					<td class="left"><select name="followme_module[<?php echo $module_row; ?>][layout_id]">
					<?php foreach ($layouts as $layout) { ?>
						<?php if ($layout['layout_id'] == $module['layout_id']) { ?>
							<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
						<?php } ?>
					<?php } ?>
					</select></td>
					<td class="left"><select name="followme_module[<?php echo $module_row; ?>][position]">
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
					<td class="left"><select name="followme_module[<?php echo $module_row; ?>][status]">
					<?php if ($module['status']) { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select></td>
					<td class="center">
						<input type="text" name="followme_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" />
					</td>
					<td class="center">
						<a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a>
					</td>
				</tr>
			</tbody>
        <?php $module_row++; ?>
        <?php } ?>
			<tfoot>
				<tr>
					<td colspan="4"></td>
					<td class="center"><a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></td>
				</tr>
			</tfoot>
		</table>
    </form>
	</div>
		<br>
		<div style="text-align:center; color:#555555;">Follow Me V3 - v<?php echo $followme_version; ?></div>
		<br>
		<div style="text-align:center; color:#666666;">Credits to KangDJ for the original version and <a href="http://www.villagedefrance.net" target="_blank">villagedefrance</a> for the second version.</div>
</div>
<?php echo $footer; ?>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="followme_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="followme_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="followme_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="center"><input type="text" name="followme_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="center"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
