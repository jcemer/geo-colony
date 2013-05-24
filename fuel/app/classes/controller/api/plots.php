<?php

class Controller_Api_Plots extends Controller_Rest
{

	public function get_id()
	{
		$data = Model_Plot::find($this->param('id'), array(
			'related' => array(
				'colony' => array('select' => array('id', 'name')),
				'trail' => array('select' => array('id', 'name')),
				'nucleu' => array('select' => array('id', 'name')),
				'section' => array('select' => array('id', 'name')),
				'edge' => array('select' => array('id', 'name')),
				'city' => array('select' => array('id', 'name')),
				'plot_landholders' => array(
					'select' => array('id', 'granting', 'release', 'area', 'price'),
					'related' => array(
						'landholder' => array('select' => array('id', 'name', 'family')),
					)
				),
				'plot_coordinates' => array(
					'select' => array('id', 'latitude', 'longitude')
				)
			)

		));

		$data = Format::forge($data)->to_array();
		$data["area"] = !empty($data["plot_landholders"][0]) ? $data["plot_landholders"][0]["area"] : '0';

		return $this->response($data);
	}
}