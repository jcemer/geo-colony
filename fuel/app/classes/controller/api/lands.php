<?php

class Controller_Api_Lands extends Controller_Rest
{

	static private $trail_options = array(
		'select' => array('id', 'name'),
		'related' => array(
			'plots' => array(
				'select' => array('id'),
				'related' => array(
					'plot_coordinates' => array(
						'select' => array('id', 'latitude', 'longitude')
					)
				)
			)
		)
	);

	static private $landholder_options = array(
		'select' => array('id', 'name'),
		'related' => array(
			'plot_landholders' => array(
				'select' => array('id', 'plot_id'),
				'related' => array(
					'plot' => array(
						'select' => array('id'),
						'related' => array(
							'plot_coordinates' => array(
								'select' => array('id', 'latitude', 'longitude')
							)
						)
					)
				)
			)
		)
	);

	private static function landholder_to_plots_array($data)
	{
		if (empty($data))
		{
			return null;
		}
		$ret = array(
			'id' => $data['id'],
			'name' => 'P: '.$data['name'],
			'plots' => array()
		);
		foreach ($data['plot_landholders'] as $item)
		{
			$ret['plots'][] = $item['plot'];
		}
		return $ret;
	}

	private static function factory($param)
	{
		$data = array();
		$type = !empty($param) ? $param[0] : 'X';
		$id = substr($param, 1);

		if ($type == "T")
		{
			$data = Model_Trail::find($id, static::$trail_options)->to_array();
		}
		else if ($type == "L")
		{
			$data = Model_Landholder::find($id, static::$landholder_options);
			$data = static::landholder_to_plots_array($data);
		}

		# add type
		if (!empty($data))
		{
			$data['id'] = $type.$data['id'];
		}

		return $data;
	}


	public function get_index()
	{
		$params = Input::get('id');
		$data = array();
		foreach ($params as $param)
		{
			$obj = static::factory($param);
			if (!empty($obj))
			{
				$data[] = $obj;
			}
		}
		return $this->response($data);
	}

	public function get_id()
	{
		$param = $this->param('id');
		$data = static::factory($param);
		return $this->response($data);
	}
}
