<?php
	$empresa = (array_key_exists('empresa',$_POST))? $_POST["empresa"] : "";
	$alias   = (array_key_exists('alias',$_POST))? $_POST["alias"] : "";
    
    // Atacamos a BD
    $con = conectarFirebird($alias);

    $arrMaquinas = array();
    
    //======================================================== SQL =================================================
    
    $seccion = (array_key_exists('seccion',$_POST))? $_POST["seccion"] : "";
    
    // datos de las maquinas de la seccion
    
    $sql = "SELECT M.ID_MAQUINA, M.CODMAQ, M.TIPO, M.DESCRIPCION, M.CODIDE, M.OBSERVACION
                FROM PRO_MAQUINAS_C M 
             WHERE M.EMPRESA = ? AND M.SECCION = ? AND VIRTUAL = 0 
                 ORDER BY M.CODIDE, M.CODMAQ ASC";
    
    $rs = ibase_prepared_sentence_cloud($con, $sql, array($empresa, $seccion));
    if($rs) {
        $n = 0;
        while( $row = ibase_fetch_assoc($rs, IBASE_TEXT) ) {
            
            $arrMaquinas[] = $row;
            
            // Inicializamos detalles
            
            $arrMaquinas[$n]["COLA"] = array(); 
            $arrMaquinas[$n]["EN_REPARACION"] = false;
            $arrMaquinas[$n]["FECHA_DETECCION_REPARACION"] = ""; 
            $arrMaquinas[$n]["DESCRIPCION_REPARACION"] = ""; 
            $arrMaquinas[$n]["OBSERVACIONES_REPARACION"] = ""; 
         
            // sql cola de la maquina
            
            $sql = "select hoj.ID_ORDEN, o.RIG_OF, t.IDENTIFICADOR, t.TAREA, o.compuesto AS COMPUESTO, a.titulo AS TITULO_COMPUESTO, hoj.FECHA_INI, hoj.FINALIZADO, hoj.TIPORECURSO AS RECURSO, t.PRODUCIENDO,
                        (select first 1 ohtp1.inicio from ope_hojas_trabajo_pausas ohtp1 where ohtp1.id_hoja_trabajo = hoj.id_hoja_trabajo order by id_pausa_trabajo desc) AS INICIO,
                        (select first 1 ohtp2.final from ope_hojas_trabajo_pausas ohtp2 where ohtp2.id_hoja_trabajo = hoj.id_hoja_trabajo order by id_pausa_trabajo desc) AS FINAL 
                     from ope_hojas_trabajo hoj 
                         join pro_ord o on (hoj.id_orden = o.id_orden) 
                         join pro_ord_tarea t on (o.empresa = t.empresa and o.ejercicio = t.ejercicio and o.canal = t.canal and o.rig_of = t.rig_of
                                                                    and hoj.id_orden = t.id_orden and hoj.linea_fase = t.linea_fase and hoj.linea_tarea = t.linea_tarea)
                         left join art_articulos a on (o.empresa = a.empresa and o.compuesto = a.articulo) 
                         left join pro_maquinas_c m on ( hoj.empresa = m.empresa and hoj.maquina = m.codmaq )
                     where hoj.EMPRESA = ?  
                     AND o.situacion IN (2, 3) 
                     AND hoj.SECCION = ? 
                     AND m.VIRTUAL = 0  AND hoj.TIPORECURSO = 'HM' 
                     AND hoj.maquina = ?
                        order by HOJ.FINALIZADO ASC, T.PRODUCIENDO DESC, t.ORDEN_COLA_MAQUINA ASC ";
            $rsC = ibase_prepared_sentence_cloud($con, $sql, array($empresa, $seccion, $row['CODMAQ']));
            
            $c = 0;
            while( $rowC = ibase_fetch_assoc($rsC) ) {
                $arrMaquinas[$n]['COLA'][] = $rowC; 
                
                // recupermaos estado de la hoja
                
                $estado_hoja = "SIN ASIGNAR";
                if( $rowC['FINALIZADO'] ) {
                    $estado_hoja = "FINALIZADA";
                } else {
                    if( (!$rowC['FECHA_INI'] && $rowC['RECURSO'] == 'HM' &&  $rowC['PRODUCIENDO']) || (!$rowC['FECHA_INI'] && $rowC['RECURSO'] == 'MO') ) {
                        $estado_hoja = "SIN INICIAR";
                    } elseif ( $rowC['INICIO'] && !$rowC['FINAL'] ) {
                        $estado_hoja = "PAUSADA";
                    } elseif ( $rowC['PRODUCIENDO'] && ((!$rowC['INICIO'] && !$rowC['FINAL']) || ($rowC['INICIO'] && $rowC['FINAL'])) ) {
                        $estado_hoja = "INICIADA";
                    }
                }
                
                $arrMaquinas[$n]['COLA'][$c]['ESTADO'] = $estado_hoja; 
                $c++;
            }                      
            
            // sql maquina en reparacion
            
            $sql = "select first 1 FECHA_DETECCION, DESCRIPCION, COMENTARIO from PRO_MAQUINAS_REPARACIONES 
                        WHERE EMPRESA = ? AND CODMAQ = ? AND REPARACION_FINALIZADA = 0
                      ORDER BY FECHA_DETECCION DESC ";
            $rsR = ibase_prepared_sentence_cloud($con, $sql, array($empresa, $row['CODMAQ']));
            while( $rowR = ibase_fetch_assoc($rsR) ) {
                $arrMaquinas[$n]['EN_REPARACION'] = true; 
                $arrMaquinas[$n]['FECHA_DETECCION_REPARACION'] = $rowR['FECHA_DETECCION']? date("d/m/Y H:i:s", strtotime($rowR['FECHA_DETECCION'])) : "";
                $arrMaquinas[$n]['DESCRIPCION_REPARACION'] = $rowR['DESCRIPCION']; 
                $arrMaquinas[$n]['OBSERVACIONES_REPARACION'] = $rowR['COMENTARIO'];
            }                      
            
            // contador 
            $n++;
        }
    }
    
    //======================================================== PDF =================================================
    
    $pdf = new PDF();
    
    $h              = 5;
    $wt             = $pdf->LINE_BREAK_WIDTH;
    $w              = 30;
    
    // Detalle
    
    $pdf->SetFont( 'Helvetica', 'B', 9 );
    $pdf->AddPage(); //page break.
    
    $w = 30;
    
    foreach( $arrMaquinas as $row ) {
    
        $pdf->MultiCellSibiling( $w, $h, $row['CODMAQ'], 'B', false);
        $pdf->MultiCellSibiling( $wt, $h, $row['DESCRIPCION'], 'B', true);
        
        $pdf->putLine();
        
        if( $row['EN_REPARACION'] ) {
            $pdf->setFillColor(230, 60, 23); // red
            
            $pdf->MultiCellSibiling( $w * 2, $h, $row['FECHA_DETECCION_REPARACION'], 'BI', false, 0, '', true, array(255,255,255));
            $pdf->MultiCellSibiling( $wt - ($w * 2), $h, $row['DESCRIPCION_REPARACION'], 'I', true, 0, '', true, array(255,255,255));
            $pdf->MultiCellSibiling( $wt, $h, $row['OBSERVACIONES_REPARACION'], 'I', true, 0, '', true, array(255,255,255));
            
            $pdf->setFillColor(255, 255, 255); // white
            $pdf->Ln();
        }
        
        if( $row['OBSERVACION'] ) {
            $pdf->MultiCellSibiling( $wt, $h, $row['OBSERVACION'], 'I', true, 1);
            $pdf->Ln();
        }
        
        foreach( $row['COLA'] as $cola ) {
            
            $r = 0;
            $g = 0;
            $b = 0;
            
            switch( $cola['ESTADO'] ) {
                case 'SIN ASIGNAR': // azul
                    $r = 1;
                    $g = 104;
                    $b = 218;
                break;
                case 'SIN INICIAR': // gris
                    $r = 166;
                    $g = 166;
                    $b = 166;
                break;
                case 'INICIADA': // verde
                    $r = 18;
                    $g = 188;
                    $b = 95;
                break;
                case 'PAUSADA': // rojo
                    $r = 230;
                    $g = 60;
                    $b = 23;
                break;
                case 'FINALIZADA': // morado
                    $r = 128;
                    $g = 31;
                    $b = 178;
                break;
            }
            
            $pdf->setFillColor($r, $g, $b);
            
            $pdf->MultiCellSibiling( $w, $h, $cola['ESTADO'], '', false, 0, '', true, array(255,255,255));
            $pdf->MultiCellSibiling( $w, $h, $cola['ID_ORDEN']);
            $pdf->MultiCellSibiling( $w, $h, $cola['RIG_OF']);
            $pdf->MultiCellSibiling( $w, $h, $cola['IDENTIFICADOR']);
            $pdf->MultiCellSibiling( $w * 2, $h, $cola['TAREA'], '', true);
            $pdf->MultiCellSibiling( $w, $h, '');
            $pdf->MultiCellSibiling( $w, $h, $cola['COMPUESTO']);
            $pdf->MultiCellSibiling( $wt, $h, $cola['TITULO_COMPUESTO'], '', true);  
        }
        
        $pdf->putLine();
        $pdf->Ln();
    }
    
    

    //========================= PINTAMOS EL PDF

    if( isset($PDF_OUTPUT) ) {
        $pdf->Output($PDF_OUTPUT, $pdfFileName);
    } else     
        $pdf->Output();


    