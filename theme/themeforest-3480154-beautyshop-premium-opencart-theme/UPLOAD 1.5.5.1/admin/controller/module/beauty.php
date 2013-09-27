<?php
################################################################################################
#  developed by dedalx http://dedalx.com/		                              	       #
#  All rights reserved                                                                         #
################################################################################################
class ControllerModuleBeauty extends Controller {
	
	private $error = array(); 
	
	public function index() {   
		
		// OpenCart 1.5.4
		// $this->load->language('module/beauty'))
		
		// OpenCart 1.5.5
		$this->language->load('module/beauty');
		
		//Set the title from the language file $_['heading_title'] string
		//$this->document->setTitle($this->language->get('heading_title'));
		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		//Load the settings model. You can also add any other models you want to load here.
		$this->load->model('setting/setting');
		
					$this->load->model('tool/image');
	
	if (isset($this->request->post['dx_image'])) {
			$this->data['dx_image'] = $this->request->post['dx_image'];
			$dx_image = $this->request->post['dx_image'];
		} else {
			$this->data['dx_image'] = '';
		}
		
		if (isset($this->request->post['dx_full_image'])) {
			$this->data['dx_full_image'] = $this->request->post['dx_full_image'];
			$dx_image = $this->request->post['dx_full_image'];
		} else {
			$this->data['dx_full_image'] = '';
		}
		
		
		//Save the settings if the user has submitted the admin form (ie if someone has pressed save).
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('beauty', $this->request->post);	

				
					
			$this->session->data['success'] = $this->language->get('text_success');
		
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
			$this->data['text_image_manager'] = 'Image manager';
					$this->data['token'] = $this->session->data['token'];		
		
		$text_strings = array(
				'heading_title',
				'text_enabled',
				'text_disabled',
				'text_content_top',
				'text_content_bottom',
				'text_column_left',
				'text_column_right',
				'entry_layout',
				'entry_position',
				'entry_status',
				'entry_sort_order',
				'button_save',
				'button_cancel',
				'button_add_module',
				'button_remove',
				'entry_example' 
		);
		
		foreach ($text_strings as $text) {
			$this->data[$text] = $this->language->get($text);
		}
		

		// store config data
		
		$config_data = array(
		'beauty_status',
		'beauty_color_body_bg',
		'beauty_color_content_bg',
		'beauty_color_headermenu_bg',
		'beauty_color_headermenu_link',
		'beauty_color_link',
		'beauty_color_linkhover',
		'beauty_color_text',
		'beauty_color_header',
		'beauty_color_moduleheader',
		'beauty_color_price',
		'beauty_color_pricegrid',
		'beauty_color_priceold',
		'beauty_color_buttonbg',
		'beauty_color_buttontextbg',
		'beauty_color_buttonhoverbg',
		'beauty_color_buttontext',
		'beauty_color_imagebg',
		'beauty_color_buttonlink',
		'beauty_color_topmenu_start',
		'beauty_color_topmenu_end',
		'beauty_color_topmenu_link',
		'beauty_color_topmenu_linkhover',
		'beauty_color_border',
		'beauty_color_aboutbg',
		'beauty_color_aboutheader',
		'beauty_color_footerbg',
		'beauty_color_footerheader',
		'beauty_color_footerlink',
		'beauty_color_footertext',
		'beauty_color_formbg',
		
		'beauty_body_bg_pattern',
		'beauty_body_font',
		'beauty_body_fontsize',
		'beauty_header_font',
		'beauty_buttons_font',
		'beauty_header_font_weight',
		'beauty_buttons_font_weight',
		'beauty_header_font_subset',
		'beauty_buttons_font_subset',
		
		'beauty_buttons_fontsize',
		'beauty_header_fontsize',
		'beauty_fonts_transform',
		'beauty_bfonts_transform',
		'beauty_footer_b',
		'dx_image',
		'beauty_preview',
		'dx_bg_image',
		'dx_full_image',
		'beauty_full_preview',
		'dx_full_bg_image',
		'beauty_transparent_content',
		'beauty_layout_responsive',
		'beauty_layout_related',
		'beauty_layout_theight',
		'beauty_layout_rightbaners',
		'beauty_layout_bottombaners',
		'beauty_layout_pdisplay',
		'beauty_layout_sliderbg',
		'beauty_layout_custommenu',
		'beauty_layout_custommenu_item1_text',
		'beauty_layout_custommenu_item2_text',
		'beauty_layout_custommenu_item3_text',
		'beauty_layout_custommenu_item4_text',
		'beauty_layout_custommenu_item5_text',
		'beauty_layout_custommenu_item6_text',
		'beauty_layout_custommenu_item7_text',
		'beauty_layout_custommenu_item8_text',
		'beauty_layout_custommenu_item9_text',
		'beauty_layout_custommenu_item10_text',
		'beauty_layout_custommenu_item1_url',
		'beauty_layout_custommenu_item2_url',
		'beauty_layout_custommenu_item3_url',
		'beauty_layout_custommenu_item4_url',
		'beauty_layout_custommenu_item5_url',
		'beauty_layout_custommenu_item6_url',
		'beauty_layout_custommenu_item7_url',
		'beauty_layout_custommenu_item8_url',
		'beauty_layout_custommenu_item9_url',
		'beauty_layout_custommenu_item10_url',
		'beauty_layout_donthidesliderimages',
		'beauty_layout_donthidewelcomeimages',
		'beauty_layout_mainmenu_border',
		
		'beauty_layout_custommenu_block',
		'beauty_layout_custommenu_block_title',
		'beauty_layout_custommenu_block_content',
		'beauty_layout_custommenu_position',
		'beauty_layout_custommenu_block_width',
		'beauty_layout_custommenu_block_position',
		
		'beauty_layout_refsearch',
		'beauty_layout_shortenby',
		
		'layout_product_customtab_content',
		'layout_product_customtab_title',
		'layout_product_customtab',
		'layout_product_customcontactblock_content',
		'layout_product_customcontactblock',
		
		'layout_product_showsalebadge',
		'layout_product_showsalebadge_title',
		'layout_product_showsalebadge_color',
		
		'beauty_effects_slideranim',
		'beauty_effects_carousel',
		'beauty_effects_productimage',
		
		'beauty_custom_css',
		'beauty_custom_js',
		
		'customFooter_status',
		'about_status',
			'about_header', 
			'about_text',
		'contact_header',
		    'contact_status',
		    'contact_subheader',
		'telephone1',
		'telephone2',
		'email1',
		'email2',
		'skype',
		'fax',
		'facebook_status',
		'facebook_id',
		'custom_footer_column_status',
		'custom_footer_column_header',
		'custom_footer_column_content',
		  'twitter_column_status',
		  'twitter_column_header',
		'twitter_number_of_tweets',
		'twitter_username',
		'categories_column_status',
		
		'social_icons_rss_url',
		'social_icons_googleplus_url',
		'social_icons_pinterest_url',
		'social_icons_youtube_url',
		
		'about_us_image',
		'about_us_image_status',
		'about_us_image_preview',
		
		'payment_icons_enabled',
		
		'payment_icons_paypal',
		'payment_icons_paypal_url',
		
		'payment_icons_visa',
		'payment_icons_visa_url',
		
		'payment_icons_mastercard',
		'payment_icons_mastercard_url',
		
		'payment_icons_discover',
		'payment_icons_discover_url',
		
		'payment_icons_amex',
		'payment_icons_amex_url',
		
		'payment_icons_moneybookers',
		'payment_icons_moneybookers_url',
		
		'payment_icons_westernunion',
		'payment_icons_westernunion_url',
		
		'dx_paymenticon_custom',
		'dx_paymenticon_image',
		'beauty_preview_payment',
		'dx_paymenticon_custom_url',
		
		'footer_powered_text'
		
		);
		
		foreach ($config_data as $conf) {
			if (isset($this->request->post[$conf])) {
				$this->data[$conf] = $this->request->post[$conf];
			} else {
				$this->data[$conf] = $this->config->get($conf);
			}
		}
		
		
		
	
		//This creates an error message. The error['warning'] variable is set by the call to function validate() in this controller (below)
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		//SET UP BREADCRUMB TRAIL. YOU WILL NOT NEED TO MODIFY THIS UNLESS YOU CHANGE YOUR MODULE NAME.
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/beauty', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/beauty', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

	
		//This code handles the situation where you have multiple instances of this module, for different layouts.
		if (isset($this->request->post['beauty_module'])) {
			$modules = explode(',', $this->request->post['beauty_module']);
		} elseif ($this->config->get('beauty_module') != '') {
			$modules = explode(',', $this->config->get('beauty_module'));
		} else {
			$modules = array();
		}			
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
				
		foreach ($modules as $module) {
			if (isset($this->request->post['beauty_' . $module . '_layout_id'])) {
				$this->data['beauty_' . $module . '_layout_id'] = $this->request->post['beauty_' . $module . '_layout_id'];
			} else {
				$this->data['beauty_' . $module . '_layout_id'] = $this->config->get('beauty_' . $module . '_layout_id');
			}	
			
			if (isset($this->request->post['beauty_' . $module . '_position'])) {
				$this->data['beauty_' . $module . '_position'] = $this->request->post['beauty_' . $module . '_position'];
			} else {
				$this->data['beauty_' . $module . '_position'] = $this->config->get('beauty_' . $module . '_position');
			}	
			
			if (isset($this->request->post['beauty_' . $module . '_status'])) {
				$this->data['beauty_' . $module . '_status'] = $this->request->post['beauty_' . $module . '_status'];
			} else {
				$this->data['beauty_' . $module . '_status'] = $this->config->get('beauty_' . $module . '_status');
			}	
						
			if (isset($this->request->post['beauty_' . $module . '_sort_order'])) {
				$this->data['beauty_' . $module . '_sort_order'] = $this->request->post['beauty_' . $module . '_sort_order'];
			} else {
				$this->data['beauty_' . $module . '_sort_order'] = $this->config->get('beauty_' . $module . '_sort_order');
			}				
		}
		

		
		$this->data['modules'] = $modules;
		
		if (isset($this->request->post['beauty_module'])) {
			$this->data['beauty_module'] = $this->request->post['beauty_module'];
		} else {
			$this->data['beauty_module'] = $this->config->get('beauty_module');
		}

		//Choose which template file will be used to display this request.
		$this->template = 'module/beauty.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
		
		if (isset($this->data['dx_paymenticon_image']) && file_exists(DIR_IMAGE . $this->data['dx_paymenticon_image'])) {
			$this->data['beauty_preview_payment'] = $this->model_tool_image->resize($this->data['dx_paymenticon_image'], 70, 70);
		} else {
			$this->data['beauty_preview_payment'] = $this->model_tool_image->resize('no_image.jpg', 50, 70);
		}
		
		if (isset($this->data['dx_image']) && file_exists(DIR_IMAGE . $this->data['dx_image'])) {
			$this->data['beauty_preview'] = $this->model_tool_image->resize($this->data['dx_image'], 70, 70);
		} else {
			$this->data['beauty_preview'] = $this->model_tool_image->resize('no_image.jpg', 50, 70);
		}
		
		
		if (isset($this->data['dx_full_image']) && file_exists(DIR_IMAGE . $this->data['dx_full_image'])) {
			$this->data['beauty_full_preview'] = $this->model_tool_image->resize($this->data['dx_full_image'], 70, 70);
		} else {
			$this->data['beauty_full_preview'] = $this->model_tool_image->resize('no_image.jpg', 50, 70);
		}

		if (isset($this->data['about_us_image']) && file_exists(DIR_IMAGE . $this->data['about_us_image'])) {
			$this->data['about_us_image_preview'] = $this->model_tool_image->resize($this->data['about_us_image'], 70, 70);
		} else {
			$this->data['about_us_image_preview'] = $this->model_tool_image->resize('no_image.jpg', 50, 70);
		}
		
		//Send the output.
		$this->response->setOutput($this->render());
	}
	
	/*
	 * 
	 * This function is called to ensure that the settings chosen by the admin user are allowed/valid.
	 * You can add checks in here of your own.
	 * 
	 */
	
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/beauty')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}


}
?>