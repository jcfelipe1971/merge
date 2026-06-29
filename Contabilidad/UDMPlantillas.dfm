object DMPlantillas: TDMPlantillas
  OldCreateOrder = False
  OnCreate = DMPlantillasCreate
  Left = 624
  Top = 285
  Height = 296
  Width = 279
  object QMPlantillas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_PLANTILLAS_CON'
      'WHERE'
      '  PLANTILLA=?old_PLANTILLA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_PLANTILLAS_CON'
      
        '  (PLANTILLA,ENTRADA,NOMBRE,TITULO,LINEAS,TIPO,MONEDA,CONCEPTO_C' +
        'OMUN,CONCEPTO_PROPIO,BANCO)'
      'VALUES'
      
        '  (?PLANTILLA,?ENTRADA,?NOMBRE,?TITULO,?LINEAS,?TIPO,?MONEDA,?CO' +
        'NCEPTO_COMUN,?CONCEPTO_PROPIO,?BANCO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PLANTILLAS_CON'
      'WHERE'
      '  PLANTILLA=?old_PLANTILLA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PLANTILLAS_CON             '
      'ORDER BY PLANTILLA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_PLANTILLAS_CON'
      'SET'
      '  ENTRADA=?ENTRADA '
      '  ,NOMBRE=?NOMBRE '
      '  ,TITULO=?TITULO '
      '  ,LINEAS=?LINEAS '
      '  ,TIPO=?TIPO '
      '  ,MONEDA=?MONEDA '
      '  ,CONCEPTO_COMUN=?CONCEPTO_COMUN'
      '  ,CONCEPTO_PROPIO=?CONCEPTO_PROPIO'
      '  ,BANCO=?BANCO'
      'WHERE'
      '  PLANTILLA=?PLANTILLA ')
    AfterDelete = Graba
    AfterOpen = QMPlantillasAfterOpen
    AfterPost = Graba
    BeforeEdit = QMPlantillasBeforeEdit
    BeforePost = QMPlantillasBeforePost
    OnNewRecord = QMPlantillasNewRecord
    ClavesPrimarias.Strings = (
      'PLANTILLA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_PLANTILLAS_CON'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 18
    object QMPlantillasPLANTILLA: TIntegerField
      DisplayLabel = 'Plantilla'
      FieldName = 'PLANTILLA'
    end
    object QMPlantillasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 40
      BlanksToNULL = False
    end
    object QMPlantillasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      OnChange = QMPlantillasTIPOChange
      Size = 3
      BlanksToNULL = False
    end
    object QMPlantillasTITULO: TFIBStringField
      DisplayLabel = 'Titulo de Tipo'
      FieldName = 'TITULO'
      Size = 100
      BlanksToNULL = False
    end
    object QMPlantillasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMPlantillasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      OnChange = QMPlantillasMONEDAChange
      Size = 3
    end
    object QMPlantillasCONCEPTO_COMUN: TIntegerField
      DisplayLabel = 'C. Comun'
      FieldName = 'CONCEPTO_COMUN'
    end
    object QMPlantillasCONCEPTO_PROPIO: TIntegerField
      DisplayLabel = 'C. Propio'
      FieldName = 'CONCEPTO_PROPIO'
    end
    object QMPlantillasBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
  end
  object DSQMPlantillas: TDataSource
    DataSet = QMPlantillas
    Left = 106
    Top = 20
  end
  object xTipo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_ASIENTO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_ASIENTO'
      'WHERE TIPO=?TIPO')
    UniDirectional = False
    DataSource = DSQMPlantillas
    Left = 28
    Top = 120
  end
  object DSxTipo: TDataSource
    DataSet = xTipo
    Left = 106
    Top = 122
  end
  object xMoneda: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MONEDAS'
      'WHERE'
      '  MONEDA=?MONEDA ')
    SelectSQL.Strings = (
      'SELECT MONEDA,TITULO FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    DataSource = DSQMPlantillas
    Left = 30
    Top = 176
  end
  object DSxMoneda: TDataSource
    DataSet = xMoneda
    Left = 106
    Top = 176
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_PLANTILLAS_CON_DETALLE'
      'WHERE'
      '  PLANTILLA=?old_PLANTILLA AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_PLANTILLAS_CON_DETALLE'
      '  (IMPORTE,PLANTILLA,LINEA,TEXTO,CARGO,ABONO)'
      'VALUES'
      '  (?IMPORTE,?PLANTILLA,?LINEA,?TEXTO,?CARGO,?ABONO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PLANTILLAS_CON_DETALLE'
      'WHERE'
      '  PLANTILLA=?PLANTILLA AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PLANTILLAS_CON_DETALLE     '
      'where plantilla = ?plantilla order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_PLANTILLAS_CON_DETALLE'
      'SET'
      '  IMPORTE=?IMPORTE '
      '  ,TEXTO=?TEXTO '
      '  ,CARGO=?CARGO '
      '  ,ABONO=?ABONO '
      'WHERE'
      '  PLANTILLA=?PLANTILLA AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMPlantillas
    AfterDelete = Graba
    AfterPost = QMDetalleAfterPost
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'PLANTILLA '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_PLANTILLAS_CON_DETALLE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 26
    Top = 70
    object QMDetallePLANTILLA: TIntegerField
      DisplayLabel = 'Plantilla'
      FieldName = 'PLANTILLA'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleCARGO: TFIBStringField
      DisplayLabel = 'Cuenta Cargo'
      FieldName = 'CARGO'
      Size = 15
    end
    object QMDetalleABONO: TFIBStringField
      DisplayLabel = 'Cuenta Abono'
      FieldName = 'ABONO'
      Size = 15
    end
    object QMDetalleIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMDetalleTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object QMDetalleCENTRO_COSTE: TIntegerField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 108
    Top = 70
  end
  object SPLineaSiguiente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure c_plantillas_linea_siguiente(?plantilla)')
    Transaction = TLocal
    AutoTrans = True
    Left = 192
    Top = 80
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 192
    Top = 24
  end
  object QCambiaMoneda: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE c_plantillas_cambia_moneda '
      '(?PLANTILLA,?MONEDAOLD,?MONEDA,?FECHA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 194
    Top = 136
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 192
    Top = 192
  end
end
