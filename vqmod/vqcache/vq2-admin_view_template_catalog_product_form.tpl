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
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      
                <div id="tabs" class="htabs">
                      <a href="#tab-general"><?php echo $tab_general; ?></a>
                      <a href="#tab-data"><?php echo $tab_data; ?></a>
                      <a href="#tab-links"><?php echo $tab_links; ?></a>
                      <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
                      <a href="#tab-stock"><?php echo $tab_stock; ?></a>
                      <a href="#tab-option" class="isStockCont"><?php echo $tab_option; ?></a>
                      <a href="#tab-option-stock" class="isStockCont"><?php echo $tab_option_stock; ?></a>
                      <!-- IF THE TABS SHOULD BE HIDDEN FOR OPTIONS  class="notStockCont" -->
                      <a href="#tab-discount" class="notStockCont"><?php echo $tab_discount; ?></a>
                      <a href="#tab-special" class="notStockCont"><?php echo $tab_special; ?></a>
                      <a href="#tab-image"><?php echo $tab_image; ?></a>
                      <a href="#tab-reward"><?php echo $tab_reward; ?></a>
                      <a href="#tab-design"><?php echo $tab_design; ?></a>
                  </div>
            
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <div id="languages" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="language<?php echo $language['language_id']; ?>">
            <table class="form">
              
              <tr>
                <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
                  <?php } ?></td>
              </tr>
              
              <tr>
                <td>Custom Title 1:</td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][custom_title_1]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['custom_title_1'] : ''; ?>" /></td>
              </tr>
              <tr>
                <td>Custom Title 2:</td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][custom_title_2]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['custom_title_2'] : ''; ?>" /></td>
              </tr>
              
              <tr>
