<?php

class Controller_Dashboard extends Controller_Template
{

	public function action_index()
	{
        $colonies_data = Model_Colony::find('all', array(
            'order_by' => 'name'
        ));
        
        $trails_data = array();

        // adding select option
        $select_option = array('id' => '-', 'name' => 'Selecione...');

        array_unshift($colonies_data, $select_option);
        $colonies_data = Arr::assoc_to_keyval($colonies_data, 'id', 'name');

        array_unshift($trails_data, $select_option);
        $trails_data = Arr::assoc_to_keyval($trails_data, 'id', 'name');        

        // view
        $view = View::forge('dashboard/index');
        $view->set_global('colonies', $colonies_data);
        $view->set_global('trails', $trails_data);

        // template
		$this->template->title = 'Dashboard &raquo; Index';
		$this->template->content = $view;
	}

}
