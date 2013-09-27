<?php 
class ModelCatalogEvents extends Model {
	public function addEvent($data) 
	{
		$this->db->query("INSERT INTO " . DB_PREFIX . "events SET event_name = '" . $this->db->escape($data['event_name']) . "', event_start_date = '" . $this->db->escape($data['event_start_date']) . "', event_end_date = '" . $this->db->escape($data['event_end_date']) . "', status = '" . (int)$data['status'] . "', description = '" . $this->db->escape($data['description']) . "'");
		
	}

	public function editEvent($event_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "events SET event_name = '" . $this->db->escape($data['event_name']) . "', event_start_date = '" . $this->db->escape($data['event_start_date']) . "', event_end_date = '" . $this->db->escape($data['event_end_date']) . "', status = '" . (int)$data['status'] . "', description = '" . $this->db->escape($data['description']) . "' WHERE event_id = " . (int)$event_id);
	}
	
	public function deleteEvent($event_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "events WHERE event_id = '" . (int)$event_id . "'");
	}
		
	public function getEvent($event_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "events WHERE event_id = " . (int)$event_id);
		
		return $query->row;
	}
		
	public function getEvents($data = array()) {
		$sql = "SELECT *, if(event_start_date = event_end_date, date_format(event_start_date, '%M %d, %Y'), concat_ws(' - ', date_format(event_start_date, '%M %d, %Y'), date_format(event_end_date, '%M %d, %Y'))) as date FROM ".DB_PREFIX."events ORDER BY " . $data['sort'] . " " . $data['order'];
	
		$query = $this->db->query($sql);
		
		return $query->rows;
	}	
	
	
	public function getTotalEvents() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "events");
		
		return $query->row['total'];
	}	
	
		
}
?>