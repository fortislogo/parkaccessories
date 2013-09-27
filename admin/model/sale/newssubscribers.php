<?php
class ModelSalenewssubscribers extends Model {
	
   private function check_db(){


	   
	 	$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "subscribe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `email_id` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `option1` varchar(225) NOT NULL,
  `option2` varchar(225) NOT NULL,
  `option3` varchar(225) NOT NULL,
  `option4` varchar(225) NOT NULL,
  `option5` varchar(225) NOT NULL,
  `option6` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;");
   }
   
	public function addEmail($data) {
		
		if(!isset($data['option1']))
		$data['option1'] = "";
		if(!isset($data['option2']))
		$data['option2'] = "";
		if(!isset($data['option3']))
		$data['option3'] = "";
		if(!isset($data['option4']))
		$data['option4'] = "";
		if(!isset($data['option5']))
		$data['option5'] = "";
		if(!isset($data['option6']))
		$data['option6'] = "";
	    
		$chk_email = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe WHERE store_id='".(int)$data['store_id']."' AND email_id='".$this->db->escape($data['email_id'])."'");
		
		if(!$chk_email->num_rows){
			
			$this->db->query("INSERT INTO " . DB_PREFIX . "subscribe SET store_id='".(int)$data['store_id']."',email_id='".$this->db->escape($data['email_id'])."',name='".$this->db->escape($data['email_name'])."',option1='".$this->db->escape($data['option1'])."',option2='".$this->db->escape($data['option2'])."',option3='".$this->db->escape($data['option3'])."',option4='".$this->db->escape($data['option4'])."',option5='".$this->db->escape($data['option5'])."',option6='".$this->db->escape($data['option6'])."'");
			
			return true;
		}else{ 
			return false;
		}
	}
	
	public function editEmail($id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "subscribe SET store_id='".$data['store_id']."',email_id='".$this->db->escape($data['email_id'])."',name='".$this->db->escape($data['email_name'])."' WHERE id = '" . (int)$id . "'");
	}
	
	public function deleteEmail($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "subscribe WHERE id = '" . (int)$id . "'");
	}
	
	public function getEmail($id) {
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "subscribe WHERE id = '" . (int)$id . "'");

		return $query->row;
	}
	
	public function getEmails($data,$start,$limit) {
		
		$condition = array();
		
		if(isset($data['store_id']) and $data['store_id']!=""){ 
		  $condition[] = "store_id='".$data['store_id']."'";
		}
		
		$condition = implode(" AND ",$condition);
		
		if($condition!=""){ 
			$condition = " WHERE ".$condition;
		}
		
		$sql = "SELECT SU.*,ST.name store_name FROM " . DB_PREFIX . "subscribe SU".$condition." LEFT JOIN(" . DB_PREFIX . "store ST) ON(ST.store_id=SU.store_id) LIMIT $start,$limit";
			
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function exportEmails() {
		
		$this->check_db();
		
		$sql = "SELECT SU.email_id,SU.name,ST.name store_name,SU.option1,SU.option2,SU.option3,SU.option4,SU.option5,SU.option6 FROM " . DB_PREFIX . "subscribe SU LEFT JOIN(" . DB_PREFIX . "store ST) ON(ST.store_id=SU.store_id)";
			
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	

	
	public function getTotalEmails($data) {
		
		$this->check_db();
		
		$sql = "SELECT * FROM " . DB_PREFIX . "subscribe";
			
		$query = $this->db->query($sql);
		
		return $query->num_rows;
	}
	public function checkmail($data,$store_id=0,$id=FALSE) {
	  
	   if($id)
		$sql = "SELECT * FROM " . DB_PREFIX . "subscribe WHERE email_id='".$data."' AND id!='".$id."' AND store_id='".$store_id."'";
	   else	
		$sql = "SELECT * FROM " . DB_PREFIX . "subscribe WHERE email_id='".$data."' AND store_id='".$store_id."'";
		
		$query = $this->db->query($sql);
		
		return $query->num_rows;
	}
	
	

}
?>
