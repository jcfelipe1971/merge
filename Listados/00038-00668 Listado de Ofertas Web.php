<?php
    $empresa = (array_key_exists('empresa',$_POST))? $_POST["empresa"] : "";
    $alias   = (array_key_exists('alias',$_POST))? $_POST["alias"] : "";
    
    // Atacamos a BD
    $con = conectarFirebird($alias);
    
    $tipo = "OFC";
    
    $arrEmpresa = array();
    $arrCab = array();
    $arrDet = array();
    
    //======================================================== SQL =================================================
    
    $id = (array_key_exists('ID',$_POST))? $_POST["ID"] : 0;
    
    // datos de la empresa
    
    $sql = "SELECT T.NIF, T.EMAIL, T.WEB, T.TELEFONO01, T.TELEFONO02, T.NOMBRE_R_SOCIAL, D.DIR_NOMBRE, D.DIR_NUMERO, L.CODIGO_POSTAL AS CP, L.TITULO AS LOCALIDAD,
                    P.TITULO AS PROVINCIA, I.IMAGEN, I.FORMATO FROM SYS_EMPRESAS E 
                LEFT JOIN SYS_TERCEROS T ON (E.TERCERO = T.TERCERO)
                LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON (T.TERCERO = D.TERCERO AND D.DIR_DEFECTO = 1)
                LEFT JOIN SYS_LOCALIDADES L ON (D.ID_LOCAL = L.ID_LOCAL)
                LEFT JOIN SYS_PROVINCIAS P ON (L.PROVINCIA = P.PROVINCIA AND L.PAIS = P.PAIS)
                LEFT JOIN SYS_IMAGENES I ON (I.CODIGO = E.E_IMAGEN) 
                    WHERE E.EMPRESA = ?";
        
    $rs = ibase_prepared_sentence_cloud($con, $sql, array($empresa));
    if($rs) {
        while( $row = ibase_fetch_assoc($rs, IBASE_TEXT) ) {
            
            $arrEmpresa = $row;
            
            $logo_empresa = $row['IMAGEN'];
            $formato_imagen = $row['FORMATO'];
            
            if( $logo_empresa ) {
                
                // Si la imagen es BMP la tenemos que tratar
                
                if( $formato_imagen == 'BMP' ) {
                    
                    $tmp = tempnam(sys_get_temp_dir(), 'create_bmp');
                    file_put_contents($tmp, $logo_empresa);
                    $img = imagecreatefrombmp_custom ($tmp);
                    
                    $tmp_png = tempnam(sys_get_temp_dir(), 'new_png');
                    imagepng($img, $tmp_png);
                    $logo_empresa = file_get_contents($tmp_png);
                    
                    $formato_imagen = 'png';
                }
                
                // Solo acepta PNG, JPG, GIF
                
                $logo_empresa = 'data://text/plain;base64,' . base64_encode($logo_empresa);
            }
            
            $arrEmpresa["LOGO"] = $logo_empresa;
			$arrEmpresa["FORMATO"] = $formato_imagen;
        }
    }

    // datos de cabecera
    
    $sql = " SELECT
        CAB.ID_S AS ID_S,
        CAB.TERCERO TERCERO,
        CAB.CLIENTE AS CLIENTE,
        CAB.SU_REFERENCIA AS REFERENCIA,
        CAB.EJERCICIO,
        CAB.CANAL,
        CAB.Z_OBSERVACION,
        DIR.DIR_COMPLETA_N AS DIRECCION,
        LOC.CODIGO_POSTAL AS CP,
        LOC.TITULO AS LOCALIDAD,
        PRO.TITULO AS PROVINCIA,
        CAB.FECHA AS FECHA,
        DIR.DIR_TELEFONO01 AS TELEFONO01,
        DIR.DIR_TELEFONO02 AS TELEFONO02,
        DIR.DIR_TELEFAX AS TELEFAX,
        TER.NIF AS NIF,
        TER.EMAIL AS EMAIL,
        TER.WEB AS WEB,
        CAB.ALMACEN AS ALMACEN,
        CAB.MONEDA AS MONEDA,
        TER.NOMBRE_R_SOCIAL AS NOMBRE_R_SOCIAL,
        CAB.FORMA_PAGO AS FORMA_PAGO,
        CAB.TARIFA AS TARIFA,
        CAB.RIG AS RIG,
        CAB.SERIE AS SERIE,
        CAB.LIQUIDO AS LIQUIDO,
        CAB.S_CUOTA_IVA AS S_CUOTA_IVA,
        CAB.S_CUOTA_RE AS S_CUOTA_RE,
        CAB.DTO_PP AS DTO_PP,
        CAB.DTO_CIAL AS DTO_CIAL,
        CAB.I_DTO_CIAL AS I_DTO_CIAL,
        CAB.I_DTO_PP AS I_DTO_PP,
        CAB.S_BASES AS S_BASES,
        CAB.B_DTO_LINEAS,
        CAB.NOTAS,
        CAB.FORMA_PAGO,
        CAB.PROYECTO,
        P.TITULO AS TITULO_PROYECTO,
        PDIR.DIR_COMPLETA_N AS DIRECCION_PROYECTO,
        PLOC.TITULO AS LOCALIDAD_PROYECTO,
        ATER.NOMBRE_R_SOCIAL AS NOMBRE_AGENTE,
        OFC.PRESUPUESTO
        FROM GES_CABECERAS_S CAB
        LEFT JOIN GES_CABECERAS_S_OFC OFC ON (CAB.ID_S = OFC.ID_S AND CAB.TIPO = OFC.TIPO)
        JOIN SYS_TERCEROS TER ON( CAB.TERCERO = TER.TERCERO )
        JOIN SYS_TERCEROS_DIRECCIONES DIR ON( CAB.TERCERO = DIR.TERCERO AND CAB.DIRECCION = DIR.DIRECCION)
        JOIN SYS_LOCALIDADES LOC ON DIR.ID_LOCAL=LOC.ID_LOCAL
        JOIN SYS_PROVINCIAS PRO ON LOC.PROVINCIA=PRO.PROVINCIA AND LOC.PAIS=PRO.PAIS
        LEFT JOIN EMP_PROYECTOS P ON (CAB.EMPRESA = P.EMPRESA AND CAB.PROYECTO = P.PROYECTO) 
        LEFT JOIN SYS_TERCEROS_DIRECCIONES PDIR ON( P.TERCERO_NULL = PDIR.TERCERO AND P.DIRECCION_TERCERO_NULL = PDIR.DIRECCION)
        LEFT JOIN SYS_LOCALIDADES PLOC ON PDIR.ID_LOCAL=LOC.ID_LOCAL
        JOIN EMP_AGENTES A ON( CAB.EMPRESA = A.EMPRESA AND CAB.AGENTE = A.AGENTE)
        JOIN SYS_TERCEROS ATER ON( A.TERCERO = ATER.TERCERO )
        WHERE CAB.ID_S = ? ";
    
    $rs = ibase_prepared_sentence_cloud($con, $sql, array($id));
    if($rs) {
        while( $row = ibase_fetch_assoc($rs, IBASE_TEXT) ) {
            $arrCab = $row;
            
            // datos cabecera sin cliente
            
            if( $arrCab['CLIENTE'] < 1 ) {
            
                $sqlNIF = "SELECT NOMBRE,NIF,DIRECCION,C_POSTAL,PROVINCIA,PAIS,LOCALIDAD,TELEFONO01,EMAIL,NOTAS,COLONIA
                    FROM GES_CABECERAS_S_FAC_NIF WHERE
                    EMPRESA = ? AND EJERCICIO = ? AND CANAL = ? AND SERIE = ? AND TIPO = ? AND RIG = ? ";
                
                $rsNIF = ibase_prepared_sentence_cloud($con, $sqlNIF, array($empresa,  $arrCab['EJERCICIO'],  $arrCab['CANAL'], $arrCab['SERIE'], $tipo, $arrCab['RIG']));
                if($rsNIF) {
                    while( $rowNIF = ibase_fetch_assoc($rsNIF, IBASE_TEXT) ) {
                        
                        $arrCab['NOMBRE_R_SOCIAL'] = $rowNIF['NOMBRE'];
                        $arrCab['DIRECCION'] = $rowNIF['DIRECCION'];
                        $arrCab['CP'] = $rowNIF['C_POSTAL'];
                        $arrCab['LOCALIDAD'] = $rowNIF['LOCALIDAD'];
                        $arrCab['PROVINCIA'] = $rowNIF['PROVINCIA'];
                        $arrCab['TELEFONO01'] = $rowNIF['TELEFONO01'];
                        $arrCab['EMAIL'] = $rowNIF['EMAIL'];
                        $arrCab['NIF'] = $rowNIF['NIF'];
                    }
                }
            }
            
            // datos de detalle
            
            $sqlD = " select D.ARTICULO, D.TITULO, D.UNIDADES, D.PRECIO, D.DESCUENTO, D.I_DESCUENTO, D.B_IMPONIBLE, D.B_DTO_LINEA,
            D.I_COMISION, D.M_BRUTO, D.P_IVA, D.C_IVA, D.NOTAS, D.LIQUIDO, D.ID_DETALLES_S, D.ID_S, A.NOTAS_VENTAS, i.imagen IMAGEN_ART, I.FORMATO
            from GES_DETALLES_S D
            join ART_ARTICULOS A on (D.EMPRESA = A.EMPRESA and D.ARTICULO = A.ARTICULO)
            join sys_imagenes i on (a.imagen = i.codigo)
            where TIPO = ? and ID_S = ?";

            $rsD = ibase_prepared_sentence_cloud($con, $sqlD, array($tipo, $id));
            if($rsD) {
                while( $rowD = ibase_fetch_assoc($rsD, IBASE_TEXT) ) {

                $img = $rowD['IMAGEN_ART'];
                $formato_imagen = $rowD['FORMATO'];
                
                if( $img ) {
                    
                    // Si la imagen es BMP la tenemos que tratar
                    
                    if( $formato_imagen == 'BMP' ) {
                        
                        $tmp = tempnam(sys_get_temp_dir(), 'create_bmp');
                        file_put_contents($tmp, $img);
                        $img = imagecreatefrombmp_custom ($tmp);
                        
                        $tmp_png = tempnam(sys_get_temp_dir(), 'new_png');
                        imagepng($img, $tmp_png);
                        $img = file_get_contents($tmp_png);
                        
                        $formato_imagen = 'png';
                    }
                    
                    // Solo acepta PNG, JPG, GIF
                    
                    $img = 'data://text/plain;base64,' . base64_encode($img);

                    $rowD['IMAGEN_ART'] = $img;
                    $rowD['FORMATO'] = $formato_imagen;
                }

                    $arrDet[] = $rowD;
                }

            }
        }
    }
    
    //======================================================== PDF =================================================

    $h              = 5;
    
    $pdf = new PDF();
    
    // Cabecera
    
    $pdf->printHeader = false;
    $pdf->callbackHeader = function($pdf) use($h, $arrEmpresa, $arrCab) {
        
        $pdf->SetFont( 'Arial', '', 8 );
        
        $hh = 3;
        //Alto y ancho de imagen logo de empresa
        $image_heigth = 7;
        $image_width = 31;
        $wh = 55;
        $wbk = 10;
        $whai = $image_width + $wh + $wbk;
        
        // header
        
        $pdf->Image($arrEmpresa['LOGO'], $pdf->GetX(), $pdf->GetY(), $image_width, $image_heigth, $arrEmpresa['FORMATO']);
        
        $pdf->MultiCellSibiling( $wbk, $hh, "");
        $pdf->MultiCellSibiling( $wh, $hh, "Cerramientos comerciales integrales", '', false, 0, 'L');
        $pdf->MultiCellSibiling( $wh, $hh, $arrEmpresa['NOMBRE_R_SOCIAL'], 'B');
        $pdf->MultiCellSibiling( $wbk, $hh, "");
        $pdf->MultiCellSibiling( $wh, $hh, "T ".$arrEmpresa['TELEFONO01'], 'B', true);
        
        $pdf->MultiCellSibiling( $whai, $hh, "");
        $pdf->MultiCellSibiling( $wh, $hh, $arrEmpresa['NIF']);
        $pdf->MultiCellSibiling( $wbk, $hh, "");
        $pdf->MultiCellSibiling( $wh, $hh, "T ".$arrEmpresa['TELEFONO02'], '', true);
        
        $pdf->MultiCellSibiling( $whai, $hh, "");
        $pdf->MultiCellSibiling( $wh, $hh, $arrEmpresa['DIR_NOMBRE'].' '.$arrEmpresa['DIR_NUMERO']);
        $pdf->MultiCellSibiling( $wbk, $hh, "");
        $pdf->MultiCellSibiling( $wh, $hh, $arrEmpresa['WEB'], '', true);
        
        $pdf->MultiCellSibiling( $whai, $hh, "");
        $pdf->MultiCellSibiling( $wh, $hh, $arrEmpresa['CP'].' '.$arrEmpresa['LOCALIDAD']);
        $pdf->MultiCellSibiling( $wbk, $hh, "");
        $pdf->MultiCellSibiling( $wh, $hh, $arrEmpresa['EMAIL'], '', true);
        
        $pdf->MultiCellSibiling( $whai, $hh, "");
        $pdf->MultiCellSibiling( $wh, $hh, $arrEmpresa['PROVINCIA'], '', true);
        
        $pdf->putLine();
        
        // subheader

        $pdf->SetFont( 'Arial', '', 9 );
        $wh = $pdf->LINE_BREAK_WIDTH / 3;
        $whl = $wh * 2;
        
        $pdf->MultiCellSibiling( $whl, $h, "Presupuesto N?: ".$arrCab['RIG']."/".$arrCab['EJERCICIO']."/".$arrCab['SERIE'], 'B');
        $pdf->MultiCellSibiling( $wh, $h, $arrCab['NOMBRE_R_SOCIAL'], 'B', true);
        
        $fecha  = $arrCab['FECHA']? date("d/m/Y", strtotime($arrCab['FECHA'])) : "";
        
        $pdf->MultiCellSibiling( $whl / 2, $h, "Fecha: ".$fecha, 'B');
        $pdf->MultiCellSibiling( $whl / 2, $h, "Proyecto: ".$arrCab['PROYECTO'], 'B');
        $pdf->MultiCellSibiling( $wh, $h, $arrCab['DIRECCION'], '', true);
        
        $pdf->MultiCellSibiling( $whl, $h, "Nombre: ".$arrCab['TITULO_PROYECTO']);
        $pdf->MultiCellSibiling( $wh, $h, $arrCab['CP'].' '.$arrCab['LOCALIDAD'], '', true);
        
        $pdf->MultiCellSibiling( $whl, $h, "Dirección".$arrCab['DIRECCION_PROYECTO']);
        $pdf->MultiCellSibiling( $wh, $h, $arrCab['PROVINCIA'], '', true);
        
        $pdf->MultiCellSibiling( $whl, $h, "Localidad: ".$arrCab['LOCALIDAD_PROYECTO']);
        $pdf->MultiCellSibiling( $wh, $h, "TEL: ".$arrCab['TELEFONO01'], '', true);
        
        $pdf->MultiCellSibiling( $whl, $h, "Comercial: ".$arrCab['NOMBRE_AGENTE'], 'B');
        $pdf->MultiCellSibiling( $wh, $h, "E-mail: ".$arrCab['EMAIL'], '', true);
        
        $pdf->MultiCellSibiling( $whl, $h, "Observación".$arrCab['Z_OBSERVACION'], 'B');
        $pdf->MultiCellSibiling( $wh / 2, $h, "NIF: ".$arrCab['NIF']);
        $pdf->MultiCellSibiling( $wh / 2, $h, "Cliente: ".$arrCab['CLIENTE'], '', true);
        
        $pdf->Ln();
        
        $pdf->SetFillColor(200, 200, 200);
        
        $wc = $pdf->LINE_BREAK_WIDTH / 8;
        $hc = 6;
        
        $pdf->MultiCellSibiling( $wc, $hc, "Referencia", 'B', false, 1, 'L', true);
        $pdf->MultiCellSibiling( $wc * 3, $hc, "Descripción", 'B', false, 1, 'L', true);
        $pdf->MultiCellSibiling( $wc, $hc, "Importe", 'B', false, 1, 'C', true);
        $pdf->MultiCellSibiling( $wc, $hc, "Cantidad", 'B', false, 1, 'C', true);
        $pdf->MultiCellSibiling( $wc, $hc, "Descuento", 'B', false, 1, 'C', true);
        $pdf->MultiCellSibiling( $wc, $hc, "Importe Total", 'B', true, 1, 'C', true);
    };
    
    // Pie
    
    $pdf->customFooterHeight = 80;
    $pdf->callbackFooter = function($pdf) use($h, $arrCab) {
        $w_label        = 30;
        $w_big_label    = 50;
        //$w_new_label = $w_label + $w_big_label;
        
        $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH * 0.6, $h, "");
        $pdf->MultiCellSibiling( $w_big_label, $h, "SUBTOTAL PRESUPUESTO", 'B', false, 0, 'R');
        $pdf->MultiCellSibiling( $w_label, $h, number_format ( $arrCab['B_DTO_LINEAS'], 2,",", "." ).' EUR', 'B', true, 0, 'R');


        if ($arrCab['I_DTO_CIAL'] != 0)
        {
            $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH * 0.6, $h, "");
            $pdf->MultiCellSibiling( $w_big_label, $h, "DESCUENTO", 'B', true, 0, 'R');
            $pdf->MultiCellSibiling( $w_label, $h, number_format ( $arrCab['I_DTO_CIAL'], 2,",", "." ).' %', 'B', true, 0, 'R');
        }

        $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH * 0.6, $h, "");
        $pdf->MultiCellSibiling( $w_big_label, $h, "TOTAL PRESUPUESTO", 'B', false, 0, 'R');
        $pdf->MultiCellSibiling( $w_label, $h, number_format ( $arrCab['S_BASES'], 2,",", "." ).' EUR', 'B', true, 1, 'R');
       // $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH * 0.6, $h, "");
       // $pdf->MultiCellSibiling( $w_new_label, $h, '                 ', 'U', true);


        $pdf->Ln();
        $pdf->putLine();
        
        $pdf->MultiCellSibiling( $w_big_label, $h, "NOTAS:", 'B', true);
        $pdf->MultiCellSibiling( $w_big_label, $h, $arrCab['NOTAS'], '', true);
        
        $pdf->Ln();
        
        $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH, $h, "CONFORME CLIENTE", 'B', true, 0, 'R');
        $pdf->MultiCellSibiling( $pdf->LINE_BREAK_WIDTH, $h, "Firma y sello", 'B', true, 0, 'R');
        
        $pdf->Ln(20);
        
    };
    
    // Detalle
    
    $pdf->SetFont( 'Arial', 'B', 8 );
    $pdf->AddPage(); //page break.
    
    $wc = $pdf->LINE_BREAK_WIDTH / 8;
    //Alto y ancho de la imagen del articulo para cada linea
    $image_width = 7;
    $image_heigth =7;
    
    foreach( $arrDet as $row ) {
        
        // ARTICULO, TITULO, UNIDADES, PRECIO, DESCUENTO, LIQUIDO
    
        $pdf->MultiCellSibiling( $wc, $h, $row['ARTICULO'], '', false, 0, 'L');
        $pdf->MultiCellSibiling( $wc * 3, $h, $row['TITULO']);
        
        if( $arrCab['PRESUPUESTO'] ) {
            $pdf->MultiCellSibiling( $wc, $h, number_format ( $row['PRECIO'], 2,",", "." ).' EUR', '', false, 0, 'R');
        } else {
            $pdf->MultiCellSibiling( $wc, $h, '', '', false, 0, 'R');
        }
        
        $pdf->MultiCellSibiling( $wc, $h, $row['UNIDADES'], '', false, 0, 'R');
        
        if( $arrCab['PRESUPUESTO'] ) {
            $pdf->MultiCellSibiling( $wc, $h, number_format ( $row['DESCUENTO'], 0,",", "." ).' %', '', false, 0, 'R');
            $pdf->MultiCellSibiling( $wc, $h, number_format ( $row['B_DTO_LINEA'], 2,",", "." ).' EUR', '', true, 0, 'R');
        } else {
            $pdf->MultiCellSibiling( $wc, $h, '', '', false, 0, 'R');
            $pdf->MultiCellSibiling( $wc, $h, '', '', true, 0, 'R');
        }
		//IMAGEN ARTICULO
		if($row['IMAGEN_ART'] ){

			$pdf->Image($row['IMAGEN_ART'], $pdf->GetX(), $pdf->GetY(), $image_width , $image_heigth, $row['FORMATO']);
            $pdf->Ln(7);
        }
		
        // NOTAS DETALLE DOC
        
        if( $row['NOTAS'] ) {
            $pdf->MultiCellSibiling( $wc, $h, "");
            $pdf->MultiCellSibiling( $wc * 6, $h, $row['NOTAS'], 'B', true);
         }

        // NOTAS VENTAS ART
        
        if( $row['NOTAS_VENTAS'] ) {
            $pdf->MultiCellSibiling( $wc, $h, "");
            $pdf->MultiCellSibiling( $wc * 6, $h, $row['NOTAS_VENTAS'], 'B', true);
        }
    }
    
    $pdf->Ln(30);

    //========================= PINTAMOS EL PDF

    if( isset($PDF_OUTPUT) ) {
        $pdf->Output($PDF_OUTPUT, $pdfFileName);
    } else     
        $pdf->Output();


    