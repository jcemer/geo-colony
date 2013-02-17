<?php

class Controller_Dashboard extends Controller_Template
{

	public function action_index()
	{
        $colonies_query = Model_Colony::find('all', array(
            'order_by' => 'name'
        ));
        array_unshift($colonies_query, array('id' => -1, 'name' => 'Selecione...'));
        $colonies_array = Arr::assoc_to_keyval($colonies_query, 'id', 'name');

        // view
        $view = View::forge('dashboard/index');
        $view->set_global('colonies', $colonies_array);

        // template
		$this->template->title = 'Dashboard &raquo; Index';
		$this->template->content = $view;
	}

}