<td><?php echo $entry_custom_title; ?></td>
			<td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][custom_title]" size="100" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['custom_title'] : ''; ?>" /></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_description; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_keyword; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_description; ?></td>
                <td><textarea name="product_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_tag; ?></td>
                <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" size="80" /></td>
              </tr>
            </table>
          </div>
          <?php } ?>
        </div>
        <div id="tab-data">
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_model; ?></td>
              <td><input type="text" name="model" value="<?php echo $model; ?>" />
                <?php if ($error_model) { ?>
                <span class="error"><?php echo $error_model; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
               <td></td><td></td> 

            </tr>
            <tr>
              <td><?php echo $entry_upc; ?></td>
              <td><input type="text" name="upc" value="<?php echo $upc; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_ean; ?></td>
              <td><input type="text" name="ean" value="<?php echo $ean; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_jan; ?></td>
              <td><input type="text" name="jan" value="<?php echo $jan; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_isbn; ?></td>
              <td><input type="text" name="isbn" value="<?php echo $isbn; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_mpn; ?></td>
              <td><input type="text" name="mpn" value="<?php echo $mpn; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_location; ?></td>
              <td><input type="text" name="location" value="<?php echo $location; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_price; ?></td>
              <td><input type="text" name="price" value="<?php echo $price; ?>" /></td>
            </tr>

<?php if ($this->user->hasPermission('access', 'module/adv_profit_reports')) { ?>				
		  <tr>
            <td><?php echo $entry_cost; ?></td>
            <td>
<script type="text/javascript">
function totalcost() {
	if (document.getElementById('form').cost_amount.value != '' && document.getElementById('form').cost_amount.value >= '0') {
		if (document.getElementById('form').cost_percentage.value != '' && document.getElementById('form').cost_percentage.value >='0') {
			if (document.getElementById('form').cost_additional.value != '' && document.getElementById('form').cost_additional.value >='0') {
				var totalcost = parseFloat(document.getElementById('form').cost_amount.value) + parseFloat((document.getElementById('form').cost_percentage.value / 100)*document.getElementById('form').price.value) + parseFloat(document.getElementById('form').cost_additional.value)
				document.getElementById('form').cost.value = totalcost
			}
		}
	}
}
</script>           
  <table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td nowrap="nowrap"><input onKeyUp="totalcost(this.form);" type="text" name="cost" value="<?php echo $cost; ?>" style="text-align:right; background-color: #ffd7d7; border: thin solid #999;" /></td>
    <td width="40" align="center" nowrap="nowrap">=</td>
    <td nowrap="nowrap"><input onKeyUp="totalcost(this.form); if(!this.value) this.value=0; totalcost(this.form);" type="text" name="cost_amount" value="<?php echo $cost_amount; ?>" style="border: thin solid #999;" /></td>
    <td width="50" align="center" nowrap="nowrap"><?php echo $text_cost_or; ?></td>
    <td nowrap="nowrap"><input onKeyUp="totalcost(this.form); if(!this.value) this.value=0; totalcost(this.form);" type="text" name="cost_percentage" maxlength="5" value="<?php echo $cost_percentage; ?>" style="border: thin solid #999;" />%</td>
    <td width="40" align="center" nowrap="nowrap">+</td>
    <td nowrap="nowrap"><input onKeyUp="totalcost(this.form); if(!this.value) this.value=0; totalcost(this.form);" type="text" name="cost_additional" value="<?php echo $cost_additional; ?>" style="border: thin solid #999;" /></td>
    <td width="40" align="center" nowrap="nowrap">+</td>
    <td nowrap="nowrap" align="left"><div id="tabs"><a href="#tab-option"><?php echo $text_cost_option_cost; ?></a></div></td>    
  </tr>
  <tr>
    <td align="center" nowrap="nowrap"><span class="help"><?php echo $text_cost; ?></span></td>
    <td>&nbsp;</td>
    <td align="center" nowrap="nowrap"><span class="help"><?php echo $text_cost_amount; ?></span></td>
    <td>&nbsp;</td>
    <td align="center" nowrap="nowrap"><span class="help"><?php echo $text_cost_percentage; ?></span></td>
    <td>&nbsp;</td>
    <td align="center" nowrap="nowrap"><span class="help"><?php echo $text_cost_additional; ?></span></td>
    <td>&nbsp;</td>
    <td align="left" nowrap="nowrap"><span class="help"><?php echo $text_cost_option; ?></span></td>    
  </tr>
  </table>
          </td>
          </tr> 
<?php } else { ?>
		  <input type="hidden" name="cost" value="<?php echo $cost; ?>" />
		  <input type="hidden" name="cost_amount" value="<?php echo $cost_amount; ?>" />
		  <input type="hidden" name="cost_percentage" value="<?php echo $cost_percentage; ?>" />
		  <input type="hidden" name="cost_additional" value="<?php echo $cost_additional; ?>" />
<?php } ?>			  
            
            <tr>
              <td><?php echo $entry_tax_class; ?></td>
              <td><select name="tax_class_id">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($tax_classes as $tax_class) { ?>
                  <?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
               <td></td><td></td> 

            </tr>
            <tr>
              <td><?php echo $entry_minimum; ?></td>
              <td><input type="text" name="minimum" value="<?php echo $minimum; ?>" size="2" /></td>
            </tr>
            <tr>
               <td></td><td></td> 









            </tr>
            <tr>
              <td><?php echo $entry_stock_status; ?></td>
              <td><select name="stock_status_id">
                  <?php foreach ($stock_statuses as $stock_status) { ?>
                  <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_shipping; ?></td>
              <td><?php if ($shipping) { ?>
                <input type="radio" name="shipping" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="shipping" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="shipping" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="shipping" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_keyword; ?></td>
              <td><input type="text" name="keyword" value="<?php echo $keyword; ?>" /></td>
            </tr>
            <tr>
              
              <td><?php echo $entry_image; ?></td>
              <td><?php if (isset($cit_status) && $cit_status) { ?>
                <table>
                  <tr>
                    <td>
                      <div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" /><br />
                      <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                      <a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></div>
                    </td>
                    <td class="lang_info">
                      <?php if ($cit_show_language_in_tab) { ?>
                      <div id="main_img_lang" class="micro_htabs">
                        <?php foreach ($languages as $language) { ?>
                        <a href="#main_img_lang<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></a>
                        <?php } ?>
                      </div>
                      <?php foreach ($languages as $language) { ?>
                      <div id="main_img_lang<?php echo $language['language_id']; ?>">
                        <table class="micro_form">
                          <?php if ($cit_show_alt_text) { ?>
                          <tr>
                            <td><?php echo $entry_image_alt; ?></td>
                            <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][alt_text]" size="60" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['alt_text'] : ''; ?>" /></td>
                          </tr>
                          <?php } ?>
                          <tr>
                            <td><?php echo $entry_image_title; ?></td>
                            <td>
                              <input type="text" name="product_description[<?php echo $language['language_id']; ?>][title_text]" size="60" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['title_text'] : ''; ?>" />
                              <?php if (!$cit_show_alt_text) { ?>
                              <input type="hidden" name="product_description[<?php echo $language['language_id']; ?>][alt_text]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['alt_text'] : ''; ?>" />
                              <?php } ?>
                            </td>
                          </tr>
                        </table>
                      </div>
                      <?php } ?>
                      <?php } else { ?>
                      <?php if ($cit_show_alt_text) { ?>
                      <table class="nano_form">
                      <?php foreach ($languages as $language) { ?>
                        <tr>
                          <td><?php echo $entry_image_alt; ?></td>
                          <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][alt_text]" size="60" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['alt_text'] : ''; ?>" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td>
                        </tr>
                        <tr>
                          <td><?php echo $entry_image_title; ?></td>
                          <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][title_text]" size="60" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['title_text'] : ''; ?>" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td>
                        </tr>
                      <?php } ?>
                      </table>
                      <?php } else { ?>
                      <table class="pico_form">
                        <tr>
                          <td><?php echo $entry_image_title; ?></td>
                        </tr>
                        <?php foreach ($languages as $language) { ?>
                        <tr>
                          <td>
                            <input type="text" name="product_description[<?php echo $language['language_id']; ?>][title_text]" size="60" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['title_text'] : ''; ?>" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                            <input type="hidden" name="product_description[<?php echo $language['language_id']; ?>][alt_text]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['alt_text'] : ''; ?>" />
                          </td>
                        </tr>
                        <?php } ?>
                      </table>
                      <?php } ?>
                      <?php } ?>
                    </td>
                  </tr>
                </table>
              <?php } else { ?>
                <div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" /><br />
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                  <a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></div>
              <?php } ?>
              </td>
            



            </tr>
            <tr>
              <td><?php echo $entry_date_available; ?></td>
              <td><input type="text" name="date_available" value="<?php echo $date_available; ?>" size="12" class="date" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_dimension; ?></td>
              <td><input type="text" name="length" value="<?php echo $length; ?>" size="4" />
                <input type="text" name="width" value="<?php echo $width; ?>" size="4" />
                <input type="text" name="height" value="<?php echo $height; ?>" size="4" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_length; ?></td>
              <td><select name="length_class_id">
                  <?php foreach ($length_classes as $length_class) { ?>
                  <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
<!--
            <tr>
              <td><?php echo $entry_weight; ?></td>
              <td><input type="text" name="weight" value="<?php echo $weight; ?>" /></td>
            </tr>
-->
            <tr>
              <td><?php echo $entry_weight_class; ?></td>
              <td><select name="weight_class_id">
                  <?php foreach ($weight_classes as $weight_class) { ?>
                  <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="2" /></td>
            </tr>
          </table>
        </div>
        <div id="tab-links">
          <table class="form">
            <tr>
              <td><?php echo $entry_manufacturer; ?></td>
              <td><input type="text" name="manufacturer" value="<?php echo $manufacturer ?>" /><input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_category; ?></td>
              <td><input type="text" name="category" value="" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="product-category" class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($product_categories as $product_category) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="product-category<?php echo $product_category['category_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_category['name']; ?><img src="view/image/delete.png" alt="" />
                    <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
                  </div>
                  <?php } ?>
                </div></td>
            </tr> 
            <tr>
              <td><?php echo $entry_filter; ?></td>
              <td><input type="text" name="filter" value="" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="product-filter" class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($product_filters as $product_filter) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="product-filter<?php echo $product_filter['filter_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_filter['name']; ?><img src="view/image/delete.png" alt="" />
                    <input type="hidden" name="product_filter[]" value="<?php echo $product_filter['filter_id']; ?>" />
                  </div>
                  <?php } ?>
                </div></td>
            </tr>                       
            <tr>
              <td><?php echo $entry_store; ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array(0, $product_store)) { ?>
                    <input type="checkbox" name="product_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="product_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($store['store_id'], $product_store)) { ?>
                    <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr>
              <td><?php echo $entry_download; ?></td>
              <td><input type="text" name="download" value="" /></td>
            </tr>			
            <tr>
              <td>&nbsp;</td>
              <td><div id="product-download" class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($product_downloads as $product_download) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="product-download<?php echo $product_download['download_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_download['name']; ?><img src="view/image/delete.png" alt="" />
                    <input type="hidden" name="product_download[]" value="<?php echo $product_download['download_id']; ?>" />
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr>

			<tr>
              <td><?php echo $entry_package_hidden; ?></td>
              <td><?php if ($product_bundle_hidden) { ?>
                <input type="radio" name="product_bundle_hidden" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="product_bundle_hidden" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="product_bundle_hidden" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="product_bundle_hidden" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<td><?php echo $entry_package; ?></td>
              <td><input type="text" size="2" maxlength="4" id="package_quantity" name="package_quantity" value="1" /> <input type="text" name="package" value="" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="product-package" class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($product_package as $product_package) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="product-related<?php echo $product_package['product_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_package['quantity'].' x '.$product_package['name']; ?><img src="view/image/delete.png" />
                    <input type="hidden" name="product_package[]" value="<?php echo $product_package['product_id'].'|'.$product_package['quantity'] ?>" />
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
			<tr>
			
              <td><?php echo $entry_related; ?></td>
              <td><input type="text" name="related" value="" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="product-related" class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($product_related as $product_related) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="product-related<?php echo $product_related['product_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_related['name']; ?><img src="view/image/delete.png" alt="" />
                    <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
          </table>
        </div>
        <div id="tab-attribute">
          <table id="attribute" class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_attribute; ?></td>
                <td class="left"><?php echo $entry_text; ?></td>
                <td></td>
              </tr>
            </thead>
            <?php $attribute_row = 0; ?>
            <?php foreach ($product_attributes as $product_attribute) { ?>
            <tbody id="attribute-row<?php echo $attribute_row; ?>">
              <tr>
                <td class="left"><input type="text" name="product_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" />
                  <input type="hidden" name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" /></td>
                <td class="left"><?php foreach ($languages as $language) { ?>
                  <textarea name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" cols="40" rows="5"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
                  <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" /><br />
                  <?php } ?></td>
                <td class="left"><a onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
              </tr>
            </tbody>
            <?php $attribute_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="2"></td>
                <td class="left"><a onclick="addAttribute();" class="button"><?php echo $button_add_attribute; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>

                <div id="tab-stock">
                  <table class="form">
                    <tr>
                      <td><?php echo $entry_has_option; ?></td>
                      <td><select name="has_option" onchange="updateStockCont();" id="has_option">
                          <?php if ($has_option) { ?>
                          <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                          <option value="0"><?php echo $text_no; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_yes; ?></option>
                          <option value="0" selected="selected"><?php echo $text_no; ?></option>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <tr class="notStockCont">
                      <td><?php echo $entry_sku; ?></td>
                      <td><input type="text" name="sku" value="<?php echo $sku; ?>" /></td>
                    </tr>
                    <tr class="notStockCont">
                      <td><?php echo $entry_weight; ?></td>
                      <td><input type="text" name="weight" value="<?php echo $weight; ?>" /></td>
                    </tr>
                    <tr class="notStockCont">
                      <td><?php echo $entry_quantity; ?></td>
                      <td><input type="text" name="quantity" value="<?php echo $quantity; ?>" size="2" /></td>
                    </tr>
                    <tr class="notStockCont">
                      <td><?php echo $entry_subtract; ?></td>
                      <td><select name="subtract">
                          <?php if ($subtract) { ?>
                          <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                          <option value="0"><?php echo $text_no; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_yes; ?></option>
                          <option value="0" selected="selected"><?php echo $text_no; ?></option>
                          <?php } ?>
                        </select></td>
                    </tr>
                  </table>
                </div>
            
        <div id="tab-option">

            <?php if(!empty($product_options)){ ?>
                <div class="attention"><?php echo $lang_atn_adding; ?></div>
            <?php } ?>
            
          <div id="vtab-option" class="vtabs">
            <?php $option_row = 0; ?>
            <?php foreach ($product_options as $product_option) { ?>
            <a href="#tab-option-<?php echo $option_row; ?>" id="option-<?php echo $option_row; ?>"><?php echo $product_option['name']; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('#option-<?php echo $option_row; ?>').remove(); $('#tab-option-<?php echo $option_row; ?>').remove(); $('#vtabs a:first').trigger('click'); return false;" /></a>
            <?php $option_row++; ?>
            <?php } ?>
            <span id="option-add">
            <input name="option" value="" style="width: 130px;" />
            &nbsp;<img src="view/image/add.png" alt="<?php echo $button_add_option; ?>" title="<?php echo $button_add_option; ?>" /></span></div>
          <?php $option_row = 0; ?>
          <?php $option_value_row = 0; ?>
          <?php foreach ($product_options as $product_option) { ?>
          <div id="tab-option-<?php echo $option_row; ?>" class="vtabs-content">
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_id]" value="<?php echo $product_option['product_option_id']; ?>" />
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
            <table class="form">
              <tr>
                <td><?php echo $entry_required; ?></td>
                <td><select name="product_option[<?php echo $option_row; ?>][required]">
                    <?php if ($product_option['required']) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select></td>
              </tr>
              <?php if ($product_option['type'] == 'text') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'textarea') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><textarea name="product_option[<?php echo $option_row; ?>][option_value]" cols="40" rows="5"><?php echo $product_option['option_value']; ?></textarea></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'file') { ?>
              <tr style="display: none;">
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'date') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="date" /></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'datetime') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="datetime" /></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'time') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="time" /></td>
              </tr>
              <?php } ?>
            </table>
            <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'color' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
            
                <table id="option-value<?php echo $option_row; ?>" class="list">
                  <thead>
                    <tr>
                      <td class="left"><?php echo $entry_option_value; ?></td>
                      <td class="right"><?php echo $entry_option_points; ?></td>
                      <td></td>
                    </tr>
                  </thead>
            











                  <td class="right"><?php echo $entry_option_points; ?></td>
                  <td class="right"><?php echo $entry_weight; ?></td>
                  <td></td>
                </tr>
              </thead>
              <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
              <tbody id="option-value-row<?php echo $option_value_row; ?>">
                <tr>
                  <td class="left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]">
                      <?php if (isset($option_values[$product_option['option_id']])) { ?>
                      <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                      <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
                      <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                      <?php } ?>
                    </select>
                    <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" /></td>
                  
                <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" />
                <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" value="<?php echo $product_option_value['subtract']; ?>" />
                <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" value="<?php echo $product_option_value['price_prefix']; ?>" />
                <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="0.00" />
                <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" />
                <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]" value="<?php echo $product_option_value['weight_prefix']; ?>" />
                <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" />
            























