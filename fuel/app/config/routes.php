<?php
return array(
	'_root_'                       => 'dashboard/index',
	'_404_'                        => 'dashboard/404',

    'api/:controller/:id/:related' => 'api/$1/related',
    'api/:controller/:id'          => 'api/$1/id'
);