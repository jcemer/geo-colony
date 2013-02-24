<?php

class Controller_Api_Trails extends Controller_Rest
{

    public function get_index()
    {       
        $options = array(
            'select' => array('colony_id', 'name'),
            'order_by' => 'name'
        );        
        $ids = Input::get('id');
        if (!empty($ids)) {
            $data = Model_Trail::findByIds($ids, $options);
        } else {
            $data = Model_Trail::find('all', $options);
        }
        
        $data = array_values($data);

        return $this->response($data);
    }

    public function get_id()
    {
        $data = Model_Trail::find($this->param('id'));
        return $this->response($data);
    }
}