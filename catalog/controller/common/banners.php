<?php   
class ControllerCommonBanners extends Controller 
{
	protected function index() 
    {
		$this->load->model('tool/image');
		$banners = $this->getTopBanners();
		foreach($banners as $key => $banner):
			if ($banner['image']) 
			{
				$image = $this->model_tool_image->resize($banner['image'], 267, 149);
			} 
			else 
			{
				$image = false;
			}
			$banners[$key]['image'] = $image;
		endforeach;
		$this->data['banners'] = $banners;
		$this->template = $this->config->get('config_template') . '/template/common/banners.tpl';
		$this->render();
    }
	
	private function getTopBanners()
	{
		$query = $this->db->query("SELECT bi.image, bi.link, bd.title FROM ".DB_PREFIX."banner_image bi JOIN ".DB_PREFIX."banner b ON b.banner_id = bi.banner_id JOIN ".DB_PREFIX."banner_image_description bd ON bd.banner_image_id = bi.banner_image_id WHERE b.name = 'Top Menu'");
		
		$result = $query->rows;
		
		return $result;
	}
}
?>    