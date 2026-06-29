object DMGenSeries: TDMGenSeries
  OldCreateOrder = False
  OnCreate = DMGenSeriesCreate
  Left = 465
  Top = 335
  Height = 288
  Width = 419
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
    Top = 16
  end
  object QMGenSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GEN_SERIES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  SERIE=?old_SERIE ')
    InsertSQL.Strings = (
      'INSERT INTO GEN_SERIES'
      
        '  (EMPRESA,'#13#10'SERIE,ACTIVO,TITULO,PROVINCIA,RECT,SFV_AUTORIZACION' +
        ',Z_TIPO_NCF,EMITIDA_POR_TERCEROS,PREFIJO_FAC_TERCERO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?SERIE,?ACTIVO,?TITULO,?PROVINCIA,?RECT,?SFV_AUTOR' +
        'IZACION,?Z_TIPO_NCF,?EMITIDA_POR_TERCEROS,?PREFIJO_FAC_TERCERO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GEN_SERIES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE ')
    SelectSQL.Strings = (
      'SELECT * FROM GEN_SERIES'
      'where empresa=?empresa'
      'order by serie')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GEN_SERIES'
      'SET'
      '  ACTIVO=?ACTIVO '
      '  ,TITULO=?TITULO '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,RECT=?RECT '
      '  ,SFV_AUTORIZACION=?SFV_AUTORIZACION '
      '  ,Z_TIPO_NCF=?Z_TIPO_NCF '
      '  ,EMITIDA_POR_TERCEROS=?EMITIDA_POR_TERCEROS '
      '  ,PREFIJO_FAC_TERCERO=?PREFIJO_FAC_TERCERO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE ')
    AfterOpen = QMGenSeriesAfterOpen
    BeforeClose = QMGenSeriesBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'SERIE')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GEN_SERIES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 16
    object QMGenSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMGenSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMGenSeriesACTIVO: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVO'
    end
    object QMGenSeriesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMGenSeriesPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      OnChange = QMGenSeriesPROVINCIAChange
      Size = 2
    end
    object QMGenSeriesRECT: TIntegerField
      DisplayLabel = 'Rectificativa'
      FieldName = 'RECT'
    end
    object QMGenSeriesSFV_AUTORIZACION: TFIBStringField
      DisplayLabel = 'SFV Autorizacion'
      FieldName = 'SFV_AUTORIZACION'
    end
    object QMGenSeriesZ_TIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'Z_TIPO_NCF'
    end
    object QMGenSeriesEMITIDA_POR_TERCEROS: TIntegerField
      DisplayLabel = 'Emit. por Terceros'
      FieldName = 'EMITIDA_POR_TERCEROS'
    end
    object QMGenSeriesPREFIJO_FAC_TERCERO: TFIBStringField
      DisplayLabel = 'Prefijo Fac. Tercero'
      FieldName = 'PREFIJO_FAC_TERCERO'
      Size = 60
    end
  end
  object DSQMGenSeries: TDataSource
    DataSet = QMGenSeries
    Left = 160
    Top = 16
  end
  object xProvincia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo'
      'from sys_provincias'
      'where provincia=?provincia')
    UniDirectional = False
    DataSource = DSQMGenSeries
    Left = 56
    Top = 64
  end
  object DSxPronvicia: TDataSource
    DataSet = xProvincia
    Left = 160
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 264
    Top = 64
  end
end
