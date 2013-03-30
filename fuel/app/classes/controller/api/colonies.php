<?php

class Controller_Api_Colonies extends Controller_Rest
{

	public function get_id()
	{
		$data = Model_Colony::find($this->param('id'));
		return $this->response($data);
	}

	public function get_trails()
	{
		$data = Model_Colony::find($this->param('id'), array(
			'related' => array(
				'trails' => array(
					'select' => array('id', 'name', 'colony_id')
				)
			)
		));
		$data = !empty($data['trails']) ? $data['trails'] : array();
		return $this->response($data);
	}
}