<?php if ($this->user->hasPermission('access', 'module/adv_profit_reports')) { ?>				
                  <td class="right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][cost_prefix]" style="background-color: #ffd7d7; border: thin solid #999;">
                      <?php if ($product_option_value['cost_prefix'] == '+') { ?>
                      <option value="+" selected="selected">+</option>
                      <?php } else { ?>
                      <option value="+">+</option>
                      <?php } ?>
                      <?php if ($product_option_value['cost_prefix'] == '-') { ?>
                      <option value="-" selected="selected">-</option>
                      <?php } else { ?>
                      <option value="-">-</option>
                      <?php } ?>
                    </select>
                    <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][cost]" value="<?php echo $product_option_value['cost']; ?>" size="5" style="background-color: #ffd7d7; border: thin solid #999;" /></td> 
<?php } else { ?>
<?php if ($product_option_value['cost_prefix'] == '+') { ?>
		  		  <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][cost_prefix]" value="+" />
<?php } ?>
<?php if ($product_option_value['cost_prefix'] == '-') { ?>
		  		  <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][cost_prefix]" value="-" />
<?php } ?>				  
		  		  <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][cost]" value="<?php echo $product_option_value['cost']; ?>" />
<?php } ?>						
            
                  <td class="right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]">
                      <?php if ($product_option_value['points_prefix'] == '+') { ?>
                      <option value="+" selected="selected">+</option>
                      <?php } else { ?>
                      <option value="+">+</option>
                      <?php } ?>
                      <?php if ($product_option_value['points_prefix'] == '-') { ?>
                      <option value="-" selected="selected">-</option>
                      <?php } else { ?>
                      <option value="-">-</option>
                      <?php } ?>
                    </select>
                    <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" size="5" /></td>
<!--
                  <td class="right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]">
                      <?php if ($product_option_value['weight_prefix'] == '+') { ?>
                      <option value="+" selected="selected">+</option>
                      <?php } else { ?>
                      <option value="+">+</option>
                      <?php } ?>
                      <?php if ($product_option_value['weight_prefix'] == '-') { ?>
                      <option value="-" selected="selected">-</option>
                      <?php } else { ?>
                      <option value="-">-</option>
                      <?php } ?>
                    </select>
                    <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" size="5" /></td>
