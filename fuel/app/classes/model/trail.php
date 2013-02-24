<?php

class Model_Trail extends \Orm\Model
{
	protected static $_properties = array(
		'id',
		'user_id',
		'colony_id',
		'name',
		'approved_by',
		'created_at',
		'updated_at'
	);

	protected static $_belongs_to = array('colony');

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

	public static function findByIds($ids, $options) {
		foreach ($ids as $id)
		{
			if (!isset($where))
			{
				$where = array('id', $id);
			}
			else
			{
				$where = array(
					array('id', $id),
					'or' => $where
				);
			}
		}
		$options['where'] = $where;
		return self::find('all', $options);
	}
}
