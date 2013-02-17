<?php

class Controller_Api_Trails extends Controller_Rest
{

    public function get_all()
    {
        $options = array(
            'select' => array('colony_id', 'name'),
            'order_by' => 'name'
        );
        if ($this->param('type') && $this->param('id'))
        {
            $options['where'] = array(
                $this->param('type').'_id' => $this->param('id')
            );
        }
        $data = Model_Trail::find('all', $options);
        $data = array_values($data);

        return $this->response(array('data' => $data));
    }
}