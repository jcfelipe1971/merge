object DMVerificacionesImpuestos: TDMVerificacionesImpuestos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 374
  Top = 113
  Height = 561
  Width = 419
  object xClientesIntra: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select c.empresa, cc.ejercicio, cc.canal, c.cliente, t.nombre_r_' +
        'social, c.intra, cc.modo_iva, p.pais, p.pertenece_cee, d.dir_com' +
        'pleta_n, l.titulo, p.titulo from emp_clientes c'
      'join con_cuentas_ges_cli cc'
      'on c.empresa=cc.empresa and c.cliente=cc.cliente'
      'join sys_terceros t'
      'on c.tercero=t.tercero'
      'join sys_terceros_direcciones d'
      'on t.tercero=d.tercero and d.dir_defecto=1'
      'join sys_localidades l'
      'on d.id_local=l.id_local'
      'join sys_paises p'
      'on l.pais=p.pais'
      'where'
      'c.empresa=?empresa and'
      'cc.ejercicio=?ejercicio and'
      'cc.canal=?canal and'
      '((c.intra = 0 and cc.modo_iva = 3) or'
      '(c.intra = 1 and cc.modo_iva <> 3) or'
      '(p.pertenece_cee=0 and cc.modo_iva = 3) or'
      '(p.pertenece_cee=1 and p.pais<>'#39'ESP'#39' and cc.modo_iva <> 3) or'
      '(p.pertenece_cee=0 and c.intra = 1) or'
      '(p.pertenece_cee=1 and p.pais<>'#39'ESP'#39' and c.intra = 0) or'
      '(c.intra = 0 and p.pertenece_cee = 1 and p.pais<>'#39'ESP'#39' ) or'
      '(c.intra = 1 and p.pertenece_cee = 0) or'
      '(p.pais='#39'ZZZ'#39'))')
    UniDirectional = False
    Left = 56
    Top = 8
    object xClientesIntraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xClientesIntraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xClientesIntraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xClientesIntraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xClientesIntraNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xClientesIntraINTRA: TIntegerField
      DisplayLabel = 'Intra'
      FieldName = 'INTRA'
    end
    object xClientesIntraMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object xClientesIntraPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xClientesIntraPERTENECE_CEE: TIntegerField
      DisplayLabel = 'C.E.E.'
      FieldName = 'PERTENECE_CEE'
    end
    object xClientesIntraDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object xClientesIntraTITULO: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TITULO'
      Size = 40
    end
    object xClientesIntraTITULO1: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'TITULO1'
      Size = 60
    end
  end
  object xProveedoresIntra: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select pp.empresa, cp.ejercicio, cp.canal, pp.proveedor, t.nombr' +
        'e_r_social, pp.intra, cp.modo_iva, p.pais, p.pertenece_cee, d.di' +
        'r_completa_n, l.titulo, p.titulo from emp_proveedores pp'
      'join con_cuentas_ges_pro cp'
      'on pp.empresa=cp.empresa and pp.proveedor=cp.proveedor'
      'join sys_terceros t'
      'on pp.tercero=t.tercero'
      'join sys_terceros_direcciones d'
      'on t.tercero=d.tercero and d.dir_defecto=1'
      'join sys_localidades l'
      'on d.id_local=l.id_local'
      'join sys_paises p'
      'on l.pais=p.pais'
      'where'
      'pp.empresa=?empresa and'
      'cp.ejercicio=?ejercicio and'
      'cp.canal=?canal and'
      '((pp.intra = 0 and cp.modo_iva = 3) or'
      '(pp.intra = 1 and cp.modo_iva <> 3) or'
      '(p.pertenece_cee=0 and cp.modo_iva = 3) or'
      '(p.pertenece_cee=1 and p.pais<>'#39'ESP'#39' and cp.modo_iva <> 3) or'
      '(p.pertenece_cee=0 and pp.intra = 1) or'
      '(p.pertenece_cee=1 and p.pais<>'#39'ESP'#39' and pp.intra = 0) or'
      '(pp.intra = 0 and p.pertenece_cee = 1 and p.pais<>'#39'ESP'#39' ) or'
      '(pp.intra = 1 and p.pertenece_cee = 0) or'
      '(p.pais='#39'ZZZ'#39'))')
    UniDirectional = False
    Left = 56
    Top = 56
    object xProveedoresIntraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProveedoresIntraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xProveedoresIntraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xProveedoresIntraPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xProveedoresIntraNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xProveedoresIntraINTRA: TIntegerField
      DisplayLabel = 'Intra'
      FieldName = 'INTRA'
    end
    object xProveedoresIntraMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object xProveedoresIntraPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xProveedoresIntraPERTENECE_CEE: TIntegerField
      DisplayLabel = 'C.E.E'
      FieldName = 'PERTENECE_CEE'
    end
    object xProveedoresIntraDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object xProveedoresIntraTITULO: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TITULO'
      Size = 40
    end
    object xProveedoresIntraTITULO1: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'TITULO1'
      Size = 60
    end
  end
  object DSxClientesIntra: TDataSource
    DataSet = xClientesIntra
    Left = 152
    Top = 8
  end
  object DSxProveedoresIntra: TDataSource
    DataSet = xProveedoresIntra
    Left = 152
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 288
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 360
    Top = 8
  end
  object xFAPModoIncorrecto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select c.empresa,c.ejercicio,c.canal,c.serie,c.tipo,c.rig,cf.pro' +
        'veedor,t.nombre_r_social,i.rig_visible,i.modo,cp.modo_iva,i.s_ba' +
        'ses,i.s_ivas,c.fecha from ges_cabeceras_e c'
      'join ges_cabeceras_e_fac cf'
      'on c.id_e = cf.id_e'
      'join emp_registro_iva i'
      
        'on cf.empresa=i.empresa and cf.ejercicio=i.ejercicio and cf.cana' +
        'l=i.canal and cf.ris=i.registro'
      'join emp_proveedores p'
      'on cf.empresa=p.empresa and cf.proveedor=p.proveedor'
      'join con_cuentas_ges_pro cp'
      
        'on cf.empresa=cp.empresa and cf.ejercicio=cp.ejercicio and cf.ca' +
        'nal=cp.canal and cf.proveedor=cp.proveedor'
      'join sys_terceros t'
      'on p.tercero=t.tercero'
      'where'
      'c.empresa=?empresa and'
      'c.ejercicio=?ejercicio and'
      'c.canal=?canal and'
      'i.signo='#39'S'#39' and'
      'i.modo<>cp.modo_iva')
    UniDirectional = False
    Left = 56
    Top = 152
    object xFAPModoIncorrectoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFAPModoIncorrectoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFAPModoIncorrectoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFAPModoIncorrectoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xFAPModoIncorrectoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xFAPModoIncorrectoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xFAPModoIncorrectoPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xFAPModoIncorrectoNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xFAPModoIncorrectoRIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIG_VISIBLE'
    end
    object xFAPModoIncorrectoMODO: TIntegerField
      DisplayLabel = 'Modo Reg.'
      FieldName = 'MODO'
    end
    object xFAPModoIncorrectoMODO_IVA: TIntegerField
      DisplayLabel = 'Modo Prov.'
      FieldName = 'MODO_IVA'
    end
    object xFAPModoIncorrectoS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xFAPModoIncorrectoS_IVAS: TFloatField
      DisplayLabel = 'S. IVAs'
      FieldName = 'S_IVAS'
    end
    object xFAPModoIncorrectoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxFAPModoIncorrecto: TDataSource
    DataSet = xFAPModoIncorrecto
    Left = 152
    Top = 152
  end
  object xFCRModoIncorrecto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select c.empresa,c.ejercicio,c.canal,c.serie,c.tipo,c.rig,cf.acr' +
        'eedor,t.nombre_r_social,i.rig_visible,i.modo,cp.modo_iva,i.s_bas' +
        'es,i.s_ivas,c.fecha from ges_cabeceras_e c'
      'join ges_cabeceras_e_fcr cf'
      'on c.id_e = cf.id_e'
      'join emp_registro_iva i'
      
        'on cf.empresa=i.empresa and cf.ejercicio=i.ejercicio and cf.cana' +
        'l=i.canal and cf.ris=i.registro'
      'join emp_acreedores p'
      'on cf.empresa=p.empresa and cf.acreedor=p.acreedor'
      'join con_cuentas_ges_acr cp'
      
        'on cf.empresa=cp.empresa and cf.ejercicio=cp.ejercicio and cf.ca' +
        'nal=cp.canal and cf.acreedor=cp.acreedor'
      'join sys_terceros t'
      'on p.tercero=t.tercero'
      'where'
      'c.empresa=?empresa and'
      'c.ejercicio=?ejercicio and'
      'c.canal=?canal and'
      'i.signo='#39'S'#39' and'
      'i.modo<>cp.modo_iva')
    UniDirectional = False
    Left = 56
    Top = 200
    object xFCRModoIncorrectoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFCRModoIncorrectoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFCRModoIncorrectoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFCRModoIncorrectoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xFCRModoIncorrectoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xFCRModoIncorrectoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xFCRModoIncorrectoACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object xFCRModoIncorrectoNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xFCRModoIncorrectoRIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIG_VISIBLE'
    end
    object xFCRModoIncorrectoMODO: TIntegerField
      DisplayLabel = 'Modo Reg.'
      FieldName = 'MODO'
    end
    object xFCRModoIncorrectoMODO_IVA: TIntegerField
      DisplayLabel = 'Modo Acr.'
      FieldName = 'MODO_IVA'
    end
    object xFCRModoIncorrectoS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xFCRModoIncorrectoS_IVAS: TFloatField
      DisplayLabel = 'S. IVAs'
      FieldName = 'S_IVAS'
    end
    object xFCRModoIncorrectoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxFCRModoIndorrecto: TDataSource
    DataSet = xFCRModoIncorrecto
    Left = 152
    Top = 200
  end
  object xFACModoIncorrecto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select c.empresa,c.ejercicio,c.canal,c.serie,c.tipo,c.rig,c.clie' +
        'nte,t.nombre_r_social,i.rig_visible,i.modo,cp.modo_iva,i.s_bases' +
        ',i.s_ivas,c.fecha from ges_cabeceras_s c'
      'join ges_cabeceras_s_fac cf'
      'on c.id_s = cf.id_s'
      'join emp_registro_iva i'
      
        'on cf.empresa=i.empresa and cf.ejercicio=i.ejercicio and cf.cana' +
        'l=i.canal and i.signo='#39'R'#39' and cf.rir=i.registro'
      'join emp_clientes p'
      'on c.empresa=p.empresa and c.cliente=p.cliente'
      'join con_cuentas_ges_cli cp'
      
        'on c.empresa=cp.empresa and c.ejercicio=cp.ejercicio and c.canal' +
        '=cp.canal and c.cliente=cp.cliente'
      'join sys_terceros t'
      'on p.tercero=t.tercero'
      'where'
      'c.empresa=?empresa and'
      'c.ejercicio=?ejercicio and'
      'c.canal=?canal and'
      'i.modo<>cp.modo_iva and'
      'cf.autofactura=0')
    UniDirectional = False
    Left = 56
    Top = 248
    object xFACModoIncorrectoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFACModoIncorrectoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFACModoIncorrectoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFACModoIncorrectoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xFACModoIncorrectoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xFACModoIncorrectoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xFACModoIncorrectoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xFACModoIncorrectoNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xFACModoIncorrectoRIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIG_VISIBLE'
    end
    object xFACModoIncorrectoMODO: TIntegerField
      DisplayLabel = 'Modo Reg.'
      FieldName = 'MODO'
    end
    object xFACModoIncorrectoMODO_IVA: TIntegerField
      DisplayLabel = 'Modo Cli.'
      FieldName = 'MODO_IVA'
    end
    object xFACModoIncorrectoS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xFACModoIncorrectoS_IVAS: TFloatField
      DisplayLabel = 'S. IVAs'
      FieldName = 'S_IVAS'
    end
    object xFACModoIncorrectoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxFACModoIncorrecto: TDataSource
    DataSet = xFACModoIncorrecto
    Left = 152
    Top = 248
  end
  object xMod349Pais: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT cast('#39'S'#39' as varchar(1)) as signo, rig_visible,tipo_doc,do' +
        'c_serie,doc_numero,doc_fecha,fecha_registro,b_imponible,i_iva,pa' +
        'is'
      'FROM CREA_LISTADO_IVA (?EMPRESA, ?EJERCICIO, ?CANAL, '
      #39'S'#39',?DFECHA,?HFECHA,1,999999,0)'
      'where PERTENECE_CEE=1 and pais<>'#39'ESP'#39' and pais<>'#39'CHE'#39
      ''
      'union'
      ''
      
        'SELECT cast('#39'R'#39' as varchar(1)) as signo, rig_visible,tipo_doc,do' +
        'c_serie,doc_numero,doc_fecha,fecha_registro,b_imponible,i_iva,pa' +
        'is'
      'FROM CREA_LISTADO_IVA (?EMPRESA, ?EJERCICIO, ?CANAL,'
      #39'R'#39',?DFECHA,?HFECHA, 1,999999,0)'
      'where PERTENECE_CEE=1 and pais<>'#39'ESP'#39' and pais<>'#39'CHE'#39)
    UniDirectional = False
    AfterScroll = xMod349AfterScroll
    Left = 56
    Top = 296
    object xMod349PaisSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xMod349PaisRIG_VISIBLE: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'RIG_VISIBLE'
    end
    object xMod349PaisTIPO_DOC: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_DOC'
      Size = 3
    end
    object xMod349PaisDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xMod349PaisDOC_NUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'DOC_NUMERO'
    end
    object xMod349PaisDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'DOC_FECHA'
    end
    object xMod349PaisFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fecha Reg.'
      FieldName = 'FECHA_REGISTRO'
    end
    object xMod349PaisB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xMod349PaisI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object xMod349PaisPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object DSxMod349Pais: TDataSource
    DataSet = xMod349Pais
    Left = 152
    Top = 296
  end
  object xMod349Modo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT cast('#39'S'#39' as varchar(1)) as signo, rig_visible,tipo_doc,do' +
        'c_serie,doc_numero,doc_fecha,fecha_registro,b_imponible,i_iva,pa' +
        'is'
      'FROM CREA_LISTADO_IVA (?EMPRESA, ?EJERCICIO, ?CANAL,'
      #39'S'#39',?DFECHA,?HFECHA,1,999999,0)'
      
        'where modo=3 or (modo=1 and tipo_iva in (6,7,8,14,17)) and doc_s' +
        'erie <> '#39'CI'#39
      ''
      'union'
      ''
      
        'SELECT cast('#39'R'#39' as varchar(1)) as signo, rig_visible,tipo_doc,do' +
        'c_serie,doc_numero,doc_fecha,fecha_registro,b_imponible,i_iva,pa' +
        'is'
      'FROM CREA_LISTADO_IVA (?EMPRESA, ?EJERCICIO, ?CANAL,'
      #39'R'#39',?DFECHA,?HFECHA,1,999999,0)'
      'where modo=3 and doc_serie <> '#39'CI'#39)
    UniDirectional = False
    AfterScroll = xMod349AfterScroll
    Left = 56
    Top = 344
    object xMod349ModoSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xMod349ModoRIG_VISIBLE: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'RIG_VISIBLE'
    end
    object xMod349ModoTIPO_DOC: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_DOC'
      Size = 3
    end
    object xMod349ModoDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xMod349ModoDOC_NUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'DOC_NUMERO'
    end
    object xMod349ModoDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'DOC_FECHA'
    end
    object xMod349ModoFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fecha Reg.'
      FieldName = 'FECHA_REGISTRO'
    end
    object xMod349ModoB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xMod349ModoI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object xMod349ModoPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object DSxMod349Modo: TDataSource
    DataSet = xMod349Modo
    Left = 152
    Top = 344
  end
  object xMod349: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select i.signo,i.rig_visible,cast('#39'FAP'#39' as varchar(3)) tipo_doc,' +
        'fac.serie doc_serie,fac.rig doc_numero,cab.fecha doc_fecha, i.fe' +
        'cha_registro,sum(det.s_bases_dto_canal) b_imponible,p.pais'
      'from ges_cabeceras_e_redondeos det'
      'join ges_cabeceras_e_fac fac'
      'on (det.id_e = fac.id_e)'
      'join ges_cabeceras_e cab'
      'on (fac.id_e = cab.id_e)'
      'join emp_proveedores pro'
      'on ((fac.empresa   = pro.empresa  )and'
      '(fac.proveedor = pro.proveedor))'
      'join sys_paises p on (p.pais_c2 = pro.pais_c2)'
      'join emp_registro_iva i'
      
        'on fac.empresa=i.empresa and fac.ejercicio=i.ejercicio and fac.c' +
        'anal=i.canal and i.signo='#39'S'#39' and fac.ris=i.registro'
      'where ((cab.empresa=?empresa) and (cab.canal=?canal) and'
      
        '(fac.fecha_con>=?dfecha) and (fac.fecha_con<=?hfecha) and (cab.t' +
        'ipo='#39'FAP'#39') and'
      '((cab.estado=5) or (cab.estado=6)) and (pro.intra = 1) and'
      '(p.pertenece_cee = 1) and (pro.pais_c2 <>'#39'ES'#39') and'
      '(i.signo='#39'S'#39') and (i.modo=3))'
      
        'group by i.signo,i.rig_visible,fac.serie,fac.rig,cab.fecha, i.fe' +
        'cha_registro,i.doc_fecha,p.pais'
      ''
      'union'
      ''
      
        'select i.signo,i.rig_visible,cast('#39'FCR'#39' as varchar(3)) tipo_doc,' +
        'fac.serie doc_serie,fac.rig doc_numero,cab.fecha doc_fecha, i.fe' +
        'cha_registro,sum(det.s_bases_dto_canal) b_imponible,p.pais'
      'from ges_cabeceras_e_redondeos det'
      'join ges_cabeceras_e_fcr fac'
      'on (det.id_e = fac.id_e)'
      'join ges_cabeceras_e cab'
      'on (fac.id_e = cab.id_e)'
      'join emp_acreedores acr'
      'on ((fac.empresa   = acr.empresa  )and'
      '(fac.acreedor = acr.acreedor))'
      'join sys_terceros t '
      'on acr.tercero=t.tercero'
      'join sys_terceros_direcciones d'
      'on t.tercero=d.tercero'
      'join sys_localidades l'
      'on d.id_local=l.id_local'
      'join sys_paises p on (p.pais = l.pais)'
      'join emp_registro_iva i'
      
        'on fac.empresa=i.empresa and fac.ejercicio=i.ejercicio and fac.c' +
        'anal=i.canal and i.signo='#39'S'#39' and fac.ris=i.registro'
      'where ((cab.empresa=?empresa) and (cab.canal=?canal) and '
      
        '(fac.fecha_con>=?dfecha) and (fac.fecha_con<=?hfecha) and (cab.t' +
        'ipo='#39'FCR'#39') and'
      '((cab.estado=5) or (cab.estado=6)) and /*(pro.intra = 1) and*/'
      
        '(p.pertenece_cee = 1) and (p.pais_c2 <>'#39'ES'#39') and (p.pais_c2 <>'#39'C' +
        'H'#39') and (d.dir_defecto=1) and'
      '(i.signo='#39'S'#39') and (i.modo=3))'
      
        'group by i.signo,i.rig_visible,fac.serie,fac.rig,cab.fecha, i.fe' +
        'cha_registro,i.doc_fecha,p.pais'
      ''
      'union'
      ''
      
        'select i.signo,i.rig_visible,cast('#39'AFP'#39' as varchar(3)) tipo_doc,' +
        'ccai.doc_serie doc_serie, ccai.doc_numero, cca.fecha doc_fecha, ' +
        'i.fecha_registro,ccai.base_imponible b_imponible,p.pais'
      'from con_cuentas_asientos_iva ccai'
      'join'
      'con_cuentas_asientos cca'
      'on( ccai.empresa   = cca.empresa   and'
      'ccai.ejercicio = cca.ejercicio and'
      'ccai.canal     = cca.canal     and'
      'ccai.ric       = cca.ric )'
      'join'
      'emp_proveedores ep'
      'on(ccai.tercero = ep.tercero)'
      'join'
      'sys_paises p'
      'on (p.pais_c2 = ep.pais_c2)'
      'join emp_registro_iva i'
      
        'on ccai.empresa=i.empresa and ccai.ejercicio=i.ejercicio and cca' +
        'i.canal=i.canal and i.signo='#39'S'#39' and ccai.registro=i.registro'
      'where ((ccai.empresa=?empresa) and (ccai.canal=?canal) and'
      
        '(cca.ejercicio = ?ejercicio)and(cca.fecha>=?dfecha) and (cca.fec' +
        'ha<=?hfecha) and'
      
        '(cca.tipo='#39'AFP'#39') and(ep.intra = 1) and(p.pertenece_cee = 1) and ' +
        '(ep.pais_c2 <>'#39'ES'#39'))'
      ''
      'union'
      ''
      
        'select min(i.signo) signo,min(i.rig_visible) rig_visible,min(cas' +
        't('#39'FAC'#39' as varchar(3))) tipo_doc,cab.serie doc_serie,cab.rig doc' +
        '_numero,cab.fecha doc_fecha, i.fecha_registro,sum(det.s_bases_dt' +
        'o_canal) b_imponible,p.pais'
      'from ges_cabeceras_s_redondeos det'
      'join ges_cabeceras_s cab on (det.id_s = cab.id_s)'
      'join ges_cabeceras_s_fac fac on (fac.id_s = cab.id_s)'
      'join emp_clientes cli on ((cab.empresa = cli.empresa)and'
      '(cab.cliente = cli.cliente))'
      'join sys_paises p on (p.pais_c2 = cli.pais_c2)'
      'join emp_registro_iva i'
      
        'on fac.empresa=i.empresa and fac.ejercicio=i.ejercicio and fac.c' +
        'anal=i.canal and i.signo='#39'R'#39' and fac.rir=i.registro'
      'join emp_registro_iva_detalle d'
      'on i.id_i=d.id_i /*and det.tipo_iva=d.tipo_iva*/'
      'where ((cab.empresa=?empresa) and (cab.canal=?canal) and'
      
        '(cab.fecha>=?dfecha) and (cab.fecha<=?hfecha) and (cab.tipo='#39'FAC' +
        #39') and'
      '((cab.estado=5) /*or (cab.estado=6)*/) and (cli.intra = 1) and'
      
        '(p.pertenece_cee = 1) and (cli.pais_c2 <>'#39'ES'#39') and (i.modo=3) an' +
        'd (d.i_iva=0))'
      
        'group by cab.serie,cab.rig,cab.fecha, i.fecha_registro,i.doc_fec' +
        'ha,p.pais'
      ''
      'union'
      ''
      
        'select i.signo,i.rig_visible,cast('#39'AFC'#39' as varchar(3)) tipo_doc,' +
        'ccai.doc_serie, ccai.doc_numero, cca.fecha doc_fecha, i.fecha_re' +
        'gistro,ccai.base_imponible b_imponible,p.pais'
      'from con_cuentas_asientos_iva ccai'
      'join'
      'con_cuentas_asientos cca'
      'on( ccai.empresa   = cca.empresa   and'
      'ccai.ejercicio = cca.ejercicio and'
      'ccai.canal     = cca.canal     and'
      'ccai.ric       = cca.ric )'
      'join'
      'emp_clientes ep'
      'on(ccai.tercero = ep.tercero)'
      'join'
      'sys_paises p'
      'on (p.pais_c2 = ep.pais_c2)'
      'join emp_registro_iva i'
      
        'on ccai.empresa=i.empresa and ccai.ejercicio=i.ejercicio and cca' +
        'i.canal=i.canal and i.signo='#39'R'#39' and ccai.registro=i.registro'
      'where ((ccai.empresa=?empresa) and (ccai.canal=?canal) and'
      
        '(cca.ejercicio = ?ejercicio)and(cca.fecha>=?dfecha) and (cca.fec' +
        'ha<=?hfecha) and'
      
        '(cca.tipo='#39'AFC'#39') and(ep.intra = 1) and(p.pertenece_cee = 1) and ' +
        '(ep.pais_c2 <>'#39'ES'#39'))')
    UniDirectional = False
    AfterScroll = xMod349AfterScroll
    Left = 56
    Top = 392
    object xMod349SIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xMod349RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'RIG_VISIBLE'
    end
    object xMod349TIPO_DOC: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_DOC'
      Size = 3
    end
    object xMod349DOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xMod349DOC_NUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'DOC_NUMERO'
    end
    object xMod349DOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'DOC_FECHA'
    end
    object xMod349FECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fecha Reg.'
      FieldName = 'FECHA_REGISTRO'
    end
    object xMod349B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xMod349PAIS2: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object DSxMod349: TDataSource
    DataSet = xMod349
    Left = 152
    Top = 392
  end
  object xAcreedoresIntra: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select pp.empresa, cp.ejercicio, cp.canal, pp.acreedor, t.nombre' +
        '_r_social, cast(1 as smallint) intra, cp.modo_iva, p.pais, p.per' +
        'tenece_cee, d.dir_completa_n, l.titulo, p.titulo from emp_acreed' +
        'ores pp'
      'join con_cuentas_ges_acr cp'
      'on pp.empresa=cp.empresa and pp.acreedor=cp.acreedor'
      'join sys_terceros t'
      'on pp.tercero=t.tercero'
      'join sys_terceros_direcciones d'
      'on t.tercero=d.tercero and d.dir_defecto=1'
      'join sys_localidades l'
      'on d.id_local=l.id_local'
      'join sys_paises p'
      'on l.pais=p.pais'
      'where'
      'pp.empresa=?empresa and'
      'cp.ejercicio=?ejercicio and'
      'cp.canal=?canal and'
      '((p.pertenece_cee=0 and cp.modo_iva = 3) or'
      '(p.pertenece_cee=1 and p.pais<>'#39'ESP'#39' and cp.modo_iva <> 3) or'
      '(p.pais='#39'ZZZ'#39'))')
    UniDirectional = False
    Left = 56
    Top = 104
    object xAcreedoresIntraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAcreedoresIntraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAcreedoresIntraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAcreedoresIntraACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object xAcreedoresIntraNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xAcreedoresIntraINTRA: TIntegerField
      DisplayLabel = 'Intra'
      FieldName = 'INTRA'
    end
    object xAcreedoresIntraMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object xAcreedoresIntraPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xAcreedoresIntraPERTENECE_CEE: TIntegerField
      DisplayLabel = 'C.E.E.'
      FieldName = 'PERTENECE_CEE'
    end
    object xAcreedoresIntraDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object xAcreedoresIntraTITULO: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TITULO'
      Size = 40
    end
    object xAcreedoresIntraTITULO1: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'TITULO1'
      Size = 60
    end
  end
  object DSxAcreedoresIntra: TDataSource
    DataSet = xAcreedoresIntra
    Left = 152
    Top = 104
  end
  object xAutofactura: TFIBDataSetRO
    Database = DMMain.DataBase
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select c.empresa,c.ejercicio,c.canal,c.serie,c.tipo,c.rig,c.id_e' +
        ',f.serie_autofactura,f.autofactura,f.ris,p.proveedor proacr,t.no' +
        'mbre_r_social from ges_cabeceras_e c'
      'join ges_cabeceras_e_fac f'
      'on c.id_e=f.id_e'
      'left join ges_cabeceras_s a'
      'on f.empresa=a.empresa and'
      'f.ejercicio=a.ejercicio and'
      'f.canal=a.canal and'
      'f.serie_autofactura=a.serie and'
      'f.autofactura=a.rig'
      'join emp_proveedores p'
      'on f.empresa=p.empresa and f.proveedor=p.proveedor'
      'join sys_terceros t'
      'on p.tercero=t.tercero'
      'where'
      'c.empresa=?empresa and'
      'c.ejercicio=?ejercicio and'
      'c.canal=?canal and'
      'c.fecha between ?dfecha and ?hfecha and'
      'f.autofactura > 0 and'
      'a.rig is null'
      'union'
      
        'select c.empresa,c.ejercicio,c.canal,c.serie,c.tipo,c.rig,c.id_e' +
        ',f.serie_autofactura,f.autofactura,f.ris,p.acreedor proacr,t.nom' +
        'bre_r_social from ges_cabeceras_e c'
      'join ges_cabeceras_e_fcr f'
      'on c.id_e=f.id_e'
      'left join ges_cabeceras_s a'
      'on f.empresa=a.empresa and'
      'f.ejercicio=a.ejercicio and'
      'f.canal=a.canal and'
      'f.serie_autofactura=a.serie and'
      'f.autofactura=a.rig'
      'join emp_acreedores p'
      'on f.empresa=p.empresa and f.acreedor=p.acreedor'
      'join sys_terceros t'
      'on p.tercero=t.tercero'
      'where'
      'c.empresa=?empresa and'
      'c.ejercicio=?ejercicio and'
      'c.canal=?canal and'
      'c.fecha between ?dfecha and ?hfecha and'
      'f.autofactura > 0 and'
      'a.rig is null')
    UniDirectional = False
    Left = 56
    Top = 440
    object xAutofacturaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAutofacturaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAutofacturaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAutofacturaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xAutofacturaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAutofacturaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xAutofacturaID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xAutofacturaSERIE_AUTOFACTURA: TFIBStringField
      DisplayLabel = 'Serie Autof.'
      FieldName = 'SERIE_AUTOFACTURA'
      Size = 10
    end
    object xAutofacturaAUTOFACTURA: TIntegerField
      DisplayLabel = 'Autofactura'
      FieldName = 'AUTOFACTURA'
    end
    object xAutofacturaRIS: TIntegerField
      DisplayLabel = 'Registro IVA'
      FieldName = 'RIS'
    end
    object xAutofacturaPROACR: TIntegerField
      DisplayLabel = 'Prov./Acr.'
      FieldName = 'PROACR'
    end
    object xAutofacturaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxAutofactura: TDataSource
    DataSet = xAutofactura
    Left = 152
    Top = 440
  end
end
