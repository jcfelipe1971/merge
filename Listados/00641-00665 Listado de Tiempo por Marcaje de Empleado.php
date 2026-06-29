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
        $filtroSQL .= " AND R.IDCABREPARAR IN( ";
        foreach( $ids as $id ) {
            $filtroSQL .= " ?, ";
            $arrParametros[] = $id;
        }
        $filtroSQL = rtrim($filtroSQL,', ');
        $filtroSQL .= " ) ";
    }
    if( $f_entrada_ini && $f_entrada_fin ) {
        $filtroSQL .= " AND (R.FECHA_ENTRADA BETWEEN ? AND ?) ";
        $arrParametros[] = $f_entrada_ini . ' 00:00:00';
        $arrParametros[] = $f_entrada_fin . ' 23:59:59';
    }
    if( $f_salida_ini && $f_salida_fin ) {
        $filtroSQL .= " AND (R.FECHA_SALIDA BETWEEN ? AND ?) ";
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
    
    $sql = "SELECT R.IDCABREPARAR, R.EMPRESA, F.MATRICULA, R.FECHA_ENTRADA, R.FECHA_SALIDA, R.CLIENTE, T.NOMBRE_R_SOCIAL AS NOMBRE_CLIENTE, RE.EMPLEADO, ET.NOMBRE_R_SOCIAL AS NOMBRE_EMPLEADO
                                    FROM REPAR_CAB_REPARACIONES R
                               LEFT JOIN REP_FICHA_TECNICA F ON R.ID_FICHA_TECNICA = F.ID_FICHA_TECNICA
                               LEFT JOIN EMP_CLIENTES E ON (R.CLIENTE = E.CLIENTE AND R.EMPRESA = E.EMPRESA)
                               LEFT JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO
                               LEFT JOIN REPAR_CAB_EMPLEADOS RE ON (R.IDCABREPARAR = RE.IDCABREPARAR)
                               LEFT JOIN OPE_EMPLEADO OE ON (OE.EMPLEADO = RE.EMPLEADO AND OE.EMPRESA = RE.EMPRESA)
                               LEFT JOIN SYS_TERCEROS ET ON OE.TERCERO = ET.TERCERO";
    $sql .= " WHERE R.EMPRESA = ? AND OE.EMPLEADO IS NOT NULL ".$filtroSQL;
    $sql .= " ORDER BY R.ESTADO, R.FECHA_ENTRADA DESC";
    
    $rs = ibase_prepared_sentence_cloud($con, $sql, $arrParametros);
    if( $rs ){
        while( $row = ibase_fetch_assoc($rs) ){
            
            $key = $row['EMPRESA'].'_'.$row['EMPLEADO'];
            $skey = $row['IDCABREPARAR'];
            
            // datos empleado
            
            if( !array_key_exists($key, $arr) ) {
                $arr[$key] = array(
                    'EMPRESA' => $row['EMPRESA'],
                    'EMPLEADO' => $row['EMPLEADO'],
                    'NOMBRE_EMPLEADO' => codificar_string($row['NOMBRE_EMPLEADO']),
                    'PERMANENCIA' => 0,
                    'REPARACIONES' => array()
                );
            }
            
            // datos reparacion
            
            $arr[$key]['REPARACIONES'][$skey] = array(
                "IDCABREPARAR" => $row['IDCABREPARAR'],
                "MATRICULA" => codificar_string($row['MATRICULA']),
                "FECHA_ENTRADA" => $row['FECHA_ENTRADA'],
                "FECHA_SALIDA" => $row['FECHA_SALIDA'],
                "CLIENTE" => $row['CLIENTE'],
                "NOMBRE_CLIENTE" => codificar_string($row['NOMBRE_CLIENTE']),
                "PERMANENCIA" => 0,
                "HOJAS_DE_TRABAJO" => array()
            );
            
            // Hacemos select de las hojas
            
            $sql = "SELECT H.ID_HOJA_TRABAJO, H.TIPOTAREA, T.TITULO AS NOMBRE_TAREA,  H.EMPRESA, H.EMPLEADO, H.FECHA_INI, H.FECHA_FIN,
                                (SELECT TIEMPO FROM DAME_TIEMPO_IMPUTADO_HOJA( H.ID_HOJA_TRABAJO )) AS TIEMPO
                                        FROM OPE_HOJAS_TRABAJO H
                                    LEFT JOIN PRO_SYS_TAREAS T ON (T.TAREA = H.TIPOTAREA AND T.EMPRESA = H.EMPRESA)
                                WHERE H.ID_ORDEN = ? AND H.EMPRESA = ? AND H.EMPLEADO = ? ";
            $rsH = ibase_prepared_sentence_cloud($con, $sql, array($skey, $empresa, $row['EMPLEADO']));
            
            if( $rsH ) {
                while( $rowH = ibase_fetch_assoc($rsH) ) {
                    
                    $tiempo_imputado = ($rowH['TIEMPO']? $rowH['TIEMPO'] : 0); // minutos
                    $arr[$key]['REPARACIONES'][$skey]['PERMANENCIA'] += $tiempo_imputado;
                    $arr[$key]['PERMANENCIA'] += $tiempo_imputado;
                    
                    // Rellenamos el array de hojas
                    
                    $arr[$key]['REPARACIONES'][$skey]['HOJAS_DE_TRABAJO'][] = array(
                        "ID_HOJA_TRABAJO" => $rowH['ID_HOJA_TRABAJO'],
                        "TIPOTAREA" => codificar_string($rowH['TIPOTAREA']),
                        "NOMBRE_TAREA" => codificar_string($rowH['NOMBRE_TAREA']),
                        "FECHA_INI" => $rowH['FECHA_INI'],
                        "FECHA_FIN" => $rowH['FECHA_FIN'],
                        "PERMANENCIA" => $tiempo_imputado
                    );
                }
            }
        }
    }
    
    //========================================================  DISENNO PDF =================================================
    
    $h = 5;
    
    $pdf = new PDF ();
    
    
    // PDF::MultiCellSibling($w, $h, $txt, $style = '', $ln = false, $border = 0, $align = 'J', $fill = false, $text_color = array(0,0,0) )
    
    $pdf->titulo_listado = "Temps marcatges fulls de treball";
    
    $pdf->callbackHeader = function($pdf) {
        
        // SUBHEADER

        $h = 5;
        
        $pdf->SetFont( 'Helvetica', 'B', 10 );
        
        // FECHA EMPLEADO PRESENCIA PRODUCCION DIFERENCIA
        
        $pdf->MultiCellSibling( 25, $h, 'Reparacio', '');
        $pdf->MultiCellSibling( 83, $h, 'Client', '');
        $pdf->MultiCellSibling( 25, $h, 'Data', '', false, 0, 'J');
        $pdf->MultiCellSibling( 16, $h, 'Inici', '', false, 0, 'J');
        $pdf->MultiCellSibling( 18, $h, 'Fi', '', false, 0, 'J');
        $pdf->MultiCellSibling( 10, $h, 'Total', '', true, 0, 'J');
        $pdf->putLine();
    };
    
    foreach ($arr as $empleado) {
        
        $pdf->AddPage(); //page break.
        
        $pdf->SetFont('Helvetica', 'B', 10);
        $pdf->MultiCellSibiling(160, $h, $empleado['NOMBRE_EMPLEADO'], 'B', false, 0, 'C', false, array(0,0,255));
        $pdf->MultiCellSibiling(20, $h, convertToHoursMins($empleado['PERMANENCIA']), 'B', true, 1, 'C', false, array(0,0,255));
        $pdf->Ln(1);
        $pdf->putLine();
        
        foreach ($empleado['REPARACIONES'] as $reparacion) {
            foreach ($reparacion['HOJAS_DE_TRABAJO'] as $hoja) { // Minimo tiene una hoja por empleado
                
                $pdf->SetFont('Helvetica', 'B', 10);
                $pdf->MultiCellSibiling( 18, $h, $reparacion['IDCABREPARAR']);
                $pdf->MultiCellSibiling( 90, $h, $reparacion['NOMBRE_CLIENTE'], '', false);
                $pdf->MultiCellSibiling( 25, $h, date('d/m/Y',strtotime($hoja['FECHA_INI'])));
                $pdf->MultiCellSibiling( 15, $h, date('H:i', strtotime($hoja['FECHA_INI'])), '');
                $pdf->MultiCellSibiling( 15, $h, date('H:i', strtotime($hoja['FECHA_FIN'])), '');
                $pdf->MultiCellSibiling(20, $h, convertToHoursMins($hoja['PERMANENCIA']), 'B', true, 0, 'C');
                $pdf->SetFont('Helvetica', 'B', 10);
            }
        }
    }
    
    //========================= PINTAMOS EL PDF
    
    if( isset($PDF_OUTPUT) ) {
        $pdf->Output($PDF_OUTPUT, $pdfFileName);
    } else     
        $pdf->Output();
    
    
    