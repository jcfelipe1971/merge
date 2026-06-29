<?php
	$empresa = (array_key_exists('empresa',$_POST))? $_POST["empresa"] : "";
	$alias   = (array_key_exists('alias',$_POST))? $_POST["alias"] : "";
    
    // Atacamos a BD
    $con = conectarFirebird($alias);
    $arr = dameDatosRuta($con, $empresa, $alias);
    
    //======================================================== INICIO DE DISENNO PDF =================================================
    
    $w_title = 30; 
    $w_cell = 60; 
    $h = 5; 
    
    $pdf = new PDF ();
    
    foreach( $arr as $k => $conductor) {
    
        $pdf->AddPage(); //page break.  
        $pdf->SetFont( 'Helvetica', 'B', 11 );
        $pdf->MultiCellSibiling( 150, $h, (($k)? 'RUTAS PENDIENTES POR VEHÍCULO: "'.$k.'"' : 'RUTAS PENDIENTES SIN VEHÍCULO') ,'B');
        $pdf->Ln( 10 );
        $pdf->putLine();
       
        foreach( $conductor as $v ) {
           
            $pdf->MultiCellSibiling( $w_title, $h, 'ID_RUTA:', 'B');
            $pdf->MultiCellSibiling( $w_cell, $h, $v['ID_RUTA'], '', true);
       
            $pdf->MultiCellSibiling( $w_title, $h, 'FECHA:', 'B');
            $pdf->MultiCellSibiling( 150, $h, decodificar_string(humanizarFecha($v['FECHA_PREV_INI'])), '', true);
                  
            $pdf->MultiCellSibiling( $w_title, $h, 'PASAJEROS:','B');
            $pdf->MultiCellSibiling( $w_cell, $h, $v['PASAJEROS'], '', true);
       
            $pdf->MultiCellSibiling( $w_title, $h, 'SERVICIO:','B');
            $pdf->MultiCellSibiling( $w_cell, $h, $v['SERVICIO'] );
            $pdf->MultiCellSibiling( $w_title, $h, 'HORA:','B');
            $pdf->MultiCellSibiling( $w_cell, $h, date('H:i:s', $v['FECHA_PREV_INI']), '', true);
       
            $pdf->MultiCellSibiling( $w_title, $h, 'TITULO:','B');
            $pdf->MultiCellSibiling( 150, $h, $v['TITULO'], '', true);
    
            $pdf->MultiCellSibiling( $w_title, $h, 'NOTAS:','B');
            $pdf->MultiCellSibiling( 150, $h, $v['NOTA'], '', true, 1);
            $pdf->Ln( 2 );
           
            $pdf->MultiCellSibiling( $w_title, $h, 'CLIENTE:','B');
            $pdf->MultiCellSibiling( $w_cell, $h, $v['NOMBRE_CLIENTE'] );
            $pdf->MultiCellSibiling( $w_title, $h, 'HORA FIN:','B');
            $pdf->Rect($pdf->GetX(), $pdf->GetY(), 50, 5);
            $pdf->MultiCellSibiling( $w_title, $h, '','',true); // columna vacía para salto de línea

            $pdf->putLine();   
        }
    }
    
    //========================= PINTAMOS EL PDF
    
    if( isset($PDF_OUTPUT) ) {
        $pdf->Output($PDF_OUTPUT, $pdfFileName);
    } else     
        $pdf->Output();
	
