<?php

class Controller_Api_Landholders extends Controller_Rest
{

	public function get_search()
	{
		$search = Input::get('q');
		if (empty($search))
		{
			throw new Exception('search can be q');
		}
		$data = Qgram::search('landholders', $search);
		return $this->response($data);
	}
}