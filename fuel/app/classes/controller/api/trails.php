<?php

class Controller_Api_Trails extends Controller_Rest
{

	private $trail_options = array(
		'related' => array(
			'plots' => array(
				'select' => array('id'),
				'related' => array(
					'plot_coordinates' => array(
						'select' => array('id', 'latitude', 'longitude')
					)
				)
			),
			'colony' => array('select' => array('id', 'name'))
		)
	);

	public function get_index()
	{
		$ids = Input::get('id');
		if (empty($ids))
		{
			throw new Exception('ids can be sended');
		}
		$data = Model_Trail::findByIds($ids, $this->trail_options);
		return $this->response($data);
	}

	public function get_id()
	{
		$data = Model_Trail::find($this->param('id'), $this->trail_options);
		return $this->response($data);
	}
}