object DMTipoIVA: TDMTipoIVA
  OldCreateOrder = False
  OnCreate = DMTipoIVACreate
  Left = 502
  Top = 283
  Height = 363
  Width = 372
  object QMTipoIva: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_IVA'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_IVA'
      '  (DEFECTO,P_RECARGO,P_IVA,ACTIVO,TIPO,PAIS,TITULO,REGIMEN)'
      'VALUES'
      
        '  (?DEFECTO,?P_RECARGO,?P_IVA,?ACTIVO,?TIPO,?PAIS,?TITULO,?REGIM' +
        'EN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_IVA'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IVA'
      'WHERE'
      'PAIS=?PAIS'
      'ORDER BY TIPO           '
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_IVA'
      'SET'
      '  DEFECTO=?DEFECTO '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,P_IVA=?P_IVA '
      '  ,ACTIVO=?ACTIVO '
      '  ,TITULO=?TITULO '
      '  ,REGIMEN = ?REGIMEN'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    AfterOpen = QMTipoIvaAfterOpen
    AfterPost = QMTipoIvaAfterPost
    BeforeClose = QMTipoIvaBeforeClose
    BeforePost = QMTipoIvaBeforePost
    OnNewRecord = QMTipoIvaNewRecord
    ClavesPrimarias.Strings = (
      'PAIS '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_IVA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMTipoIvaPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMTipoIvaTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMTipoIvaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 15
      BlanksToNULL = False
    end
    object QMTipoIvaP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMTipoIvaP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object QMTipoIvaACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMTipoIvaDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QMTipoIvaREGIMEN: TIntegerField
      DisplayLabel = 'Regimen'
      FieldName = 'REGIMEN'
      OnChange = QMTipoIvaREGIMENChange
    end
  end
  object DSQMTipoIva: TDataSource
    DataSet = QMTipoIva
    Left = 144
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 272
    Top = 24
  end
  object xSysTipoRegimen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_REGIMEN'
      'WHERE TIPO = ?REGIMEN')
    UniDirectional = False
    DataSource = DSQMTipoIva
    Plan.Strings = (
      'PLAN (SYS_TIPO_REGIMEN INDEX (PK_SYS_TIPO_REGIMEN))')
    Left = 40
    Top = 72
  end
  object DSxSysTipoRegimen: TDataSource
    DataSet = xSysTipoRegimen
    Left = 144
    Top = 72
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 72
  end
end
