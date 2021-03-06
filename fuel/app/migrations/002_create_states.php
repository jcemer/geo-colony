<?php

namespace Fuel\Migrations;

class Create_states
{
	public function up()
	{
		\DBUtil::create_table('states', array(
			'id' => array('constraint' => 11, 'type' => 'int', 'auto_increment' => true),
			'country_id' => array('constraint' => 11, 'type' => 'int'),
			'name' => array('constraint' => 255, 'type' => 'varchar'),
			'code' => array('constraint' => 2, 'type' => 'char'),
			'created_at' => array('constraint' => 11, 'type' => 'int'),
			'updated_at' => array('constraint' => 11, 'type' => 'int'),

		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('states');
	}
}