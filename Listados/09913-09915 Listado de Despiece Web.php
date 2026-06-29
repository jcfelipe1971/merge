<?php
	$empresa = (array_key_exists('empresa',$_POST))? $_POST["empresa"] : "";
	$alias   = (array_key_exists('alias',$_POST))? $_POST["alias"] : "";
    
    // Atacamos a BD
    $con = conectarFirebird($alias);
    $arr = array();
    
    //======================================================== PARAMETROS =================================================
    
    $ids = (array_key_exists('IDS',$_POST))? explode(',',$_POST['IDS']) : array();   
    $idUsuario = $_COOKIE['id_usuario'];
    
    // Si hay filtro ----------------------------------------------
    
    $filtroSQL = "";
    if( count($ids) > 0 ) {
        $filtroSQL .= " AND C.ID_DESPIECE_CAB IN( ";
        foreach( $ids as $id ) {
            $filtroSQL .= " ?, ";
            $arrParametros[] = $id;
        }
        $filtroSQL = rtrim($filtroSQL,', ');
        $filtroSQL .= " ) ";
    }
    if( $idUsuario ) {
        $filtroSQL .= " AND C.USUARIO = ? ";
        $arrParametros[] = $idUsuario;
    }
    
    //======================================================== SQL CABECERA =================================================
    
    $sql = "SELECT C.ID_DESPIECE_CAB, C.MODELO, SM.DESCRIPCION, C.ESCANDALLO, C.MEDIDA_1, C.MEDIDA_2, C.COLOR, C.CANTIDAD, C.LONA_LAMA, L.TITULO AS TITULO_LONA,
                        C.TIPO_LONA, C.MOTOR, coalesce(C.MANIVELA,'') AS MANIVELA, coalesce(MM.TITULO,'') AS TITULO_MANIVELA, C.TIPO_MOTOR, M.TITULO AS TITULO_MOTOR, C.ESTADO, C.NOTAS, C.TOTAL_COMPONENTES, C.TOTAL_TAREAS, C.TOTAL_COSTE,
                        C.MARGEN, C.TOTAL_VENTA, C.SU_REFERENCIA, C.FECHA 
                    FROM PRO_DESPIECE_CAB C
                    LEFT JOIN ART_ARTICULOS L ON (C.EMPRESA = L.EMPRESA AND C.LONA_LAMA = L.ARTICULO)
                    LEFT JOIN ART_ARTICULOS M ON (C.EMPRESA = M.EMPRESA AND C.TIPO_MOTOR = M.ARTICULO)
                    LEFT JOIN ART_ARTICULOS MM ON (C.EMPRESA = MM.EMPRESA AND C.MANIVELA = MM.ARTICULO)
                    LEFT JOIN Z_SYS_MODELOS SM ON (C.EMPRESA = SM.EMPRESA AND C.MODELO = SM.CODIGO)	";
    $sql .= " WHERE C.ESTADO = 0 ".$filtroSQL;
    
    $rs = ibase_prepared_sentence_cloud($con, $sql, $arrParametros);
    if( $rs ){
        while( $row = ibase_fetch_assoc($rs, IBASE_TEXT) ){
            $arr[] = $row;
            
            //======================================================== SQL DETALLE =================================================
            
            $sqlD = "SELECT D.ID_DESPIECE_CAB, D.ID_DESPIECE_DET, D.FASE, D.COMPONENTE, A.TITULO AS TITULO_COMPONENTE, D.UNIDADES_ART, D.CANTIDAD, D.PRECIO, D.TOTAL,
                            D.LACADO, D.CORTE, D.FORMULA, F.NOMBRE AS TITULO_FORMULA, D.LINEA_FASE, D.TIPO_FASE,
                        D.CORTE_MEDIDA1, D.CORTE_MEDIDA2, D.CORTE_MEDIDA3, D.CORTE_MEDIDA4, D.NOTAS FROM PRO_DESPIECE_DET_COMPONENTE D
                            LEFT JOIN PRO_DESPIECE_CAB C ON (C.ID_DESPIECE_CAB = D.ID_DESPIECE_CAB)
                            LEFT JOIN ART_ARTICULOS A ON (C.EMPRESA = A.EMPRESA AND D.COMPONENTE = A.ARTICULO)
                            LEFT JOIN PRO_FORMULAS F ON (F.ID_FORMULA = D.FORMULA)
                    WHERE D.ID_DESPIECE_CAB = ? ";
            
            $rsD = ibase_prepared_sentence_cloud($con, $sqlD, array($row['ID_DESPIECE_CAB']));
            
            $arr[count($arr) -1]["DETALLE"] = array();
            if( $rsD ) {
                while( $rowD = ibase_fetch_assoc($rsD, IBASE_TEXT) ) {
                    $arr[count($arr) -1]["DETALLE"][] = $rowD;
                }
            }
        }
    }
    
    //========================================================  DISENNO PDF =================================================
    
    $h = 5;
    $w_cell = 30;
    
    $pdf = new PDF();
    $pdf->titulo_listado = "Listado de Despiece";
    
    foreach( $arr as $k => $despiece) {
		
		$pdf->callbackHeader = function($pdf) use($h, $w_cell, $despiece)  {
			
			$pdf->SetFont( 'Helvetica', 'B', 10 );
        
			/* C.ID_DESPIECE_CAB, C.MODELO, C.ESCANDALLO, C.MEDIDA_1, C.MEDIDA_2, C.COLOR, C.CANTIDAD, C.LONA_LAMA, L.TITULO AS TITULO_LONA,
			C.TIPO_LONA, C.MOTOR, C.MANIVELA, MM.TITULO AS TITULO_MANIVELA, C.TIPO_MOTOR, M.TITULO AS TITULO_MOTOR, C.ESTADO, C.NOTAS, 
			C.TOTAL_COMPONENTES, C.TOTAL_TAREAS, C.TOTAL_COSTE,
			C.TOTAL_VENTA, C.SU_REFERENCIA */
			
			// function MultiCellSibling($w, $h, $txt, $style = '', $ln = false, $border = 0, 
			// $align = 'J', $fill = false, $text_color = array(0,0,0)
			//-------------------------------------------------------------------------
			//Cabecera
			
			$pdf->MultiCellSibiling( $w_cell, $h, "MODELO ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, "DESCRIPCION ", 'B', false, 0, 'L');
			$pdf->MultiCellSibiling( $w_cell, $h, "CANTIDAD ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, "LINEA ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, "SALIDA ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, "COLOR ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, "DESPIECE ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, "REFERENCIA ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, "FECHA ", 'B', true, 0, 'C');
			
			
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['MODELO'], '', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['DESCRIPCION'], '', false, 0, 'L');
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['CANTIDAD'], '', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['MEDIDA_1'], '', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['MEDIDA_2'], '', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['COLOR'], '', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['ID_DESPIECE_CAB'], '', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['SU_REFERENCIA'], '', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, date('d/m/Y', strtotime($despiece['FECHA'])), '', true, 0, 'C');
			
			
			$pdf->MultiCellSibiling( $w_cell, $h, "LONA ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( 38, $h, "DESCRIPCION ", 'B', false, 0, 'C');
			
			if( $despiece['MOTOR'] === 1 ) {
			$pdf->MultiCellSibiling( $w_cell, $h, "MOTOR ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( 42, $h, "DESCRIPCION ", 'B', false, 0, 'L');
			} else {
			$pdf->MultiCellSibiling( $w_cell, $h, "MANIVELA ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( 55, $h, "DESCRIPCION ", 'B', false, 0, 'L');
			}
			$pdf->MultiCellSibiling( $w_cell, $h, "COSTE ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, "VENTA ", 'B', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, "MARGEN ", 'B', true, 0, 'C');	
			
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['LONA_LAMA'], '', false, 0, 'C');
			$pdf->MultiCellSibiling( 38, $h, $despiece['TITULO_LONA'], '', false, 0, 'L');
			
			if( $despiece['MOTOR'] === 1 ) {
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['TIPO_MOTOR'], '', false, 0, 'C');
			$pdf->MultiCellSibiling( 42, $h, $despiece['TITULO_MOTOR'], '', false, 0, 'L');	
			} else {		
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['MANIVELA'], '', false, 0, 'C');
			$pdf->MultiCellSibiling( 55, $h, $despiece['TITULO_MANIVELA'], '', false, 0, 'L');
			}
		
			$pdf->MultiCellSibiling( $w_cell, $h, number_format ( $despiece['TOTAL_COSTE'], 2 , "," , "." ), '', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, number_format ($despiece['TOTAL_VENTA'], 2 , "," , "." ), '', false, 0, 'C');
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['MARGEN'], '', true, 0, 'C');
			
			
			/*$pdf->MultiCellSibiling( $w_cell, $h, "ESCANDALLO: ", 'B');
			$pdf->MultiCellSibiling( $w_cell, $h, $despiece['ESCANDALLO'], 'B');
			$pdf->MultiCellSibiling( $w_cell, $h, "Estado: ".$despiece['ESTADO'], 'B');
			$pdf->MultiCellSibiling( $w_cell, $h, "Notas: ".$despiece['NOTAS'], 'B');*/
			
			//-----------------------------------------------------------------------------
			//Detalle

			$pdf->Ln( 2 );
			$pdf->putDoubleLine();
			
			$pdf->SetFont( 'Helvetica', 'B', 9 );
			
			$pdf->MultiCellSibiling( 25, $h, "COMPONENTE ", 'B', false, 0, 'L');
			$pdf->MultiCellSibiling( 65, $h, "DESCRIPCION ", 'B', false, 0, 'L');			
			$pdf->MultiCellSibiling( 13, $h, "CANT ", 'B', false, 0, 'R');
			$pdf->MultiCellSibiling( 18, $h, "T.UNIDAD ", 'B', false, 0, 'R');
			$pdf->MultiCellSibiling( 18, $h, "FORMULA ", 'B', false, 0, 'R');
			$pdf->MultiCellSibiling( 17, $h, "MEDIDA1 ", 'B', false, 0, 'R');
			$pdf->MultiCellSibiling( 17, $h, "MEDIDA2 ", 'B', false, 0, 'R');
			$pdf->MultiCellSibiling( 17, $h, "MEDIDA3 ", 'B', false, 0, 'R');
			$pdf->MultiCellSibiling( 17, $h, "LACADO ", 'B', false, 0, 'R');
			$pdf->MultiCellSibiling( 15, $h, "CORTE ", 'B', false, 0, 'R');
			$pdf->MultiCellSibiling( 20, $h, "COSTE_UN ", 'B', false, 0, 'R');
			$pdf->MultiCellSibiling( 27, $h, "COSTE_TOTAL ", 'B', false, 0, 'R');
			$pdf->MultiCellSibiling( 15, $h, "FASE ", 'B', true, 0, 'R');
		};
		
		$pdf->AddPage('L'); //page break.    
        
        foreach( $despiece['DETALLE'] as $componente ) {
            
            /* D.ID_DESPIECE_CAB, D.ID_DESPIECE_DET, D.FASE, D.COMPONENTE, A.TITULO AS TITULO_COMPONENTE, D.UNIDADES_ART, D.CANTIDAD,
               D.PRECIO, D.TOTAL, D.LACADO, D.CORTE, D.FORMULA, F.NOMBRE AS TITULO_FORMULA, D.LINEA_FASE, D.TIPO_FASE,
                        D.CORTE_MEDIDA1, D.CORTE_MEDIDA2, D.CORTE_MEDIDA3, D.CORTE_MEDIDA4, D.NOTAS */
						
			// function MultiCellSibling($w, $h, $txt, $style = '', $ln = false, $border = 0, 
			// $align = 'J', $fill = false, $text_color = array(0,0,0) 				
            
            $pdf->MultiCellSibiling( 25, $h, $componente['COMPONENTE'], '', false, 0, 'L');
			$pdf->MultiCellSibiling( 65, $h, $componente['TITULO_COMPONENTE'], '', false, 0, 'L');
			$pdf->MultiCellSibiling( 13, $h, number_format($componente['CANTIDAD'], 2 , "," , "." ), '', false, 0, 'R');
			$pdf->MultiCellSibiling( 15, $h, $componente['UNIDADES_ART'], '', false, 0, 'R');
			$pdf->MultiCellSibiling( 18, $h, $componente['FORMULA'], '', false, 0, 'R');
			//$pdf->MultiCellSibiling( 15, $h, $componente['TITULO_FORMULA']);
			$pdf->MultiCellSibiling( 17, $h, $componente['CORTE_MEDIDA1'], '', false, 0, 'R');
            $pdf->MultiCellSibiling( 17, $h, $componente['CORTE_MEDIDA2'], '', false, 0, 'R');
            $pdf->MultiCellSibiling( 17, $h, $componente['CORTE_MEDIDA3'], '', false, 0, 'R');
			$pdf->MultiCellSibiling( 17, $h, $componente['LACADO'], '', false, 0, 'R');
			
			if( $componente['CORTE'] === 1 ) {
            $pdf->MultiCellSibiling( 15, $h, 'SI', '', false, 0, 'R');
        } else { 
            $pdf->MultiCellSibiling( 15, $h, 'NO', '', false, 0, 'R');
        }
			//$pdf->MultiCellSibiling( 15, $h, $componente['CORTE'], '', false, 0, 'R');
			
			$pdf->MultiCellSibiling( 20, $h, number_format ($componente['PRECIO'], 2 , "," , "." ), '', false, 0, 'R');
			$pdf->MultiCellSibiling( 27, $h, number_format ($componente['TOTAL'], 2 , "," , "." ), '', false, 0, 'R');
		    $pdf->MultiCellSibiling( 15, $h, $componente['TIPO_FASE'], '', true, 0, 'R');            
            
			
			/*$pdf->MultiCellSibiling( $w_cell, $h, $componente['ID_DESPIECE_DET']);
			$pdf->MultiCellSibiling( $w_cell, $h, $componente['TIPO_FASE'], '', true);
            $pdf->MultiCellSibiling( $w_cell, $h, $componente['CORTE_MEDIDA4'], '', true);
            $pdf->MultiCellSibiling( $w_cell, $h, $componente['NOTAS']);*/
           
        }
        
        $pdf->putLine();
        $pdf->Ln( 5 );
		
		break; //  solo despiece
	}
    
    //========================= PINTAMOS EL PDF
    
    if( isset($PDF_OUTPUT) ) {
        $pdf->Output($PDF_OUTPUT, $pdfFileName);
    } else     
        $pdf->Output();
    