<?php

class Controller_Api_Plots extends Controller_Rest
{

    public function get_id()
    {
        $data = Model_Plot::find($this->param('id'), array(

        ));
        return $this->response($data);
    }
}