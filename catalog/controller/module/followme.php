<?php
// ------------------------------------------
// Follow Me for Opencart v1.5.2+ 
// Original by KangDJ
// Updated by villagedefrance (V2) 
// Updated by HelderIM (V3) 
// ------------------------------------------

class ControllerModuleFollowMe extends Controller {

	private $_name = 'followme';

	protected function index() {
		static $module = 0;
		
		$this->language->load('module/' . $this->_name);

      	$this->data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('localisation/language');

		$languages = $this->model_localisation_language->getLanguages();
		
		foreach ($languages as $language) {
			if (isset($this->request->post[$this->_name . '_title' . $language['language_id']])) {
				$this->data[$this->_name . '_title' . $language['language_id']] = $this->request->post[$this->_name . '_title' . $language['language_id']];
			} else {
				$this->data[$this->_name . '_title' . $language['language_id']] = $this->config->get($this->_name . '_title' . $language['language_id']);
			}
		}
		
		$this->data['title'] = $this->config->get($this->_name . '_title' . $this->config->get('config_language_id'));

		$this->data['header'] = $this->config->get($this->_name . '_header');
		
		$this->data['icon'] = $this->config->get($this->_name . '_icon');
		
		if (!$this->data['title']) { $this->data['title'] = $this->data['heading_title']; } 
		if (!$this->data['header']) { $this->data['title'] = ''; }
		
		$this->data['box'] = $this->config->get($this->_name . '_box');
		
		$this->load->model('setting/store');
		
		$this->data['store'] = $this->config->get('config_name');
		
		$this->data['instagram_url']  = $this->config->get($this->_name . '_instagram');
		$this->data['facebook_url']  = $this->config->get($this->_name . '_facebook');
        $this->data['twitter_url'] = $this->config->get($this->_name . '_twitter');
		$this->data['google_url'] = $this->config->get($this->_name . '_google');
		$this->data['linkedin_url'] = $this->config->get($this->_name . '_linkedin');
		$this->data['pinterest_url'] = $this->config->get($this->_name . '_pinterest');
		$this->data['hyves_url'] = $this->config->get($this->_name . '_hyves');
		
		$this->data['instagram']  = $this->config->get($this->_name . '_instagram_usage');
		$this->data['face']  = $this->config->get($this->_name . '_facebook_usage');
        $this->data['twit'] = $this->config->get($this->_name . '_twitter_usage');
		$this->data['gplus'] = $this->config->get($this->_name . '_gplus_usage');
		$this->data['linked'] = $this->config->get($this->_name . '_linkedin_usage');
		$this->data['pin'] = $this->config->get($this->_name . '_pinterest_usage');
		$this->data['hyve'] = $this->config->get($this->_name . '_hyves_usage');
		
		$this->load->model('tool/image');
		
		if ($this->config->get($this->_name . '_instagram_image'))
	   	{
			$image = $this->config->get($this->_name . '_instagram_image');
			$this->data['instagram_image'] = $this->model_tool_image->resize($image, 140, 140);
		}
		else
		{
			$this->data['instagram_image'] = false;
		}
		
		if ($this->config->get($this->_name . '_facebook_image'))
	   	{
			$image = $this->config->get($this->_name . '_facebook_image');
			$this->data['facebook_image'] = $this->model_tool_image->resize($image, 140, 140);
		}
		else
		{
			$this->data['facebook_image'] = false;
		}
		
		if ($this->config->get($this->_name . '_pinterest_image'))
	   	{
			$image = $this->config->get($this->_name . '_pinterest_image');
			$this->data['pinterest_image'] = $this->model_tool_image->resize($image, 140, 140);
		}
		else
		{
			$this->data['pinterest_image'] = false;
		}
		
		$this->data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/' . $this->_name . '.tpl';
		} else {
			$this->template = 'default/template/module/' . $this->_name . '.tpl';
		}
	
		$this->render();
	}
}
?>
