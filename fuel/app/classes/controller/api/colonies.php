<?php

class Controller_Api_Colonies extends Controller_Rest
{

    public function get_index()
    {
        $options = array(
            'select' => array('name'),
            'order_by' => 'name'
        );
        $data = Model_Colony::find('all', $options);
        $data = array_values($data);

        return $this->response($data);
    }

    public function get_id()
    {
        $data = Model_Colony::find($this->param('id'));
        return $this->response($data);
    }

    public function get_related()
    {
        $main_data = Model_Colony::find($this->param('id'), array(
            'related' => $this->param('related')
        ));

        // filter fields
        $data = array();
        foreach ($main_data[$this->param('related')] as $related)
        {
            $data[] = array(
                'name' => $related['name'],
                'colony_id' => $related['colony_id']
            );
        }

        return $this->response($data);
    }
}