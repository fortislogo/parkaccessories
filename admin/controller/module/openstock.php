<?php  
/**
 * OpenStock controller class
 * Created by James Allsup / Welford Media
 * http://www.welfordmedia.co.uk / http://support.welfordmedia.co.uk
 */
class ControllerModuleOpenstock extends Controller {
    private $error = array();
    
    public function index(){
        $this->load->model('openstock/openstock');
        $this->load->model('setting/setting');

        $this->data = array_merge($this->data, $this->load->language('module/openstock'));

        $this->document->setTitle($this->data['heading_title']);
        
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('openstock', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
        
        if (isset($this->session->data['error'])) {
            $this->data['error'] = $this->session->data['error'];
            unset($this->session->data['error']);
        } else {
            $this->data['error'] = '';
        }

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }
        
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
            'href'      => $this->url->link('module/openstock', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['token']        = $this->session->data['token'];
        $this->data['cancel']       = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['export']       = $this->url->link('module/openstock/export', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['import']       = $this->url->link('module/openstock/import', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['optionLink']   = $this->url->link('catalog/option', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['token']        = $this->session->data['token'];
        $this->data['optionTest']   = $this->model_openstock_openstock->checkOptionOrders();
        
        $this->data['action'] = $this->url->link('module/openstock', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['openstock_show_default_price'] = $this->config->get('openstock_show_default_price');

        $this->template = 'module/openstock.tpl';
        $this->children = array(
                'common/header',
                'common/footer'
        );
        $this->response->setOutput($this->render());
    }
    
    public function install(){
        $this->load->model('openstock/openstock');
        $this->load->model('setting/setting');
        
        $this->model_openstock_openstock->install();
        
        $this->model_setting_setting->editSetting('openstock', array('openstock_show_default_price' => '0'));
    }
    
    public function uninstall(){        
        $this->load->model('openstock/openstock');
        
        $this->model_openstock_openstock->uninstall();
    }

    public function repair(){
        $this->load->model('openstock/openstock');

        $this->model_openstock_openstock->repair();
    }
    
    public function export(){
        $this->load->model('openstock/openstock');
        $this->load->model('openstock/csv');
        
        $this->model_openstock_csv->init();
        
        $this->model_openstock_csv->setHeading('VID #','SKU','Product name','Variant name','Stock','Weight','Price','Status');
        
        $products = $this->model_openstock_openstock->getProductsWithOptions();
        
        if($products != false){
            foreach($products as $product){
                foreach($product['options'] as $option){
                    $this->model_openstock_csv->addLine(
                        $option['id'],
                        $option['sku'],
                        utf8_decode(html_entity_decode($product['name'])),
                        utf8_decode(html_entity_decode($option['combi'])),
                        $option['stock'], 
                        $option['weight'],
                        $option['price'], 
                        $option['active']
                    );
                }
            }

            $this->model_openstock_csv->output("D","OpenStock_export.csv");
            
            $this->model_openstock_csv->clear();
        }
    }
    
    public function import(){
        $this->load->language('module/openstock');
        
        if($this->request->server['REQUEST_METHOD'] != 'POST'){
            $this->session->data['error'] = $this->language->get('notice_error_nofile');
        }else{
            if($fp = fopen($_FILES['uploadFile']['tmp_name'],'r')){
                $c = 0;
                while($csv_line = fgetcsv($fp,1024)){
                    if($c != 0){
                        $this->db->query("
                            UPDATE `" . DB_PREFIX . "product_option_relation` 
                            SET 
                                `sku` = '".$this->db->escape($csv_line['1'])."',
                                `stock` = '".(int)$csv_line['4']."',
                                `weight` = " . (double) $csv_line['5'] . ",
                                `price` = '".(double)$csv_line['6']."',
                                `active` = '".(int)$csv_line['7']."' 
                            WHERE `id` = '".(int)$csv_line['0']."' 
                            LIMIT 1
                        ");
                    }
                    
                    $c++;
                }
                
                $this->session->data['success'] = $this->language->get('notice_success');
            }else{
                $this->session->data['error'] = $this->language->get('notice_error_fail');
            }
        }
        
        $this->redirect($this->url->link('module/openstock', 'token=' . $this->session->data['token'], 'SSL'));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/openstock')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}
?>