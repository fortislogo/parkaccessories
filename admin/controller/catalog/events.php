<?php
class ControllerCatalogEvents extends Controller { 
	private $error = array();

	public function index() {
		$this->language->load('catalog/events');

		$this->document->setTitle($this->language->get('heading_title'));
		 
		$this->load->model('catalog/events');

		$this->getList();
	}

	public function insert() {
		$this->language->load('catalog/events');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/events');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_events->addEvent($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/events', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('catalog/events');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/events');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_events->editEvent($this->request->get['event_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/events', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}
 
	public function delete() {
		$this->language->load('catalog/events');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/events');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) 
		{
			foreach ($this->request->post['selected'] as $event_id) 
			{
				$this->model_catalog_events->deleteEvent($event_id);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/events', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'event_name';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/events', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['column_name'] = $this->language->get('column_name');
							
		$this->data['insert'] = $this->url->link('catalog/events/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/events/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$url = "";
		
		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}
		
		if (isset($this->request->get['page'])) 
		{
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->data['sort_name'] = $this->url->link('catalog/events', 'sort=event_name&token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['sort_date'] = $this->url->link('catalog/events', 'sort=event_start_date&token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('catalog/events', 'sort=status&token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['events'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$events_total = $this->model_catalog_events->getTotalEvents();
	
		$results = $this->model_catalog_events->getEvents($data);
 
    	foreach ($results as $result) 
		{
			$action = array();
						
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/events/update', 'token=' . $this->session->data['token'] . '&event_id=' . $result['event_id'] . $url, 'SSL')
			);
						
			$this->data['events'][] = array(
				'event_id'		 => $result['event_id'],
				'title'          => $result['event_name'],
				'date'          => $result['date'],
				'status'     	 => $result['status'],
				'selected'       => isset($this->request->post['selected']) && in_array($result['event_id'], $this->request->post['selected']),
				'action'         => $action
			);
		}	
	
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_title'] = $this->language->get('column_title');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');		
		
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
 
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->data['sort_title'] = $this->url->link('catalog/events', 'token=' . $this->session->data['token'] . '&sort=id.title' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('catalog/events', 'token=' . $this->session->data['token'] . '&sort=i.sort_order' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $events_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/events', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/events_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
    	$this->data['text_disabled'] = $this->language->get('text_disabled');
		
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_date'] = $this->language->get('entry_date');
		$this->data['entry_status'] = $this->language->get('entry_status');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
    	
		

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = "";
		}
		
		if (isset($this->error['date'])) {
			$this->data['error_date'] = $this->error['date'];
		} else {
			$this->data['error_date'] = "";
		}
		
		$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),     		
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/events', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		if (!isset($this->request->get['event_id'])) {
			$this->data['action'] = $this->url->link('catalog/events/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/events/update', 'token=' . $this->session->data['token'] . '&event_id=' . $this->request->get['event_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/events', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['event_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) 
		{
			$event_info = $this->model_catalog_events->getEvent($this->request->get['event_id']);
		}
		
		
		if (isset($this->request->post['event_name']))
		{
			$this->data['event_name'] = $this->request->post['event_name'];
		}
		else if (!empty($event_info))
		{
			$this->data['event_name'] = $event_info['event_name'];
		}
		else
		{
			$this->data['event_name'] = "";
		}
		
		if (isset($this->request->post['description']))
		{
			$this->data['description'] = $this->request->post['description'];
		}
		else if (!empty($event_info))
		{
			$this->data['description'] = $event_info['description'];
		}
		else
		{
			$this->data['description'] = "";
		}
		
		if (isset($this->request->post['event_start_date']))
		{
			$this->data['event_start_date'] = $this->request->post['event_start_date'];
		}
		else if (!empty($event_info))
		{
			$this->data['event_start_date'] = $event_info['event_start_date'];
		}
		else
		{
			$this->data['event_start_date'] = "";
		}
		
		if (isset($this->request->post['event_end_date']))
		{
			$this->data['event_end_date'] = $this->request->post['event_end_date'];
		}
		else if (!empty($event_info))
		{
			$this->data['event_end_date'] = $event_info['event_end_date'];
		}
		else
		{
			$this->data['event_end_date'] = "";
		}
		
		if (isset($this->request->post['status']))
		{
			$this->data['status'] = $this->request->post['status'];
		}
		else if (!empty($event_info))
		{
			$this->data['status'] = $event_info['status'];
		}
		else
		{
			$this->data['status'] = 1;
		}
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');
		
		
		
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($events_info)) {
			$this->data['status'] = $events_info['status'];
		} else {
			$this->data['status'] = 1;
		}

		
				
		$this->template = 'catalog/events_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/events')) 
		{
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (utf8_strlen($this->request->post['event_name']) < 1)
		{
			$this->error['name'] = $this->language->get('error_name');
		}
		
		$start = strtotime($this->request->post['event_start_date']);
		$end = strtotime($this->request->post['event_end_date']);
		
		if ($end < $start)
		{
			$this->error['date'] = $this->language->get('error_date');
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
			
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() 
	{
		if (!$this->user->hasPermission('modify', 'catalog/events')) {
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