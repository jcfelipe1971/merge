object ProDMMatInc: TProDMMatInc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 447
  Top = 263
  Height = 278
  Width = 439
  object QMProCabInc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MAT_INC_C'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MAT_INC_C'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,FECHA,ORDEN,FASES,ID_ORDEN,' +
        ' ALMACEN_LAN,ALMACEN_SAL,LINEA_FASE)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?FECHA,?ORDEN,?FASES,?' +
        'ID_ORDEN,?ALMACEN_LAN,?ALMACEN_SAL,?LINEA_FASE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MAT_INC_C'
      'WHERE'
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_MAT_INC_C'
      
        'WHERE empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and '
      '          serie=?serie'
      'ORDER BY empresa,ejercicio,canal,serie,rig')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MAT_INC_C'
      'SET'
      '  FECHA=?FECHA '
      '  ,ORDEN=?ORDEN '
      '  ,FASES=?FASES'
      '  ,ID_ORDEN=?ID_ORDEN'
      '  ,ALMACEN_LAN=?ALMACEN_LAN'
      '  ,ALMACEN_SAL=?ALMACEN_SAL'
      '  ,LINEA_FASE=?LINEA_FASE'
      'WHERE'
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      '')
    AfterDelete = Graba
    AfterOpen = QMProCabIncAfterOpen
    AfterPost = Graba
    AfterScroll = QMProCabIncAfterScroll
    BeforeClose = QMProCabIncBeforeClose
    BeforePost = QMProCabIncBeforePost
    OnCalcFields = QMProCabIncCalcFields
    OnNewRecord = QMProCabIncNewRecord
    ClavesPrimarias.Strings = (
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MAT_INC_C'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMProCabIncEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProCabIncEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProCabIncCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProCabIncSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProCabIncRIG: TIntegerField
      DisplayLabel = 'Parte N'#186
      FieldName = 'RIG'
    end
    object QMProCabIncFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMProCabIncORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProCabIncFASES: TFIBStringField
      DisplayLabel = 'Fases'
      FieldName = 'FASES'
      Size = 3
    end
    object QMProCabIncDESCRIPFASE: TStringField
      DisplayLabel = 'Desc. Fase'
      FieldKind = fkCalculated
      FieldName = 'DESCRIPFASE'
      Size = 100
      Calculated = True
    end
    object QMProCabIncCOMPUESTO: TStringField
      DisplayLabel = 'Compuesto'
      FieldKind = fkCalculated
      FieldName = 'COMPUESTO'
      Size = 100
      Calculated = True
    end
    object QMProCabIncID_CIERRE: TIntegerField
      DisplayLabel = 'ID Cierre'
      FieldName = 'ID_CIERRE'
    end
    object QMProCabIncSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMProCabIncLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMProCabIncID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
      OnChange = QMProCabIncID_ORDENChange
    end
    object QMProCabIncID_INC_C: TIntegerField
      DisplayLabel = 'ID Inc. Cab.'
      FieldName = 'ID_INC_C'
    end
    object QMProCabIncALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMProCabIncALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QMProCabIncRIG_MOV: TIntegerField
      DisplayLabel = 'Movim.'
      FieldName = 'RIG_MOV'
    end
    object QMProCabIncTITULO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      Size = 60
      Calculated = True
    end
  end
  object DSQMProCabInc: TDataSource
    DataSet = QMProCabInc
    Left = 136
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 240
    Top = 8
  end
  object QMProDetInc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MAT_INC_D'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG_OF=?old_RIG_OF AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MAT_INC_D'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG_OF,LINEA,COMPONENTE,UNDS,PR' +
        'E_COS_UNI,TOTAL,NOTAS,'
      '   ID_UBICACION,ID_NRO_SERIE_KRI, NRO_SERIE_LOTE,ID_LOTE)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG_OF,?LINEA,?COMPONENTE,' +
        '?UNDS,?PRE_COS_UNI,?TOTAL,?NOTAS,'
      '   ?ID_UBICACION,?ID_NRO_SERIE_KRI,?NRO_SERIE_LOTE,?ID_LOTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MAT_INC_D'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_MAT_INC_D'
      'WHERE   RIG_OF=?RIG AND '
      '     SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA '
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MAT_INC_D'
      'SET'
      '  COMPONENTE=?COMPONENTE '
      '  ,UNDS=?UNDS '
      '  ,PRE_COS_UNI=?PRE_COS_UNI '
      '  ,TOTAL=?TOTAL '
      '  ,NOTAS=?NOTAS '
      '  ,ID_UBICACION=?ID_UBICACION'
      '  ,ID_NRO_SERIE_KRI=?ID_NRO_SERIE_KRI'
      '  ,NRO_SERIE_LOTE=?NRO_SERIE_LOTE'
      '  ,ID_LOTE=?ID_LOTE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG_OF=?RIG_OF AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMProCabInc
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMProDetIncBeforePost
    OnNewRecord = QMProDetIncNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG_OF '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MAT_INC_D'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
    object QMProDetIncEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProDetIncEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProDetIncCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProDetIncSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProDetIncRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.F.'
      FieldName = 'RIG_OF'
    end
    object QMProDetIncLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMProDetIncCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      OnChange = QMProDetIncCOMPONENTEChange
      Size = 15
    end
    object QMProDetIncUNDS: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNDS'
      OnChange = QMProDetIncUNDSChange
    end
    object QMProDetIncPRE_COS_UNI: TFloatField
      DisplayLabel = 'P. Coste Uni.'
      FieldName = 'PRE_COS_UNI'
      OnChange = QMProDetIncPRE_COS_UNIChange
    end
    object QMProDetIncTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMProDetIncNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMProDetIncDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      OnGetText = QMProDetIncDescripcionGetText
      Size = 100
      Calculated = True
    end
    object QMProDetIncID_CIERRE: TIntegerField
      DisplayLabel = 'ID Cierre'
      FieldName = 'ID_CIERRE'
    end
    object QMProDetIncID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Orden Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMProDetIncN_MOV_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
      FieldName = 'N_MOV_STOCK'
    end
    object QMProDetIncALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMProDetIncID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProDetIncID_INC_C: TIntegerField
      DisplayLabel = 'ID Inc. Cab.'
      FieldName = 'ID_INC_C'
    end
    object QMProDetIncID_INC_D: TIntegerField
      DisplayLabel = 'ID Inc. Det.'
      FieldName = 'ID_INC_D'
    end
    object QMProDetIncID_ORDEN_MAT_COMPRA: TIntegerField
      DisplayLabel = 'ID Orden Mat. Compra'
      FieldName = 'ID_ORDEN_MAT_COMPRA'
    end
    object QMProDetIncID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMProDetIncID_NRO_SERIE_KRI: TIntegerField
      DisplayLabel = 'ID Serie/Lote'
      FieldName = 'ID_NRO_SERIE_KRI'
    end
    object QMProDetIncNRO_SERIE_LOTE: TFIBStringField
      DisplayLabel = 'Nro. Serie/Lote'
      FieldName = 'NRO_SERIE_LOTE'
      Size = 25
    end
    object QMProDetIncTITULO_UBICACION: TStringField
      DisplayLabel = 'Ubicacion'
      FieldKind = fkCalculated
      FieldName = 'TITULO_UBICACION'
      OnGetText = QMProDetIncTITULO_UBICACIONGetText
      Size = 60
      Calculated = True
    end
    object QMProDetIncLINEA_MOV: TIntegerField
      DisplayLabel = 'Linea Mov.'
      FieldName = 'LINEA_MOV'
    end
    object QMProDetIncID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
      OnChange = QMProDetIncID_LOTEChange
    end
    object QMProDetIncDescLote: TStringField
      DisplayLabel = 'Lote'
      FieldKind = fkCalculated
      FieldName = 'DescLote'
      OnGetText = QMProDetIncDescLoteGetText
      Calculated = True
    end
  end
  object DSQMProDetInc: TDataSource
    DataSet = QMProDetInc
    Left = 136
    Top = 56
  end
  object xComprobarOF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'select situacion from pro_ord'
      'where id_orden=?id_orden')
    UniDirectional = False
    DataSource = DSQMProCabInc
    Left = 32
    Top = 104
    object xComprobarOFSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
  end
  object DsxComporbarOF: TDataSource
    DataSet = xComprobarOF
    Left = 136
    Top = 104
  end
  object xTotalDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select sum(total) as TotalDetalle from pro_mat_inc_d'
      'where id_inc_c=?id_inc_c')
    UniDirectional = False
    DataSource = DSQMProCabInc
    Left = 32
    Top = 152
    object xTotalDetalleTOTALDETALLE: TFloatField
      DisplayLabel = 'Total Detalle'
      FieldName = 'TOTALDETALLE'
    end
  end
  object DSxTotalDetalle: TDataSource
    DataSet = xTotalDetalle
    Left = 136
    Top = 152
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 328
    Top = 8
  end
end
