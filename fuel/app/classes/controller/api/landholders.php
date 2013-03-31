<?php

class Controller_Api_Landholders extends Controller_Rest
{

	public function get_search()
	{
		$query = Input::get('query');
		if (empty($query))
		{
			throw new Exception('search can provide query');
		}
		$data = Qgram::search(
			'landholders', 
			$query, 
			'plot_landholders ON plot_landholders.landholder_id = t.id'
		);
		return $this->response($data);
	}
}