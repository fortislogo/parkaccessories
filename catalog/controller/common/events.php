<?php   
class ControllerCommonEvents extends Controller {
	protected function index() 
	{		
		$this->data['events'] = $this->getEvents();
	
		$this->template = $this->config->get('config_template') . '/template/common/events.tpl';
		
    	$this->render();
	} 	
	
	private function getEvents()
	{
		$sql = "SELECT * FROM ".DB_PREFIX."events WHERE status = 1 AND ((event_start_date <= '".date("Y-m-d")."' AND event_end_date >= '".date("Y-m-d")."') OR event_start_date > '".date("Y-m-d")."') ORDER BY event_start_date ";
		$query = $this->db->query($sql);
		$results = $query->row;
		return $results;
	}
}
?>
