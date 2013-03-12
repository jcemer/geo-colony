<?php

class Controller_Api_Trails extends Controller_Rest
{

    private $trail_options = array(
        'related' => array(
            'plots' => array(
                'select' => array('id'),
                'related' => array(
                    'plot_coordinates' => array(
                        'select' => array('id', 'latitude', 'longitude')
                    )
                )
            )
        )
    );

    public function get_index()
    {
        $ids = Input::get('id');
        if (!empty($ids)) {
            $data = Model_Trail::findByIds($ids, $this->trail_options);
        } else {
            $data = Model_Trail::find('all', array(
                'select' => array('colony_id', 'name'),
                'order_by' => 'name'
            ));
        }
        return $this->response($data);
    }

    public function get_id()
    {
        $data = Model_Trail::find($this->param('id'), $this->trail_options);
        return $this->response($data);
    }
}