function dameDatosRuta($con, $empresa, $alias){
  // Recuperamos parámetros

    list($f_ini, $f_fin) = (array_key_exists('FECHAS',$_POST))? explode('#',$_POST['FECHAS']) : null;
    $ids = (array_key_exists('IDS',$_POST))? explode(',',$_POST['IDS']) : null;
    
    // Array de parametros para el SQL
    $arrParametros = array($empresa);
    
    // Si hay filtro ----------------------------------------------
    $filtroSQL = "";
    if( $f_ini && $f_fin ) {
        $filtroSQL .= " AND ((R.FECHA_PREV_INI BETWEEN ? AND ?) OR (R.FECHA_PREV_FIN BETWEEN ? AND ?)) ";
        $arrParametros[] = $f_ini . ' 00:00:00';
        $arrParametros[] = $f_fin . ' 23:59:59';
        $arrParametros[] = $f_ini . ' 00:00:00';
        $arrParametros[] = $f_fin . ' 23:59:59';
    }
    if( $ids ) {
        $filtroSQL .= " AND R.ID_RUTA IN( ";
        foreach( $ids as $id ) {
            $filtroSQL .= " ?, ";
            $arrParametros[] = $id;
        }
        $filtroSQL = rtrim($filtroSQL,', ');
        $filtroSQL .= " ) ";
    }  
      $sql = "SELECT R.ID_RUTA, R.TITULO, R.NOTA, R.ID_CLIENTE, C.CLIENTE, T.NOMBRE_COMERCIAL AS NOMBRE_CLIENTE, R.SU_REFERENCIA,
            R.FECHA_PREV_INI, R.FECHA_PREV_FIN, R.ID_VEHICULO, V.MATRICULA AS MATRICULA_VEHICULO, R.ID_REMOLQUE, VV.MATRICULA AS MATRICULA_REMOLQUE,
            R.ID_CONDUCTOR, TT.NOMBRE_COMERCIAL AS NOMBRE_CONDUCTOR, R.ID_ARTICULO, A.ARTICULO, A.TITULO AS ARTICULO_TITULO,
            R.KM_PREVISTOS, R.UNIDADES, R.PASAJEROS, R.PRECIO, R.ESTADO, E.TITULO AS NOMBRE_ESTADO, R.FECHA_FIN FROM TRANS_RUTA R
           
            LEFT JOIN ART_ARTICULOS A ON A.ID_A = R.ID_ARTICULO                   /* ARTÍCULO */
            LEFT JOIN EMP_CLIENTES C ON C.ID_CLIENTE = R.ID_CLIENTE               /* CLIENTE */
            LEFT JOIN SYS_TERCEROS T ON T.TERCERO = C.TERCERO                     /* TERCERO CLIENTE */
            LEFT JOIN OPE_EMPLEADO O ON O.ID_EMPLEADO = R.ID_CONDUCTOR            /* CONDUCTOR */
            LEFT JOIN SYS_TERCEROS TT ON TT.TERCERO = O.TERCERO                   /* TERCERO CONDUCTOR */
            LEFT JOIN REP_FICHA_TECNICA V ON V.ID_FICHA_TECNICA = R.ID_VEHICULO   /* VEHÍCULO */
            LEFT JOIN REP_FICHA_TECNICA VV ON VV.ID_FICHA_TECNICA = R.ID_REMOLQUE /* REMOLQUE */
            LEFT JOIN SYS_GES_ESTADOS E ON E.ESTADO = R.ESTADO                    /* ESTADO */       
            WHERE R.EMPRESA = ? ".$filtroSQL;
    
    $sql .= "ORDER BY R.ESTADO, R.FECHA_PREV_INI";
       
    $rs = ibase_prepared_sentence_cloud($con, $sql, $arrParametros);
    
    if( $rs ){
        $arr = array();
        while( $row = ibase_fetch_assoc($rs) ){
               
            // Decodificamos notas como BLOB
            $blob_data = ibase_blob_info($row['NOTA']);
            $blob_hndl = ibase_blob_open($row['NOTA']);
            $nota   = ibase_blob_get($blob_hndl, $blob_data[0]);
            ibase_blob_close($blob_hndl);
           
            //Retocamos las datas
            $fecha_prev_ini = '';
            if( $row['FECHA_PREV_INI'] ) {
                list( $f, $h ) = explode(' ', $row['FECHA_PREV_INI']);
                $f = implode('-', array_reverse( explode('-', $f)));
                $fecha_prev_ini = strtotime($f.' '.$h);
            }
           
            $fecha_prev_fin = '';
            if( $row['FECHA_PREV_FIN'] ) {
                list( $f, $h ) = explode(' ', $row['FECHA_PREV_FIN']);
                $f = implode('-', array_reverse( explode('-', $f)));
                $fecha_prev_fin = strtotime($f.' '.$h);
            }
           
            $fecha_cierre = '';
            if( $row['FECHA_FIN'] ) {
                list( $f, $h ) = explode(' ', $row['FECHA_FIN']);
                $f = implode('-', array_reverse( explode('-', $f)));
                $fecha_cierre = strtotime($f.' '.$h);
            }
    
               
            // Agregamos al array de rutas
            $arr[codificar_string($row['MATRICULA_VEHICULO'])][] = array(
                    'ID_RUTA' => intVal($row['ID_RUTA']),
                    'TITULO' => codificar_string($row['TITULO']),
                    'NOTA' => codificar_string($nota),
                    'ID_CLIENTE' => codificar_string($row['ID_CLIENTE']),
                    'CLIENTE' => $row['CLIENTE'],
                    'NOMBRE_CLIENTE' => codificar_string($row['NOMBRE_CLIENTE']),
                    'SU_REFERENCIA' => codificar_string($row['SU_REFERENCIA']),
                    'FECHA_PREV_INI' => $fecha_prev_ini,
                    'FECHA_PREV_FIN' => $fecha_prev_fin,
                    'ID_VEHICULO' => $row['ID_VEHICULO'],
                    'MATRICULA_VEHICULO' => $row['MATRICULA_VEHICULO'],
                    'ID_REMOLQUE' => $row['ID_REMOLQUE'],
                    'MATRICULA_REMOLQUE' => $row['MATRICULA_REMOLQUE'],
                    'ID_CONDUCTOR' => $row['ID_CONDUCTOR'],
                    'NOMBRE_CONDUCTOR' => codificar_string($row['NOMBRE_CONDUCTOR']),
                    'ID_ARTICULO' => $row['ID_ARTICULO'],
                    'SERVICIO' => codificar_string($row['ARTICULO'] .' - '. $row['ARTICULO_TITULO']),
                    'KM_PREVISTOS' => $row['KM_PREVISTOS'],
                    'UNIDADES' => $row['UNIDADES'],
                    'PASAJEROS' => $row['PASAJEROS'],
                    'PRECIO' => $row['PRECIO'],
                    'ESTADO' => $row['ESTADO'],
                    'NOMBRE_ESTADO' => codificar_string($row['NOMBRE_ESTADO']),
                    'FECHA_CIERRE' => $fecha_cierre,
                    'FINALIZADO' => (( $row['FECHA_FIN'] )? true : false)
            );
        }
    }
    return $arr;
}
function dameDatosTramo($con, $id_ruta){       
    $arrTramoParametros = array($id_ruta);
    //Obtenemos datos de tramo    
    $sql_tramo = "SELECT ID_RUTA, ID_TRAMO, TITULO, ORIGEN, FECHA_INI, FECHA_FIN, DESTINO  FROM TRANS_TRAMO WHERE ID_RUTA = ?";   
    $sql_tramo .= " ORDER BY ID_TRAMO ";
   
    $rs = ibase_prepared_sentence_cloud($con, $sql_tramo, $arrTramoParametros);

    if( $rs ){
        $arr_tramo = array();
        while( $row = ibase_fetch_assoc($rs) ){
            //Retocamos las datas
            $fecha_tramo_ini = '';
            if( $row['FECHA_INI'] ) {
                list( $f, $h ) = explode(' ', $row['FECHA_INI']);
                $f = implode('-', array_reverse( explode('-', $f)));
                $fecha_tramo_ini = strtotime($f.' '.$h);
            } 
            $fecha_tramo_fin = '';
            if( $row['FECHA_FIN'] ) {
                list( $f, $h ) = explode(' ', $row['FECHA_FIN']);
                $f = implode('-', array_reverse( explode('-', $f)));
                $fecha_tramo_fin = strtotime($f.' '.$h);
            }
            // Agregamos al array de tramos
            $arr_tramo[$row['ID_TRAMO']] = array(
                    'ID_RUTA' => intVal($row['ID_RUTA']),
                    'ID_TRAMO' => intVal($row['ID_TRAMO']),
                    'TITULO' => codificar_string($row['TITULO']),
                    'ORIGEN' => codificar_string($row['ORIGEN']),
                    'FECHA_INI' => $fecha_tramo_ini,
                    'FECHA_FIN' => $fecha_tramo_fin,
                    'DESTINO' => codificar_string($row['DESTINO'])                
            );
        }
    }
    return $arr_tramo;
}


