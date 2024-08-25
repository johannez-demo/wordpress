<?php
/*
    Plugin Name:    Demo Config
    Description:    Project specific configurations should go here.
    Version:        1.0
    Author:         Johannes Schmidt
    License:        MIT
*/

use Demo\Service\ExampleService;

// Adjust ACF json path to use this plugin instead of theme.
add_filter('acf/settings/save_json', function ($path) {
    return plugin_dir_path(__FILE__) . '/acf-json';
});

add_filter('acf/settings/load_json', function ($path) {
    return [plugin_dir_path(__FILE__) . '/acf-json'];
});

add_action('admin_notices', function () {
    $exampleService = new ExampleService();
    $message = $exampleService->getMessage();
    echo '<div class="notice notice-success is-dismissible">';
    echo '<p>' . esc_html($message) . '</p>';
    echo '</div>';
});