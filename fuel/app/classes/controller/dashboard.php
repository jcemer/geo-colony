<?php

class Controller_Dashboard extends Controller_Template
{

	public function action_index()
	{
		$this->template->title = 'Dashboard &raquo; Index';
		$this->template->content = View::forge('dashboard/index');
	}

}