-->
                  <td class="left"><a onclick="$('#option-value-row<?php echo $option_value_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
                </tr>
              </tbody>
              <?php $option_value_row++; ?>
              <?php } ?>
              <tfoot>
                <tr>
                  
                <td colspan="2"></td>
                <td class="left"><a onclick="addOptionValue('<?php echo $option_row; ?>');" class="button"><?php echo $button_add_option_value; ?></a></td>
            

                </tr>
              </tfoot>
            </table>
            <select id="option-values<?php echo $option_row; ?>" style="display: none;">
              <?php if (isset($option_values[$product_option['option_id']])) { ?>
              <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
              <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
            <?php } ?>
          </div>
          <?php $option_row++; ?>
          <?php } ?>
        </div>
        <div id="tab-discount">
          <table id="discount" class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_customer_group; ?></td>
                <td class="right"><?php echo $entry_quantity; ?></td>
                <td class="right"><?php echo $entry_priority; ?></td>
                <td class="right"><?php echo $entry_price; ?></td>
                <td class="left"><?php echo $entry_date_start; ?></td>
                <td class="left"><?php echo $entry_date_end; ?></td>
                <td></td>
              </tr>
            </thead>
            <?php $discount_row = 0; ?>
            <?php foreach ($product_discounts as $product_discount) { ?>
            <tbody id="discount-row<?php echo $discount_row; ?>">
              <tr>
                <td class="left"><select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]">
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
                <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" size="2" /></td>
                <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" size="2" /></td>
                <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" /></td>
                <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" class="date" /></td>
                <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" class="date" /></td>
                <td class="left"><a onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
              </tr>
            </tbody>
            <?php $discount_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="6"></td>
                <td class="left"><a onclick="addDiscount();" class="button"><?php echo $button_add_discount; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>

                <div id="tab-option-stock">
                  <table id="option-stock" class="list">
                    <thead>
                      <tr>
                        <td class="left" width="120">Image</td>
                        <td class="left" width="40"><?php echo $entry_stockoption_sku; ?></td>
                        <td class="left"><?php echo $entry_stockoption_mix; ?></td>
                        <td class="left"><?php echo $entry_weight; ?></td>
                        <td class="left"><?php echo $entry_stockoption_groups; ?></td>
                        <td class="left"><?php echo $entry_stockoption_discount; ?></td>
                        <td class="left" width="30"><?php echo $entry_stockoption_stock; ?></td>
                        <td class="left" width="30"><?php echo $entry_stockoption_price; ?></td>
                        <td class="left" width="30"><?php echo $entry_stockoption_subtract; ?></td>
                        <td class="center" width="10">Active<br /><input type="checkbox" id="product_option_stock_active_change" onclick="optionActiveChange();" /></td>
                      </tr>
                    </thead>
                    <?php
                    $grp_price          = 0;
                    $discount_price     = 0;
                    foreach ($product_option_stocks as $key => $product_option_stock) {
                    ?>
                    <tbody id="discount-row<?php echo $key; ?>">
                      <tr>

                        <input type="hidden" name="product_option_stock[<?php echo $key; ?>][id]" value="<?php echo $product_option_stock['id']; ?>" />
                        <input type="hidden" name="product_option_stock[<?php echo $key; ?>][var]" value="<?php echo $product_option_stock['var']; ?>" />

                        <!-- Variation Image -->

                        <td class="left">
                            <div class="image">
                                <img src="<?php if($product_option_stock['thumb']) { echo $product_option_stock['thumb']; } ?>" alt="" id="pos_<?php echo $key; ?>_thumb" /><br />
                                <input type="hidden" name="product_option_stock[<?php echo $key; ?>][image]" value="<?php echo $product_option_stock['image']; ?>" id="pos_<?php echo $key; ?>_image" />
                                <a onclick="image_upload('pos_<?php echo $key; ?>_image', 'pos_<?php echo $key; ?>_thumb');"><?php echo $option_text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#pos_<?php echo $key; ?>_thumb').attr('src', '<?php echo $no_image; ?>'); $('#pos_<?php echo $key; ?>_image').attr('value', '');"><?php echo $option_text_clear; ?></a>
                            </div>
                        </td>

                        <td class="left"><input type="text" name="product_option_stock[<?php echo $key; ?>][sku]" value="<?php echo $product_option_stock['sku']; ?>" size="10" /></td>
                        <td class="left"><?php if(isset($product_option_stock['combi'])){ echo $product_option_stock['combi']; } ?></td>
                        <td class="left"><input type="text" name="product_option_stock[<?php echo $key; ?>][weight]" value="<?php echo $product_option_stock['weight']; ?>" size="25" /></td>
                        <td class="left" style="vertical-align:top;">
                            <div id="groupPrice<?php echo $key; ?>">
                                <?php if(is_array($product_option_stock['grp'])){ foreach ($product_option_stock['grp'] as $psogKey => $psogVal) { ?>
                                    <div style="margin:5px 0px; padding:5px; background-color:#EFEFEF;" id="grp_price_<?php echo $key; ?>_<?php echo $grp_price; ?>">
                                        <p><span style="margin-left:5px; margin-right:5px;">Group</span><select name="product_option_stock[<?php echo $key; ?>][grp][<?php echo $grp_price; ?>][grp_id]">
                                            <?php foreach ($customer_groups as $customer_group) { ?>
                                                <option value="<?php echo $customer_group['customer_group_id']; ?>" <?php if($customer_group['customer_group_id'] == $psogKey){ echo 'selected';}?>><?php echo $customer_group['name']; ?></option>
                                            <?php } ?>
                                            </select></p><p><span style="margin-left:5px; margin-right:5px;">Price</span>
                                            <input type="text" name="product_option_stock[<?php echo $key; ?>][grp][<?php echo $grp_price; ?>][price]" style="width:50px; margin-right:5px;" value="<?php echo $psogVal; ?>" />
                                            <a class="button" onclick="removeGroupPrice('grp_price_<?php echo $key; ?>_<?php echo $grp_price; ?>');" style="float:right; margin-top:-2px;">X</a>
                                    </p></div><div style="clear:both;"></div>
                                <?php $grp_price++; } }?>
                            </div>
                            <a class="button" onclick="addGroupPrice('<?php echo $key; ?>');" style="float:right;">Add</a>
                        </td>
                        <td class="left" style="vertical-align:top;">
                            <div id="discountPrice<?php echo $key; ?>">
                                <?php if(is_array($product_option_stock['discount'])){ foreach ($product_option_stock['discount'] as $discKey => $discVal) { ?>
                                    <div style="margin:5px 0px; padding:5px; background-color:#EFEFEF;" id="discount_price_<?php echo $key; ?>_<?php echo $discount_price; ?>">
                                        <p>
                                            <span style="margin-left:5px; margin-right:5px;">Group</span>
                                            <select name="product_option_stock[<?php echo $key; ?>][discount][<?php echo $discount_price; ?>][grp]">
                                                <?php foreach ($customer_groups as $customer_group) { ?>
                                                    <option value="<?php echo $customer_group['customer_group_id']; ?>" <?php if($customer_group['customer_group_id'] == $discVal['grp']){ echo 'selected';}?>><?php echo $customer_group['name']; ?></option>
                                                <?php } ?>
                                            </select>
                                        </p>
                                        <p>
                                            <span style="margin-left:5px; margin-right:5px;">Qty</span>
                                            <input type="text" name="product_option_stock[<?php echo $key; ?>][discount][<?php echo $discount_price; ?>][qty]" style="width:50px; margin-right:5px;" value="<?php echo $discVal['qty']; ?>" />
                                            <span style="margin-left:5px; margin-right:5px;">Price</span>
                                            <input type="text" name="product_option_stock[<?php echo $key; ?>][discount][<?php echo $discount_price; ?>][price]" style="width:50px; margin-right:5px;" value="<?php echo $discVal['price']; ?>" />
                                            <a class="button" onclick="removeDiscountPrice('discount_price_<?php echo $key; ?>_<?php echo $discount_price; ?>');" style="float:right; margin-top:-2px;">X</a>
                                        </p>
                                    </div><div style="clear:both;"></div>
                                <?php $discount_price++; } }?>
                            </div>
                            <a class="button" onclick="addDiscountPrice('<?php echo $key; ?>');" style="float:right;">Add</a>
                        </td>
                        <td class="left"><input type="text" name="product_option_stock[<?php echo $key; ?>][stock]" value="<?php echo $product_option_stock['stock']; ?>" size="4" style="text-align:center;" /></td>
                        <td class="left"><input type="text" name="product_option_stock[<?php echo $key; ?>][price]" value="<?php echo $product_option_stock['price']; ?>" size="6" style="text-align:center;" /></td>
                        <td class="left">
                            <select name="product_option_stock[<?php echo $key; ?>][subtract]">
                                <?php if ($product_option_stock['subtract']) { ?>
                                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                <option value="0"><?php echo $text_no; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_yes; ?></option>
                                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="center">
                            <input type="hidden" name="product_option_stock[<?php echo $key; ?>][active]" value="0" />
                            <input type="checkbox" class="product_option_stock_active" name="product_option_stock[<?php echo $key; ?>][active]" value="1"
                            <?php if($product_option_stock['active'] == 1) { echo ' checked="checked"';} ?>
                            />
                        </td>
                      </tr>
                    </tbody>
                    <?php
                    } ?>
                  </table>
                </div>
            
        <div id="tab-special">
          <table id="special" class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_customer_group; ?></td>
                <td class="right"><?php echo $entry_priority; ?></td>
                <td class="right"><?php echo $entry_price; ?></td>
                <td class="left"><?php echo $entry_date_start; ?></td>
                <td class="left"><?php echo $entry_date_end; ?></td>
                <td></td>
              </tr>
            </thead>
            <?php $special_row = 0; ?>
            <?php foreach ($product_specials as $product_special) { ?>
            <tbody id="special-row<?php echo $special_row; ?>">
              <tr>
                <td class="left"><select name="product_special[<?php echo $special_row; ?>][customer_group_id]">
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
                <td class="right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" size="2" /></td>
                <td class="right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" /></td>
                <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" class="date" /></td>
                <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" class="date" /></td>
                <td class="left"><a onclick="$('#special-row<?php echo $special_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
              </tr>
            </tbody>
            <?php $special_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="5"></td>
                <td class="left"><a onclick="addSpecial();" class="button"><?php echo $button_add_special; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <div id="tab-image">
          <table id="images" class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_image; ?></td>

                <?php if (isset($cit_status) && $cit_status) { ?>
                <td class="left"><?php echo $entry_description; ?></td>
                <?php } ?>
            
                <td class="right"><?php echo $entry_sort_order; ?></td>
                <td></td>
              </tr>
            </thead>
            <?php $image_row = 0; ?>
            <?php foreach ($product_images as $product_image) { ?>
            <tbody id="image-row<?php echo $image_row; ?>">
              <tr>
                <td class="left"><div class="image"><img src="<?php echo $product_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />
                    <input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="image<?php echo $image_row; ?>" />
                    <br />
                    <a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>

                <?php if (isset($cit_status) && $cit_status) { ?>
                <td>
                  <table class="image_data">
                    <tr>
                      <td>
                        <?php if ($cit_show_language_in_tab) { ?>
                        <div id="img_lang<?php echo $image_row; ?>" class="micro_htabs">
                          <?php foreach ($languages as $language) { ?>
                          <a href="#img_lang<?php echo $image_row . $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></a>
                          <?php } ?>
                        </div>
                        <?php foreach ($languages as $language) { ?>
                        <div id="img_lang<?php echo $image_row . $language['language_id']; ?>">
                          <table class="micro_form">
                            <?php if ($cit_show_alt_text) { ?>
                            <tr>
                              <td><?php echo $entry_image_alt; ?></td>
                              <td><input type="text" name="product_image[<?php echo $image_row; ?>][descriptions][<?php echo $language['language_id']; ?>][alt_text]" size="60" value="<?php echo isset($product_image['descriptions'][$language['language_id']]) ? $product_image['descriptions'][$language['language_id']]['alt_text'] : ''; ?>" /></td>
                            </tr>
                            <?php } ?>
                            <tr>
                              <td><?php echo $entry_image_title; ?></td>
                              <td>
                                <input type="text" name="product_image[<?php echo $image_row; ?>][descriptions][<?php echo $language['language_id']; ?>][title_text]" size="60" value="<?php echo isset($product_image['descriptions'][$language['language_id']]) ? $product_image['descriptions'][$language['language_id']]['title_text'] : ''; ?>" />
                                <?php if (!$cit_show_alt_text) { ?>
                                <input type="hidden" name="product_image[<?php echo $image_row; ?>][descriptions][<?php echo $language['language_id']; ?>][alt_text]" value="<?php echo isset($product_image['descriptions'][$language['language_id']]) ? $product_image['descriptions'][$language['language_id']]['alt_text'] : ''; ?>" />
                                <?php } ?>
                              </td>
                            </tr>
                          </table>
                        </div>
                        <?php } ?>
                        <?php } else { ?>
                        <?php if ($cit_show_alt_text) { ?>
                        <table class="nano_form">
                        <?php foreach ($languages as $language) { ?>
                          <tr>
                            <td><?php echo $entry_image_alt; ?></td>
                            <td><input type="text" name="product_image[<?php echo $image_row; ?>][descriptions][<?php echo $language['language_id']; ?>][alt_text]" size="60" value="<?php echo isset($product_image['descriptions'][$language['language_id']]) ? $product_image['descriptions'][$language['language_id']]['alt_text'] : ''; ?>" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td>
                          </tr>
                          <tr>
                            <td><?php echo $entry_image_title; ?></td>
                            <td><input type="text" name="product_image[<?php echo $image_row; ?>][descriptions][<?php echo $language['language_id']; ?>][title_text]" size="60" value="<?php echo isset($product_image['descriptions'][$language['language_id']]) ? $product_image['descriptions'][$language['language_id']]['title_text'] : ''; ?>" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td>
                          </tr>
                        <?php } ?>
                        </table>
                        <?php } else { ?>
                        <table class="pico_form">
                          <tr>
                            <td><?php echo $entry_image_title; ?></td>
                          </tr>
                          <?php foreach ($languages as $language) { ?>
                          <tr>
                            <td>
                              <input type="text" name="product_image[<?php echo $image_row; ?>][descriptions][<?php echo $language['language_id']; ?>][title_text]" size="60" value="<?php echo isset($product_image['descriptions'][$language['language_id']]) ? $product_image['descriptions'][$language['language_id']]['title_text'] : ''; ?>" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                              <input type="hidden" name="product_image[<?php echo $image_row; ?>][descriptions][<?php echo $language['language_id']; ?>][alt_text]" value="<?php echo isset($product_image['descriptions'][$language['language_id']]) ? $product_image['descriptions'][$language['language_id']]['alt_text'] : ''; ?>" />
                            </td>
                          </tr>
                          <?php } ?>
                        </table>
                        <?php } ?>
                        <?php } ?>
                      </td>
                    </tr>
                  </table>
                </td>
                <?php } ?>
            
                <td class="right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" size="2" /></td>
                <td class="left"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
              </tr>
            </tbody>
            
            <?php $image_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <?php if (isset($cit_status) && $cit_status) { ?>
                <td colspan="3"></td>
                <?php } else { ?>
                <td colspan="2"></td>
                <?php } ?>
                <td class="left"><a onclick="addImage();" class="button"><?php echo $button_add_image; ?></a></td>
              </tr>
            </tfoot>
            







          </table>
        </div>
        <div id="tab-reward">
          <table class="form">
            <tr>
              <td><?php echo $entry_points; ?></td>
              <td><input type="text" name="points" value="<?php echo $points; ?>" /></td>
            </tr>
          </table>
          <table class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_customer_group; ?></td>
                <td class="right"><?php echo $entry_reward; ?></td>
              </tr>
            </thead>
            <?php foreach ($customer_groups as $customer_group) { ?>
            <tbody>
              <tr>
                <td class="left"><?php echo $customer_group['name']; ?></td>
                <td class="right"><input type="text" name="product_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" /></td>
              </tr>
            </tbody>
            <?php } ?>
          </table>
        </div>
        <div id="tab-design">
          <table class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_store; ?></td>
                <td class="left"><?php echo $entry_layout; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="left"><?php echo $text_default; ?></td>
                <td class="left"><select name="product_layout[0][layout_id]">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
              </tr>
            </tbody>
            <?php foreach ($stores as $store) { ?>
            <tbody>
              <tr>
                <td class="left"><?php echo $store['name']; ?></td>
                <td class="left"><select name="product_layout[<?php echo $store['store_id']; ?>][layout_id]">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
              </tr>
            </tbody>
            <?php } ?>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';
		
		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');
				
				currentCategory = item.category;
			}
			
			self._renderItem(ul, item);
		});
	}
});

