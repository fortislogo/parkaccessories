<?php   
class ControllerCommonHeader extends Controller {
	protected function index() {
		$this->data['title'] = $this->document->getTitle();
		
		$this->document->addStyle('catalog/view/javascript/jquery/dropkick/dropkick.css');
		$this->document->addStyle('catalog/view/javascript/jquery/jquery.selectbox-0.2/css/jquery.selectbox.css');
		$this->document->addScript('catalog/view/javascript/jquery/jquery.selectbox-0.2/js/jquery.selectbox-0.2.js');
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$this->data['base'] = $server;
		$this->data['description'] = $this->document->getDescription();
		$this->data['keywords'] = $this->document->getKeywords();
		$this->data['links'] = $this->document->getLinks();	 
		$this->data['styles'] = $this->document->getStyles();
		$this->data['scripts'] = $this->document->getScripts();
		$this->data['lang'] = $this->language->get('code');
		$this->data['direction'] = $this->language->get('direction');
		
				if (isset($this->request->get['route']) && $this->request->get['route'] == 'checkout/success') {
					$this->data['google_analytics'] = '';
				} else {
					$profile_id = html_entity_decode(trim($this->config->get('config_google_analytics')), ENT_QUOTES, 'UTF-8');
					$this->data['google_analytics'] = "<script type='text/javascript'>\n" .
					  		    	 				  "var _gaq = _gaq || [];\n" .
					  		    	 				  "_gaq.push(['_setAccount', '$profile_id']);\n" .
					  		    	 				  "_gaq.push(['_trackPageview']);\n" .
					  		    	 				  "(function() {\n" .
			  		 		     	  				  "var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;\n" .
			  		 		     	  				  "ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';\n" .
			  		 		     	  				  "var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);\n" .
			  		 		     	  				  "})();\n" .
			  		 		     	  				  "</script>";

			  		// Find Cart, Compare, WishList buttons and insert GA Event code
			  		// before they fire.
			  		$this->data['google_analytics'] .= '<script type="text/javascript">' . 
			  										   '$(function() {' .
			  										   		'var addToCartButtons = $("input[onclick*=addToCart]");' .
			  										   		'$.each(addToCartButtons, function() {' .
			  										   			'var tmp = $(this).attr("onclick");' .
			  										   			'$(this).prop("onclick", null);' .
			  										   			'$(this).bind("click", function() {' .
			  										   				"_gaq.push(['_trackEvent', 'Button clicked', 'Add to Cart']);" .
			  										   				'eval(tmp);' .
			  										   			'});' .
			  										   		'});' .
			  										   		'$("#button-cart").click(function() {' .
			  										   			"_gaq.push(['_trackEvent', 'Button clicked', 'Add to Cart']);" .
			  										   		'});' .
			  										   		'var addToWishListButtons = $("a[onclick*=addToWishList]");' .
			  										   		'$.each(addToWishListButtons, function() {' .
			  										   			'var tmp = $(this).attr("onclick");' .
			  										   			'$(this).prop("onclick", null);' .
			  										   			'$(this).bind("click", function() {' .
			  										   				"_gaq.push(['_trackEvent', 'Button clicked', 'Add to WishList']);" .
			  										   				'eval(tmp);' .
			  										   			'});' .
			  										   		'});' .
			  										   		'var addToCompareButtons = $("a[onclick*=addToCompare]");' .
			  										   		'$.each(addToCompareButtons, function() {' .
			  										   			'var tmp = $(this).attr("onclick");' .
			  										   			'$(this).prop("onclick", null);' .
			  										   			'$(this).bind("click", function() {' .
			  										   				"_gaq.push(['_trackEvent', 'Button clicked', 'Add to Compare']);" .
			  										   				'eval(tmp);' .
			  										   			'});' .
			  										   		'});' .
			  										   '});' .
			  										   '</script>';

			  		// Add funnel tracking the checkout using _trackPageview method.
			  		$this->data['google_analytics'] .= '<script type="text/javascript">' .
			  										   "$('#button-account').live('click', function () {_gaq.push(['_trackPageview', '/index.php?route=checkout/register']);});" .
			  										   "$('#button-guest').live('click', function () {_gaq.push(['_trackPageview', '/index.php?route=checkout/billing']);});" .
			  										   "$('#button-payment-address').live('click', function () {_gaq.push(['_trackPageview', '/index.php?route=checkout/shipping_address']);});" .
			  										   "$('#button-shipping-address').live('click', function () {_gaq.push(['_trackPageview', '/index.php?route=checkout/shipping_method']);});" .
			  										   "$('#button-shipping-method').live('click', function () {_gaq.push(['_trackPageview', '/index.php?route=checkout/payment_method']);});" .
   			  										   "$('#button-payment-method').live('click', function () {_gaq.push(['_trackPageview', '/index.php?route=checkout/confirm']);});" .
   			  										   "</script>";
			  	}
			

            	$domainurl = new getDomain();
            	$this->data['domainurl'] = $domainurl->domain(HTTP_SERVER);
            
		$this->data['name'] = $this->config->get('config_name');
		
		if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$this->data['icon'] = '';
		}
		
