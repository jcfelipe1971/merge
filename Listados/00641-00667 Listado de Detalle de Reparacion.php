<?php
	$empresa = (array_key_exists('empresa',$_POST))? $_POST["empresa"] : "";
	$alias   = (array_key_exists('alias',$_POST))? $_POST["alias"] : "";
    
    // inicializamos el array de ESTADOS
    
    $arrEstados = array(
        0 => "Normal",
        1 => "Aceptado",
        2 => "Descartado",
        3 => "Pendiente",
        4 => "Facturable",
        5 => "Cerrado y Bloqueado"
    );
    
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
    
    $sql = "SELECT R.IDCABREPARAR, R.ID_FICHA_TECNICA, R.MARCA, R.MODELO, R.FECHA_ENTRADA, R.FECHA_AVISO, F.MATRICULA, R.FECHA_PREV_SALIDA,
			       R.FECHA_SALIDA, R.REPARACION, R.KILOMETROS_ENTRADA, R.CLIENTE AS ID_CLIENTE, T.NOMBRE_R_SOCIAL AS CLIENTE, R.TECNICO,
			       R.OBSERVACIONES_CLIENTE, R.TRABAJO_REALIZADO, R.CONTACTO_NOMBRE, R.CONTACTO_TELEFONO, R.CONTACTO_EMAIL, R.SERIE_DOC, R.SERIE,
			       S.TITULO AS SERIE_TXT, R.ESTADO, R.ESTADO_REPAR, R.ID_S, R.SITUACION, RS.TITULO AS NOMBRE_SITUACION, RS.COLOR AS COLOR_SITUACION,
                   R.TIPO, TR.TITULO AS NOMBRE_TIPO, R.PROYECTO, R.CONTACTO_DIR_NOMBRE AS DIRECCION_CONTACTO1, CONTACTO_DIR_NOMBRE_2 AS DIRECCION_CONTACTO2,
                   R.CONTACTO_LOCALIDAD AS LOCALIDAD_CONTACTO, R.HORARIO_1_DESDE, R.HORARIO_1_HASTA, R.HORARIO_2_DESDE, R.HORARIO_2_HASTA,
                   C.RIG, R.SERIE_DOC, C.TIPO AS TIPO_DOC, P.TITULO AS NOMBRE_PROYECTO, EC.ID_CUOTA, FP.TITULO AS NOMBRE_FORMA_PAGO,
                   (SELECT SUM((UNIDADES * PRECIO_VENTA) - ((UNIDADES * PRECIO_VENTA) * DESCUENTO / 100))
                        FROM REPAR_DET_REPARACIONES
                        WHERE
                        IDCABREPARAR = R.IDCABREPARAR) BRUTO,
                   (SELECT SUM(IMPORTE_IVA)
                        FROM REPAR_DET_REPARACIONES
                        WHERE
                        IDCABREPARAR = R.IDCABREPARAR) IMPORTE_IVA,
                   (SELECT SUM(LIQUIDO)
                        FROM REPAR_DET_REPARACIONES
                        WHERE
                        IDCABREPARAR = R.IDCABREPARAR) LIQUIDO
			FROM REPAR_CAB_REPARACIONES R
				LEFT JOIN REP_FICHA_TECNICA F ON R.ID_FICHA_TECNICA = F.ID_FICHA_TECNICA
				LEFT JOIN EMP_CLIENTES E ON (R.EMPRESA = E.EMPRESA AND R.CLIENTE = E.CLIENTE )
                LEFT JOIN EMP_CLIENTES_CUOTAS EC ON (R.EMPRESA = EC.EMPRESA AND R.CANAL = EC.CANAL AND R.CLIENTE = EC.CLIENTE )
                LEFT JOIN CON_CUENTAS_GES_CLI ECG ON (R.EMPRESA = ECG.EMPRESA AND R.EJERCICIO = ECG.EJERCICIO AND R.CANAL = ECG.CANAL AND R.CLIENTE = ECG.CLIENTE )
                LEFT JOIN SYS_FORMAS_PAGO FP ON (FP.FORMA = ECG.FORMA_PAGO)
				LEFT JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO
				LEFT JOIN SYS_SERIES S ON R.SERIE = S.SERIE
                LEFT JOIN REPAR_SITUACIONES RS ON RS.SITUACION = R.SITUACION
                LEFT JOIN SYS_TIPO_REPARACION TR ON R.TIPO = TR.TIPO
                LEFT JOIN GES_CABECERAS_S C ON R.ID_S = C.ID_S 
                LEFT JOIN EMP_PROYECTOS P ON (E.EMPRESA = P.EMPRESA AND R.PROYECTO = P.PROYECTO)";
    
    $sql .= "WHERE R.EMPRESA = ? ".$filtroSQL;
    $sql .= " ORDER BY R.ESTADO, R.FECHA_ENTRADA DESC";
        
    
    $rs = ibase_prepared_sentence_cloud($con, $sql, $arrParametros);
    if( $rs ){
        $i = 0;
        while( $row = ibase_fetch_assoc($rs, IBASE_TEXT) ){
            
            $notas = $row ['OBSERVACIONES_CLIENTE']? $row ['OBSERVACIONES_CLIENTE'] : "";
            $trabajo_realizado = $row ['TRABAJO_REALIZADO']? $row ['TRABAJO_REALIZADO'] : "";
            
            if (!$row['MATRICULA']) $row['MATRICULA'] = "";
            if (!$row['CLIENTE']) $row['CLIENTE'] = "";
            
            // recuperamos el tiempo imputado
            
            $tiempo_imputado = 0;
            
            $sqlH = "SELECT ID_HOJA_TRABAJO FROM OPE_HOJAS_TRABAJO H WHERE ID_ORDEN = ? ";
            $rsH = ibase_prepared_sentence_cloud($con, $sqlH, array($row['IDCABREPARAR']) );
            if( $rsH ) {
                while( $rowH = ibase_fetch_object($rsH)) {
                    $sqlT = "SELECT TIEMPO FROM DAME_TIEMPO_IMPUTADO_HOJA( ? )";
                    $rsT = ibase_prepared_sentence_cloud($con, $sqlT, array($rowH->ID_HOJA_TRABAJO) );
                    if( $rsT ) {
                        while( $rowT = ibase_fetch_object($rsT)) {
                            $tiempo_imputado += ($rowT->TIEMPO? $rowT->TIEMPO : 0); // minutos
                        }
                    }
                }
            }
            
            // Cargamos el array de datos
            
            $arr[] = array(
                "IDCABREPARAR"                 => $row['IDCABREPARAR'],
                "REPARACION"                   => (string)$row['REPARACION'], // La pasamos a string para filtros de XCODE
                "ID_FICHA_TECNICA"             => $row['ID_FICHA_TECNICA'],
                "MARCA"                        => codificar_string($row['MARCA']),
                "MODELO"                       => codificar_string($row['MODELO']),
                "MATRICULA"                    => codificar_string($row['MATRICULA']),
                "FECHA_ENTRADA"                => $row['FECHA_ENTRADA'],
                "FECHA_AVISO"                  => $row['FECHA_AVISO'],
                "FECHA_PREV_SALIDA"            => $row['FECHA_PREV_SALIDA'],
                "FECHA_SALIDA"                 => $row['FECHA_SALIDA'],
                "KILOMETROS"                   => $row['KILOMETROS_ENTRADA'],
                "ID_CLIENTE"                   => $row['ID_CLIENTE'],
                "CLIENTE"                      => codificar_string($row['CLIENTE']),
                "TELEFONO"                     => codificar_string($row['CONTACTO_TELEFONO']),
                "PERSONA_CONTACTO"             => codificar_string($row['CONTACTO_NOMBRE']),
                "EMAIL"                        => codificar_string($row['CONTACTO_EMAIL']),
                "TECNICO"                      => codificar_string($row['TECNICO']),
                "NOTAS"                        => codificar_string($notas),
                "TRABAJO_REALIZADO"            => codificar_string($trabajo_realizado),
                "EMPLEADO"                     => "",
                "EMPLEADO_NOMBRE"              => "",
                "SERIE_DOC"                    => $row['SERIE_DOC'],
                "SERIE"                        => $row['SERIE'],
                "SERIE_TXT"                    => codificar_string($row['SERIE_TXT']),
                "ESTADO"                       => $row['ESTADO'],
                "NOMBRE_ESTADO"                => array_key_exists($row['ESTADO'], $arrEstados)? codificar_string($arrEstados[$row['ESTADO']]): '',
                "FINALIZADO"                   => (( $row['ESTADO'] == 1 && $row['SITUACION'] >= 5 ) || $row['ID_S'] > 0),
                "SITUACION"                    => (($row ['SITUACION'] > 0) ? $row ['SITUACION'] : ""),
                "NOMBRE_SITUACION"             => codificar_string($row ['NOMBRE_SITUACION']),
                "COLOR_SITUACION"              => $row['COLOR_SITUACION'],
                "TIPO"                         => $row["TIPO"],
                "NOMBRE_TIPO"                  => codificar_string($row["NOMBRE_TIPO"]),
                "PROYECTO"                     => $row["PROYECTO"],
                "NOMBRE_PROYECTO"              => codificar_string($row["NOMBRE_PROYECTO"]),
                "DIRECCION_CONTACTO1"          => codificar_string($row['DIRECCION_CONTACTO1']),
                "DIRECCION_CONTACTO2"          => codificar_string($row['DIRECCION_CONTACTO2']),
                "LOCALIDAD_CONTACTO"           => $row['LOCALIDAD_CONTACTO'],
                "HORARIO_1_DESDE"              => date("H:i", strtotime($row['HORARIO_1_DESDE'])),
                "HORARIO_1_HASTA"              => date("H:i", strtotime($row['HORARIO_1_HASTA'])),
                "HORARIO_2_DESDE"              => date("H:i", strtotime($row['HORARIO_2_DESDE'])),
                "HORARIO_2_HASTA"              => date("H:i", strtotime($row['HORARIO_2_HASTA'])),
                "ID_CUOTA"                     => $row['ID_CUOTA']? $row['ID_CUOTA'] : "",
                "NOMBRE_FORMA_PAGO"            => $row['NOMBRE_FORMA_PAGO']? $row['NOMBRE_FORMA_PAGO'] : "",
                "DOCUMENTO"                    => join(' ', array($row['TIPO_DOC'], $row['SERIE_DOC'], $row['RIG'])),
                "TIEMPO"                       => convertToHoursMins($tiempo_imputado),
                "BRUTO"                        => number_format ( $row ["BRUTO"], 2,"," ,"." ) .' €',
                "IMPORTE_IVA"                  => number_format ( $row ["IMPORTE_IVA"], 2,"," ,"." ) .' €',
                "LIQUIDO"                      => number_format ( $row ["LIQUIDO"], 2,"," ,"." ) .' €',
                "DETALLE"                      => array(),
                "DATOS_FIRMA"                  => array()
            );
            
            // Sacamos los empleados de la tarea con un GROUP BY
            // por si hay empleados en mas de una tarea
            
            $sqlEmp = "SELECT O.ID_EMPLEADO, R.EMPLEADO, T.NOMBRE_R_SOCIAL AS EMPLEADO_NOMBRE FROM REPAR_CAB_EMPLEADOS R
    						LEFT JOIN OPE_EMPLEADO O ON (O.EMPLEADO = R.EMPLEADO AND O.EMPRESA = R.EMPRESA)
    						LEFT JOIN SYS_TERCEROS T ON T.TERCERO = O.TERCERO
    					WHERE R.IDCABREPARAR = ? AND R.EMPRESA = ?
                                GROUP BY O.ID_EMPLEADO, R.EMPLEADO, T.NOMBRE_R_SOCIAL";
            
            $rsEmp = ibase_prepared_sentence_cloud($con, $sqlEmp, array($row['IDCABREPARAR'], $empresa));
            if( $rsEmp ){
                while( $rowEmp = ibase_fetch_assoc($rsEmp) ){
                    $arr[$i]["EMPLEADO"] = join(",", array($arr[$i]["EMPLEADO"], $rowEmp["EMPLEADO"]));
                    $arr[$i]["EMPLEADO_NOMBRE"] = join(",", array($arr[$i]["EMPLEADO_NOMBRE"], codificar_string($rowEmp["EMPLEADO_NOMBRE"])));
                }
                $arr[$i]["EMPLEADO"] = ltrim($arr[$i]["EMPLEADO"], ",");
                $arr[$i]["EMPLEADO_NOMBRE"] = ltrim($arr[$i]["EMPLEADO_NOMBRE"], ",");
            }
            
            // Sacamos el detalle de la reparacion
            
            $sql = "SELECT R.LINEA, R.IDCABREPARAR, R.ARTICULO, R.TITULO_ART, R.UNIDADES, R.PRECIO, R.PRECIO_VENTA, R.DESCUENTO, R.IMPORTE_IVA, R.TOTAL FROM REPAR_DET_REPARACIONES R ";
            $sql .= "WHERE R.EMPRESA = ? AND R.IDCABREPARAR = ? ";
            $sql .= "ORDER BY R.LINEA";
            
            $rsD = ibase_prepared_sentence_cloud ( $con, $sql, array( $empresa, $row['IDCABREPARAR']) );
            if ($rsD) {
                while ( $rowD = ibase_fetch_assoc ( $rsD ) ) {
                    
                    if (! $rowD ['ARTICULO'])
                        $rowD ['ARTICULO'] = "";
                    if (! $rowD ['TITULO_ART'])
                        $rowD ['TITULO_ART'] = "";
                        
                   $arr[$i]['DETALLE'][] = array (
                       "LINEA" => $rowD ["LINEA"],
                       "IDCABREPARAR" => $rowD ["IDCABREPARAR"],
                       "ID_A" => codificar_string ( $rowD ["ARTICULO"] ),
                       "ARTICULO" => codificar_string ( $rowD ["TITULO_ART"] ),
                       "UNIDADES" => $rowD ["UNIDADES"],
                       "PRECIO" => number_format ( $rowD ["PRECIO"], 2,"," ,"." ),
                       "PRECIO_VENTA" => number_format ( $rowD ["PRECIO_VENTA"], 2,"," ,"." ),
                       "DESCUENTO" => round ( $rowD ["DESCUENTO"], 2, PHP_ROUND_HALF_UP ),
                       "IVA" => number_format ( $rowD ["IMPORTE_IVA"], 2,"," ,"." ),
                       "TOTAL" => number_format ( $rowD ["TOTAL"], 2,"," ,"." )
                    );
                }
            }
            
            // Sacamos los dtos de la firma
            
            $sqlF = "select first 1 NOMBRE, NIF, COMENTARIO, FIRMA, FORMATO from ges_firmas where id_doc = ? and tipo = ? ";
            
            $rsF = ibase_prepared_sentence_cloud($con, $sqlF, array($row['IDCABREPARAR'], 'REP'));
            if( $rsF ) {
                while( $row = ibase_fetch_object($rsF, IBASE_TEXT)) {
                    
                    $firma = "";
                    if($row->FIRMA) {
                        $firma = $row->FIRMA;
                    }
                    
                    $arr[$i]['DATOS_FIRMA'] = array(
                        "NOMBRE" => codificar_string($row->NOMBRE),
                        "NIF" => codificar_string($row->NIF),
                        "COMENTARIO" => codificar_string($row->COMENTARIO),
                        "FORMATO" => $row->FORMATO,
                        "FIRMA" => $firma
                    );
                }
            }
            
            $i++;
        }
    }
    
    //========================================================  DISENNO PDF =================================================
    
    $w_minimal      = 5;
    $w_label        = 20;
    $w_label_large  = 40;
    $w_cell_medium  = 50;
    $w_cell_large   = 80;
    $h              = 5;
    $h_image        = 30;
    
    $pdf = new PDF();
    $pdf->titulo_listado = "Detalle reparaciones";

    $pdf->AddPage(); //page break.
    
    $n = 0;
    foreach( $arr as $k => $reparacion) {
        
        $pdf->SetFont( 'Helvetica', 'B', 10 );
        $pdf->SetFillColor(220, 220, 220);
        
        $f_entrada = $reparacion['FECHA_ENTRADA'] ? date('d/m/Y', strtotime($reparacion['FECHA_ENTRADA'])) : "";
        $f_aviso   = $reparacion['FECHA_AVISO'] ? date('d/m/Y', strtotime($reparacion['FECHA_AVISO'])) : "";
        
        $averia = "  ";
        $mantenimiento = "  ";
        $instalacion = "  ";
        
        switch( $reparacion['TIPO']) {
            case 1:
                $averia = "X";
                $mantenimiento = "  ";
                $instalacion = "  ";
                break;
            case 2:
                $averia = "  ";
                $mantenimiento = "X";
                $instalacion = "  ";
                break;
            case 3:
                $averia = "  ";
                $mantenimiento = "  ";
                $instalacion = "X";
                break;
        }
        
        $img_firma = "";
        $nombre_firma = "";
        $dni_firma = "";
        
        if( count($reparacion['DATOS_FIRMA']) > 0 ) {
            
            $nombre_firma = $reparacion['DATOS_FIRMA']['NOMBRE'];
            $dni_firma = $reparacion['DATOS_FIRMA']['NIF'];
            
            if( $reparacion['DATOS_FIRMA']['FORMATO'] == 'PNG' ) {
                $reparacion['DATOS_FIRMA']['FIRMA'] = imagePngToJpg($reparacion['DATOS_FIRMA']['FIRMA']);
                $reparacion['DATOS_FIRMA']['FORMATO'] = 'JPG';
            }
            
            if( $reparacion['DATOS_FIRMA']['FORMATO'] == 'JPG' ) {
                $img_firma = tempnam(sys_get_temp_dir(), 'create_jpg');
                file_put_contents($img_firma, $reparacion['DATOS_FIRMA']['FIRMA']);
            }
            
        }
        
        // ===================================================================================================================
        //                                          DATOS DEL CLIENTE
        // ===================================================================================================================
        
        $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH, $h, "Datos Cliente", 'B', true, 0, 'C', true);
        $pdf->Ln();
        
        $pdf->MultiCellSibiling( $w_label, $h, "Cliente: ");
        $pdf->MultiCellSibiling( $w_cell_large, $h, $reparacion['CLIENTE']);
        $pdf->MultiCellSibiling( $w_cell_large, $h, "Contrato Mantenimiento: " . $reparacion['ID_CUOTA'], '', true);
        
        $pdf->MultiCellSibiling( $w_label, $h, "");
        $pdf->MultiCellSibiling( $w_cell_large, $h, $reparacion['DIRECCION_CONTACTO1'], '', true);
        $pdf->MultiCellSibiling( $w_label, $h, "");
        $pdf->MultiCellSibiling( $w_cell_large, $h, $reparacion['LOCALIDAD_CONTACTO'], '', true);
        $pdf->MultiCellSibiling( $w_label, $h, "");
        $pdf->MultiCellSibiling( $w_cell_large, $h, "Forma de pago: " . $reparacion['NOMBRE_FORMA_PAGO'],'', true);
        
        $pdf->Ln();
        
        // ===================================================================================================================
        //                                          DATOS DE LA REPARACION
        // ===================================================================================================================

        $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH, $h, "Datos de la Reparación", 'B', true, 0, 'C', true);
        $pdf->Ln();
        
        $pdf->MultiCellSibiling( $w_label_large, $h, "Marca:");
        $pdf->MultiCellSibiling( $w_cell_medium, $h, $reparacion['MARCA']);
        $pdf->MultiCellSibiling( $w_label_large, $h, "Nombre Proyecto: ");
        $pdf->MultiCellSibiling( $w_cell_medium, $h, $reparacion['NOMBRE_PROYECTO'], '', true);
        $pdf->MultiCellSibiling( $w_label_large, $h, "Modelo:");
        $pdf->MultiCellSibiling( $w_cell_medium, $h, $reparacion['MODELO']);
        $pdf->MultiCellSibiling( $w_label_large, $h, "Proyecto:");
        $pdf->MultiCellSibiling( $w_cell_medium, $h, $reparacion['PROYECTO'], '', true);
        $pdf->MultiCellSibiling( $w_label_large, $h, "Técnico:");
        $pdf->MultiCellSibiling( $w_cell_medium, $h, $reparacion['EMPLEADO_NOMBRE']);
        $pdf->MultiCellSibiling( $w_label_large, $h, "CP Población:");
        $pdf->MultiCellSibiling( $w_cell_medium, $h, $reparacion['LOCALIDAD_CONTACTO'], '', true);
        $pdf->MultiCellSibiling( $w_label_large, $h, "Serie Doc.:");
        $pdf->MultiCellSibiling( $w_cell_medium, $h, $reparacion['SERIE_DOC']);
        $pdf->MultiCellSibiling( $w_label_large, $h, "Kms: ");
        $pdf->MultiCellSibiling( $w_cell_medium, $h, $reparacion['KILOMETROS'], '', true);
        $pdf->MultiCellSibiling( $w_label_large, $h, "Fecha Aviso:");
        $pdf->MultiCellSibiling( $w_cell_medium, $h, $f_aviso, '', true);
        $pdf->MultiCellSibiling( $w_label_large, $h, "Fecha intervención:");
        $pdf->MultiCellSibiling( $w_cell_medium, $h, $f_entrada, '', true);
        
        $pdf->Ln();
        
        $pdf->MultiCellSibiling( $w_label_large, $h, "Observacones cliente:", '', true);
        $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH, $h, $reparacion['NOTAS'], '', true, 1);
        
        $pdf->Ln();     
        
        $pdf->MultiCellSibiling( $w_label_large, $h, "Tipo reparación:");
        $pdf->MultiCellSibiling( $w_label_large, $h, "AVERÍA", '', false, 0, 'R');
        $pdf->MultiCellSibiling( $w_minimal, $h, $averia, 'B', false, 1);
        $pdf->MultiCellSibiling( $w_label_large, $h, "MANTENIMIENTO", '', false, 0, 'R');
        $pdf->MultiCellSibiling( $w_minimal, $h, $mantenimiento, 'B', false, 1);
        $pdf->MultiCellSibiling( $w_label_large, $h, "INSTALACIÓN", '', false, 0, 'R');
        $pdf->MultiCellSibiling( $w_minimal, $h, $instalacion, 'B', true, 1);
        
        $pdf->Ln();
        
        $pdf->MultiCellSibiling( $w_label_large, $h, "Trabajo Realizado", '', true);
        $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH, $h, $reparacion['TRABAJO_REALIZADO'], '', true, 1);
        
        $pdf->Ln();  
        
        
        // ===================================================================================================================
        //                                          DETALLE
        // ===================================================================================================================
        
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 16.6 / 100), $h, "UNIDADES", 'B', false, 0, '', true);
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 16.6 / 100), $h, "REFERÉNCIA", 'B', false, 0, '', true);
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 22 / 100), $h, "DESCRIPCIÓN", 'B', false, 0, '', true);
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 16.6 / 100), $h, "IMPORTE", 'B', false, 0, 'R', true);
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 12 / 100), $h, "DTO.", 'B', false, 0, 'R', true);
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 16.6 / 100), $h, "TOTAL", 'B', true, 0, 'R', true);
        
        foreach( $reparacion["DETALLE"] as $detalle ) {
            
            $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 16.6 / 100), $h, $detalle["UNIDADES"]);
            $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 16.6 / 100), $h, $detalle["ID_A"]);
            $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 22 / 100), $h, $detalle["ARTICULO"]);
            $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 16.6 / 100), $h, $detalle["PRECIO_VENTA"], '', false, 0, 'R');
            $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 12 / 100), $h, $detalle["DESCUENTO"]." %", '', false, 0, 'R');
            $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 16.6 / 100), $h, $detalle["TOTAL"], '', true, 0, 'R');
        }
        
        $pdf->Ln();
        
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 0.49), $h, "");
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 0.5 * 0.36), $h, "BASE IMPONIBLE", '', false, 1, 'C');
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 0.5 * 0.33), $h, "IVA", '', false, 1, 'C');
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 0.5 * 0.33), $h, "TOTAL", '', true, 1, 'C');
        
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 0.49), $h, "");
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 0.5 * 0.36), $h, $reparacion['BRUTO'], '', false, 1, 'C');
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 0.5 * 0.33), $h, $reparacion['IMPORTE_IVA'], '', false, 1, 'C');
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 0.5 * 0.33), $h, $reparacion['LIQUIDO'], '', true, 1, 'C');
        
        $pdf->Ln();
        
        // ===================================================================================================================
        //                                          FIRMA - TOTAL
        // =================================================================================================================== 
        
        $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH, $h, "CONFORME CLIENTE", '', true);
        
        if( $img_firma ) {
            
            list($w_img) = getimagesize($img_firma);
            if( $w_img > $pdf->LINE_BREAK_WIDTH ) {
                $w_img = $pdf->LINE_BREAK_WIDTH;
            }
            
            $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH, $h_image, $pdf->Image($img_firma, $pdf->GetX(), $pdf->GetY(), $w_img, $h_image, 'JPG', '', true), '', true, 1, 'C');
        } else {
            $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH, $h, "", '', true, 1);
        }
        
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 0.5), $h, "NOMBRE CLIENTE: " . $nombre_firma, '', false, 1);
        $pdf->MultiCellSibiling( ($pdf->LINE_BREAK_WIDTH * 0.5), $h, "DNI: " . $dni_firma, '', true, 1);
        
        
        $n++;
        
        if( $n != count($arr) ) {
            $pdf->AddPage(); //page break.
        }
    }
    
    //========================= PINTAMOS EL PDF

    if( isset($PDF_OUTPUT) ) {
        $pdf->Output($PDF_OUTPUT, $pdfFileName);
    } else     
        $pdf->Output();
    