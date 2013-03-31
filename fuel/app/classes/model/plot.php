<?php

class Model_Plot extends \Orm\Model
{
	protected static $_properties = array(
		'id',
		'user_id',
		'colony_id',
		'trail_id',
		'nucleu_id',
		'section_id',
		'edge_id',
		'source_id',
		'city_id',
		'number',
		'elevation',
		'approved_by'
	);

	protected static $_belongs_to = array('colony', 'trail', 'nucleu', 'section', 'edge', 'city');
	protected static $_has_many = array('plot_coordinates', 'plot_landholders');

	protected static $_observers = array(
		'Orm\Observer_CreatedAt' => array(
			'events' => array('before_insert'),
			'mysql_timestamp' => false,
		),
		'Orm\Observer_UpdatedAt' => array(
			'events' => array('before_save'),
			'mysql_timestamp' => false,
		),
	);
}
