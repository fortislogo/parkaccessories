<?php
define('EXTENSION_NAME', "Custom Image Titles (CIT)");
define('EXTENSION_VERSION', "2.5.0");
define('EXTENSION_TYPE', "vQmod");
define('EXTENSION_COMPATIBILITY', "OpenCart 1.5.5.x and 1.5.6.x");
define('EXTENSION_URL', "http://www.opencart.com/index.php?route=extension/extension/info&extension_id=1243");
define('EXTENSION_SUPPORT', "support@agar.ee");
define('EXTENSION_SUPPORT_FORUM', "http://forum.opencart.com/viewtopic.php?f=123&t=25970");

class ControllerModuleCustomImageTitles extends Controller {
    private $error = array();
    private $defaults = array(
        'cit_installed'                 => 1,
        'custom_image_titles_status'    => 0,
        'cit_display_caption'           => 0,
        'cit_show_alt_text'             => 1,
        'cit_show_language_in_tab'      => 1,
        'cit_use_admin_language_value'  => 1,
        'cit_remove_sql_changes'        => 0
    );

    public function index() {
        $this->data = array_merge($this->data, $this->language->load('module/custom_image_titles'));

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            foreach ($this->defaults as $key => $def) {
                if (!isset($this->request->post[$key])) {
                     $this->request->post[$key] = 0;
                }
            }

            $this->model_setting_setting->editSetting('custom_image_titles', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->checkDatabaseStructure();

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (!isset($this->data['error_warning']) && !class_exists('VQMod')) {
            $this->data['error_warning'] = $this->language->get('error_vqmod');
        }

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
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
            'href'      => $this->url->link('module/custom_image_titles', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('module/custom_image_titles', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['ext_name'] = EXTENSION_NAME;
        $this->data['ext_version'] = EXTENSION_VERSION;
        $this->data['ext_type'] = EXTENSION_TYPE;
        $this->data['ext_compatibility'] = EXTENSION_COMPATIBILITY;
        $this->data['ext_url'] = EXTENSION_URL;
        $this->data['ext_support'] = EXTENSION_SUPPORT;
        $this->data['ext_support_forum'] = EXTENSION_SUPPORT_FORUM;
        $this->data['ext_subject'] = sprintf($this->language->get('text_ext_subject'), EXTENSION_NAME);

        $this->load->model('localisation/language');
        $this->data['language_count'] = (int)$this->model_localisation_language->getTotalLanguages();

        # Loop through all settings for the post/config values
        foreach (array_keys($this->defaults) as $setting) {
            if (isset($this->request->post[$setting])) {
                $this->data[$setting] = $this->request->post[$setting];
            } else {
                $this->data[$setting] = $this->config->get($setting);
                if ($this->data[$setting] === null) {
                    if (!isset($this->data['error_warning'])) {
                        $this->data['error_warning'] = $this->language->get('error_unsaved_settings');
                    }
                    if (isset($this->defaults[$setting])) {
                        $this->data[$setting] = $this->defaults[$setting];
                    }
                }
            }
        }

        $this->template = 'module/custom_image_titles.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    public function install() {
        $columns = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_description LIKE '%_text'");
        $test_columns = array("alt_text", "title_text");
        foreach($columns->rows as $row) {
            $test_columns = array_diff($test_columns, array($row['Field']));
        }
        if (count($test_columns) == 2) {
            $this->db->query("ALTER TABLE " . DB_PREFIX . "product_description ADD (alt_text VARCHAR(255) COLLATE utf8_bin NOT NULL, title_text VARCHAR(255) COLLATE utf8_bin NOT NULL)");
        }
        $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_image LIKE 'sort_order'");
        if (!$column_exists->num_rows) {
            $this->db->query("ALTER TABLE " . DB_PREFIX . "product_image ADD sort_order INT(11) NOT NULL DEFAULT '0'");
        }

        $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_image_description (product_image_id INT(11) NOT NULL, language_id INT(11) NOT NULL, product_id INT(11) NOT NULL, alt_text VARCHAR(255) COLLATE utf8_bin NOT NULL, title_text VARCHAR(255) COLLATE utf8_bin NOT NULL, PRIMARY KEY (product_image_id, language_id)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin");

        $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "category_description LIKE 'alt_text'");
        if (!$column_exists->num_rows) {
            $this->db->query("ALTER TABLE " . DB_PREFIX . "category_description ADD (alt_text VARCHAR(255) COLLATE utf8_bin NOT NULL)");
        }

        $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "category_description LIKE 'title_text'");
        if (!$column_exists->num_rows) {
            $this->db->query("ALTER TABLE " . DB_PREFIX . "category_description ADD (title_text VARCHAR(255) COLLATE utf8_bin NOT NULL)");
        }

        $this->load->model('setting/setting');
        $this->model_setting_setting->editSetting('custom_image_titles', $this->defaults);
    }

    public function uninstall() {
        if ($this->config->get("cit_remove_sql_changes")) {
            $columns = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_description LIKE '%_text'");
            $test_columns = array("alt_text", "title_text");
            foreach($columns->rows as $row) {
                $test_columns = array_diff($test_columns, array($row['Field']));
            }
            if (!count($test_columns)) {
                $this->db->query("ALTER TABLE " . DB_PREFIX . "product_description DROP COLUMN alt_text, DROP COLUMN title_text");
            }

            $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "product_image_description");

            $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "category_description LIKE 'alt_text'");
            if ($column_exists->num_rows) {
                $this->db->query("ALTER TABLE " . DB_PREFIX . "category_description DROP COLUMN alt_text");
            }
            $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "category_description LIKE 'title_text'");
            if ($column_exists->num_rows) {
                $this->db->query("ALTER TABLE " . DB_PREFIX . "category_description DROP COLUMN title_text");
            }
        }
        $this->load->model('setting/setting');
        $this->model_setting_setting->deleteSetting('custom_image_titles');
    }

    private function checkDatabaseStructure() {
        $table_exists = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "product_image_description'");
        if (!$table_exists->num_rows) {
            $this->error['warning'] = sprintf($this->language->get('error_missing_table'), DB_PREFIX . 'product_image_description');
        }

        $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_image LIKE 'sort_order'");
        if (!$column_exists->num_rows) {
            $this->error['warning'] = sprintf($this->language->get('error_missing_column'), DB_PREFIX . 'product_image', 'sort_order');
        }

        $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_description LIKE 'alt_text'");
        if (!$column_exists->num_rows) {
            $this->error['warning'] = sprintf($this->language->get('error_missing_column'), DB_PREFIX . 'product_description', 'alt_text');
        }

        $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_description LIKE 'title_text'");
        if (!$column_exists->num_rows) {
            $this->error['warning'] = sprintf($this->language->get('error_missing_column'), DB_PREFIX . 'product_description', 'title_text');
        }

        $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "category_description LIKE 'alt_text'");
        if (!$column_exists->num_rows) {
            $this->error['warning'] = sprintf($this->language->get('error_missing_column'), DB_PREFIX . 'category_description', 'alt_text');
        }

        $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "category_description LIKE 'title_text'");
        if (!$column_exists->num_rows) {
            $this->error['warning'] = sprintf($this->language->get('error_missing_column'), DB_PREFIX . 'category_description', 'title_text');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/custom_image_titles')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return $this->checkDatabaseStructure();
        } else {
            return false;
        }
    }
}
?>