<?php
	$empresa = (array_key_exists('empresa',$_POST))? $_POST["empresa"] : "";
	$alias   = (array_key_exists('alias',$_POST))? $_POST["alias"] : "";
    
    // Atacamos a BD
    $con = conectarFirebird($alias);
    
    // ======================================================== INICIO SQL =================================================
    $f_ini = null;
    $f_fin = null;
    
    if (array_key_exists('FECHA', $_REQUEST)) {
        list ($f_ini, $f_fin) = explode('#', $_REQUEST['FECHA']);
    }
    $idEmpleado = (array_key_exists('ID_EMPLEADO', $_POST)) ? $_POST['ID_EMPLEADO'] : null;
    
    // Array de parametros para el SQL
    $arrParametros = array(
        $empresa
    );
    
    // Si hay filtro ----------------------------------------------
    $filtroSQL = "";
    if ($f_ini && $f_fin) {
        $filtroSQL .= " AND (C.FECHA BETWEEN ? AND ?) ";
        $arrParametros[] = $f_ini . ' 00:00:00';
        $arrParametros[] = $f_fin . ' 23:59:59';
    }
    if ($idEmpleado) {
        $filtroSQL .= " AND E.ID_EMPLEADO = ? ";
        $arrParametros[] = $idEmpleado;
    }
    
    $sql = " SELECT ID_DET_PRESENCIA, T.NOMBRE_R_SOCIAL AS NOMBRE, C.FECHA, E.ID_EMPLEADO, D.HORA_ENTRADA, D.HORA_SALIDA, D.INCIDENCIA, I.DESCRIPCION AS TITULO_INCIDENCIA, D.NOTAS,
                          E.HORARIO, H.DESCRIPCION AS TITULO_HORARIO, D.TIEMPO
                                FROM PRO_CAB_PRESENCIA C
                            LEFT JOIN PRO_DET_PRESENCIA D ON ( C.EMPRESA = D.EMPRESA AND C.EJERCICIO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.SERIE = D.SERIE AND C.TIPO = D.TIPO AND C.RIG = D.RIG )
                            LEFT JOIN OPE_EMPLEADO E ON ( C.OPERARIO = E.EMPLEADO AND C.EMPRESA = E.EMPRESA )
                            LEFT JOIN OPE_HORARIOS H ON ( E.HORARIO = H.HORARIO AND E.EMPRESA = H.EMPRESA )
                            LEFT JOIN SYS_TERCEROS T ON ( E.TERCERO = T.TERCERO )
                            LEFT JOIN PRO_SYS_TIPO_INCIDENCIA I ON ( I.ID_INCIDENCIA = D.INCIDENCIA )
                         WHERE C.EMPRESA = ? " . $filtroSQL;
    
    $sql .= "ORDER BY C.FECHA DESC, E.ID_EMPLEADO";
    
    $rs = ibase_prepared_sentence_cloud($con, $sql, $arrParametros);
    
    if ($rs) {
        $arr = array();
        while ($row = ibase_fetch_assoc($rs, IBASE_TEXT)) {
    
            $fecha = '';
            if ($row['FECHA']) {
                list ($f, $h) = explode(' ', $row['FECHA']);
                $f = implode('-', array_reverse(explode('-', $f)));
                $fecha = strtotime($f . ' ' . $h);
            }
    
            $hi = "";
            if ($row['HORA_ENTRADA']) {
                $hi = date("H:i", strtotime($row['HORA_ENTRADA']));
            }
            $hf = "";
            if ($row['HORA_SALIDA']) {
                $hf = date("H:i", strtotime($row['HORA_SALIDA']));
            }
            $t = "";
            if ($row['TIEMPO']) {
                list ($basura, $t) = explode(" ", $row['TIEMPO']);
                $t = convertToHoursMins(convertStringHourToMins($t));
            }
    
            // Agregamos al array de rutas
            $arr[$fecha][] = array(
                'ID' => $row['ID_DET_PRESENCIA'],
                'NOMBRE' => codificar_string($row['NOMBRE']),
                'FECHA' => $fecha,
                'HORA_ENTRADA' => $hi,
                'HORA_SALIDA' => $hf,
                'TIEMPO' => $t,
                'INCIDENCIA' => $row['INCIDENCIA'],
                'TITULO_INCIDENCIA' => codificar_string($row['TITULO_INCIDENCIA']),
                'HORARIO' => $row['HORARIO'],
                'TITULO_HORARIO' => codificar_string($row['TITULO_HORARIO']),
                'ESTADO' => (($row['HORA_ENTRADA'] && $row['HORA_SALIDA']) ? 1 : 0),
                'NOTAS' => codificar_string($row['NOTAS']),
                'ID_EMPLEADO' => $row['ID_EMPLEADO']
            );
        }
    }
    
    // ======================================================== INICIO DE DISENYO PDF =================================================
    
    $h = 5; // height

    // ========================================================

    $pdf = new PDF();

    $pdf->titulo_listado = "Llistat Diari Presencia";

    $pdf->callbackHeader = function($pdf) {
        
        // SUBHEADER
        
        $h = 5;
        
        $pdf->SetFont( 'Helvetica', 'B', 10 );
        
        // FECHA EMPLEADO PRESENCIA PRODUCCION DIFERENCIA
        
        $pdf->MultiCellSibling( 16, $h, 'ID', '');
        $pdf->MultiCellSibling( 19, $h, 'Data', '');
        $pdf->MultiCellSibling( 10, $h, ' ', '');
        $pdf->MultiCellSibling( 50, $h, 'Empleat', '', false, 0, 'L');
        $pdf->MultiCellSibling( 20, $h, 'Entrada', '', false, 0, 'L');
        $pdf->MultiCellSibling( 20, $h, 'Sortida', '', false, 0, 'L');
        $pdf->MultiCellSibling( 20, $h, 'Temps', '', false, 0, 'L');
        $pdf->MultiCellSibling( 20, $h, 'Incidencia', '', true, 0, 'L');
    
    
        $pdf->putLine();
    };

    // ========================================================

    $pdf->AddPage(); // page break.  

    foreach ($arr as $k => $marcaje) {
    
        $i = 0;
        $subtotal = 0;
        $total = 0;
        $lastEmpleado = 0;
        
        foreach ($marcaje as $v) {
            $i++;
            
            $total += convertStringHourToMins($v['TIEMPO']);
            
            if( !$lastEmpleado ) $lastEmpleado = $v['ID_EMPLEADO'];
            if( $lastEmpleado && $lastEmpleado != $v['ID_EMPLEADO'] ) {
                
                $pdf->MultiCellSibiling( 138, $h, '');
                $pdf->MultiCellSibiling( 20, $h, convertToHoursMins($subtotal), 'B', false, 0, 'L', false, array(0,0,255));
                $pdf->MultiCellSibiling( 150, $h, '', '', true);
                
                $pdf->putLine();
                
                $lastEmpleado = $v['ID_EMPLEADO'];
                $subtotal = convertStringHourToMins($v['TIEMPO']);
                
            } else {
                $subtotal += convertStringHourToMins($v['TIEMPO']);
            }
            
            $pdf->MultiCellSibiling( 15, $h, $v['ID'], '');
            $pdf->MultiCellSibiling( 30, $h, date('d/m/Y', $v['FECHA']), '', false, 0, 'L', false, array(0,0,0));
            $pdf->MultiCellSibiling( 53, $h, $v['NOMBRE'], '', false, 0, 'L', false, array(0,0,0));
            $pdf->MultiCellSibiling( 20, $h, $v['HORA_ENTRADA'], '', false, 0, 'L', false, array(0,0,0));
            $pdf->MultiCellSibiling( 20, $h, $v['HORA_SALIDA'], '', false, 0, 'L', false, array(0,0,0));
            $pdf->MultiCellSibiling( 20, $h, $v['TIEMPO'], 'B', false, 0, 'L', false, array(0,0,0));
            $pdf->MultiCellSibiling( 150, $h, $v['INCIDENCIA'] . " - " . $v['TITULO_INCIDENCIA'], '', true, 0, 'L', false, array(0,0,0));
    
            $pdf->Ln(1);
            
            if( count($marcaje) == $i ) {
                
                $pdf->MultiCellSibiling( 138, $h, '');
                $pdf->MultiCellSibiling( 20, $h, convertToHoursMins($subtotal), 'B', true,  0, 'L', false, array(0,0,255));

                $pdf->putLine();  
                $pdf->MultiCellSibiling( 60, $h, '');
                $pdf->MultiCellSibiling( 20, $h, 'Total ', 'B', false, 0, 'L', false, array(205,95,92));
                $pdf->MultiCellSibiling( 56, $h, decodificar_string(humanizarFecha($v['FECHA'])), 'B', false, 0, 'L', false, array(205,95,92));
                $pdf->MultiCellSibiling( 20, $h, convertToHoursMins($total), 'B', true, 0, 'L', false, array(205,95,92));
                $pdf->AddPage(); // page break.
            }
        }
    }
    
    // ========================= PINTAMOS EL PDF
    
    if( isset($PDF_OUTPUT) ) {
        $pdf->Output($PDF_OUTPUT, $pdfFileName);
    } else     
        $pdf->Output();