// Manufacturer
$('input[name=\'manufacturer\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.manufacturer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'manufacturer\']').attr('value', ui.item.label);
		$('input[name=\'manufacturer_id\']').attr('value', ui.item.value);
	
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

// Category
$('input[name=\'category\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.category_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-category' + ui.item.value).remove();
		
		$('#product-category').append('<div id="product-category' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_category[]" value="' + ui.item.value + '" /></div>');

		$('#product-category div:odd').attr('class', 'odd');
		$('#product-category div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-category div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-category div:odd').attr('class', 'odd');
	$('#product-category div:even').attr('class', 'even');	
});

// Filter
$('input[name=\'filter\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.filter_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-filter' + ui.item.value).remove();
		
		$('#product-filter').append('<div id="product-filter' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_filter[]" value="' + ui.item.value + '" /></div>');

		$('#product-filter div:odd').attr('class', 'odd');
		$('#product-filter div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-filter div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-filter div:odd').attr('class', 'odd');
	$('#product-filter div:even').attr('class', 'even');	
});

// Downloads
$('input[name=\'download\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.download_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-download' + ui.item.value).remove();
		
		$('#product-download').append('<div id="product-download' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_download[]" value="' + ui.item.value + '" /></div>');

		$('#product-download div:odd').attr('class', 'odd');
		$('#product-download div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-download div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-download div:odd').attr('class', 'odd');
	$('#product-download div:even').attr('class', 'even');	
});

