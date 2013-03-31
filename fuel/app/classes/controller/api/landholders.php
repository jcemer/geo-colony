<?php

class Controller_Api_Landholders extends Controller_Rest
{

	public function get_search()
	{
		$search = Input::get('q');
		if (empty($search))
		{
			throw new Exception('search can provide q');
		}
		$data = Qgram::search(
			'landholders', 
			$search, 
			'plot_landholders ON plot_landholders.landholder_id = t.id'
		);
		return $this->response($data);
	}
}