<?php
class ModelCatalogReview extends Model {		
	public function addReview($product_id, $data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['name']) . "', customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()");
// template email - start
		$this->load->model('catalog/template_email');

		$result = $this->model_catalog_template_email->getTemplateEmail('reviews.added');
			
		if ((sizeof($result['description']) > 0) && ($result['status'] == '0' || $result['status'] == '')) {
			$tpl_data = array();
			$product_name = $this->model_catalog_template_email->getProduct((int)$product_id);

			$tpl_data = array(
				'author'  => html_entity_decode($data['name'], ENT_QUOTES, 'UTF-8'),
				'review'  => html_entity_decode($data['text'], ENT_QUOTES, 'UTF-8'),
				'rating'  => $data['rating'],
				'product' => '<a href="' . $this->url->link('product/product', 'product_id=' . (int)$product_id, 'SSL') . '">' . $product_name['name'] . '</a>'
			);

			$this->model_catalog_template_email->sendReviewsNoticeTemplateEmail($tpl_data, $result);
		}
		// template email - stop
	}
		
	public function getReviewsByProductId($product_id, $start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}
		
		if ($limit < 1) {
			$limit = 20;
		}		
		
		$query = $this->db->query("SELECT r.review_id, r.author, r.rating, r.text, p.product_id, pd.name, p.price, p.image, r.date_added FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
			
		return $query->rows;
	}

	public function getTotalReviewsByProductId($product_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row['total'];
	}
}
?>