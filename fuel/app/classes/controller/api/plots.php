<?php

class Controller_Api_Plots extends Controller_Rest
{

    public function get_id()
    {
        $data = Model_Plot::find($this->param('id'), array(
            'related' => array(
                'nucleu' => array('select' => array('id', 'name')),
                'section' => array('select' => array('id', 'name')),
                'edge' => array('select' => array('id', 'name')),
                'city' => array('select' => array('id', 'name')),
                'plot_landholders' => array(
                    'select' => array('id', 'area')
                ),
                'plot_coordinates' => array(
                    'select' => array('id', 'latitude', 'longitude')
                )
            )

        ));
        return $this->response($data);
    }
}