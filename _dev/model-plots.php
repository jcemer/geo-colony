<?php
    require 'class.database.php';
    
    DB::conn()->exec('USE `colonias-v3`');
    $rs = DB::exec('SELECT * FROM lote WHERE id <= 24477 ORDER BY id');
    DB::conn()->exec('USE `geo-colony`');

    echo '<pre>';
    while ($row = $rs->row()) {
        $colony = DB::row('SELECT * FROM colonies WHERE TMP_id = "'.$row['Colonia_ID'].'"');
        $trail = DB::row('SELECT * FROM trails WHERE TMP_id = "'.$row['Linha_ID'].'"');
        $nucleu = DB::row('SELECT * FROM nucleus WHERE TMP_id = "'.$row['Nucleo_ID'].'"');
        $section = DB::row('SELECT * FROM sections WHERE TMP_id = "'.$row['Seccao_ID'].'"');
        $edge = DB::row('SELECT * FROM edges WHERE TMP_id = "'.$row['Lado_Ala_ID'].'"');
        $source = DB::row('SELECT * FROM sources WHERE TMP_id = "'.$row['Fonte_ID'].'"');
        $city = DB::row('SELECT * FROM cities WHERE name = "'.$row['Cidade'].'"');
        
        $fields = array(
            'id' => $row['id'],
            'user_id' => 1,
            'colony_id' => $colony['id'],
            'trail_id' => $trail['id'],
            'nucleu_id' => $nucleu['id'],
            'section_id' => $section['id'],
            'edge_id' => $edge['id'],
            'source_id' => $source['id'],
            'city_id' => $city['id'],
            'number' => $row['Numero'],
            'elevation' => $row['Elevacao'],
            'approved_by' => 1
        );

        var_dump($fields);

        DB::insert('plots', $fields);
    }