// Related

			$('input[name=\'package\']').autocomplete({
				delay: 0,
				source: function(request, response) {
					$.ajax({
						url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
						dataType: 'json',
						success: function(json) {		
							response($.map(json, function(item) {
								return {
									label: item.name,
									value: item.product_id
								}
							}));
						}
					});
				}, 
				select: function(event, ui) {
					var quantity = $('#package_quantity').val();
					if(isNaN(quantity) || quantity < 1) { quantity = 1; }
					$('#package_quantity').val('1');
					$('#product-package' + ui.item.value).remove();
					$('#product-package').append('<div id="product-package' + ui.item.value + '">' + quantity + ' x ' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" name="product_package[]" value="' + ui.item.value + '|' + quantity + '" /></div>');
					$('#product-package div:odd').attr('class', 'odd');
					$('#product-package div:even').attr('class', 'even');	
					return false;
				}
			});
			
			$('#product-package div img').live('click', function() {
				$(this).parent().remove();
				$('#product-package div:odd').attr('class', 'odd');
				$('#product-package div:even').attr('class', 'even');	
			});
			
			
$('input[name=\'related\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-related' + ui.item.value).remove();
		
		$('#product-related').append('<div id="product-related' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_related[]" value="' + ui.item.value + '" /></div>');

		$('#product-related div:odd').attr('class', 'odd');
		$('#product-related div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-related div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-related div:odd').attr('class', 'odd');
	$('#product-related div:even').attr('class', 'even');	
});
//--></script> 
<script type="text/javascript"><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
	html  = '<tbody id="attribute-row' + attribute_row + '">';
    html += '  <tr>';
	html += '    <td class="left"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
	html += '    <td class="left">';
	<?php foreach ($languages as $language) { ?>
	html += '<textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" cols="40" rows="5"></textarea><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" /><br />';
    <?php } ?>
	html += '    </td>';
	html += '    <td class="left"><a onclick="$(\'#attribute-row' + attribute_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
    html += '  </tr>';	
    html += '</tbody>';
	
	$('#attribute tfoot').before(html);
	
	attributeautocomplete(attribute_row);
	
	attribute_row++;
}

function attributeautocomplete(attribute_row) {
	$('input[name=\'product_attribute[' + attribute_row + '][name]\']').catcomplete({
		delay: 500,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {	
					response($.map(json, function(item) {
						return {
							category: item.attribute_group,
							label: item.name,
							value: item.attribute_id
						}
					}));
				}
			});
		}, 
		select: function(event, ui) {
			$('input[name=\'product_attribute[' + attribute_row + '][name]\']').attr('value', ui.item.label);
			$('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').attr('value', ui.item.value);
			
			return false;
		},
		focus: function(event, ui) {
      		return false;
   		}
	});
}

$('#attribute tbody').each(function(index, element) {
	attributeautocomplete(index);
});
//--></script> 
<script type="text/javascript"><!--	
var option_row = <?php echo $option_row; ?>;

