<?php
/*
    Plugin Name:    Custom Config
    Description:    Project specific configurations should go here.
    Version:        1.0
    Author:         Johannes Schmidt
    License:        MIT
*/

// Adjust ACF json path to use this plugin instead of theme.
add_filter('acf/settings/save_json', function ($path) {
    return plugin_dir_path(__FILE__) . '/acf-json';
});

add_filter('acf/settings/load_json', function ($path) {
    return [plugin_dir_path(__FILE__) . '/acf-json'];
});
