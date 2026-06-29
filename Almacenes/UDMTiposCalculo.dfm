object DMTiposCalculo: TDMTiposCalculo
  OldCreateOrder = False
  OnCreate = DMTarifasCreate
  Left = 441
  Top = 419
  Height = 246
  Width = 270
  object QMTiposCalculo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_TARIFAS_CALCULOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CALCULO=?old_CALCULO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_TARIFAS_CALCULOS'
      
        '  (EMPRESA,'#13#10'CALCULO,TITULO,TIPO_REDONDEO,COMISION,CARGO_PORCENT' +
        'UAL,CARGO_LINEAL,DESCUENTO,CARGO_COMERCIAL,PRECIO_PUNTOS,RE_INCL' +
        'UIDO,'#13#10'TIPO_PRECIO_BASE,ULT_MODIFICACION,FACTOR)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?CALCULO,?TITULO,?TIPO_REDONDEO,?COMISION,?CARGO_P' +
        'ORCENTUAL,?CARGO_LINEAL,?DESCUENTO,?CARGO_COMERCIAL,?PRECIO_PUNT' +
        'OS,?RE_INCLUIDO,'#13#10'?TIPO_PRECIO_BASE,?ULT_MODIFICACION,?FACTOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_TARIFAS_CALCULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CALCULO=?CALCULO ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_TARIFAS_CALCULOS'
      'WHERE'
      'EMPRESA = ?EMPRESA'
      'ORDER BY CALCULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_TARIFAS_CALCULOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,TIPO_REDONDEO=?TIPO_REDONDEO '
      '  ,COMISION=?COMISION '
      '  ,CARGO_PORCENTUAL=?CARGO_PORCENTUAL '
      '  ,CARGO_LINEAL=?CARGO_LINEAL '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,CARGO_COMERCIAL=?CARGO_COMERCIAL '
      '  ,PRECIO_PUNTOS=?PRECIO_PUNTOS '
      '  ,RE_INCLUIDO=?RE_INCLUIDO '
      '  ,TIPO_PRECIO_BASE=?TIPO_PRECIO_BASE '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,FACTOR=?FACTOR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CALCULO=?CALCULO ')
    AfterDelete = Graba
    AfterOpen = QMTiposCalculoAfterOpen
    AfterPost = Graba
    BeforePost = QMTiposCalculoBeforePost
    OnNewRecord = QMTiposCalculoNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'CALCULO')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_TARIFAS_CALCULOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 30
    Top = 16
    object QMTiposCalculoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTiposCalculoCALCULO: TIntegerField
      DisplayLabel = 'Calculo'
      FieldName = 'CALCULO'
    end
    object QMTiposCalculoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMTiposCalculoTIPO_REDONDEO: TIntegerField
      DisplayLabel = 'Tipo Redondeo'
      FieldName = 'TIPO_REDONDEO'
      OnChange = QMTiposCalculoTIPO_REDONDEOChange
    end
    object QMTiposCalculoCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object QMTiposCalculoCARGO_PORCENTUAL: TFloatField
      DisplayLabel = 'Cargo Porcent.'
      FieldName = 'CARGO_PORCENTUAL'
    end
    object QMTiposCalculoCARGO_LINEAL: TFloatField
      DisplayLabel = 'Cargo Lin.'
      FieldName = 'CARGO_LINEAL'
    end
    object QMTiposCalculoDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object QMTiposCalculoCARGO_COMERCIAL: TFloatField
      DisplayLabel = 'Cargo Com.'
      FieldName = 'CARGO_COMERCIAL'
    end
    object QMTiposCalculoPRECIO_PUNTOS: TFloatField
      DisplayLabel = 'Precio Puntos'
      FieldName = 'PRECIO_PUNTOS'
    end
    object QMTiposCalculoTIPO_PRECIO_BASE: TIntegerField
      DisplayLabel = 'Tipo Precio Base'
      FieldName = 'TIPO_PRECIO_BASE'
      OnChange = QMTiposCalculoTIPO_PRECIO_BASEChange
    end
    object QMTiposCalculoFACTOR: TFloatField
      DisplayLabel = 'Factor'
      FieldName = 'FACTOR'
    end
  end
  object DSQMTiposCalculo: TDataSource
    DataSet = QMTiposCalculo
    Left = 126
    Top = 14
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 212
    Top = 12
  end
  object xTipoRedondeo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_REDONDEOS'
      'WHERE TIPO_REDONDEO=?TIPO_REDONDEO')
    UniDirectional = False
    DataSource = DSQMTiposCalculo
    Left = 34
    Top = 66
    object xTipoRedondeoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object xTiposPrecioBase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_PRECIO_BASE'
      'WHERE TIPO_PRECIO_BASE  = ?TIPO_PRECIO_BASE')
    UniDirectional = False
    DataSource = DSQMTiposCalculo
    Left = 34
    Top = 122
    object xTiposPrecioBaseTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object DSxTipoRedondeo: TDataSource
    DataSet = xTipoRedondeo
    Left = 126
    Top = 66
  end
  object DSxTiposPrecioBase: TDataSource
    DataSet = xTiposPrecioBase
    Left = 126
    Top = 130
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 212
    Top = 60
  end
end