$('input[name=\'option\']').catcomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						category: item.category,
						label: item.name,
						value: item.option_id,
						type: item.type,
						option_value: item.option_value
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		html  = '<div id="tab-option-' + option_row + '" class="vtabs-content">';
		html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + ui.item.label + '" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + ui.item.value + '" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + ui.item.type + '" />';
		html += '	<table class="form">';
		html += '	  <tr>';
		html += '		<td><?php echo $entry_required; ?></td>';
		html += '       <td><select name="product_option[' + option_row + '][required]">';
		html += '	      <option value="1"><?php echo $text_yes; ?></option>';
		html += '	      <option value="0"><?php echo $text_no; ?></option>';
		html += '	    </select></td>';
		html += '     </tr>';
		
		if (ui.item.type == 'text') {
			html += '     <tr>';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';
			html += '     </tr>';
		}
		
		if (ui.item.type == 'textarea') {
			html += '     <tr>';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><textarea name="product_option[' + option_row + '][option_value]" cols="40" rows="5"></textarea></td>';
			html += '     </tr>';						
		}
		 
		if (ui.item.type == 'file') {
			html += '     <tr style="display: none;">';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';
			html += '     </tr>';			
		}
						
		if (ui.item.type == 'date') {
			html += '     <tr>';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="date" /></td>';
			html += '     </tr>';			
		}
		
		if (ui.item.type == 'datetime') {
			html += '     <tr>';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="datetime" /></td>';
			html += '     </tr>';			
		}
		
		if (ui.item.type == 'time') {
			html += '     <tr>';
			html += '       <td><?php echo $entry_option_value; ?></td>';
			html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="time" /></td>';
			html += '     </tr>';			
		}
		
		html += '  </table>';
			
		if (ui.item.type == 'select' || ui.item.type == 'color' || ui.item.type == 'radio' || ui.item.type == 'checkbox' || ui.item.type == 'image') {
			html += '  <table id="option-value' + option_row + '" class="list">';
			html += '  	 <thead>'; 
			html += '      <tr>';
			html += '        <td class="left"><?php echo $entry_option_value; ?></td>';
			 
			 
			 

<?php if ($this->user->hasPermission('access', 'module/adv_profit_reports')) { ?>			
			html += '        <td class="right"><?php echo $entry_option_cost; ?></td>';
<?php } ?>				
            
			html += '        <td class="right"><?php echo $entry_option_points; ?></td>';
			
			html += '        <td></td>';
			html += '      </tr>';
			html += '  	 </thead>';
			html += '    <tfoot>';
			html += '      <tr>';
			
<?php if ($this->user->hasPermission('access', 'module/adv_profit_reports')) { ?>
			html += '        <td colspan="7"></td>';
<?php } else { ?>
			html += '        <td colspan="2"></td>';
<?php } ?>
            
			html += '        <td class="left"><a onclick="addOptionValue(' + option_row + ');" class="button"><?php echo $button_add_option_value; ?></a></td>';
			html += '      </tr>';
			html += '    </tfoot>';
			html += '  </table>';
            html += '  <select id="option-values' + option_row + '" style="display: none;">';
			
            for (i = 0; i < ui.item.option_value.length; i++) {
				html += '  <option value="' + ui.item.option_value[i]['option_value_id'] + '">' + ui.item.option_value[i]['name'] + '</option>';
            }

            html += '  </select>';			
			html += '</div>';	
		}
		
		$('#tab-option').append(html);
		
		$('#option-add').before('<a href="#tab-option-' + option_row + '" id="option-' + option_row + '">' + ui.item.label + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'#option-' + option_row + '\').remove(); $(\'#tab-option-' + option_row + '\').remove(); $(\'#vtab-option a:first\').trigger(\'click\'); return false;" /></a>');
		
		$('#vtab-option a').tabs();
		
		$('#option-' + option_row).trigger('click');		
		
		$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		$('.datetime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			timeFormat: 'h:m'
		});	
			
		$('.time').timepicker({timeFormat: 'h:m'});	
				
		option_row++;
		
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});
//--></script> 
<script type="text/javascript"><!--		
var option_value_row = <?php echo $option_value_row; ?>;


                function addOptionValue(option_row) {
                        html  = '<tbody id="option-value-row' + option_value_row + '">';
                        html += '  <input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" />';
                        html += '  <input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" value="" />';
                        html += '  <input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]"  value="" />';
                        html += '  <input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" />';
                        html += '  <input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" />';
                        html += '  <input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" value="" />';
                        html += '  <tr>';
                        html += '    <td class="left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]">';
                        html += $('#option-values' + option_row).html();
                        html += '    </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
                        html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]">';
                        html += '      <option value="+">+</option>';
                        html += '      <option value="-">-</option>';
                        html += '    </select>';
                        html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" size="5" /></td>';
                        html += '    <td class="left"><a onclick="$(\'#option-value-row' + option_value_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
                        html += '  </tr>';
                        html += '</tbody>';
            	




























	html += '      <option value="+">+</option>';
	html += '      <option value="-">-</option>';
	html += '    </select>';
	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" size="5" /></td>';	
	html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]">';
	html += '      <option value="+">+</option>';
	html += '      <option value="-">-</option>';
	html += '    </select>';
	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" size="5" /></td>';
	html += '    <td class="left"><a onclick="$(\'#option-value-row' + option_value_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#option-value' + option_row + ' tfoot').before(html);

	option_value_row++;
}
//--></script> 
<script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
	html  = '<tbody id="discount-row' + discount_row + '">';
	html += '  <tr>'; 
    html += '    <td class="left"><select name="product_discount[' + discount_row + '][customer_group_id]">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
    <?php } ?>
    html += '    </select></td>';		
    html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" size="2" /></td>';
    html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" size="2" /></td>';
	html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" /></td>';
    html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" class="date" /></td>';
	html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" class="date" /></td>';
	html += '    <td class="left"><a onclick="$(\'#discount-row' + discount_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';	
    html += '</tbody>';
	
	$('#discount tfoot').before(html);
		
	$('#discount-row' + discount_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});
	
	discount_row++;
}
//--></script> 
<script type="text/javascript"><!--
var special_row = <?php echo $special_row; ?>;

function addSpecial() {
	html  = '<tbody id="special-row' + special_row + '">';
	html += '  <tr>'; 
    html += '    <td class="left"><select name="product_special[' + special_row + '][customer_group_id]">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
    <?php } ?>
    html += '    </select></td>';		
    html += '    <td class="right"><input type="text" name="product_special[' + special_row + '][priority]" value="" size="2" /></td>';
	html += '    <td class="right"><input type="text" name="product_special[' + special_row + '][price]" value="" /></td>';
    html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][date_start]" value="" class="date" /></td>';
	html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][date_end]" value="" class="date" /></td>';
	html += '    <td class="left"><a onclick="$(\'#special-row' + special_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
    html += '</tbody>';
	
	$('#special tfoot').before(html);
 
	$('#special-row' + special_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});
	
	special_row++;
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
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;