		if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
			$this->data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$this->data['logo'] = '';
		}		
		
		$this->language->load('common/header');
		
		$this->data['text_home'] = $this->language->get('text_home');
		$this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
    	$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
		$this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
		$this->data['text_account'] = $this->language->get('text_account');
    	$this->data['text_checkout'] = $this->language->get('text_checkout');
				
		$this->data['home'] = $this->url->link('common/home');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['logged'] = $this->customer->isLogged();
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['shopping_cart'] = $this->url->link('checkout/cart');
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		
		// Daniel's robot detector
		$status = true;
		
		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", trim($this->config->get('config_robots')));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}
		
		// A dirty hack to try to set a cookie for the multi-store feature
		$this->load->model('setting/store');
		
		$this->data['stores'] = array();
		
		if ($this->config->get('config_shared') && $status) {
			$this->data['stores'][] = $server . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();
			
			$stores = $this->model_setting_store->getStores();
					
			foreach ($stores as $store) {
				$this->data['stores'][] = $store['url'] . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();
			}
		}
				
		// Search		
		if (isset($this->request->get['search'])) {
			$this->data['search'] = $this->request->get['search'];
		} else {
			$this->data['search'] = '';
		}
		
		// Menu
		$this->load->model('catalog/category');
		
		$this->load->model('catalog/product');
		
		$this->data['categories'] = array();
					
		$categories = $this->model_catalog_category->getCategories(0);
		
		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();
				
				$children = $this->model_catalog_category->getCategories($category['category_id']);
				
				foreach ($children as $child) {
					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
					
					//$product_total = $this->model_catalog_product->getTotalProducts($data);
									
					$children_data[] = array(
						'name'  => $child['name'],
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);						
				}
				
				// Level 1
				$this->data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
		$this->children = array(
			'module/language',
			'module/currency',
			'module/cart',
			'common/banners',
			'common/events'
		);
				

			$this->language->load('blog/blog');
         $this->data['text_blog']    = $this->language->get('text_blog');
         $this->load->model('blog/setting');
			$blogSetting = $this->model_blog_setting->getSettings();
			
			if (isset($this->request->get['article_id']) && $blogSetting['socMedia']) {
				$article_id = $this->request->get['article_id'];
				$this->load->model('blog/setting');
				$this->load->model('blog/article');
				$this->load->model('tool/image');
				$blogSetting = $this->model_blog_setting->getSettings();
				$articleData = $this->model_blog_article->getArticle($article_id);            
				
				if (isset($this->request->get['category_id'])) {
					$category = '&category_id='.$this->request->get['category_id'];
				} else {
					$category = '';
				}
				
				if ($articleData) {
               $fbOpengraph = '<meta property="og:site_name" content="' . $this->config->get('config_title') . '"/>';
					$fbOpengraph .= '<meta property="og:title" content="' . $articleData['title'] . '"/>';
					$fbOpengraph .= '<meta property="og:type" content="article"/>';
					$fbOpengraph .= '<meta property="og:image" content="' . $this->model_tool_image->resize($articleData['image'], $blogSetting['articleFeatWidth'], $blogSetting['articleFeatHeight']) . '"/>';
					$fbOpengraph .= '<meta property="og:image:url" content="' . $this->model_tool_image->resize($articleData['image'], $blogSetting['articleFeatWidth'], $blogSetting['articleFeatHeight']) . '"/>';
					$fbOpengraph .= '<link rel="image_src" href="' . $this->model_tool_image->resize($articleData['image'], $blogSetting['articleFeatWidth'], $blogSetting['articleFeatHeight']) . '" />';
					$fbOpengraph .= '<meta property="og:url" content="' . $this->url->link('blog/article', $category . '&article_id=' . $article_id) . '"/>';
					$fbOpengraph .= '<meta property="og:description" content="' . $articleData['meta_description'] . '"/>';
					$fbOpengraphHeader = 'xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml"';
				} else {
               $fbOpengraphHeader   = '';
               $fbOpengraph         = '';
            }
				
				$this->data['fbOpengraphHeader'] = $fbOpengraphHeader;
				$this->data['fbOpengraph']       = $fbOpengraph;
			} else {
            $this->data['fbOpengraphHeader'] = '';
				$this->data['fbOpengraph']       = '';
			}
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/header.tpl';
		} else {
			$this->template = 'default/template/common/header.tpl';
		}
		
    	$this->render();
	} 	
}

		class getDomain {
            public function domain($url)
            {
                global $subtlds;
                $slds = "";
                $url = strtolower(preg_replace("(https?://)", "", $url));

               $host = parse_url('http://'.$url,PHP_URL_HOST);

                preg_match("/[^\.\/]+\.[^\.\/]+$/", $host, $matches);
                foreach($subtlds as $sub){
                    if (preg_match('/\.'.preg_quote($sub).'$/', $host, $xyz)){
                        preg_match("/[^\.\/]+\.[^\.\/]+\.[^\.\/]+$/", $host, $matches);
                    }
                }

                return @$matches[0];
            }

            public function get_tlds(){
            	global $subtlds;
                $address = 'http://mxr.mozilla.org/mozilla-central/source/netwerk/dns/effective_tld_names.dat?raw=1';
                $content = file($address);
                foreach($content as $num => $line){
                        $line = trim($line);
                        if($line == '') continue;
                        if(@substr($line[0], 0, 2) == '/') continue;
                        $line = @preg_replace("/[^a-zA-Z0-9\.]/", '', $line);
                        if($line == '') continue;  //$line = '.'.$line;
                        if(@$line[0] == '.') $line = substr($line, 1);
                        if(!strstr($line, '.')) continue;
                        $subtlds[] = $line;
                        //echo "{$num}: '{$line}'"; echo "<br>";
                }

                $subtlds = array_merge(array(
                        'co.uk', 'me.uk', 'net.uk', 'org.uk', 'sch.uk', 'ac.uk', 
                        'gov.uk', 'nhs.uk', 'police.uk', 'mod.uk', 'asn.au', 'com.au',
                        'net.au', 'id.au', 'org.au', 'edu.au', 'gov.au', 'csiro.au'
                        ),$subtlds);

                $subtlds = array_unique($subtlds);
            
                return $subtlds;    
            }
		} 
            
            $subtlds = new getDomain();
            $subtlds->get_tlds();
            
?>
