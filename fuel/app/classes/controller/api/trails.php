<?php

class Controller_Api_Trails extends Controller_Rest
{

    public function get_index()
    {
        $options = array(
            'select' => array('colony_id', 'name'),
            'order_by' => 'name'
        );
        $data = Model_Trail::find('all', $options);
        $data = array_values($data);

        return $this->response($data);
    }
}