<?php if (isset($cit_status) && $cit_status) { ?>
function addImage() {
    html  = '<tbody id="image-row' + image_row + '">';
    html += '  <tr>';
    html += '    <td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
    html += '    <td>';
    html += '      <table class="image_data">';
    html += '        <tr>';
    html += '          <td>';
    <?php if ($cit_show_language_in_tab) { ?>
    html += '            <div id="img_lang' + image_row + '" class="micro_htabs">';
    <?php foreach ($languages as $language) { ?>
    html += '              <a href="#img_lang' + image_row + '<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></a>';
    <?php } ?>
    html += '            </div>';
    <?php foreach ($languages as $language) { ?>
    html += '            <div id="img_lang' + image_row + '<?php echo $language['language_id']; ?>">';
    html += '              <table class="micro_form">';
    <?php if ($cit_show_alt_text) { ?>
    html += '                <tr>';
    html += '                  <td><?php echo $entry_image_alt; ?></td>';
    html += '                  <td><input type="text" name="product_image[' + image_row + '][descriptions][<?php echo $language['language_id']; ?>][alt_text]" size="60" value="" /></td>';
    html += '                </tr>';
    <?php } ?>
    html += '                <tr>';
    html += '                  <td><?php echo $entry_image_title; ?></td>';
    html += '                  <td>';
    html += '                    <input type="text" name="product_image[' + image_row + '][descriptions][<?php echo $language['language_id']; ?>][title_text]" size="60" value="" />';
    <?php if (!$cit_show_alt_text) { ?>
    html += '                    <input type="hidden" name="product_image[' + image_row + '][descriptions][<?php echo $language['language_id']; ?>][alt_text]" value="" />';
    <?php } ?>
    html += '                  </td>';
    html += '                </tr>';
    html += '              </table>';
    html += '            </div>';
    <?php } ?>
    <?php } else { ?>
    <?php if ($cit_show_alt_text) { ?>
    html += '            <table class="nano_form">';
    <?php foreach ($languages as $language) { ?>
    html += '              <tr>';
    html += '                <td><?php echo $entry_image_alt; ?></td>';
    html += '                <td><input type="text" name="product_image[' + image_row + '][descriptions][<?php echo $language['language_id']; ?>][alt_text]" size="60" value="" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td>';
    html += '              </tr>';
    html += '              <tr>';
    html += '                <td><?php echo $entry_image_title; ?></td>';
    html += '                <td><input type="text" name="product_image[' + image_row + '][descriptions][<?php echo $language['language_id']; ?>][title_text]" size="60" value="" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td>';
    html += '              </tr>';
    <?php } ?>
    html += '            </table>';
    <?php } else { ?>
    html += '            <table class="pico_form">';
    html += '              <tr>';
    html += '                <td><?php echo $entry_image_title; ?></td>';
    html += '              </tr>';
    <?php foreach ($languages as $language) { ?>
    html += '              <tr>';
    html += '                <td>';
    html += '                  <input type="text" name="product_image[' + image_row + '][descriptions][<?php echo $language['language_id']; ?>][title_text]" size="60" value="" />&nbsp;<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />';
    html += '                  <input type="hidden" name="product_image[' + image_row + '][descriptions][<?php echo $language['language_id']; ?>][alt_text]" value="" />';
    html += '                </td>';
    html += '              </tr>';
    <?php } ?>
    html += '            </table>';
    <?php } ?>
    <?php } ?>
    html += '          </td>';
    html += '        </tr>';
    html += '      </table>';
    html += '    </td>';
    html += '    <td class="right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" size="2" /></td>';
    html += '    <td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
    html += '  </tr>';
    html += '</tbody>';

    $('#images tfoot').before(html);

    <?php if ($cit_show_language_in_tab) { ?>
    $('#img_lang' + image_row + ' a').tabs();
    <?php } ?>

    image_row++;
}

function __addImage__() {
<?php } else { ?>
function addImage() {
<?php } ?>
            
    html  = '<tbody id="image-row' + image_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
	html += '    <td class="right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" size="2" /></td>';
	html += '    <td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#images tfoot').before(html);
	
	image_row++;
}
//--></script> 
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs(); 

<?php if (isset($cit_status) && $cit_status && $cit_show_language_in_tab) { ?>
$('#main_img_lang a').tabs();
<?php
    for ($i = 0; $i < $image_row; $i++)
        echo "$('#img_lang" . $i . " a').tabs();\n";
}
?>
            
$('#vtab-option a').tabs();
//--></script> 

                <script type="text/javascript"><!--
                function updateStockCont()
                {
                    var getStockContStatus = $('#has_option').val();
                    if(getStockContStatus == 0)
                    {
                        $('.isStockCont').hide();
                        $('.notStockCont').show();
                    }else{
                        $('.isStockCont').show();
                        $('.notStockCont').hide();
                    }
                }

                function optionActiveChange()
                {
                    var valChecked = $('#product_option_stock_active_change').prop('checked');

                    if(valChecked == true)
                    {
                        $('.product_option_stock_active').prop('checked', true);
                    }else{
                        $('.product_option_stock_active').prop('checked', false);
                    }
                }

                var grp_price = <?php echo $grp_price; ?>;

                function addGroupPrice(id)
                {
                    var appendHtml = '';
                    appendHtml += '<div style="margin:5px 0px; padding:5px; background-color:#EFEFEF;" id="grp_price_'+id+'_'+grp_price+'">';
                        appendHtml += '<p><span style="margin-left:5px; margin-right:5px;">Group</span><select name="product_option_stock['+id+'][grp]['+grp_price+'][grp_id]">';

                        <?php foreach ($customer_groups as $customer_group) { ?>
                        appendHtml += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
                        <?php } ?>

                        appendHtml += '</select></p><p><span style="margin-left:5px; margin-right:5px;">Price</span>';
                        appendHtml += '<input type="text" name="product_option_stock['+id+'][grp]['+grp_price+'][price]" style="width:50px; margin-right:5px;" />';

                        var divId = "'grp_price_"+id+"_"+grp_price+"'";

                        appendHtml += '<a class="button" onclick="removeGroupPrice('+divId+');" style="float:right; margin-top:-2px;">X</a>';
                    appendHtml += '</p></div><div style="clear:both;"></div>';

                    $('#groupPrice'+id).append(appendHtml);
                    grp_price++;
                }

                var discount_price = <?php echo $discount_price; ?>;

                function addDiscountPrice(id)
                {
                    var appendHtml = '';
                    appendHtml += '<div style="margin:5px 0px; padding:5px; background-color:#EFEFEF;" id="discount_price_'+id+'_'+discount_price+'">';
                    appendHtml += '<p><span style="margin-left:5px; margin-right:5px;">Group</span><select name="product_option_stock['+id+'][discount]['+discount_price+'][grp]">';

                    <?php foreach ($customer_groups as $customer_group) { ?>
                    appendHtml += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
                    <?php } ?>

                    appendHtml += '</select><p><p><span style="margin-left:5px; margin-right:5px;">Qty</span>';
                    appendHtml += '<input type="text" name="product_option_stock['+id+'][discount]['+discount_price+'][qty]" style="width:50px; margin-right:5px;" />';

                    appendHtml += '</select><span style="margin-left:5px; margin-right:5px;">Price</span>';
                    appendHtml += '<input type="text" name="product_option_stock['+id+'][discount]['+discount_price+'][price]" style="width:50px; margin-right:5px;" />';

                    var divId = "'discount_price_"+id+"_"+discount_price+"'";

                    appendHtml += '<a class="button" onclick="removeDiscountPrice('+divId+');" style="float:right; margin-top:-2px;">X</a>';
                    appendHtml += '</p></div><div style="clear:both;"></div>';

                    $('#discountPrice'+id).append(appendHtml);

                    discount_price++;
                }

                function removeGroupPrice(id) { $('#'+id).remove(); }
                function removeDiscountPrice(id) { $('#'+id).remove(); }

                $(document).ready(function() { updateStockCont(); });
                //--></script>
            
<?php echo $footer; ?>