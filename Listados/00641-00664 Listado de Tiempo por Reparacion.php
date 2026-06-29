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
        $filtroSQL .= " AND (SELECT COALESCE(OE.ID_EMPLEADO, 0) FROM REPAR_CAB_EMPLEADOS RCE
                                            LEFT JOIN OPE_EMPLEADO OE ON (OE.EMPLEADO = RCE.EMPLEADO AND OE.EMPRESA = RCE.EMPRESA)
                                           WHERE RCE.IDCABREPARAR = R.IDCABREPARAR AND RCE.EMPRESA = R.EMPRESA AND OE.ID_EMPLEADO = ?) > 0 ";
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
    
    $sql = "SELECT R.IDCABREPARAR, F.MATRICULA, R.FECHA_ENTRADA, R.FECHA_SALIDA, R.CLIENTE, T.NOMBRE_R_SOCIAL AS NOMBRE_CLIENTE,
                        RS.SITUACION, RS.TITULO AS TITULO_SITUACION, RS.COLOR AS COLOR_SITUACION
                                FROM REPAR_CAB_REPARACIONES R
                           LEFT JOIN REP_FICHA_TECNICA F ON R.ID_FICHA_TECNICA = F.ID_FICHA_TECNICA
                           LEFT JOIN EMP_CLIENTES E ON (R.CLIENTE = E.CLIENTE AND R.EMPRESA = E.EMPRESA)
                           LEFT JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO
                           LEFT JOIN REPAR_SITUACIONES RS ON (R.SITUACION = RS.SITUACION)";
    $sql .= " WHERE R.EMPRESA = ? ".$filtroSQL;
    $sql .= " ORDER BY R.ESTADO, R.FECHA_ENTRADA DESC";
    
    $rs = ibase_prepared_sentence_cloud($con, $sql, $arrParametros);
    if( $rs ){
        while( $row = ibase_fetch_assoc($rs) ){
            
            $arr[$row['IDCABREPARAR']] = array(
                "IDCABREPARAR" => $row['IDCABREPARAR'],
                "MATRICULA" => codificar_string($row['MATRICULA']),
                "FECHA_ENTRADA" => $row['FECHA_ENTRADA'],
                "FECHA_SALIDA" => $row['FECHA_SALIDA'],
                "CLIENTE" => $row['CLIENTE'],
                "NOMBRE_CLIENTE" => codificar_string($row['NOMBRE_CLIENTE']),
                "PERMANENCIA" => 0,
                "SITUACION" => $row['SITUACION'],
                "TITULO_SITUACION" => codificar_string($row['TITULO_SITUACION']),
                "COLOR_SITUACION" => $row['COLOR_SITUACION'],
                "HOJAS_DE_TRABAJO" => array()
            );
            
            // Hacemos select de las hojas
            
            $sql = "SELECT H.ID_HOJA_TRABAJO, H.TIPOTAREA, T.TITULO AS NOMBRE_TAREA,  H.EMPRESA, H.EMPLEADO, ET.NOMBRE_R_SOCIAL AS NOMBRE_EMPLEADO, H.FECHA_INI, H.FECHA_FIN,
                                (SELECT TIEMPO FROM DAME_TIEMPO_IMPUTADO_HOJA( H.ID_HOJA_TRABAJO )) AS TIEMPO
                                    FROM OPE_HOJAS_TRABAJO H
                                LEFT JOIN PRO_SYS_TAREAS T ON (T.TAREA = H.TIPOTAREA AND T.EMPRESA = H.EMPRESA)
                                LEFT JOIN OPE_EMPLEADO OE ON (OE.EMPLEADO = H.EMPLEADO AND OE.EMPRESA = H.EMPRESA)
                                LEFT JOIN SYS_TERCEROS ET ON OE.TERCERO = ET.TERCERO
                            WHERE H.ID_ORDEN = ?";
            $rsH = ibase_prepared_sentence_cloud($con, $sql, array($row['IDCABREPARAR']));
            
            if( $rsH ) {
                while( $rowH = ibase_fetch_assoc($rsH) ) {
                    
                    $tiempo_imputado = ($rowH['TIEMPO']? $rowH['TIEMPO'] : 0); // minutos
                    $arr[$row['IDCABREPARAR']]['PERMANENCIA'] += $tiempo_imputado;
                    
                    // Rellenamos el array de hojas
                    
                    $arr[$row['IDCABREPARAR']]['HOJAS_DE_TRABAJO'][] = array(
                        "ID_HOJA_TRABAJO" => $rowH['ID_HOJA_TRABAJO'],
                        "TIPOTAREA" => codificar_string($rowH['TIPOTAREA']),
                        "NOMBRE_TAREA" => codificar_string($rowH['NOMBRE_TAREA']),
                        "EMPLEADO" => $rowH['EMPLEADO'],
                        "NOMBRE_EMPLEADO" => codificar_string($rowH['NOMBRE_EMPLEADO']),
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
    
    $pdf = new PDF();
    $pdf->titulo_listado = "Temps marcatges reparacions";
    
    $pdf->callbackHeader = function($pdf) {
        
        // SUBHEADER
        
        $h = 5;
        
        $pdf->SetFont( 'Helvetica', 'B', 10 );
        
        
        $pdf->MultiCellSibling( 25, $h, 'Reparació', '');
        $pdf->MultiCellSibling( 25, $h, 'Data', '', false, 0, 'L');
        $pdf->MultiCellSibling( 25, $h, 'Matrícula', '', false, 0, 'L');
        $pdf->MultiCellSibling( 80, $h, 'Client', '');
        $pdf->MultiCellSibling( 25, $h, 'Situació/Total', '', true, 0, 'L');
        $pdf->putLine();
    };
    
    $pdf->AddPage(); //page break.
    
    
    foreach( $arr as $k => $reparacion) {
        
        $pdf->SetFont( 'Helvetica', 'B', 10 );
        $pdf->MultiCellSibiling( 20, $h, $reparacion['IDCABREPARAR'], 'B');
        $pdf->MultiCellSibiling( 25, $h, date('d/m/Y', strtotime($reparacion['FECHA_ENTRADA'])),'B');
        $pdf->MultiCellSibiling( 20, $h, $reparacion['MATRICULA'],'B');
        $pdf->MultiCellSibiling( 80, $h, $reparacion['NOMBRE_CLIENTE'],'B', false, 0, 'L');
        $pdf->MultiCellSibiling( 20, $h, $reparacion['TITULO_SITUACION'], 'B', false, 1, 'C', false, hexToRGB(dechex($reparacion['COLOR_SITUACION'])));
        $pdf->MultiCellSibiling( 15, $h, convertToHoursMins($reparacion['PERMANENCIA']), 'B', true, 1, 'C', false, array(0,0,255));
        
        $pdf->Ln( 2 );
        
        $pdf->SetFont( 'Helvetica', 'B', 9 );
        
        foreach( $reparacion['HOJAS_DE_TRABAJO'] as $hoja ) {
            
            $f_ini = $hoja['FECHA_INI']? date('d/m/Y', strtotime($hoja['FECHA_INI'])) : '';
            $h_ini = $hoja['FECHA_INI']? date('H:i', strtotime($hoja['FECHA_INI'])) : '';
            $f_fin = $hoja['FECHA_FIN']? date('d/m/Y', strtotime($hoja['FECHA_FIN'])) : '';
            $h_fin = $hoja['FECHA_FIN']? date('H:i', strtotime($hoja['FECHA_FIN'])) : '';
            
            $pdf->MultiCellSibiling( 50, $h, ($hoja['NOMBRE_EMPLEADO']), 'BI');
            $pdf->MultiCellSibiling( 25, $h, $f_ini, 'I');
            $pdf->MultiCellSibiling( 25, $h, $h_ini, 'I');
            $pdf->MultiCellSibiling( 25, $h, $f_fin, 'I');
            $pdf->MultiCellSibiling( 25, $h, $h_fin, 'I');
            $pdf->MultiCellSibiling( 8, $h, '', 'I');
            $pdf->MultiCellSibiling( 25, $h, convertToHoursMins($hoja['PERMANENCIA']), 'BI', true, 0, 'C');
            $pdf->Ln( 1 );
        }
        
        $pdf->putLine();
        $pdf->Ln( 5 );
    }
    
    //========================= PINTAMOS EL PDF
    
    if( isset($PDF_OUTPUT) ) {
        $pdf->Output($PDF_OUTPUT, $pdfFileName);
    } else     
        $pdf->Output();
    