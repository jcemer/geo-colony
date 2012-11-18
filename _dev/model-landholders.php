<?php
    require 'class.database.php';
    new DB('mysql', 'localhost', 'root', 'z4j9p2', 'geo-colony');
    setlocale(LC_CTYPE, 'pt_BR');
    
    $rs = DB::select('landholders', array('id' => '', 'name' => '', 'lastname' => ''));

    echo '<pre>';
    while ($row = $rs->row()) {
        $name = $row['name'];
        $lastname = $row['lastname'];

        $row['name'] = ucwords(strtolower($row['name']));
        $row['lastname'] = ucwords(strtolower($row['lastname']));

        $row['name'] = str_replace(' E ', ' e ', $row['name']);
        $row['name'] = str_replace(' De ', ' de ', $row['name']);
        $row['name'] = str_replace(' Dos ', ' dos ', $row['name']);
        $row['name'] = str_replace(' Ou ', ' ou ', $row['name']);
        $row['name'] = str_replace('?', '', $row['name']);
        $row['name'] = str_replace('*', '', $row['name']);

        $reversename = stripos($row['name'], $row['lastname']);
        if ($reversename !== false && $reversename >= 0) {
            $color = 'blue';
            $row['name'] = str_replace($row['lastname'], '', $row['name']);
            $row['name'] = preg_replace('/^\s*,?\s*/', '', $row['name']);
            $row['name'] = $row['lastname'].', '.$row['name'];
        } else if ($reversename === false && !empty($row['lastname']))  {
            $color = 'red';
            $row['name'] = $row['lastname'].', '.$row['name'];
        } else {
            $color = 'black';
        }


        echo '<span style="color: '.$color.'">';
        echo $reversename.$name;
        echo ' &raquo ';
        echo $row['name'];
        echo '</span>';

        //DB::update('landholders', $row);

        echo "       ";
        //echo $row['lastname'];
        echo '<br>';

    }