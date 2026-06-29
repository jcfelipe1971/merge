object DMDescargasGas: TDMDescargasGas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 251
  Top = 159
  Height = 441
  Width = 733
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 592
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 592
    Top = 56
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 352
    Top = 8
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select * from ges_gas_cab_venta'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and serie=?serie and rig=?rig')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_CAB_DESCARGA'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE AND'
      'RIG=?RIG')
    UniDirectional = False
    DataSource = DSQMDescargasGas
    Left = 248
    Top = 8
    object xInfoActualizadaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xInfoActualizadaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xInfoActualizadaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xInfoActualizadaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xInfoActualizadaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xInfoActualizadaID_DESCARGA: TIntegerField
      DisplayLabel = 'ID Desc.'
      FieldName = 'ID_DESCARGA'
    end
    object xInfoActualizadaFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object xInfoActualizadaFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xInfoActualizadaTIEMPO_DESCARGA: TFloatField
      DisplayLabel = 'Tiempo Desc.'
      FieldName = 'TIEMPO_DESCARGA'
    end
    object xInfoActualizadaORDEN_COMPRA: TIntegerField
      DisplayLabel = 'Ord. Compra'
      FieldName = 'ORDEN_COMPRA'
    end
    object xInfoActualizadaCOLA_CAMION: TIntegerField
      DisplayLabel = 'Cola Camion'
      FieldName = 'COLA_CAMION'
    end
    object xInfoActualizadaTURNO: TFIBStringField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
      Size = 3
    end
    object xInfoActualizadaPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xInfoActualizadaPRESION: TFloatField
      DisplayLabel = 'Presion'
      FieldName = 'PRESION'
    end
    object xInfoActualizadaTEMPERATURA: TFloatField
      DisplayLabel = 'Temp.'
      FieldName = 'TEMPERATURA'
    end
    object xInfoActualizadaALBARAN_CONDUCE: TFloatField
      DisplayLabel = 'Alb. Conduce'
      FieldName = 'ALBARAN_CONDUCE'
    end
    object xInfoActualizadaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xInfoActualizadaID_DESCARGA_O: TIntegerField
      DisplayLabel = 'ID Desc. Orig.'
      FieldName = 'ID_DESCARGA_O'
    end
    object xInfoActualizadaID_DESCARGA_D: TIntegerField
      DisplayLabel = 'ID Desc. Dest.'
      FieldName = 'ID_DESCARGA_D'
    end
    object xInfoActualizadaENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 144
    Top = 248
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CANALES_SERIES'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and serie=?serie'
      ''
      '')
    UniDirectional = False
    Left = 40
    Top = 248
  end
  object QMDescargasGas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_CAB_DESCARGA'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_CAB_DESCARGA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_DESCARGA,FECHA_INICIO,FE' +
        'CHA_CIERRE,TIEMPO_DESCARGA,ORDEN_COMPRA,COLA_CAMION,TURNO,PRECIO' +
        ',PRESION,TEMPERATURA,ALBARAN_CONDUCE,NOTAS,ID_DESCARGA_O,ID_DESC' +
        'ARGA_D,ENTRADA,ESTADO,descarga_fac,numero_fac,RIC,PROVEDOR'
      ' ,PRESION_ANTE_DESC_COLA'
      ' ,PRESION_FINAL_DESC_COLA'
      ' ,TEMPERATURA_INICIAL_COLA'
      ' ,TEMPERATURA_FINAL_COLA'
      ' ,FECHA_SALIDA_TERMINAL'
      ' ,FECHA_LLEGADA_SUCURSAL'
      ' ,ROTO_GAUGE'
      ' ,NUM_CABEZOTE'
      ' ,COD_CAMION'
      ' ,CHOFER_COLA'
      ' ,DENSIDAD'
      ' ,GLS_REC_TEMP_AMBIENTE'
      ' ,METODO_DESCARGA'
      ' ,RECIBIDO'
      ' ,ID_DOC)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_DESCARGA,?FECHA_IN' +
        'ICIO,?FECHA_CIERRE,?TIEMPO_DESCARGA,?ORDEN_COMPRA,?COLA_CAMION,?' +
        'TURNO,?PRECIO,?PRESION,?TEMPERATURA,?ALBARAN_CONDUCE,?NOTAS,?ID_' +
        'DESCARGA_O,?ID_DESCARGA_D,?ENTRADA,?ESTADO,?descarga_fac,?numero' +
        '_fac,?RIC,?PROVEDOR'
      ' ,?PRESION_ANTE_DESC_COLA'
      ' ,?PRESION_FINAL_DESC_COLA'
      ' ,?TEMPERATURA_INICIAL_COLA'
      ' ,?TEMPERATURA_FINAL_COLA'
      ' ,?FECHA_SALIDA_TERMINAL'
      ' ,?FECHA_LLEGADA_SUCURSAL'
      ' ,?ROTO_GAUGE'
      ' ,?NUM_CABEZOTE'
      ' ,?COD_CAMION'
      ' ,?CHOFER_COLA'
      ' ,?DENSIDAD'
      ' ,?GLS_REC_TEMP_AMBIENTE'
      ' ,?METODO_DESCARGA'
      ' ,?RECIBIDO'
      ' ,?ID_DOC'
      ' )')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_CAB_DESCARGA'
      'WHERE'
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_CAB_DESCARGA'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE'
      'ORDER BY RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_CAB_DESCARGA'
      'SET'
      '  ID_DESCARGA=?ID_DESCARGA '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_CIERRE=?FECHA_CIERRE '
      '  ,TIEMPO_DESCARGA=?TIEMPO_DESCARGA '
      '  ,ORDEN_COMPRA=?ORDEN_COMPRA '
      '  ,COLA_CAMION=?COLA_CAMION '
      '  ,TURNO=?TURNO '
      '  ,PRECIO=?PRECIO '
      '  ,PRESION=?PRESION '
      '  ,TEMPERATURA=?TEMPERATURA '
      '  ,ALBARAN_CONDUCE=?ALBARAN_CONDUCE '
      '  ,NOTAS=?NOTAS '
      '  ,descarga_fac=?descarga_fac'
      '  ,numero_fac=?numeor_fac'
      '  ,ID_DESCARGA_O=?ID_DESCARGA_O '
      '  ,ID_DESCARGA_D=?ID_DESCARGA_D '
      '  ,ENTRADA=?ENTRADA '
      '  ,ESTADO=?ESTADO '
      '  ,RIC=?RIC '
      '  ,PROVEDOR=?PROVEDOR '
      '  ,PRESION_ANTE_DESC_COLA=?PRESION_ANTE_DESC_COLA  '
      '  ,PRESION_FINAL_DESC_COLA=?PRESION_FINAL_DESC_COLA '
      '  ,TEMPERATURA_INICIAL_COLA=?TEMPERATURA_INICIAL_COLA '
      '  ,TEMPERATURA_FINAL_COLA=?TEMPERATURA_FINAL_COLA '
      '  ,FECHA_SALIDA_TERMINAL=?FECHA_SALIDA_TERMINAL '
      '  ,FECHA_LLEGADA_SUCURSAL=?FECHA_LLEGADA_SUCURSA '
      '  ,ROTO_GAUGE=?ROTO_GAUGE '
      '  ,NUM_CABEZOTE=?NUM_CABEZOTE '
      '  ,COD_CAMION=?COD_CAMION'
      '  ,CHOFER_COLA=?CHOFER_COLA '
      '  ,DENSIDAD=?DENSIDAD '
      '  ,GLS_REC_TEMP_AMBIENTE=?GLS_REC_TEMP_AMBIENTE '
      '  ,METODO_DESCARGA=?METODO_DESCARGA '
      '  ,RECIBIDO=?RECIBIDO '
      '  ,ID_DOC=?ID_DOC'
      'WHERE'
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMDescargasGasAfterOpen
    AfterPost = QMDescargasGasAfterPost
    BeforeClose = QMDescargasGasBeforeClose
    BeforeDelete = QMDescargasGasBeforeDelete
    BeforeEdit = QMDescargasGasBeforeEdit
    BeforePost = QMDescargasGasBeforePost
    OnNewRecord = QMDescargasGasNewRecord
    ClavesPrimarias.Strings = (
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_CAB_DESCARGA'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMDescargasGasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDescargasGasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMDescargasGasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDescargasGasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDescargasGasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDescargasGasID_DESCARGA: TIntegerField
      DisplayLabel = 'ID Desc.'
      FieldName = 'ID_DESCARGA'
    end
    object QMDescargasGasFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
      OnChange = QMDescargasGasFECHA_INICIOChange
    end
    object QMDescargasGasFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
      OnChange = QMDescargasGasFECHA_CIERREChange
    end
    object QMDescargasGasTIEMPO_DESCARGA: TFloatField
      DisplayLabel = 'Tiempo Desc.'
      FieldName = 'TIEMPO_DESCARGA'
      OnGetText = QMDescargasGasTIEMPO_DESCARGAGetText
    end
    object QMDescargasGasORDEN_COMPRA: TIntegerField
      DisplayLabel = 'Orden Compra'
      FieldName = 'ORDEN_COMPRA'
    end
    object QMDescargasGasCOLA_CAMION: TIntegerField
      DisplayLabel = 'Cola Cami'#243'n'
      FieldName = 'COLA_CAMION'
    end
    object QMDescargasGasTURNO: TFIBStringField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
      Size = 3
    end
    object QMDescargasGasPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDescargasGasPRESION: TFloatField
      DisplayLabel = 'Presi'#243'n'
      FieldName = 'PRESION'
    end
    object QMDescargasGasTEMPERATURA: TFloatField
      DisplayLabel = 'Temp.'
      FieldName = 'TEMPERATURA'
    end
    object QMDescargasGasALBARAN_CONDUCE: TFloatField
      DisplayLabel = 'Alb. Conduce'
      FieldName = 'ALBARAN_CONDUCE'
    end
    object QMDescargasGasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDescargasGasID_DESCARGA_O: TIntegerField
      DisplayLabel = 'ID Desc. Orig.'
      FieldName = 'ID_DESCARGA_O'
    end
    object QMDescargasGasID_DESCARGA_D: TIntegerField
      DisplayLabel = 'ID Desc. Dest.'
      FieldName = 'ID_DESCARGA_D'
    end
    object QMDescargasGasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDescargasGasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDescargasGasORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDescargasGasDescEstado: TStringField
      DisplayLabel = 'Descrip. Estado'
      FieldKind = fkCalculated
      FieldName = 'DescEstado'
      Calculated = True
    end
    object QMDescargasGasDescTurno: TStringField
      DisplayLabel = 'Descrip. Turno'
      FieldKind = fkCalculated
      FieldName = 'DescTurno'
      OnGetText = QMDescargasGasDescTurnoGetText
      Calculated = True
    end
    object QMDescargasGasDESCARGA_FAC: TFloatField
      DisplayLabel = 'Descarga Fac.'
      FieldName = 'DESCARGA_FAC'
    end
    object QMDescargasGasNUMERO_FAC: TFIBStringField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'NUMERO_FAC'
      Size = 40
    end
    object QMDescargasGasRIC: TIntegerField
      DisplayLabel = 'Nro. RIC'
      FieldName = 'RIC'
    end
    object QMDescargasGasPROVEDOR: TIntegerField
      DisplayLabel = 'Prov.'
      FieldName = 'PROVEDOR'
    end
    object QMDescargasGasALBARAN_NUM: TIntegerField
      DisplayLabel = 'Nro. Albaran'
      FieldName = 'ALBARAN_NUM'
    end
    object QMDescargasGasPRESION_ANTE_DESC_COLA: TFloatField
      DisplayLabel = 'Presion Ant. Desc. Cola'
      FieldName = 'PRESION_ANTE_DESC_COLA'
    end
    object QMDescargasGasPRESION_FINAL_DESC_COLA: TFloatField
      DisplayLabel = 'Presion Final Desc. Cola'
      FieldName = 'PRESION_FINAL_DESC_COLA'
    end
    object QMDescargasGasTEMPERATURA_INICIAL_COLA: TFloatField
      DisplayLabel = 'Temp. Inicial Cola'
      FieldName = 'TEMPERATURA_INICIAL_COLA'
    end
    object QMDescargasGasTEMPERATURA_FINAL_COLA: TFloatField
      DisplayLabel = 'Temp. Final Cola'
      FieldName = 'TEMPERATURA_FINAL_COLA'
    end
    object QMDescargasGasFECHA_SALIDA_TERMINAL: TDateTimeField
      FieldName = 'FECHA_SALIDA_TERMINAL'
    end
    object QMDescargasGasFECHA_LLEGADA_SUCURSAL: TDateTimeField
      FieldName = 'FECHA_LLEGADA_SUCURSAL'
    end
    object QMDescargasGasROTO_GAUGE: TFloatField
      FieldName = 'ROTO_GAUGE'
    end
    object QMDescargasGasNUM_CABEZOTE: TFIBStringField
      FieldName = 'NUM_CABEZOTE'
      Size = 40
    end
    object QMDescargasGasCOD_CAMION: TIntegerField
      FieldName = 'COD_CAMION'
    end
    object QMDescargasGasCHOFER_COLA: TFIBStringField
      DisplayWidth = 25
      FieldName = 'CHOFER_COLA'
      Size = 25
    end
    object QMDescargasGasDENSIDAD: TFloatField
      FieldName = 'DENSIDAD'
    end
    object QMDescargasGasGLS_REC_TEMP_AMBIENTE: TFloatField
      FieldName = 'GLS_REC_TEMP_AMBIENTE'
    end
    object QMDescargasGasMETODO_DESCARGA: TFIBStringField
      FieldName = 'METODO_DESCARGA'
      Size = 25
    end
    object QMDescargasGasRECIBIDO: TFIBStringField
      FieldName = 'RECIBIDO'
      Size = 25
    end
    object QMDescargasGasCAPACIDAD_COLA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CAPACIDAD_COLA'
      OnGetText = QMDescargasGasCAPACIDAD_COLAGetText
      Calculated = True
    end
    object QMDescargasGasID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
      OnGetText = QMDescargasGasID_DOCGetText
    end
    object QMDescargasGasROTOGATE: TFloatField
      DisplayLabel = 'Rotogate'
      FieldName = 'ROTOGATE'
    end
  end
  object DSQMDescargasGas: TDataSource
    DataSet = QMDescargasGas
    Left = 144
    Top = 8
  end
  object QMTanque: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_DESC_TANQUE'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_DESC_TANQUE'
      '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_DESCARGA,LINEA,'
      '  COD_TANQUE,CAP_INICIAL,CAP_FINAL,UNID_CARGA,PRECIO,'
      '  IMPORTE_TOTAL,RIG_MOV,POR_INICIAL,POR_FINAL,'
      
        '  PRESION_INICIAL,PRESION_FINAL,TEMPERATURA_INICIAL,TEMPERATURA_' +
        'FINAL)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_DESCARGA,?LINEA,'
      '  ?COD_TANQUE,?CAP_INICIAL,?CAP_FINAL,?UNID_CARGA,?PRECIO,'
      '  ?IMPORTE_TOTAL,?RIG_MOV,?POR_INICIAL,?POR_FINAL,'
      
        '  ?PRESION_INICIAL,?PRESION_FINAL,?TEMPERATURA_INICIAL,?TEMPERAT' +
        'URA_FINAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_DESC_TANQUE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_DESC_TANQUE'
      'Where (Empresa=?Empresa and'
      '             Ejercicio=?Ejercicio and'
      '             Canal=?Canal  and'
      '             Serie=?Serie and'
      '             Rig=?Rig)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_DESC_TANQUE'
      'SET'
      '  ID_DESCARGA=?ID_DESCARGA '
      '  ,COD_TANQUE=?COD_TANQUE '
      '  ,CAP_INICIAL=?CAP_INICIAL '
      '  ,CAP_FINAL=?CAP_FINAL '
      '  ,UNID_CARGA=?UNID_CARGA '
      '  ,PRECIO=?PRECIO '
      '  ,IMPORTE_TOTAL=?IMPORTE_TOTAL '
      '  ,RIG_MOV=?RIG_MOV '
      '  ,POR_INICIAL=?POR_INICIAL '
      '  ,POR_FINAL=?POR_FINAL '
      '  ,PRESION_INICIAL=?PRESION_INICIAL '
      '  ,PRESION_FINAL=?PRESION_FINAL '
      '  ,TEMPERATURA_INICIAL=?TEMPERATURA_INICIAL '
      '  ,TEMPERATURA_FINAL=?TEMPERATURA_FINAL '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMDescargasGas
    AfterDelete = Graba
    AfterPost = QMTanqueAfterPost
    BeforeDelete = QMTanqueBeforeDelete
    BeforeEdit = QMTanqueBeforeEdit
    BeforeInsert = QMTanqueBeforeInsert
    OnNewRecord = QMTanqueNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_DESC_TANQUE'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMTanqueEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTanqueEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMTanqueCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTanqueSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMTanqueRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMTanqueID_DESCARGA: TIntegerField
      DisplayLabel = 'ID Desc.'
      FieldName = 'ID_DESCARGA'
    end
    object QMTanqueLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMTanqueCOD_TANQUE: TIntegerField
      DisplayLabel = 'Tanque'
      FieldName = 'COD_TANQUE'
    end
    object QMTanqueCAP_INICIAL: TFloatField
      DisplayLabel = 'Cap. Inicial'
      FieldName = 'CAP_INICIAL'
    end
    object QMTanqueCAP_FINAL: TFloatField
      DisplayLabel = 'Cap. Final'
      FieldName = 'CAP_FINAL'
    end
    object QMTanqueUNID_CARGA: TFloatField
      DisplayLabel = 'Uds. Carga'
      FieldName = 'UNID_CARGA'
    end
    object QMTanquePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMTanqueIMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Imp. Total'
      FieldName = 'IMPORTE_TOTAL'
    end
    object QMTanqueRIG_MOV: TIntegerField
      DisplayLabel = 'Stock'
      FieldName = 'RIG_MOV'
    end
    object QMTanquePOR_INICIAL: TFloatField
      DisplayLabel = 'Porc. Inic.'
      FieldName = 'POR_INICIAL'
    end
    object QMTanquePOR_FINAL: TFloatField
      DisplayLabel = 'Porc. Final'
      FieldName = 'POR_FINAL'
    end
    object QMTanqueCapacidad: TStringField
      FieldKind = fkCalculated
      FieldName = 'Capacidad'
      OnGetText = QMTanqueCapacidadGetText
      Calculated = True
    end
    object QMTanqueDescTanque: TStringField
      DisplayLabel = 'Descripci'#243'n.'
      FieldKind = fkCalculated
      FieldName = 'DescTanque'
      OnGetText = QMTanqueDescTanqueGetText
      Calculated = True
    end
    object QMTanquePRESION_INICIAL: TFloatField
      FieldName = 'PRESION_INICIAL'
    end
    object QMTanquePRESION_FINAL: TFloatField
      FieldName = 'PRESION_FINAL'
    end
    object QMTanqueTEMPERATURA_INICIAL: TFloatField
      FieldName = 'TEMPERATURA_INICIAL'
    end
    object QMTanqueTEMPERATURA_FINAL: TFloatField
      FieldName = 'TEMPERATURA_FINAL'
    end
  end
  object DSQMTanque: TDataSource
    DataSet = QMTanque
    Left = 144
    Top = 56
  end
  object QMDispensador: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_DESC_DISP'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_DESC_DISP'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_DESCARGA,LINEA,COD_DISP,' +
        'LECTURA_INICIAL,LECTURA_FINAL,UNID_DISPENSADAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_DESCARGA,?LINEA,?C' +
        'OD_DISP,?LECTURA_INICIAL,?LECTURA_FINAL,?UNID_DISPENSADAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_DESC_DISP'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_DESC_DISP'
      'Where (Empresa=?Empresa and'
      '             Ejercicio=?Ejercicio and'
      '             Canal=?Canal  and'
      '             Serie=?Serie and'
      '             Rig=?Rig)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_DESC_DISP'
      'SET'
      '  ID_DESCARGA=?ID_DESCARGA '
      '  ,COD_DISP=?COD_DISP '
      '  ,LECTURA_INICIAL=?LECTURA_INICIAL '
      '  ,LECTURA_FINAL=?LECTURA_FINAL '
      '  ,UNID_DISPENSADAS=?UNID_DISPENSADAS '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMDescargasGas
    AfterDelete = Graba
    AfterPost = QMDispensadorAfterPost
    BeforeDelete = QMDispensadoresBeforeDelete
    BeforeEdit = QMDispensadoresBeforeEdit
    BeforeInsert = QMDispensadoresBeforeInsert
    OnNewRecord = QMDispensadoresNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_DESC_DISP'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object QMDispensadorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDispensadorEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMDispensadorCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDispensadorSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDispensadorRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDispensadorID_DESCARGA: TIntegerField
      DisplayLabel = 'ID Desc.'
      FieldName = 'ID_DESCARGA'
    end
    object QMDispensadorLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDispensadorCOD_DISP: TIntegerField
      DisplayLabel = 'Dispensador'
      FieldName = 'COD_DISP'
    end
    object QMDispensadorLECTURA_INICIAL: TFloatField
      DisplayLabel = 'Lectura Ini.'
      FieldName = 'LECTURA_INICIAL'
    end
    object QMDispensadorLECTURA_FINAL: TFloatField
      DisplayLabel = 'Lectura Final'
      FieldName = 'LECTURA_FINAL'
    end
    object QMDispensadorUNID_DISPENSADAS: TFloatField
      DisplayLabel = 'Uds. Dispensadas'
      FieldName = 'UNID_DISPENSADAS'
    end
    object QMDispensadorDescDispensador: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescDispensador'
      OnGetText = QMDispensadorDescDispensadorGetText
      Calculated = True
    end
  end
  object DSQMDispensador: TDataSource
    DataSet = QMDispensador
    Left = 144
    Top = 104
  end
  object DSxTanque: TDataSource
    DataSet = xTanque
    Left = 144
    Top = 200
  end
  object xTanque: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, CAPACIDAD, ALMACEN FROM SYS_GAS_TANQUE'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'COD_TANQUE=?COD_TANQUE')
    UniDirectional = False
    Left = 40
    Top = 200
    object xTanqueTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xTanqueCAPACIDAD: TFloatField
      DisplayLabel = 'Capacidad'
      FieldName = 'CAPACIDAD'
    end
    object xTanqueALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
  end
  object DSxEstados: TDataSource
    DataSet = xEstados
    Left = 144
    Top = 296
  end
  object xEstados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_GAS_ESTADOS'
      'WHERE ESTADO=?ESTADO')
    UniDirectional = False
    DataSource = DSQMDescargasGas
    Left = 40
    Top = 296
    object xEstadosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xEstadosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object DSxDispensador: TDataSource
    DataSet = xDispensador
    Left = 144
    Top = 152
  end
  object xDispensador: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_GAS_DISPENSADOR'
      'where cod_dispensador=?dispensador '
      ''
      '')
    UniDirectional = False
    Left = 40
    Top = 152
    object xDispensadorCOD_DISPENSADOR: TIntegerField
      DisplayLabel = 'Cod. Dispensador'
      FieldName = 'COD_DISPENSADOR'
    end
    object xDispensadorTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDispensadorESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xDispensadorNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSxInfoSumTanque: TDataSource
    DataSet = xInfoSumTanque
    Left = 352
    Top = 56
  end
  object xInfoSumTanque: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select * from ges_gas_cab_venta'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and serie=?serie and rig=?rig')
    SelectSQL.Strings = (
      'SELECT SUM(UNID_CARGA) TOTAL_UNID FROM GES_GAS_DET_DESC_TANQUE'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL  AND'
      'SERIE=?SERIE AND'
      'RIG=?RIG')
    UniDirectional = False
    DataSource = DSQMDescargasGas
    Left = 248
    Top = 56
    object xInfoSumTanqueTOTAL_UNID: TFloatField
      DisplayLabel = 'Total Uds.'
      FieldName = 'TOTAL_UNID'
    end
    object xInfoSumTanqueDIFERENCIA: TFloatField
      DisplayLabel = 'Diferencia'
      FieldKind = fkCalculated
      FieldName = 'DIFERENCIA'
      OnGetText = xInfoSumTanqueDIFERENCIAGetText
      Calculated = True
    end
    object xInfoSumTanqueRECIBIDOS_SUMINISTRADOS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RECIBIDOS_SUMINISTRADOS'
      OnGetText = xInfoSumTanqueRECIBIDOS_SUMINISTRADOSGetText
      Calculated = True
    end
  end
  object DSxInfoSumDispensador: TDataSource
    DataSet = xInfoSumDispensador
    Left = 352
    Top = 104
  end
  object xInfoSumDispensador: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select * from ges_gas_cab_venta'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and serie=?serie and rig=?rig')
    SelectSQL.Strings = (
      
        'SELECT SUM(UNID_DISPENSADAS) TOTAL_UNID FROM GES_GAS_DET_DESC_DI' +
        'SP'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL  AND'
      'SERIE=?SERIE AND'
      'RIG=?RIG')
    UniDirectional = False
    DataSource = DSQMDescargasGas
    Left = 248
    Top = 104
    object xInfoSumDispensadorTOTAL_UNID: TFloatField
      DisplayLabel = 'Total. Uds.'
      FieldName = 'TOTAL_UNID'
    end
  end
end
