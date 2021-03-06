<?php
class Cart {
	private $config;
	private $db;
	private $data = array();
	
  	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->customer = $registry->get('customer');
		$this->session = $registry->get('session');
		$this->db = $registry->get('db');
		$this->tax = $registry->get('tax');
		$this->weight = $registry->get('weight');

		if (!isset($this->session->data['cart']) || !is_array($this->session->data['cart'])) {
      		$this->session->data['cart'] = array();
    	}
	}
	      
  	public function getProducts() {
		if (!$this->data) {

			
			if ($this->db->query("SHOW TABLES FROM `".DB_DATABASE."` LIKE '" . DB_PREFIX . "product_to_product'")) {
				$package_exist = true;
			} else {
				$package_exist = false;
			}
			
			
			foreach ($this->session->data['cart'] as $key => $quantity) {
				$product = explode(':', $key);
$pImage = '';
				$product_id = $product[0];
				$stock = true;
	
				// Options
				if (isset($product[1])) {
					$options = unserialize(base64_decode($product[1]));

                $optionsTmp = array();
				foreach($options as $v) {
                    if(!is_array($v)){
                        $q = $this->db->query("
                            SELECT `o`.`type`
                            FROM
                                `" . DB_PREFIX . "product_option_value` as `pv`,
                                `" . DB_PREFIX . "option` as `o`
                            WHERE `pv`.`option_id` = `o`.`option_id`
                            AND `pv`.`product_option_value_id` = '".(int)$v."'");

                        if($q->num_rows){
                            $type = $q->row['type'];
                        }else{
                            $type = '';
                        }

                        if($type == 'select' || $type == 'image' || $type =='radio' || $type == 'color'){
                            $optionsTmp[] = $v;
                        }
                    }
                }
                $var = implode(':', $optionsTmp);
            
				} else {
					$options = array();
				} 
				
				$product_query = $this->db->query("SELECT *,(SELECT CASE WHEN p2p.product_id IS NOT NULL THEN MIN(pr2.quantity - p2p.quantity)+1 ELSE p.quantity END FROM " . DB_PREFIX . "product_to_product p2p INNER JOIN " . DB_PREFIX . "product AS pr2 ON p2p.related_id = pr2.product_id WHERE p2p.product_id = p.product_id) As quantity FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");
				
				if ($product_query->num_rows) {

	                 if (isset($newWeight)) {
	                     unset($newWeight);
	                 }
              
					$option_price = 0;

      				$option_cost = 0;
            
					$option_points = 0;
					$option_weight = 0;
	

			$package_data = array();
			
					$option_data = array();
	

					if ($package_exist) {
						
						$package_query = $this->db->query("SELECT p2p.related_id, p2p.quantity, pd.name, p.image FROM " . DB_PREFIX . "product_to_product p2p LEFT JOIN (" . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON p.product_id = pd.product_id) ON p2p.related_id = p.product_id WHERE p2p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
						
						if ($package_query->num_rows) {
							foreach ($package_query->rows as $package) { 
								$package_data[] = array(
									'product_id' => $package['related_id'],
									'quantity'   => $package['quantity'],
									'name'    	 => $package['name'],
									'image'    	 => $package['image']
								);
							}
						}
					}
			
					foreach ($options as $product_option_id => $option_value) {
						$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
						
						if ($option_query->num_rows) {
							if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'color' || $option_query->row['type'] == 'radio' || $option_query->row['type'] == 'image') {
								$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.cost, pov.cost_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$option_value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
								
								if ($option_value_query->num_rows) {
									if ($option_value_query->row['price_prefix'] == '+') {
										$option_price += $option_value_query->row['price'];
									} elseif ($option_value_query->row['price_prefix'] == '-') {
										$option_price -= $option_value_query->row['price'];
									}
	

									if ($option_value_query->row['cost_prefix'] == '+') {
										$option_cost += $option_value_query->row['cost'];
									} elseif ($option_value_query->row['cost_prefix'] == '-') {
										$option_cost -= $option_value_query->row['cost'];
									}
            
									if ($option_value_query->row['points_prefix'] == '+') {
										$option_points += $option_value_query->row['points'];
									} elseif ($option_value_query->row['points_prefix'] == '-') {
										$option_points -= $option_value_query->row['points'];
									}
																
									if ($option_value_query->row['weight_prefix'] == '+') {
										$option_weight += $option_value_query->row['weight'];
									} elseif ($option_value_query->row['weight_prefix'] == '-') {
										$option_weight -= $option_value_query->row['weight'];
									}
									
									if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $quantity))) {
										$stock = false;
									}
									
									$option_data[] = array(
										'product_option_id'       => $product_option_id,
										'product_option_value_id' => $option_value,
										'option_id'               => $option_query->row['option_id'],
										'option_value_id'         => $option_value_query->row['option_value_id'],
										'name'                    => $option_query->row['name'],
										'option_value'            => $option_value_query->row['name'],
										'type'                    => $option_query->row['type'],
										'quantity'                => $option_value_query->row['quantity'],
										'subtract'                => $option_value_query->row['subtract'],
										'price'                   => $option_value_query->row['price'],
										'price_prefix'            => $option_value_query->row['price_prefix'],

										'cost'                    => $option_value_query->row['cost'],
										'cost_prefix'             => $option_value_query->row['cost_prefix'],
            
										'points'                  => $option_value_query->row['points'],
										'points_prefix'           => $option_value_query->row['points_prefix'],									
										'weight'                  => $option_value_query->row['weight'],
										'weight_prefix'           => $option_value_query->row['weight_prefix']
									);								
								}
							} elseif ($option_query->row['type'] == 'checkbox' && is_array($option_value)) {
								foreach ($option_value as $product_option_value_id) {
									$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.cost, pov.cost_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
									
									if ($option_value_query->num_rows) {
										if ($option_value_query->row['price_prefix'] == '+') {
											$option_price += $option_value_query->row['price'];
										} elseif ($option_value_query->row['price_prefix'] == '-') {
											$option_price -= $option_value_query->row['price'];
										}
	

									if ($option_value_query->row['cost_prefix'] == '+') {
										$option_cost += $option_value_query->row['cost'];
									} elseif ($option_value_query->row['cost_prefix'] == '-') {
										$option_cost -= $option_value_query->row['cost'];
									}
            
										if ($option_value_query->row['points_prefix'] == '+') {
											$option_points += $option_value_query->row['points'];
										} elseif ($option_value_query->row['points_prefix'] == '-') {
											$option_points -= $option_value_query->row['points'];
										}
																	
										if ($option_value_query->row['weight_prefix'] == '+') {
											$option_weight += $option_value_query->row['weight'];
										} elseif ($option_value_query->row['weight_prefix'] == '-') {
											$option_weight -= $option_value_query->row['weight'];
										}
										
										if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $quantity))) {
											$stock = false;
										}
										
										$option_data[] = array(
											'product_option_id'       => $product_option_id,
											'product_option_value_id' => $product_option_value_id,
											'option_id'               => $option_query->row['option_id'],
											'option_value_id'         => $option_value_query->row['option_value_id'],
											'name'                    => $option_query->row['name'],
											'option_value'            => $option_value_query->row['name'],
											'type'                    => $option_query->row['type'],
											'quantity'                => $option_value_query->row['quantity'],
											'subtract'                => $option_value_query->row['subtract'],
											'price'                   => $option_value_query->row['price'],
											'price_prefix'            => $option_value_query->row['price_prefix'],

										'cost'                    => $option_value_query->row['cost'],
										'cost_prefix'             => $option_value_query->row['cost_prefix'],
            
											'points'                  => $option_value_query->row['points'],
											'points_prefix'           => $option_value_query->row['points_prefix'],
											'weight'                  => $option_value_query->row['weight'],
											'weight_prefix'           => $option_value_query->row['weight_prefix']
										);								
									}
								}						
							} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
								$option_data[] = array(
									'product_option_id'       => $product_option_id,
									'product_option_value_id' => '',
									'option_id'               => $option_query->row['option_id'],
									'option_value_id'         => '',
									'name'                    => $option_query->row['name'],
									'option_value'            => $option_value,
									'type'                    => $option_query->row['type'],
									'quantity'                => '',
									'subtract'                => '',
									'price'                   => '',
									'price_prefix'            => '',

									'cost'                    => '',
									'cost_prefix'             => '',
            
									'points'                  => '',
									'points_prefix'           => '',								
									'weight'                  => '',
									'weight_prefix'           => ''
								);						
							}
						}
					} 
				
					if ($this->customer->isLogged()) {
						$customer_group_id = $this->customer->getCustomerGroupId();
					} else {
						$customer_group_id = $this->config->get('config_customer_group_id');
					}
					
					$price = $product_query->row['price'];

					$cost = $product_query->row['cost'];
            
					
					// Product Discounts
					$discount_quantity = 0;
					
					foreach ($this->session->data['cart'] as $key_2 => $quantity_2) {
						$product_2 = explode(':', $key_2);
						
						
                    $options2 = array();
					if (isset($product_2[1])) {
                        $options2 = unserialize(base64_decode($product_2[1]));
                        $optionsTmp2 = array();
                        foreach($options2 as $v) {
                            if(!is_array($v)){

                                $q = $this->db->query("
                                    SELECT `o`.`type`
                                    FROM
                                        `" . DB_PREFIX . "product_option_value` as `pv`,
                                        `" . DB_PREFIX . "option` as `o`
                                    WHERE `pv`.`option_id` = `o`.`option_id`
                                    AND `pv`.`product_option_value_id` = '".(int)$v."'");

                                if($q->num_rows){
                                    $type = $q->row['type'];
                                }else{
                                    $type = '';
                                }

                                if($type == 'select' || $type == 'image' || $type =='radio' || $type == 'color'){
                                    $optionsTmp2[] = $v;
                                }
                            }
                        }

                        $var2 = implode(':', $optionsTmp2);
                    }

                    $excludeDiscount = false;
                    if(isset($product_query->row['has_option']) && ($product_query->row['has_option'] == 1)){
                        $stock_qry = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option_relation` WHERE `var` = '".(string)$var2."' AND `product_id` = '".(int)$product_2[0]."' LIMIT 1");

                        if($stock_qry->num_rows){
                            if($stock_qry->row['price'] != 0){
                                $excludeDiscount = '3';
                            }
                        }
                    }

                    if (($product_2[0] == $product_id) && ($excludeDiscount == false)) {
            
							$discount_quantity += $quantity_2;
						}
					}
					
					$product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND quantity <= '" . (int)$discount_quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");
					
					if ($product_discount_query->num_rows) {
						$price = $product_discount_query->row['price'];
					}
					
					// Product Specials
					$product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
				
					if ($product_special_query->num_rows) {
						$price = $product_special_query->row['price'];
					}						
			
					// Reward Points
					$product_reward_query = $this->db->query("SELECT points FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "'");
					
					if ($product_reward_query->num_rows) {	
						$reward = $product_reward_query->row['points'];
					} else {
						$reward = 0;
					}
					
					// Downloads		
					$download_data = array();     		
					
					$download_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download p2d LEFT JOIN " . DB_PREFIX . "download d ON (p2d.download_id = d.download_id) LEFT JOIN " . DB_PREFIX . "download_description dd ON (d.download_id = dd.download_id) WHERE p2d.product_id = '" . (int)$product_id . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				
					foreach ($download_query->rows as $download) {
						$download_data[] = array(
							'download_id' => $download['download_id'],
							'name'        => $download['name'],
							'filename'    => $download['filename'],
							'mask'        => $download['mask'],
							'remaining'   => $download['remaining']
						);
					}
					
					// Stock
					
                    if(isset($product_query->row['has_option']) && ($product_query->row['has_option'] == 1)){
                        $stock_qry = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option_relation` WHERE `var` = '".(string)$var."' AND `product_id` = '".(int)$product_id."' LIMIT 1");
						
						if(!empty($stock_qry->row['image'])){
                            $pImage = $stock_qry->row['image'];
                        }
						
						if($stock_qry->num_rows){
                            $priceNew = $stock_qry->row['price'];
                
                            if ($stock_qry->row['weight']) {
                                $newWeight = $stock_qry->row['weight'];
	                        }

                            if($stock_qry->row['stock'] < 1 || $stock_qry->row['stock'] < $quantity)
                            {
                                $stock = false;
                            }

                            //product special pricing
                            $sql2 = "
                                SELECT `price`
                                FROM `" . DB_PREFIX . "product_option_relation_group_price`
                                    WHERE `product_option_relation_id` = '".(int)$stock_qry->row['id']."'
                                    AND `product_id` = '".(int)$product_id."'
                                    AND `customer_group_id` = '".(int)$customer_group_id."'
                                ORDER BY `price` ASC
                                LIMIT 1";

                            $option_qry2 = $this->db->query($sql2);

                            if($option_qry2->num_rows)
                            {
                                if($option_qry2->row['price'] != 0)
                                {
                                    $priceNew = $option_qry2->row['price'];
                                }
                            }

                            //product option discounts.
                            $sql = "
                                SELECT
                                    `" . DB_PREFIX . "product_option_relation_discount_price`.`price` AS `dp`
                                FROM
                                    `" . DB_PREFIX . "product_option_relation_discount_price`,
                                    `" . DB_PREFIX . "product_option_relation`
                                WHERE
                                    `" . DB_PREFIX . "product_option_relation`.`var` = '".(string)$var."'
                                AND
                                    `" . DB_PREFIX . "product_option_relation`.`product_id` = '".(int)$product_id."'
                                AND
                                    `" . DB_PREFIX . "product_option_relation`.`id` = `" . DB_PREFIX . "product_option_relation_discount_price`.`product_option_relation_id`
                                AND
                                    `" . DB_PREFIX . "product_option_relation_discount_price`.`qty` <= '" . (int)$quantity . "'
                                AND
                                    `" . DB_PREFIX . "product_option_relation_discount_price`.`customer_group_id` <= '" . (int)$customer_group_id . "'
                                ORDER BY
                                    `" . DB_PREFIX . "product_option_relation_discount_price`.`qty` DESC, `" . DB_PREFIX . "product_option_relation_discount_price`.`price` ASC
                                LIMIT 1
                            ";
                            $discount_qry = $this->db->query($sql);

                            if($discount_qry->num_rows){
                                if($discount_qry->row['dp'] != 0){
                                    $priceNew = $discount_qry->row['dp'];
                                }
                            }

                            if($priceNew != 0){
                                $price = $priceNew;
                            }
                        }else{
                            $stock = false;
                        }
                    }else{
                        if (!$product_query->row['quantity'] || ($product_query->row['quantity'] < $quantity)) {
                            $stock = false;
                        }
                    }

            


					

            if(!isset($pImage) || $pImage == ''){
                $pImage = $product_query->row['image'];
            }
            
					$this->data[$key] = array(
						'key'             => $key,
						'product_id'      => $product_query->row['product_id'],
						'name'            => $product_query->row['name'],
						'model'           => $product_query->row['model'],
						'shipping'        => $product_query->row['shipping'],
						'image'           => $pImage,
						'option'          => $option_data,
						'package'        => $package_data,
						'download'        => $download_data,
						'quantity'        => $quantity,
						'minimum'         => $product_query->row['minimum'],
						'subtract'        => $product_query->row['subtract'],
						'stock'           => $stock,
						'price'           => ($price + $option_price),

						'cost'            => ($cost + $option_cost),
            
						'total'           => ($price + $option_price) * $quantity,
						'reward'          => $reward * $quantity,
						'points'          => ($product_query->row['points'] ? ($product_query->row['points'] + $option_points) * $quantity : 0),
						'tax_class_id'    => $product_query->row['tax_class_id'],
						'weight'          => ((isset($newWeight) ? $newWeight : ($product_query->row['weight'] + $option_weight))) * $quantity,
						'weight_class_id' => $product_query->row['weight_class_id'],
						'length'          => $product_query->row['length'],
						'width'           => $product_query->row['width'],
						'height'          => $product_query->row['height'],
						'length_class_id' => $product_query->row['length_class_id']					
					);
				} else {
					$this->remove($key);
				}
			}
		}
		
		return $this->data;
  	}
		  
  	public function add($product_id, $qty = 1, $option = array()) {
    	if (!$option) {
      		$key = (int)$product_id;
    	} else {
      		$key = (int)$product_id . ':' . base64_encode(serialize($option));
    	}
    	
		if ((int)$qty && ((int)$qty > 0)) {
    		if (!isset($this->session->data['cart'][$key])) {
      			$this->session->data['cart'][$key] = (int)$qty;
    		} else {
      			$this->session->data['cart'][$key] += (int)$qty;
    		}
		}
		
		$this->data = array();
  	}

  	public function update($key, $qty) {
    	if ((int)$qty && ((int)$qty > 0)) {
      		$this->session->data['cart'][$key] = (int)$qty;
    	} else {
	  		$this->remove($key);
		}
		
		$this->data = array();
  	}

  	public function remove($key) {
		if (isset($this->session->data['cart'][$key])) {
     		unset($this->session->data['cart'][$key]);
  		}
		
		$this->data = array();
	}
	
  	public function clear() {
		$this->session->data['cart'] = array();
		$this->data = array();
  	}
	
  	public function getWeight() {
		$weight = 0;
	
    	foreach ($this->getProducts() as $product) {
			if ($product['shipping']) {
      			$weight += $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get('config_weight_class_id'));
			}
		}
	
		return $weight;
	}
	
  	public function getSubTotal() {
		$total = 0;
		
		foreach ($this->getProducts() as $product) {
			$total += $product['total'];
		}

		return $total;
  	}
	
	public function getTaxes() {
		$tax_data = array();
		
		foreach ($this->getProducts() as $product) {
			if ($product['tax_class_id']) {
				$tax_rates = $this->tax->getRates($product['price'], $product['tax_class_id']);
				
				foreach ($tax_rates as $tax_rate) {
					if (!isset($tax_data[$tax_rate['tax_rate_id']])) {
						$tax_data[$tax_rate['tax_rate_id']] = ($tax_rate['amount'] * $product['quantity']);
					} else {
						$tax_data[$tax_rate['tax_rate_id']] += ($tax_rate['amount'] * $product['quantity']);
					}
				}
			}
		}
		
		return $tax_data;
  	}

  	public function getTotal() {
		$total = 0;
		
		foreach ($this->getProducts() as $product) {
			$total += $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'];
		}

		return $total;
  	}
	  	
  	public function countProducts() {
		$product_total = 0;
			
		$products = $this->getProducts();
			
		foreach ($products as $product) {
			$product_total += $product['quantity'];
		}		
					
		return $product_total;
	}
	  
  	public function hasProducts() {
    	return count($this->session->data['cart']);
  	}
  
  	public function hasStock() {
		$stock = true;
		
		foreach ($this->getProducts() as $product) 
		{
			if (!$product['stock']) 
			{
	    		$stock = false;
			}
		}
		
    	return $stock;
  	}
  
  	public function hasShipping() {
		$shipping = false;
		
		foreach ($this->getProducts() as $product) {
	  		if ($product['shipping']) {
	    		$shipping = true;
				
				break;
	  		}		
		}
		
		return $shipping;
	}
	
  	public function hasDownload() {
		$download = false;
		
		foreach ($this->getProducts() as $product) {
	  		if ($product['download']) {
	    		$download = true;
				
				break;
	  		}		
		}
		
		return $download;
	}	
}
?>