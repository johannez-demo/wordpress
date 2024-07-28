<?php

echo "Importing ACF people post type\n";
$people_post_type_json = file_get_contents(__DIR__ . '/post-types/post_type_people.json');
$people_post_type = json_decode($people_post_type_json, true);
acf_import_post_type($people_post_type);


echo "Importing ACF people field group\n";
$people_field_group_json = file_get_contents(__DIR__ . '/field-groups/group_person.json');
$people_field_group = json_decode($people_field_group_json, true);
acf_import_field_group($people_field_group);

echo "Creating sample people\n";
$person1_id = wp_insert_post([
    'post_title' => 'Peter Lustig',
    'post_content' => 'Peter\'s biography',
    'post_type' => 'person',
    'post_status' => 'publish',
    'post_name' => sanitize_title('Peter Lustig'),
    'post_date' => date('Y-m-d h:i:s', time())
]);
update_field('first_name', 'Peter', $person1_id);
update_field('last_name', 'Lustig', $person1_id);

