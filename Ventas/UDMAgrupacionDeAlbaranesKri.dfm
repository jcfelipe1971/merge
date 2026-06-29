object DMAgrupacionDeAlbaranesKri: TDMAgrupacionDeAlbaranesKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 753
  Top = 191
  Height = 619
  Width = 469
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 336
    Top = 8
  end
  object QAgrupacionAlbaranes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_AGRUP'
      'WHERE'
      '  ID_S_AG=?old_ID_S_AG ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_AGRUP'
      
        '  (EMPRESA,CANAL,TIPO,ID_S_AG,TAREA_1,TAREA_2,TAREA_3,TAREA_4,TA' +
        'REA_5,TAREA_6,TAREA_7,TAREA_8,TAREA_9,TAREA_10)'
      'VALUES'
      
        '  (?EMPRESA,?CANAL,?TIPO,?ID_S_AG,?TAREA_1,?TAREA_2,?TAREA_3,?TA' +
        'REA_4,?TAREA_5,?TAREA_6,?TAREA_7,?TAREA_8,?TAREA_9,?TAREA_10)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_AGRUP'
      'WHERE'
      '  ID_S_AG=?ID_S_AG ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_AGRUP'
      'WHERE '
      '  EMPRESA = ?EMPRESA AND '
      '  CANAL = ?CANAL AND TIPO = '#39'ALB'#39' AND'
      '  ID_S_AG <> ?NO_ID_S_AG'
      'ORDER BY ID_S_AG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_AGRUP'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,TIPO=?TIPO'
      '  ,TAREA_1=?TAREA_1 '
      '  ,TAREA_2=?TAREA_2 '
      '  ,TAREA_3=?TAREA_3 '
      '  ,TAREA_4=?TAREA_4 '
      '  ,TAREA_5=?TAREA_5 '
      '  ,TAREA_6=?TAREA_6 '
      '  ,TAREA_7=?TAREA_7 '
      '  ,TAREA_8=?TAREA_8 '
      '  ,TAREA_9=?TAREA_9 '
      '  ,TAREA_10=?TAREA_10 '
      'WHERE'
      '  ID_S_AG=?ID_S_AG ')
    AfterOpen = QAgrupacionAlbaranesAfterOpen
    BeforeClose = QAgrupacionAlbaranesBeforeClose
    ClavesPrimarias.Strings = (
      'ID_S_AG ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_AGRUP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QAgrupacionAlbaranesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QAgrupacionAlbaranesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QAgrupacionAlbaranesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QAgrupacionAlbaranesID_S_AG: TIntegerField
      DisplayLabel = 'Agrupacion'
      FieldName = 'ID_S_AG'
    end
    object QAgrupacionAlbaranesTAREA_1: TIntegerField
      DisplayLabel = 'Alb.'
      FieldName = 'TAREA_1'
    end
    object QAgrupacionAlbaranesTAREA_2: TIntegerField
      DisplayLabel = 'P. List'
      FieldName = 'TAREA_2'
    end
    object QAgrupacionAlbaranesTAREA_3: TIntegerField
      DisplayLabel = 'P. List. Total'
      FieldName = 'TAREA_3'
    end
    object QAgrupacionAlbaranesTAREA_4: TIntegerField
      DisplayLabel = 'Etiq.'
      FieldName = 'TAREA_4'
    end
    object QAgrupacionAlbaranesTAREA_5: TIntegerField
      DisplayLabel = 'Trasp. Fac.'
      FieldName = 'TAREA_5'
    end
    object QAgrupacionAlbaranesTAREA_6: TIntegerField
      DisplayLabel = 'Etiq. Cont.'
      FieldName = 'TAREA_6'
    end
    object QAgrupacionAlbaranesTAREA_7: TIntegerField
      DisplayLabel = 'Rel. Carta'
      FieldName = 'TAREA_7'
    end
    object QAgrupacionAlbaranesTAREA_8: TIntegerField
      DisplayLabel = 'Fact. Can.'
      FieldName = 'TAREA_8'
    end
    object QAgrupacionAlbaranesTAREA_9: TIntegerField
      DisplayLabel = 'Sobre '
      FieldName = 'TAREA_9'
    end
    object QAgrupacionAlbaranesTAREA_10: TIntegerField
      DisplayLabel = 'Selec.'
      FieldName = 'TAREA_10'
    end
    object QAgrupacionAlbaranesINTERVALO: TFIBStringField
      DisplayLabel = 'Intervalo'
      DisplayWidth = 40
      FieldName = 'INTERVALO'
      Size = 40
    end
  end
  object DSQAgrupacionAlbaranes: TDataSource
    DataSet = QAgrupacionAlbaranes
    Left = 160
    Top = 8
  end
  object DSQCabecerasAlbaran: TDataSource
    DataSet = QCabecerasAlbaran
    Left = 160
    Top = 56
  end
  object DSQPackingListTotales: TDataSource
    DataSet = QPackingListTotales
    Left = 160
    Top = 104
  end
  object QPackingListTotales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from xver_picking_list_totales (?ID_S_AG)'
      'order by id_g_t,ref_proveedor,s_color')
    UniDirectional = False
    AfterOpen = QPackingListTotalesAfterOpen
    BeforeClose = QPackingListTotalesBeforeClose
    Left = 40
    Top = 104
    object QPackingListTotalesREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Ref. Proveedor'
      FieldName = 'REF_PROVEEDOR'
      Size = 25
    end
    object QPackingListTotalesS_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'S_COLOR'
      Size = 10
    end
    object QPackingListTotalesID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QPackingListTotalesID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
    object QPackingListTotalesID_A_M_C: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C'
    end
    object QPackingListTotalesP_COMPRA: TFloatField
      DisplayLabel = 'P. Compra'
      FieldName = 'P_COMPRA'
    end
    object QPackingListTotalesP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QPackingListTotalesTITM: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITM'
      Size = 60
    end
    object QPackingListTotalesTITMC: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITMC'
      Size = 60
    end
    object QPackingListTotalesID_D_S_GR: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_S_GR'
    end
    object QPackingListTotalesT01: TFloatField
      FieldName = 'T01'
    end
    object QPackingListTotalesT02: TFloatField
      FieldName = 'T02'
    end
    object QPackingListTotalesT03: TFloatField
      FieldName = 'T03'
    end
    object QPackingListTotalesT04: TFloatField
      FieldName = 'T04'
    end
    object QPackingListTotalesT05: TFloatField
      FieldName = 'T05'
    end
    object QPackingListTotalesT06: TFloatField
      FieldName = 'T06'
    end
    object QPackingListTotalesT07: TFloatField
      FieldName = 'T07'
    end
    object QPackingListTotalesT08: TFloatField
      FieldName = 'T08'
    end
    object QPackingListTotalesT09: TFloatField
      FieldName = 'T09'
    end
    object QPackingListTotalesT10: TFloatField
      FieldName = 'T10'
    end
    object QPackingListTotalesT11: TFloatField
      FieldName = 'T11'
    end
    object QPackingListTotalesT12: TFloatField
      FieldName = 'T12'
    end
    object QPackingListTotalesT13: TFloatField
      FieldName = 'T13'
    end
    object QPackingListTotalesT14: TFloatField
      FieldName = 'T14'
    end
    object QPackingListTotalesT15: TFloatField
      FieldName = 'T15'
    end
    object QPackingListTotalesT16: TFloatField
      FieldName = 'T16'
    end
    object QPackingListTotalesT17: TFloatField
      FieldName = 'T17'
    end
    object QPackingListTotalesT18: TFloatField
      FieldName = 'T18'
    end
    object QPackingListTotalesT19: TFloatField
      FieldName = 'T19'
    end
    object QPackingListTotalesT20: TFloatField
      FieldName = 'T20'
    end
    object QPackingListTotalesT21: TFloatField
      FieldName = 'T21'
    end
    object QPackingListTotalesT22: TFloatField
      FieldName = 'T22'
    end
    object QPackingListTotalesUTOTAL: TFloatField
      DisplayLabel = 'Total Uds.'
      FieldName = 'UTOTAL'
    end
    object QPackingListTotalesPTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'PTOTAL'
    end
    object QPackingListTotalesCAMBIA: TIntegerField
      DisplayLabel = 'Cambia'
      FieldName = 'CAMBIA'
    end
    object QPackingListTotalesCAJA_EDI: TIntegerField
      DisplayLabel = 'Caja EDI'
      FieldName = 'CAJA_EDI'
    end
    object QPackingListTotalesTIPO_CAJA_EDI: TFIBStringField
      DisplayLabel = 'Tipo Caja EDI'
      FieldName = 'TIPO_CAJA_EDI'
      Size = 5
    end
    object QPackingListTotalesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
  end
  object frListado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frListadoGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 336
    Top = 104
    ReportForm = {19000000}
  end
  object frDBQPackingListTotales: TfrDBDataSet
    DataSet = QPackingListTotales
    Left = 264
    Top = 104
  end
  object xTallas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from xget_tallas'
      'where id_g_t = ?id_g_t')
    UniDirectional = False
    DataSource = DSQPackingListTotales
    Left = 40
    Top = 152
    object xTallasNVISIBLE: TIntegerField
      DisplayLabel = 'Nro. Visible'
      FieldName = 'NVISIBLE'
    end
    object xTallasID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
    object xTallasGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 3
    end
    object xTallasT01: TFIBStringField
      FieldName = 'T01'
      Size = 8
    end
    object xTallasT02: TFIBStringField
      FieldName = 'T02'
      Size = 8
    end
    object xTallasT03: TFIBStringField
      FieldName = 'T03'
      Size = 8
    end
    object xTallasT04: TFIBStringField
      FieldName = 'T04'
      Size = 8
    end
    object xTallasT05: TFIBStringField
      FieldName = 'T05'
      Size = 8
    end
    object xTallasT06: TFIBStringField
      FieldName = 'T06'
      Size = 8
    end
    object xTallasT07: TFIBStringField
      FieldName = 'T07'
      Size = 8
    end
    object xTallasT08: TFIBStringField
      FieldName = 'T08'
      Size = 8
    end
    object xTallasT09: TFIBStringField
      FieldName = 'T09'
      Size = 8
    end
    object xTallasT10: TFIBStringField
      FieldName = 'T10'
      Size = 8
    end
    object xTallasT11: TFIBStringField
      FieldName = 'T11'
      Size = 8
    end
    object xTallasT12: TFIBStringField
      FieldName = 'T12'
      Size = 8
    end
    object xTallasT13: TFIBStringField
      FieldName = 'T13'
      Size = 8
    end
    object xTallasT14: TFIBStringField
      FieldName = 'T14'
      Size = 8
    end
    object xTallasT15: TFIBStringField
      FieldName = 'T15'
      Size = 8
    end
    object xTallasT16: TFIBStringField
      FieldName = 'T16'
      Size = 8
    end
    object xTallasT17: TFIBStringField
      FieldName = 'T17'
      Size = 8
    end
    object xTallasT18: TFIBStringField
      FieldName = 'T18'
      Size = 8
    end
    object xTallasT19: TFIBStringField
      FieldName = 'T19'
      Size = 8
    end
    object xTallasT20: TFIBStringField
      FieldName = 'T20'
      Size = 8
    end
    object xTallasT21: TFIBStringField
      FieldName = 'T21'
      Size = 8
    end
    object xTallasT22: TFIBStringField
      FieldName = 'T22'
      Size = 8
    end
  end
  object DSxTallas: TDataSource
    DataSet = xTallas
    Left = 160
    Top = 152
  end
  object frDBxTallas: TfrDBDataSet
    DataSet = xTallas
    Left = 264
    Top = 152
  end
  object frDBxEtiquetas: TfrDBDataSet
    DataSource = DSxEtiquetas
    Left = 264
    Top = 200
  end
  object xEtiquetas: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from c_crea_etiquetas_alb_agr(?empresa,?id_s_ag,?vacias' +
        ',?copias,?entrada)')
    UniDirectional = False
    Left = 40
    Top = 200
    object xEtiquetasCODPOSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODPOSTAL'
      Size = 10
    end
    object xEtiquetasPOBLACION: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'POBLACION'
      Size = 40
    end
    object xEtiquetasPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xEtiquetasTRANSPORTISTA: TFIBStringField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
      Size = 60
    end
    object xEtiquetasEMPRESA_CLI: TFIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA_CLI'
      Size = 60
    end
    object xEtiquetasDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 172
    end
    object xEtiquetasBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xEtiquetasPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object xEtiquetasPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
    object xEtiquetasPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xEtiquetasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xEtiquetasDIRECCION1: TFIBStringField
      DisplayLabel = 'Direccion 1'
      FieldName = 'DIRECCION1'
      Size = 172
    end
    object xEtiquetasDIRECCION2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIRECCION2'
      Size = 40
    end
    object xEtiquetasSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xEtiquetasDIRECCION_EDI: TFIBStringField
      DisplayLabel = 'Direccion EDI'
      FieldName = 'DIRECCION_EDI'
      Size = 172
    end
  end
  object DSxEtiquetas: TDataSource
    DataSet = xEtiquetas
    Left = 160
    Top = 200
  end
  object SPTraspasoAlbaranMul: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure G_TRASPASO_ALBARAN_A_OTRO_MUL '
      '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?TIPO_DESTINO,'
      
        '   ?ENTRADA,?FECHA, ?TRANSPORTISTA,?D_EJERCICIO,?D_CANAL,?D_SERI' +
        'E,?ID_S,'
      '0,0,0,0,0)')
    Transaction = TUpdate
    AutoTrans = False
    Left = 40
    Top = 248
  end
  object QCierra: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure '
      
        'g_factura_cierra2(?empresa,?ejercicio,?canal,?serie,?rig,?fecha,' +
        '?entrada,?ID_S)')
    Transaction = TUpdate
    Plan.Strings = (
      ' ')
    AutoTrans = False
    Left = 263
    Top = 248
  end
  object QDestino: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'select rel.d_empresa,rel.d_ejercicio,rel.d_canal,rel.d_serie,rel' +
        '.d_tipo,rel.d_rig,cab.fecha,cab.id_s from ges_cabeceras_relacion' +
        'es rel'
      'join ges_cabeceras_s cab on'
      'rel.d_empresa = cab.empresa and'
      'rel.d_ejercicio = cab.ejercicio and'
      'rel.d_canal = cab.canal and'
      'rel.d_serie = cab.serie and'
      'rel.d_tipo = cab.tipo and'
      'rel.d_rig = cab.rig'
      'where'
      'o_empresa = ?empresa and'
      'o_ejercicio = ?ejercicio and'
      'o_canal = ?canal and'
      'o_serie = ?serie and'
      'o_tipo = ?tipo and'
      'o_rig = ?rig')
    Transaction = TLocal
    AutoTrans = True
    Left = 160
    Top = 248
  end
  object DSQMCartaPortesTransportista: TDataSource
    DataSet = QMCartaPortesTransportista
    Left = 208
    Top = 296
  end
  object DSQMCartaPortesAlbaranes: TDataSource
    DataSet = QMCartaPortesAlbaranes
    Left = 208
    Top = 344
  end
  object QMCartaPortesTransportista: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'select distinct cab.transportista,ter.nombre_r_social,cab.portes' +
        ' from ges_cabeceras_s cab'
      'join ges_cabeceras_s_agrup_det agr'
      'on cab.id_s = agr.id_s'
      'join emp_acreedores acr'
      
        'on cab.empresa = acr.empresa and cab.transportista = acr.acreedo' +
        'r'
      'join sys_terceros ter'
      'on acr.tercero = ter.tercero '
      'join sys_terceros_direcciones dir'
      'on acr.tercero = dir.tercero and dir.dir_defecto = 1'
      'join sys_localidades loc'
      'on dir.dir_localidad = loc.localidad'
      
        'where agr.id_s_ag = ?ID_S_AG and cab.transportista =?TRANSPORTIS' +
        'TA')
    SelectSQL.Strings = (
      
        'select distinct agr.id_s_ag,agr.entrada_agrup,cab.empresa,cab.ej' +
        'ercicio,cab.canal,cab.transportista,'
      ' ter.nombre_r_social,cab.portes,cab.tipo_portes,cab.idioma'
      'from ges_cabeceras_s cab'
      'join ges_cabeceras_s_agrup_det agr'
      'on cab.id_s = agr.id_s'
      'join emp_acreedores acr'
      
        'on cab.empresa = acr.empresa and cab.transportista = acr.acreedo' +
        'r'
      'join sys_terceros ter'
      'on acr.tercero = ter.tercero '
      'join sys_terceros_direcciones dir'
      'on acr.tercero = dir.tercero and dir.dir_defecto = 1'
      'join sys_localidades loc'
      'on dir.dir_localidad = loc.localidad'
      
        'where agr.id_s_ag = ?ID_S_AG and agr.entrada_agrup=?ENTRADA_AGRU' +
        'P'
      'ORDER BY cab.transportista')
    UniDirectional = False
    DataSource = DSQAgrupacionAlbaranes
    AfterOpen = QMCartaPortesTransportistaAfterOpen
    BeforeClose = QMCartaPortesTransportistaBeforeClose
    Left = 56
    Top = 296
    object QMCartaPortesTransportistaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCartaPortesTransportistaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCartaPortesTransportistaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCartaPortesTransportistaTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMCartaPortesTransportistaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCartaPortesTransportistaPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMCartaPortesTransportistaTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object QMCartaPortesTransportistaIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMCartaPortesTransportistaID_S_AG: TIntegerField
      DisplayLabel = 'Agrupacion'
      FieldName = 'ID_S_AG'
    end
    object QMCartaPortesTransportistaENTRADA_AGRUP: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA_AGRUP'
    end
  end
  object QMCartaPortesAlbaranes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select cab.fecha,cab.serie,cab.rig,cab.bultos,alb.bultos_kri,ter' +
        '.nombre_r_social,'
      
        '       dir.dir_tipo,dir.dir_nombre,dir.dir_nombre_2,dir.dir_nume' +
        'ro,dir_bloque_escalera,'
      
        '       dir.dir_piso,dir_puerta,dir.dir_completa,dir.dir_completa' +
        '_n,dir.dir_telefono01,'
      
        '       dir.dir_telefono02,dir.dir_telefax,loc.titulo as localida' +
        'd, loc.codigo_postal,'
      
        '       pa.titulo as pais,prov.titulo as provincia,cab.notas,cab.' +
        'su_referencia,std2.dir_nombre_2 as direccion_edi '
      'from ges_cabeceras_s_alb alb'
      'join ges_cabeceras_s cab'
      'on cab.id_s = alb.id_s '
      'join ges_cabeceras_s_agrup_det agr'
      'on cab.id_s = agr.id_s'
      'join sys_terceros ter'
      'on cab.tercero = ter.tercero '
      'join sys_terceros_direcciones dir'
      'on cab.tercero = dir.tercero and dir.direccion = cab.direccion'
      'join sys_localidades loc'
      'on dir.dir_localidad = loc.localidad'
      'join sys_provincias prov on'
      'loc.provincia = prov.provincia and loc.pais = prov.pais '
      'join sys_paises pa'
      'on loc.pais = pa.pais'
      'left join sys_terceros_direcciones std2'
      
        'on std2.tercero = cab.tercero and std2.codigo_edi = cab.comprado' +
        'r '
      
        'where agr.id_s_ag = ?ID_S_AG and cab.transportista = ?TRANSPORTI' +
        'STA and cab.portes = ?PORTES and agr.entrada_agrup=?ENTRADA_AGRU' +
        'P'
      'order by cab.serie,cab.rig')
    UniDirectional = False
    DataSource = DSQMCartaPortesTransportista
    Left = 48
    Top = 344
    object QMCartaPortesAlbaranesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCartaPortesAlbaranesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCartaPortesAlbaranesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCartaPortesAlbaranesBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMCartaPortesAlbaranesBULTOS_KRI: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS_KRI'
    end
    object QMCartaPortesAlbaranesNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCartaPortesAlbaranesDIR_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DIR_TIPO'
      Size = 3
    end
    object QMCartaPortesAlbaranesDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object QMCartaPortesAlbaranesDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMCartaPortesAlbaranesDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object QMCartaPortesAlbaranesDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloq./Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object QMCartaPortesAlbaranesDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object QMCartaPortesAlbaranesDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object QMCartaPortesAlbaranesDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object QMCartaPortesAlbaranesDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object QMCartaPortesAlbaranesDIR_TELEFONO01: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'DIR_TELEFONO01'
    end
    object QMCartaPortesAlbaranesDIR_TELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'DIR_TELEFONO02'
    end
    object QMCartaPortesAlbaranesDIR_TELEFAX: TFIBStringField
      DisplayLabel = 'FAX'
      FieldName = 'DIR_TELEFAX'
    end
    object QMCartaPortesAlbaranesLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMCartaPortesAlbaranesCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMCartaPortesAlbaranesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCartaPortesAlbaranesSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMCartaPortesAlbaranesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 60
    end
    object QMCartaPortesAlbaranesPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMCartaPortesAlbaranesDIRECCION_EDI: TFIBStringField
      DisplayLabel = 'Direccion EDI'
      FieldName = 'DIRECCION_EDI'
      Size = 40
    end
  end
  object frDBCartaPortesTransportista: TfrDBDataSet
    DataSet = QMCartaPortesTransportista
    Left = 360
    Top = 296
  end
  object frDBCartaPortesAlbaranes: TfrDBDataSet
    DataSet = QMCartaPortesAlbaranes
    Left = 360
    Top = 344
  end
  object xArticuloKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TITULO_CORTO,ALFA_1,ALFA_2,ALFA_3,ALFA_4,ALFA_5,SERIALIZA' +
        'DO_KRI,LOTES_KRI FROM ART_ARTICULOS'
      'WHERE '
      '  ID_A=?ID_A')
    UniDirectional = True
    DataSource = DSQPackingListTotales
    Left = 48
    Top = 393
    object xArticuloKriALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object xArticuloKriALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object xArticuloKriALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object xArticuloKriALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object xArticuloKriALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object xArticuloKriTITULO_CORTO: TFIBStringField
      DisplayLabel = 'Titulo Corto'
      FieldName = 'TITULO_CORTO'
    end
    object xArticuloKriSERIALIZADO_KRI: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO_KRI'
    end
    object xArticuloKriLOTES_KRI: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTES_KRI'
    end
  end
  object DSxArticuloKri: TDataSource
    DataSet = xArticuloKri
    Left = 112
    Top = 393
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 398
    Top = 8
  end
  object QCabecerasAlbaran: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_ALBARAN'
      'WHERE'
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_ALBARAN'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,ALMACEN,MONEDA,FECHA,T' +
        'ERCERO,TITULO,DIRECCION,CLIENTE,SU_REFERENCIA,FORMA_PAGO,CAMPANY' +
        'A,NOTAS,ESTADO,BULTOS,LINEAS,BRUTO,I_DTO_LINEAS,S_BASES,M_BRUTO,' +
        'C_TOTAL,AGENTE,S_CUOTA_IVA,S_CUOTA_RE,B_DTO_LINEAS,DTO_PP,DTO_CI' +
        'AL,I_DTO_CIAL,I_DTO_PP,B_COMISION,I_COMISION,POR_FINANCIACION,I_' +
        'FINANCIACION,LIQUIDO,ENTRADA,TRANSPORTISTA,I_BASE_RETENCION,P_RE' +
        'TENCION,I_RETENCION,TIPO_IRPF,A_IRPF,TOTAL_A_COBRAR,NOMBRE_COMER' +
        'CIAL,PORTES,TARIFA,ID_S,BULTOS_KRI,GARANTIA,AGRUPACION_KRI)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ALMACEN,?MONEDA' +
        ',?FECHA,?TERCERO,?TITULO,?DIRECCION,?CLIENTE,?SU_REFERENCIA,?FOR' +
        'MA_PAGO,?CAMPANYA,?NOTAS,?ESTADO,?BULTOS,?LINEAS,?BRUTO,?I_DTO_L' +
        'INEAS,?S_BASES,?M_BRUTO,?C_TOTAL,?AGENTE,?S_CUOTA_IVA,?S_CUOTA_R' +
        'E,?B_DTO_LINEAS,?DTO_PP,?DTO_CIAL,?I_DTO_CIAL,?I_DTO_PP,?B_COMIS' +
        'ION,?I_COMISION,?POR_FINANCIACION,?I_FINANCIACION,?LIQUIDO,?ENTR' +
        'ADA,?TRANSPORTISTA,?I_BASE_RETENCION,?P_RETENCION,?I_RETENCION,?' +
        'TIPO_IRPF,?A_IRPF,?TOTAL_A_COBRAR,?NOMBRE_COMERCIAL,?PORTES,?TAR' +
        'IFA,?ID_S,?BULTOS_KRI,?GARANTIA,?AGRUPACION_KRI)')
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN VER'
      'join ges_cabeceras_s_agrup_det ag on'
      'ver.id_s = ag.id_s'
      'WHERE ver.AGRUPACION_KRI = ?AGRUPACION_KRI and ver.ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN VER'
      'join ges_cabeceras_s_agrup_det ag on'
      'ver.id_s = ag.id_s'
      
        'WHERE ver.empresa=?EMPRESA and ver.EJERCICIO=?EJERCICIO and ver.' +
        'AGRUPACION_KRI = ?ID_S_AG'
      'UNION'
      'SELECT * FROM VER_CABECERAS_ALBARAN VER'
      'join ges_cabeceras_s_agrup_det ag on'
      'ver.id_s = ag.id_s'
      
        'WHERE ver.empresa=?EMPRESA and ver.EJERCICIO=?EJERCICIO-1 and ve' +
        'r.AGRUPACION_KRI = ?ID_S_AG'
      'ORDER BY 2,4,6')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'update ges_cabeceras_s_agrup_det cab'
      'set cab.entrada_agrup = ?entrada_agrup'
      'WHERE cab.ID_S_AG = ?old_AGRUPACION_KRI and cab.ID_S=?old_ID_S')
    DataSource = DSQAgrupacionAlbaranes
    AfterOpen = QCabecerasAlbaranAfterOpen
    BeforeClose = QCabecerasAlbaranBeforeClose
    BeforeOpen = QCabecerasAlbaranBeforeOpen
    OnNewRecord = QCabecerasAlbaranNewRecord
    ClavesPrimarias.Strings = (
      'AGRUPACION_KRI '
      'ID_S ')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_ALBARAN'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QCabecerasAlbaranEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QCabecerasAlbaranEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QCabecerasAlbaranCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QCabecerasAlbaranSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QCabecerasAlbaranTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QCabecerasAlbaranRIG: TIntegerField
      DisplayLabel = 'Albar'#225'n'
      FieldName = 'RIG'
    end
    object QCabecerasAlbaranID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QCabecerasAlbaranALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QCabecerasAlbaranFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QCabecerasAlbaranTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QCabecerasAlbaranCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QCabecerasAlbaranSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su. Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QCabecerasAlbaranAGRUPACION_KRI: TIntegerField
      DisplayLabel = 'Agrup.'
      FieldName = 'AGRUPACION_KRI'
    end
    object QCabecerasAlbaranTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transp.'
      FieldName = 'TRANSPORTISTA'
    end
    object QCabecerasAlbaranESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QCabecerasAlbaranENTRADA_AGRUP: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA_AGRUP'
    end
  end
  object xDireccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'select d.dir_tipo,d.dir_nombre,d.dir_nombre_2,d.dir_numero,d.dir' +
        '_bloque_escalera,d.dir_piso,d.dir_puerta,'
      
        '       l.localidad,l.titulo as titulo_localidad,l.codigo_postal,' +
        'p.titulo as titulo_provincia,a.titulo as titulo_pais,'
      
        '       d.dir_telefono01,d.dir_telefono02,d.dir_telefax from ges_' +
        'cabeceras_s c'
      'join sys_terceros t on'
      'c.tercero=t.tercero'
      'join sys_terceros_direcciones d on'
      't.tercero=d.tercero and c.direccion=d.direccion '
      'join sys_localidades l on'
      'l.id_local=d.id_local '
      'join sys_provincias p '
      'on l.pais=p.pais and l.provincia=p.provincia '
      'join sys_paises a'
      'on p.pais=a.pais'
      'where c.id_s=?id_s')
    SelectSQL.Strings = (
      
        'select d.dir_tipo,d.dir_nombre,d.dir_nombre_2,d.dir_numero,d.dir' +
        '_bloque_escalera,d.dir_piso,d.dir_puerta,'
      
        '       l.localidad,l.titulo as titulo_localidad,l.codigo_postal,' +
        'p.titulo as titulo_provincia,a.titulo as titulo_pais,'
      
        '       d.dir_telefono01,d.dir_telefono02,d.dir_telefax from ges_' +
        'cabeceras_s c'
      'join sys_terceros t on'
      'c.tercero=t.tercero'
      'join sys_terceros_direcciones d on'
      't.tercero=d.tercero and c.direccion=d.direccion '
      'join sys_localidades l on'
      'l.id_local=d.id_local '
      'join sys_provincias p '
      'on l.pais=p.pais and l.provincia=p.provincia '
      'join sys_paises a'
      'on p.pais=a.pais'
      'where c.id_s=?id_s'
      '')
    UniDirectional = False
    DataSource = DSQCabecerasAlbaran
    Left = 40
    Top = 448
    object xDireccionDIR_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DIR_TIPO'
      Size = 3
    end
    object xDireccionDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xDireccionDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object xDireccionDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object xDireccionDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloq./Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object xDireccionDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object xDireccionDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object xDireccionLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 8
    end
    object xDireccionTITULO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TITULO_LOCALIDAD'
      Size = 40
    end
    object xDireccionCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'C. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xDireccionTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object xDireccionTITULO_PAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'TITULO_PAIS'
      Size = 60
    end
    object xDireccionDIR_TELEFONO01: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'DIR_TELEFONO01'
    end
    object xDireccionDIR_TELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'DIR_TELEFONO02'
    end
    object xDireccionDIR_TELEFAX: TFIBStringField
      DisplayLabel = 'FAX'
      FieldName = 'DIR_TELEFAX'
    end
  end
  object DSxDireccion: TDataSource
    DataSet = xDireccion
    Left = 128
    Top = 448
  end
  object xPackingList: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'select * from EDI_PACKING_LIST_CAJAS'
      '(?EMPRESA ,?CANAL, ?TIPO, ?ID_S_AG)')
    UniDirectional = False
    Left = 232
    Top = 400
    object xPackingListARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xPackingListPEDIDO: TFIBStringField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
      Size = 35
    end
    object xPackingListCOLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
      Size = 10
    end
    object xPackingListPATRON: TFIBStringField
      DisplayLabel = 'Patron'
      FieldName = 'PATRON'
      Size = 25
    end
    object xPackingListCAJA: TFIBStringField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
      Size = 35
    end
    object xPackingListALMACEN: TIntegerField
      DisplayLabel = 'Alm'
      FieldName = 'ALMACEN'
    end
    object xPackingListTIENDA: TIntegerField
      DisplayLabel = 'Tienda'
      FieldName = 'TIENDA'
    end
    object xPackingListT01: TFloatField
      FieldName = 'T01'
    end
    object xPackingListT02: TFloatField
      FieldName = 'T02'
    end
    object xPackingListT03: TFloatField
      FieldName = 'T03'
    end
    object xPackingListT04: TFloatField
      FieldName = 'T04'
    end
    object xPackingListT05: TFloatField
      FieldName = 'T05'
    end
    object xPackingListT06: TFloatField
      FieldName = 'T06'
    end
    object xPackingListT07: TFloatField
      FieldName = 'T07'
    end
    object xPackingListT08: TFloatField
      FieldName = 'T08'
    end
    object xPackingListUNID: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNID'
    end
  end
  object DSxPackingList: TDataSource
    DataSet = xPackingList
    Left = 327
    Top = 400
  end
  object ExcelApplication: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 336
    Top = 224
  end
  object ExcelWorkbook: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 400
    Top = 224
  end
  object xPackingList2: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'select  PEDIDO, PATRON, COLOR, min(ARTICULO) as articulo, '
      'SUM(T01) as T01,'
      'SUM(T02) as T02,'
      'SUM(T03) as T03,'
      'SUM(T04) as T04,'
      'SUM(T05) as T05,'
      'SUM(T06) as T06,'
      'SUM(T07) as T07,'
      'SUM(T08) as T08,'
      'SUM(T09) as T09,'
      'SUM(T10) as T10,'
      'SUM(T11) as T11,'
      'SUM(T12) as T12,'
      'SUM(T13) as T13,'
      'SUM(T14) as T14,'
      'SUM(T15) as T15,'
      'SUM(T16) as T16,'
      'SUM(T17) as T17,'
      'SUM(T18) as T18,'
      'SUM(T19) as T19,'
      'SUM(T20) as T20,'
      'SUM(T21) as T21,'
      'SUM(T22) as T22'
      ' from EDI_PACKING_LIST_CAJAS'
      '(?EMPRESA ,?CANAL, ?TIPO, ?ID_S_AG)'
      'GROUP BY'
      'PEDIDO, PATRON, COLOR/*, ARTICULO*/')
    UniDirectional = False
    Left = 232
    Top = 456
    object xPackingList2PEDIDO: TFIBStringField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
      Size = 35
    end
    object xPackingList2PATRON: TFIBStringField
      DisplayLabel = 'Patron'
      FieldName = 'PATRON'
      Size = 25
    end
    object xPackingList2COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
      Size = 10
    end
    object xPackingList2T01: TFloatField
      FieldName = 'T01'
    end
    object xPackingList2T02: TFloatField
      FieldName = 'T02'
    end
    object xPackingList2T03: TFloatField
      FieldName = 'T03'
    end
    object xPackingList2T04: TFloatField
      FieldName = 'T04'
    end
    object xPackingList2T05: TFloatField
      FieldName = 'T05'
    end
    object xPackingList2T06: TFloatField
      FieldName = 'T06'
    end
    object xPackingList2T07: TFloatField
      FieldName = 'T07'
    end
    object xPackingList2T08: TFloatField
      FieldName = 'T08'
    end
    object xPackingList2T09: TFloatField
      FieldName = 'T09'
    end
    object xPackingList2T10: TFloatField
      FieldName = 'T10'
    end
    object xPackingList2T11: TFloatField
      FieldName = 'T11'
    end
    object xPackingList2T12: TFloatField
      FieldName = 'T12'
    end
    object xPackingList2T13: TFloatField
      FieldName = 'T13'
    end
    object xPackingList2T14: TFloatField
      FieldName = 'T14'
    end
    object xPackingList2T15: TFloatField
      FieldName = 'T15'
    end
    object xPackingList2T16: TFloatField
      FieldName = 'T16'
    end
    object xPackingList2T17: TFloatField
      FieldName = 'T17'
    end
    object xPackingList2T18: TFloatField
      FieldName = 'T18'
    end
    object xPackingList2T19: TFloatField
      FieldName = 'T19'
    end
    object xPackingList2T20: TFloatField
      FieldName = 'T20'
    end
    object xPackingList2T21: TFloatField
      FieldName = 'T21'
    end
    object xPackingList2T22: TFloatField
      FieldName = 'T22'
    end
    object xPackingList2ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
  end
  object DSxPackingList2: TDataSource
    DataSet = xPackingList2
    Left = 328
    Top = 456
  end
  object QAgrupacionAlbaranesSeleccion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_AGRUP'
      'WHERE'
      '  ID_S_AG=?old_ID_S_AG ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_AGRUP'
      
        '  (EMPRESA,CANAL,TIPO,ID_S_AG,TAREA_1,TAREA_2,TAREA_3,TAREA_4,TA' +
        'REA_5,TAREA_6,TAREA_7,TAREA_8,TAREA_9,TAREA_10)'
      'VALUES'
      
        '  (?EMPRESA,?CANAL,?TIPO,?ID_S_AG,?TAREA_1,?TAREA_2,?TAREA_3,?TA' +
        'REA_4,?TAREA_5,?TAREA_6,?TAREA_7,?TAREA_8,?TAREA_9,?TAREA_10)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_AGRUP'
      'WHERE'
      '  ID_S_AG=?ID_S_AG ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_AGRUP'
      'WHERE '
      '  EMPRESA = ?EMPRESA AND '
      '  CANAL = ?CANAL AND TIPO = '#39'ALB'#39' AND'
      '  ID_S_AG <> ?NO_ID_S_AG'
      'ORDER BY ID_S_AG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_AGRUP'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,TIPO=?TIPO'
      '  ,TAREA_10=?TAREA_10 '
      'WHERE'
      '  ID_S_AG=?ID_S_AG ')
    AfterOpen = QAgrupacionAlbaranesSeleccionAfterOpen
    AfterPost = QAgrupacionAlbaranesSeleccionAfterPost
    ClavesPrimarias.Strings = (
      'ID_S_AG ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_AGRUP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 504
    object QAgrupacionAlbaranesSeleccionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QAgrupacionAlbaranesSeleccionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QAgrupacionAlbaranesSeleccionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QAgrupacionAlbaranesSeleccionID_S_AG: TIntegerField
      DisplayLabel = 'ID Agrup.'
      FieldName = 'ID_S_AG'
    end
    object QAgrupacionAlbaranesSeleccionTAREA_1: TIntegerField
      DisplayLabel = 'Tarea 1'
      FieldName = 'TAREA_1'
    end
    object QAgrupacionAlbaranesSeleccionTAREA_2: TIntegerField
      DisplayLabel = 'Tarea 2'
      FieldName = 'TAREA_2'
    end
    object QAgrupacionAlbaranesSeleccionTAREA_3: TIntegerField
      DisplayLabel = 'Tarea 3'
      FieldName = 'TAREA_3'
    end
    object QAgrupacionAlbaranesSeleccionTAREA_4: TIntegerField
      DisplayLabel = 'Tarea 4'
      FieldName = 'TAREA_4'
    end
    object QAgrupacionAlbaranesSeleccionTAREA_5: TIntegerField
      DisplayLabel = 'Tarea 5'
      FieldName = 'TAREA_5'
    end
    object QAgrupacionAlbaranesSeleccionTAREA_6: TIntegerField
      DisplayLabel = 'Tarea 6'
      FieldName = 'TAREA_6'
    end
    object QAgrupacionAlbaranesSeleccionTAREA_7: TIntegerField
      DisplayLabel = 'Tarea 7'
      FieldName = 'TAREA_7'
    end
    object QAgrupacionAlbaranesSeleccionTAREA_8: TIntegerField
      DisplayLabel = 'Tarea 8'
      FieldName = 'TAREA_8'
    end
    object QAgrupacionAlbaranesSeleccionTAREA_9: TIntegerField
      DisplayLabel = 'Tarea 9'
      FieldName = 'TAREA_9'
    end
    object QAgrupacionAlbaranesSeleccionTAREA_10: TIntegerField
      DisplayLabel = 'Tarea 10'
      FieldName = 'TAREA_10'
    end
    object QAgrupacionAlbaranesSeleccionINTERVALO: TFIBStringField
      DisplayLabel = 'Intervalo'
      FieldName = 'INTERVALO'
      Size = 40
    end
  end
  object DSQAgrupacionAlbaranesSeleccion: TDataSource
    DataSet = QAgrupacionAlbaranesSeleccion
    Left = 160
    Top = 504
  end
  object frxListado: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9705409491
    ReportOptions.LastChange = 38691.9705409491
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frxListadoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 392
    Top = 104
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
