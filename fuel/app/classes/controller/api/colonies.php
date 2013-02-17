<?php

class Controller_Api_Colonies extends Controller_Rest
{

    public function get_all()
    {
        $data = Model_Colony::find('all', array(
            'select' => array('name'),
            'order_by' => 'name'
        ));
        $data = array_values($data);

        return $this->response(array('data' => $data));
    }
}