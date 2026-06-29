<?php
	$empresa = (array_key_exists('empresa',$_POST))? $_POST["empresa"] : "";
	$alias   = (array_key_exists('alias',$_POST))? $_POST["alias"] : "";
    
    // Atacamos a BD
    $con = conectarFirebird($alias);
    $arr = array();
    $arrParametros = array( $empresa );
    
    //======================================================== SQL =================================================
    
    $ids = (array_key_exists('IDS',$_POST))? explode(',',$_POST['IDS']) : array();
    
    list($f_entrada_ini, $f_entrada_fin) = (array_key_exists('FECHA_ENTRADA',$_POST))? explode('#',$_POST['FECHA_ENTRADA']) : null;
    list($f_salida_ini, $f_salida_fin) = (array_key_exists('FECHA_SALIDA',$_POST))? explode('#',$_POST['FECHA_SALIDA']) : null;
    $cliente = (array_key_exists('ID_CLIENTE',$_POST))? $_POST['ID_CLIENTE'] : null;
    $vehiculo = (array_key_exists('ID_VEHICULO',$_POST))? $_POST['ID_VEHICULO'] : null;
    $tecnico = (array_key_exists('ID_EMPLEADO',$_POST))? $_POST['ID_EMPLEADO'] : null;
    $estado = (array_key_exists('ESTADO',$_POST))? $_POST['ESTADO'] : null;
    $idcabreparar = (array_key_exists('IDCABREPARAR',$_POST))? $_POST['IDCABREPARAR'] : 0;
    $finalizadas = (array_key_exists('FINALIZADAS',$_POST))? (($_POST['FINALIZADAS'] === 'true')? 1 : 0) : null;
    
    
    // Si hay filtro ----------------------------------------------
    $filtroSQL = "";
    if( count($ids) > 0 ) {
        $filtroSQL .= " AND H.ID_ORDEN IN( ";
        foreach( $ids as $id ) {
            $filtroSQL .= " ?, ";
            $arrParametros[] = $id;
        }
        $filtroSQL = rtrim($filtroSQL,', ');
        $filtroSQL .= " ) ";
    }
    if( $f_entrada_ini && $f_entrada_fin ) {
        $filtroSQL .= " AND (P.FECHA BETWEEN ? AND ?) ";
        $arrParametros[] = $f_entrada_ini . ' 00:00:00';
        $arrParametros[] = $f_entrada_fin . ' 23:59:59';
    }
    if( $f_salida_ini && $f_salida_fin ) {
        $filtroSQL .= " AND (P.FECHA BETWEEN ? AND ?) ";
        $arrParametros[] = $f_salida_ini . ' 00:00:00';
        $arrParametros[] = $f_salida_fin . ' 23:59:59';
    }
    if( $cliente ) {
        $filtroSQL .= " AND R.CLIENTE = ? ";
        $arrParametros[] = $cliente;
    }
    if( $tecnico ) {
        //         $filtroSQL .= " AND (SELECT COALESCE(OE.ID_EMPLEADO, 0) FROM REPAR_CAB_EMPLEADOS RCE
        //                                         LEFT JOIN OPE_EMPLEADO OE ON (OE.EMPLEADO = RCE.EMPLEADO AND OE.EMPRESA = RCE.EMPRESA)
        //                                        WHERE RCE.IDCABREPARAR = R.IDCABREPARAR AND RCE.EMPRESA = R.EMPRESA AND OE.ID_EMPLEADO = ?) > 0 ";
        $filtroSQL .= " AND OE.ID_EMPLEADO = ? ";
        $arrParametros[] = $tecnico;
    }
    if( $vehiculo ) {
        $filtroSQL .= " AND R.ID_FICHA_TECNICA = ? ";
        $arrParametros[] = $vehiculo;
    }
    if( $estado !== null ) { // puede ser 0
        $filtroSQL .= " AND R.ESTADO = ? ";
        $arrParametros[] = $estado;
    }
    if( $idcabreparar ) {
        $filtroSQL .= " AND R.IDCABREPARAR = ? ";
        $arrParametros[] = $idcabreparar;
    }
    if( $finalizadas !== null ) {
        if( $finalizadas > 0 ) {
            $filtroSQL .= " AND (R.ID_S IS NOT NULL AND R.ID_S > 0) ";
        } else {
            $filtroSQL .= " AND (R.ID_S IS NULL OR R.ID_S = 0)";
        }
    }
    
    $sql = "SELECT P.FECHA, OE.ID_EMPLEADO, OE.EMPLEADO, ET.NOMBRE_R_SOCIAL AS NOMBRE_EMPLEADO, P.TIEMPO_TOTAL, H.ID_HOJA_TRABAJO,
                                (SELECT TIEMPO FROM DAME_TIEMPO_IMPUTADO_HOJA( H.ID_HOJA_TRABAJO )) AS TIEMPO
                                    FROM OPE_EMPLEADO OE
                               LEFT JOIN SYS_TERCEROS ET ON OE.TERCERO = ET.TERCERO
                               LEFT JOIN PRO_CAB_PRESENCIA P ON P.ID_EMPLEADO = OE.ID_EMPLEADO
                               LEFT JOIN OPE_HOJAS_TRABAJO H ON ( OE.EMPRESA = H.EMPRESA AND OE.EMPLEADO = H.EMPLEADO
                                                                        AND H.FECHA_INI IS NOT NULL AND H.FECHA_FIN IS NOT NULL
                                                                        AND P.FECHA BETWEEN H.FECHA_INI AND H.FECHA_FIN )
                               LEFT JOIN REPAR_CAB_REPARACIONES R ON H.ID_ORDEN = R.IDCABREPARAR ";
    $sql .= " WHERE OE.EMPRESA = ? ";
    $sql .= $filtroSQL;
    $sql .= " ORDER BY OE.ID_EMPLEADO, P.FECHA";
    
    $rs = ibase_prepared_sentence_cloud($con, $sql, $arrParametros);
    if( $rs ){
        while( $row = ibase_fetch_assoc($rs) ){
            
            $key  = $row['ID_EMPLEADO'];
            $fkey = strtotime($row['FECHA']);
            
            // Calculamos la presencia y produccion en minutos
            
            $presencia = 0;
            if( $row['TIEMPO_TOTAL'] ) {
                list($f, $h) = explode(" ", $row['TIEMPO_TOTAL']);
                $presencia = convertStringHourToMins($h);
            }
            
            $tiempo_imputado = ($row['TIEMPO']? $row['TIEMPO'] : 0); // minutos
            
            // Rellenamos array empleado
            
            if( array_key_exists($key, $arr) ) {
                
                $arr[$key]["PRESENCIA"]    += $presencia;
                $arr[$key]["PERMANENCIA"]  += $tiempo_imputado;
                
            } else {
                $arr[$key] = array(
                    "ID_EMPLEADO" => $row['ID_EMPLEADO'],
                    "EMPLEADO" => $row['EMPLEADO'],
                    "NOMBRE_EMPLEADO" => codificar_string($row['NOMBRE_EMPLEADO']),
                    "PRESENCIA" => $presencia,
                    "PERMANENCIA" => $tiempo_imputado,
                    "FECHAS" => array()
                );
            }
            
            // Rellenamos array fechas
            
            $arr[$key]['FECHAS'][$fkey] = array(
                "FECHA" => $row['FECHA'],
                "PRESENCIA" => $presencia,
                "PERMANENCIA" => $tiempo_imputado
            );
            
            
        }
    }
    
    //========================================================  DISENNO PDF =================================================
    
    $w_cell = 40;
    $w_cell2 = 30;
    $h = 5;
    
    $pdf = new PDF();
    
    // PDF::MultiCellSibling($w, $h, $txt, $style = '', $ln = false, $border = 0, $align = 'J', $fill = false, $text_color = array(0,0,0) )
    
    $pdf->titulo_listado = "Listado de Presencia contra Reparacion";
    
    $pdf->callbackHeader = function($pdf) {
        
        // SUBHEADER

        $h = 5;
        
        $pdf->SetFont( 'Helvetica', 'B', 10 );
        
        // FECHA EMPLEADO PRESENCIA PRODUCCION DIFERENCIA
        
        $pdf->MultiCellSibling( 30, $h, 'Data', '');
        $pdf->MultiCellSibling( 40, $h, 'Empleat', '');
        $pdf->MultiCellSibling( 40, $h, 'Presencia', '', false, 0, 'R');
        $pdf->MultiCellSibling( 40, $h, 'Producció', '', false, 0, 'R');
        $pdf->MultiCellSibling( 40, $h, 'Diferencia', '', true, 0, 'R');
        $pdf->putLine();
    };
    
    
    $pdf->AddPage(); //page break.
    
    foreach( $arr as $empleado) {
        
        $i = 0;
        foreach( $empleado['FECHAS'] as $fecha) {
            
            $i++;
            
            // Calculamos la diferencia
            
            if( $fecha['PRESENCIA'] < $fecha['PERMANENCIA']) {
                $diferencia = "-".convertToHoursMins($fecha['PERMANENCIA'] - $fecha['PRESENCIA']);
            } else {
                $diferencia = convertToHoursMins($fecha['PRESENCIA'] - $fecha['PERMANENCIA']);
            }
            
            // Pintamos detalle
            
            $pdf->SetFont( 'Helvetica', 'B', 10 );
            
            $pdf->MultiCellSibling( $w_cell2, $h, date('d/m/Y',strtotime($fecha['FECHA'])));
            $pdf->MultiCellSibling( $w_cell, $h, $empleado['NOMBRE_EMPLEADO']);
            $pdf->MultiCellSibling( $w_cell, $h, convertToHoursMins($fecha['PRESENCIA']), '', false, 0, 'R');
            $pdf->MultiCellSibling( $w_cell, $h, convertToHoursMins($fecha['PERMANENCIA']), '', false, 0, 'R');
            $pdf->MultiCellSibling( 35, $h, $diferencia, '', true, 0, 'R');
            
            if( count($empleado['FECHAS']) == $i ) {
                
                $pdf->putLine();
                
                // Calculamos la diferencia
                
                if( $empleado['PRESENCIA'] < $empleado['PERMANENCIA']) {
                    $diferencia = "-".convertToHoursMins($empleado['PERMANENCIA'] - $empleado['PRESENCIA']);
                } else {
                    $diferencia = convertToHoursMins($empleado['PRESENCIA'] - $empleado['PERMANENCIA']);
                }
                
                // Pintamos total
                
                $color = array(0,0,255);
                
                $pdf->MultiCellSibling( 30, $h, '' );
                $pdf->MultiCellSibling( $w_cell, $h, $empleado['NOMBRE_EMPLEADO'], 'B', false, 0, 'R', false, $color);
                $pdf->MultiCellSibling( $w_cell, $h, convertToHoursMins($empleado['PRESENCIA']), 'B', false, 0, 'R', false, $color );
                $pdf->MultiCellSibling( $w_cell, $h, convertToHoursMins($empleado['PERMANENCIA']), 'B', false, 0, 'R', false, $color );
                $pdf->MultiCellSibling( 20, $h, '' );
                $pdf->MultiCellSibling( 18, $h, $diferencia, 'B', true, 1, 'C', false, $color );
            }
            
        }
        
        $pdf->Ln(10);
    }
    
    //========================= PINTAMOS EL PDF
    
    if( isset($PDF_OUTPUT) ) {
        $pdf->Output($PDF_OUTPUT, $pdfFileName);
    } else     
        $pdf->Output();
        