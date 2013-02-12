<?php

class Model_Plot_Landholder extends \Orm\Model
{
	protected static $_properties = array(
		'id',
		'user_id',
		'plot_id',
		'landholder_id',
		'source_id',
		'granting',
		'release',
		'area',
		'price',
		'observation'
	);

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
