<?php
// ------------------------------------------
// Follow Me for Opencart v1.5.2+ 
// Original by KangDJ
// Updated by villagedefrance (V2) 
// Updated by HelderIM (V3) 
// ------------------------------------------

class ControllerModuleFollowMe extends Controller {
	private $error = array();
	private $_name = 'followme';
	private $_version = '1.5.2'; 

	public function index() {
		$this->load->language('module/' . $this->_name);

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->data[$this->_name . '_version'] = $this->_version;
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) 
		{
			$this->model_setting_setting->editSetting($this->_name, $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
		
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_module_settings'] = $this->language->get('text_module_settings');
		
		$this->data['entry_header'] = $this->language->get('entry_header'); 
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_icon'] = $this->language->get('entry_icon');
		$this->data['entry_box'] = $this->language->get('entry_box');
		$this->data['entry_box_usage'] = $this->language->get('entry_box_usage');
		$this->data['entry_yes'] = $this->language->get('entry_yes'); 
		$this->data['entry_no']	= $this->language->get('entry_no');
		
		$this->data['entry_instagram'] = $this->language->get('entry_instagram');
		$this->data['entry_facebook'] = $this->language->get('entry_facebook');
        $this->data['entry_twitter'] = $this->language->get('entry_twitter');
		$this->data['entry_google'] = $this->language->get('entry_google');
		$this->data['entry_linkedin'] = $this->language->get('entry_linkedin');
		$this->data['entry_pinterest'] = $this->language->get('entry_pinterest');
		$this->data['entry_hyves'] = $this->language->get('entry_hyves');
		
		$this->data['entry_instagram_usage'] = $this->language->get('entry_instagram_usage');
		$this->data['entry_facebook_usage'] = $this->language->get('entry_facebook_usage');
        $this->data['entry_twitter_usage'] = $this->language->get('entry_twitter_usage');
		$this->data['entry_gplus_usage'] = $this->language->get('entry_gplus_usage');
		$this->data['entry_linkedin_usage'] = $this->language->get('entry_linkedin_usage');
		$this->data['entry_pinterest_usage'] = $this->language->get('entry_pinterest_usage');
		$this->data['entry_hyves_usage'] = $this->language->get('entry_hyves_usage');
		
		$this->data['entry_template']	= $this->language->get('entry_template');
        
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		
		$this->data['token'] = $this->session->data['token'];
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
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
			'href'      => $this->url->link('module/' . $this->_name, 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/' . $this->_name, 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['templates'] = array();

		$directories = glob(DIR_CATALOG . 'view/theme/*', GLOB_ONLYDIR);
		
		foreach ($directories as $directory) {
			$this->data['templates'][] = basename($directory);
		}	
		
		if (isset($this->request->post['config_template'])) {
			$this->data['config_template'] = $this->request->post['config_template'];
		} else {
			$this->data['config_template'] = $this->config->get('config_template');			
		}	
		
		$this->load->model('localisation/language');
		
		$languages = $this->model_localisation_language->getLanguages();
		
		foreach ($languages as $language) {
			if (isset($this->request->post[$this->_name . '_title' . $language['language_id']])) {
				$this->data[$this->_name . '_title' . $language['language_id']] = $this->request->post[$this->_name . '_title' . $language['language_id']];
			} else {
				$this->data[$this->_name . '_title' . $language['language_id']] = $this->config->get($this->_name . '_title' . $language['language_id']);
			}
		}
		
		$this->data['languages'] = $languages;
		
		if (isset($this->request->post[$this->_name . '_header'])) {
			$this->data[$this->_name . '_header'] = $this->request->post[$this->_name . '_header'];
		} else {
			$this->data[$this->_name . '_header'] = $this->config->get( $this->_name . '_header' );
		}
		
		if (isset($this->request->post[$this->_name . '_title'])) { 
			$this->data[$this->_name . '_title'] = $this->request->post[$this->_name . '_title']; 
		} else { 
			$this->data[$this->_name . '_title'] = $this->config->get($this->_name . '_title' ); 
		} 
		
		
		if (isset($this->request->post[$this->_name . '_icon'])) { 
			$this->data[$this->_name . '_icon'] = $this->request->post[$this->_name . '_icon']; 
		} else { 
			$this->data[$this->_name . '_icon'] = $this->config->get($this->_name . '_icon' ); 
		} 
		
		if (isset($this->request->post[$this->_name . '_box'])) { 
			$this->data[$this->_name . '_box'] = $this->request->post[$this->_name . '_box']; 
		} else { 
			$this->data[$this->_name . '_box'] = $this->config->get($this->_name . '_box' ); 
		}
		
		if (isset($this->request->post[$this->_name . '_box_usage'])) { 
			$this->data[$this->_name . '_box_usage'] = $this->request->post[$this->_name . '_box_usage']; 
		} else { 
			$this->data[$this->_name . '_box_usage'] = $this->config->get($this->_name . '_box_usage' ); 
		}
		
		$this->load->model('tool/image');
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		if (isset($this->request->post[$this->_name . '_instagram_image'])) 
		{
			$this->data[$this->_name . '_instagram_image'] = $this->request->post[$this->_name . '_instagram_image'];
			$image = $this->request->post[$this->_name . '_instagram_image'];
		} 
		else 
		{
			$this->data[$this->_name . '_instagram_image'] = $this->config->get($this->_name . '_instagram_image');
			$image = $this->config->get($this->_name . '_instagram_image');
		}
		
		$this->data[$this->_name . '_instagram_thumb'] = $this->model_tool_image->resize($image, 100, 100);
		
		
		if (isset($this->request->post[$this->_name . '_facebook_image'])) {
			$this->data[$this->_name . '_facebook_image'] = $this->request->post[$this->_name . '_facebook_image'];
			$image = $this->request->post[$this->_name . '_facebook_image'];
		} else {
			$this->data[$this->_name . '_facebook_image'] = $this->config->get($this->_name . '_facebook_image');
			$image = $this->config->get($this->_name . '_facebook_image');
		}
		
		$this->data[$this->_name . '_facebook_thumb'] = $this->model_tool_image->resize($image, 100, 100);
		
		if (isset($this->request->post[$this->_name . '_twitter_image'])) {
			$this->data[$this->_name . '_twitter_image'] = $this->request->post[$this->_name . '_twitter_image'];
			$image = $this->request->post[$this->_name . '_twitter_image'];
		} else {
			$this->data[$this->_name . '_twitter_image'] = $this->config->get($this->_name . '_twitter_image');
			$image = $this->config->get($this->_name . '_twitter_image');
		}
		
		$this->data[$this->_name . '_twitter_thumb'] = $this->model_tool_image->resize($image, 100, 100);
		
		if (isset($this->request->post[$this->_name . '_google_image'])) {
			$this->data[$this->_name . '_google_image'] = $this->request->post[$this->_name . '_google_image'];
			$image = $this->request->post[$this->_name . '_google_image'];
		} else {
			$this->data[$this->_name . '_google_image'] = $this->config->get($this->_name . '_google_image');
			$image = $this->config->get($this->_name . '_google_image');
		}
		
		$this->data[$this->_name . '_google_thumb'] = $this->model_tool_image->resize($image, 100, 100);
		
		if (isset($this->request->post[$this->_name . '_linkedin_image'])) {
			$this->data[$this->_name . '_linkedin_image'] = $this->request->post[$this->_name . '_linkedin_image'];
			$image = $this->request->post[$this->_name . '_linkedin_image'];
		} else {
			$this->data[$this->_name . '_linkedin_image'] = $this->config->get($this->_name . '_linkedin_image');
			$image = $this->config->get($this->_name . '_linkedin_image');
		}
		
		$this->data[$this->_name . '_linkedin_thumb'] = $this->model_tool_image->resize($image, 100, 100);
		
		if (isset($this->request->post[$this->_name . '_pinterest_image'])) {
			$this->data[$this->_name . '_pinterest_image'] = $this->request->post[$this->_name . '_pinterest_image'];
			$image = $this->request->post[$this->_name . '_pinterest_image'];
		} else {
			$this->data[$this->_name . '_pinterest_image'] = $this->config->get($this->_name . '_pinterest_image');
			$image = $this->config->get($this->_name . '_pinterest_image');
		}
		
		$this->data[$this->_name . '_pinterest_thumb'] = $this->model_tool_image->resize($image, 100, 100);
		
		if (isset($this->request->post[$this->_name . '_hyves_image'])) {
			$this->data[$this->_name . '_hyves_image'] = $this->request->post[$this->_name . '_hyves_image'];
			$image = $this->request->post[$this->_name . '_hyves_image'];
		} else {
			$this->data[$this->_name . '_hyves_image'] = $this->config->get($this->_name . '_hyves_image');
			$image = $this->config->get($this->_name . '_hyves_image');
		}
		
		$this->data[$this->_name . '_hyves_thumb'] = $this->model_tool_image->resize($image, 100, 100);
		
		if (isset($this->request->post[$this->_name . '_instagram'])) {
			$this->data[$this->_name . '_instagram'] = $this->request->post[$this->_name . '_instagram'];
		} else {
			$this->data[$this->_name . '_instagram'] = $this->config->get($this->_name . '_instagram');
		}	
		
		if (isset($this->request->post[$this->_name . '_facebook'])) {
			$this->data[$this->_name . '_facebook'] = $this->request->post[$this->_name . '_facebook'];
		} else {
			$this->data[$this->_name . '_facebook'] = $this->config->get($this->_name . '_facebook');
		}	
        
        if (isset($this->request->post[$this->_name . '_twitter'])) {
			$this->data[$this->_name . '_twitter'] = $this->request->post[$this->_name . '_twitter'];
		} else {
			$this->data[$this->_name . '_twitter'] = $this->config->get($this->_name . '_twitter');
		}
		
		if (isset($this->request->post[$this->_name . '_google'])) {
			$this->data[$this->_name . '_google'] = $this->request->post[$this->_name . '_google'];
		} else {
			$this->data[$this->_name . '_google'] = $this->config->get($this->_name . '_google');
		}
		
		
		
		if (isset($this->request->post[$this->_name . '_linkedin'])) {
			$this->data[$this->_name . '_linkedin'] = $this->request->post[$this->_name . '_linkedin'];
		} else {
			$this->data[$this->_name . '_linkedin'] = $this->config->get($this->_name . '_linkedin');
		}
		
		
		
		if (isset($this->request->post[$this->_name . '_pinterest'])) {
			$this->data[$this->_name . '_pinterest'] = $this->request->post[$this->_name . '_pinterest'];
		} else {
			$this->data[$this->_name . '_pinterest'] = $this->config->get($this->_name . '_pinterest');
		}
		
		
		
		if (isset($this->request->post[$this->_name . '_hyves'])) {
			$this->data[$this->_name . '_hyves'] = $this->request->post[$this->_name . '_hyves'];
		} else {
			$this->data[$this->_name . '_hyves'] = $this->config->get($this->_name . '_hyves');
		}
		
		
		
		
		if (isset($this->request->post[$this->_name . '_instagram_usage'])) {
			$this->data[$this->_name . '_instagram_usage'] = $this->request->post[$this->_name . '_instagram_usage'];
		} else {
			$this->data[$this->_name . '_instagram_usage'] = $this->config->get($this->_name . '_instagram_usage');
		}	
		
		if (isset($this->request->post[$this->_name . '_facebook_usage'])) {
			$this->data[$this->_name . '_facebook_usage'] = $this->request->post[$this->_name . '_facebook_usage'];
		} else {
			$this->data[$this->_name . '_facebook_usage'] = $this->config->get($this->_name . '_facebook_usage');
		}	
        
        if (isset($this->request->post[$this->_name . '_twitter_usage'])) {
			$this->data[$this->_name . '_twitter_usage'] = $this->request->post[$this->_name . '_twitter_usage'];
		} else {
			$this->data[$this->_name . '_twitter_usage'] = $this->config->get($this->_name . '_twitter_usage');
		}
		
		if (isset($this->request->post[$this->_name . '_gplus_usage'])) {
			$this->data[$this->_name . '_gplus_usage'] = $this->request->post[$this->_name . '_gplus_usage'];
		} else {
			$this->data[$this->_name . '_gplus_usage'] = $this->config->get($this->_name . '_gplus_usage');
		}
		
		if (isset($this->request->post[$this->_name . '_linkedin_usage'])) {
			$this->data[$this->_name . '_linkedin_usage'] = $this->request->post[$this->_name . '_linkedin_usage'];
		} else {
			$this->data[$this->_name . '_linkedin_usage'] = $this->config->get($this->_name . '_linkedin_usage');
		}
		
		if (isset($this->request->post[$this->_name . '_pinterest_usage'])) {
			$this->data[$this->_name . '_pinterest_usage'] = $this->request->post[$this->_name . '_pinterest_usage'];
		} else {
			$this->data[$this->_name . '_pinterest_usage'] = $this->config->get($this->_name . '_pinterest_usage');
		}
		
		if (isset($this->request->post[$this->_name . '_hyves_usage'])) {
			$this->data[$this->_name . '_hyves_usage'] = $this->request->post[$this->_name . '_hyves_usage'];
		} else {
			$this->data[$this->_name . '_hyves_usage'] = $this->config->get($this->_name . '_hyves_usage');
		}
		
		if (isset($this->request->post[$this->_name . '_template'])) {
			$this->data[$this->_name . '_template'] = $this->request->post[$this->_name . '_template'];
		} else {
			$this->data[$this->_name . '_template'] = $this->config->get($this->_name . '_template');
		}
	
		$this->data['modules'] = array();
		
		if (isset($this->request->post[$this->_name . '_module'])) {
			$this->data['modules'] = $this->request->post[$this->_name . '_module'];
		} elseif ($this->config->get($this->_name . '_module')) { 
			$this->data['modules'] = $this->config->get($this->_name . '_module');
		}
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
	
		$this->template = 'module/' . $this->_name . '.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/' . $this->_name)) {
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
