<?php

if(!defined('BOOTSTRAP')) {die('Access denied');}

function fn_logger_additions_save_log($type, $action, $data, $user_id, $content, $event_type, $object_primary_keys) {

	// Push the ip_address index to applicable log types.
	if ($type != 'database') {
		$ip_address = fn_get_ip();
		$content['ip_address'] = empty($data['ip']) ? $ip_address['host'] : $data['ip'];
	}
	
	// Rewrite the object names into links for quick jumps
	if ($type == 'orders' && !empty($content['order'])) {
		
		$this_url = fn_url('orders.details&order_id=' . $content['id']);
		$content['order'] = html_entity_decode('<a href="' . $this_url . '">' . $content['order'] . '</a>');
	
	} elseif ($type == 'products' && !empty($content['product'])) {
		
		$this_url = fn_url('products.update&product_id=' . $content['id']);
		$content['product'] = html_entity_decode('<a href="' . $this_url . '">' . $content['product'] . '</a>');
		
	} elseif ($type == 'categories' && !empty($content['category'])) {
		
		$this_url = fn_url('categories.update&category_id=' . $content['id']);
		$content['category'] = html_entity_decode('<a href="' . $this_url . '">' . $content['category'] . '</a>');
		
	} elseif ($type == 'users' && !empty($content['user'])) {
		
		$this_url = fn_url('profiles.update&user_id=' . $content['id']);
		$content['user'] = html_entity_decode('<a href="' . $this_url . '">' . $content['user'] . '</a>');

		if (in_array($action, array ('session', 'failed_login'))) {
			// Push user agent to user entries
			$content['user_agent'] = ($_SERVER['HTTP_USER_AGENT'] ? $_SERVER['HTTP_USER_AGENT'] : 'No User Agent');
		}
	}

}

