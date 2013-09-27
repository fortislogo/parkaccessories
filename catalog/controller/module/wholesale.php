<?php  
class ControllerModuleWholesale extends Controller {
	function index($setting) {
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/wholesale.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/wholesale.tpl';
		} else {
			$this->template = 'default/template/module/wholesale.tpl';
		}
		
		$this->render();
  	}
}
?>