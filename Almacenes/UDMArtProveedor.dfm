object DMArtProveedor: TDMArtProveedor
  OldCreateOrder = False
  OnCreate = DMArtProvCreate
  Left = 431
  Top = 299
  Height = 274
  Width = 490
  object QMTarifasProv: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ART_TARIFAS_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PROVEEDOR=?old_PROVEEDOR AND '
      '  TARIFA=?old_TARIFA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ART_TARIFAS_PROVEEDOR'
      
        '  (FECHA_INICIO,FECHA_FINAL,PROVEEDOR,DESCUENTO1,DESCUENTO2,DESC' +
        'UENTO3,EMPRESA,EJERCICIO,CANAL,TITULO,TITULO_PROVEEDOR,TARIFA,MO' +
        'NEDA,ULT_MODIFICACION)'
      'VALUES'
      
        '  (?FECHA_INICIO,?FECHA_FINAL,?PROVEEDOR,?DESCUENTO1,?DESCUENTO2' +
        ',?DESCUENTO3,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?TITULO_PROVEEDO' +
        'R,?TARIFA,?MONEDA,?ULT_MODIFICACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  TARIFA=?TARIFA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_PROVEEDOR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL '
      'ORDER BY PROVEEDOR, TARIFA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ART_TARIFAS_PROVEEDOR'
      'SET'
      '  FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_FINAL=?FECHA_FINAL '
      '  ,DESCUENTO1=?DESCUENTO1 '
      '  ,DESCUENTO2=?DESCUENTO2 '
      '  ,DESCUENTO3=?DESCUENTO3 '
      '  ,TITULO=?TITULO '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,MONEDA=?MONEDA '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  TARIFA=?TARIFA ')
    Plan.Strings = (
      ' ')
    AfterOpen = QMTarifasProvAfterOpen
    AfterPost = QMTarifasProvAfterPost
    BeforeClose = QMTarifasProvBeforeClose
    BeforeEdit = QMTarifasProvBeforeEdit
    BeforePost = QMTarifasProvBeforePost
    OnNewRecord = QMTarifasProvNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PROVEEDOR '
      'TARIFA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_TARIFAS_PROVEEDOR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMTarifasProvEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTarifasProvEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTarifasProvCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTarifasProvPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      OnChange = QMTarifasProvPROVEEDORChange
    end
    object QMTarifasProvTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMTarifasProvTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMTarifasProvFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Inicio'
      FieldName = 'FECHA_INICIO'
    end
    object QMTarifasProvFECHA_FINAL: TDateTimeField
      DisplayLabel = 'Fec. Final'
      FieldName = 'FECHA_FINAL'
    end
    object QMTarifasProvDESCUENTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO1'
    end
    object QMTarifasProvDESCUENTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO2'
    end
    object QMTarifasProvDESCUENTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO3'
    end
    object QMTarifasProvMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      OnChange = QMTarifasProvMONEDAChange
      Size = 3
    end
    object QMTarifasProvTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo Proveedor'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMTarifasProvULT_MODIFICACION: TDateTimeField
      DisplayLabel = 'Ult. Modif.'
      FieldName = 'ULT_MODIFICACION'
    end
  end
  object DSQMTarifasProv: TDataSource
    DataSet = QMTarifasProv
    Left = 136
    Top = 16
  end
  object QMTarifasProvArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ART_TARIFAS_PROV_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PROVEEDOR=?old_PROVEEDOR AND '
      '  TARIFA=?old_TARIFA AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ART_TARIFAS_PROV_DETALLE'
      
        '  (P_COSTE,PROVEEDOR,EMPRESA,EJERCICIO,CANAL,TITULO,ARTICULO_PRO' +
        'VEEDOR,TARIFA,ARTICULO,ALFA_1,ALFA_2,ALFA_3,ALFA_4,ALFA_5,ALFA_6' +
        ',ALFA_7,ALFA_8)'
      'VALUES'
      
        '  (?P_COSTE,?PROVEEDOR,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?ARTIC' +
        'ULO_PROVEEDOR,?TARIFA,?ARTICULO,?ALFA_1,?ALFA_2,?ALFA_3,?ALFA_4,' +
        '?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_PROV_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  TARIFA=?TARIFA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_PROV_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  TARIFA=?TARIFA '
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ART_TARIFAS_PROV_DETALLE'
      'SET'
      '  P_COSTE=?P_COSTE '
      '  ,TITULO=?TITULO '
      '  ,ARTICULO_PROVEEDOR=?ARTICULO_PROVEEDOR '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,ALFA_3=?ALFA_3 '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,ALFA_6=?ALFA_6 '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  TARIFA=?TARIFA AND '
      '  ARTICULO=?ARTICULO ')
    DataSource = DSQMTarifasProv
    Plan.Strings = (
      ' ')
    BeforeEdit = QMTarifasProvArtBeforeEdit
    BeforeInsert = QMTarifasProvArtBeforeInsert
    BeforePost = QMTarifasProvArtBeforePost
    OnNewRecord = QMTarifasProvArtNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PROVEEDOR '
      'TARIFA '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_TARIFAS_PROV_DETALLE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMTarifasProvArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTarifasProvArtEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTarifasProvArtCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTarifasProvArtPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMTarifasProvArtTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMTarifasProvArtARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMTarifasProvArtARTICULOChange
      Size = 15
    end
    object QMTarifasProvArtTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMTarifasProvArtARTICULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Art'#237'culo Prov.'
      DisplayWidth = 40
      FieldName = 'ARTICULO_PROVEEDOR'
      Size = 40
    end
    object QMTarifasProvArtP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMTarifasProvArtALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMTarifasProvArtALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMTarifasProvArtALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMTarifasProvArtALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMTarifasProvArtALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMTarifasProvArtALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMTarifasProvArtALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMTarifasProvArtALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMTarifasProvArtULT_MODIFICACION: TDateTimeField
      DisplayLabel = 'Ult. Modif.'
      FieldName = 'ULT_MODIFICACION'
    end
  end
  object DSQMTarifasProvArt: TDataSource
    DataSet = QMTarifasProvArt
    Left = 136
    Top = 64
  end
  object SPIncrementoPorcentual: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure A_Art_Tarifas_Inc_Porcent(?empresa,?ejercicio,' +
        '?canal,?proveedor,?Tarifa,?Incremento)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 304
    Top = 16
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    DataSource = DSQMTarifasProv
    Left = 32
    Top = 112
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 136
    Top = 112
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 408
    Top = 16
  end
  object QArtProveedor: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT CODIGO_PROVEEDOR'
      'FROM ART_ARTICULOS_CODPROV'
      'WHERE EMPRESA=?EMPRESA AND '
      '               ARTICULO=?ARTICULO AND '
      '               PROVEEDOR=?PROVEEDOR')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 304
    Top = 64
  end
  object SPCambiaMoneda: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'EXECUTE PROCEDURE ut_refresca_detalle_tar_prov (?EMPRESA,?EJERCI' +
        'CIO,?CANAL,'
      '?PROVEEDOR,?TARIFA,?MONEDAOLD,?MONEDA,?FECHA)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 304
    Top = 112
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 408
    Top = 64
  end
end