function dameDatosVehivulo($con, $id_tramo){       

    $arrTramoVehiculoParametros = array($id_tramo);
    //Obtenemos datos de tramo    
    $sql_tramoVehiculo  = " SELECT TTV.ID_TRAMO, TTV.ID_VEHICULO, TF.MATRICULA, TF.MODELO  FROM TRANS_TRAMO_VEHICULO TTV JOIN REP_FICHA_TECNICA TF ON (TF.ID_FICHA_TECNICA = TTV.ID_VEHICULO) ";   
    $sql_tramoVehiculo .= " WHERE ID_TRAMO = ? ORDER BY TTV.ID_VEHICULO ASC ";
   
    $rs = ibase_prepared_sentence_cloud($con, $sql_tramoVehiculo, $arrTramoVehiculoParametros);

    if( $rs ){
        $arr_tramo_vehiculo = array();
        while( $row = ibase_fetch_assoc($rs) ){
            
            // Agregamos al array de vehiculos
            $arr_tramo_vehiculo[$row['ID_VEHICULO']] = array(
                'ID_TRAMO'    => intVal($row['ID_TRAMO']),
                'ID_VEHICULO' => intVal($row['ID_VEHICULO']),
                'MATRICULA'   => codificar_string($row['MATRICULA']),
                'MODELO'      => codificar_string($row['MODELO'])                
            );
        }
    }
    return $arr_tramo_vehiculo;
}
function dameDatosConductor($con, $id_tramo){       

    $arrTramoConductorParametros = array($id_tramo);
    //Obtenemos datos de conductores del tramo    

    $sql_tramoConductor = " SELECT TTC.ID_TRAMO, ST.NOMBRE_R_SOCIAL, ST.TELEFONO01, OE.CATEGORIA, TTC.ID_CONDUCTOR ";   
    $sql_tramoConductor .= " FROM TRANS_TRAMO_CONDUCTOR TTC ";   
    $sql_tramoConductor .= " JOIN OPE_EMPLEADO OE ON (TTC.ID_CONDUCTOR = OE.ID_EMPLEADO) ";   
    $sql_tramoConductor .= " JOIN SYS_TERCEROS ST ON (ST.TERCERO = OE.TERCERO) ";   
    $sql_tramoConductor .= " WHERE TTC.ID_TRAMO = ? ";   
    $sql_tramoConductor .= " ORDER BY TTC.ID_CONDUCTOR ASC ";   

    $rs = ibase_prepared_sentence_cloud($con, $sql_tramoConductor, $arrTramoConductorParametros);

    if( $rs ){
        $arr_tramo_conductor = array();
        while( $row = ibase_fetch_assoc($rs) ){            
            // Agregamos al array de conductores
            $arr_tramo_conductor[$row['ID_CONDUCTOR']] = array(
                'ID_TRAMO'        => intVal($row['ID_TRAMO']),
                'ID_CONDUCTOR'    => intVal($row['ID_CONDUCTOR']),
                'NOMBRE_R_SOCIAL' => codificar_string($row['NOMBRE_R_SOCIAL']),
                'TELEFONO01'      => codificar_string($row['TELEFONO01']),
                'CATEGORIA'       => codificar_string($row['CATEGORIA'])
            );
        }
    }
    return $arr_tramo_conductor;
}