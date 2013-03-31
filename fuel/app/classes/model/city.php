<?php

class Model_City extends \Orm\Model
{
	protected static $_properties = array(
		'id',
		'state_id',
		'name',
		'created_at',
		'updated_at'
	);

	protected static $_belongs_to = array('state');
	protected static $_has_many = array('plots');

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

	public static function findByNameWithPlots($search)
	{
		return DB::query('
			SELECT DISTINCT t.id, t.name 
			FROM cities t JOIN plots ON plots.city_id = t.id
			WHERE t.name LIKE '.DB::quote($search.'%').' ORDER BY t.name
		')->execute();
	}
}
