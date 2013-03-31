<?php

class Controller_Api_Cities extends Controller_Rest
{

	public function get_search()
	{
		$query = Input::get('query');
		if (empty($query))
		{
			throw new Exception('search can provide query');
		}

		$data = Model_city::findByNameWithPlots($query);
		return $this->response($data);
	}
	
}