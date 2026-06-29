object DMTipoRetencion: TDMTipoRetencion
  OldCreateOrder = False
  OnCreate = DMTipoAsientoCreate
  Left = 595
  Top = 423
  Height = 288
  Width = 387
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 8
  end
  object QMTipoRet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DOM_TIPO_RETENCION'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO DOM_TIPO_RETENCION'
      
        '  (ID,DESCRIPCION,POR_ITBIS,CUENTA_ITBIS,POR_ISR,CUENTA_ISR,CALC' +
        'ULO_SOBRE_BASE)'
      'VALUES'
      
        '  (?ID,?DESCRIPCION,?POR_ITBIS,?CUENTA_ITBIS,?POR_ISR,?CUENTA_IS' +
        'R,?CALCULO_SOBRE_BASE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DOM_TIPO_RETENCION'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM DOM_TIPO_RETENCION'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE DOM_TIPO_RETENCION'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,POR_ITBIS=?POR_ITBIS '
      '  ,CUENTA_ITBIS=?CUENTA_ITBIS '
      '  ,POR_ISR=?POR_ISR '
      '  ,CUENTA_ISR=?CUENTA_ISR '
      '  ,CALCULO_SOBRE_BASE=?CALCULO_SOBRE_BASE '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMTipoRetBeforePost
    OnNewRecord = QMTipoRetNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'DOM_TIPO_RETENCION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMTipoRetID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMTipoRetDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMTipoRetPOR_ITBIS: TFloatField
      DisplayLabel = 'Porc. ITBIS'
      FieldName = 'POR_ITBIS'
    end
    object QMTipoRetCUENTA_ITBIS: TFIBStringField
      DisplayLabel = 'Cta. ITBIS'
      FieldName = 'CUENTA_ITBIS'
      Size = 15
    end
    object QMTipoRetPOR_ISR: TFloatField
      DisplayLabel = 'Porc. ISR'
      FieldName = 'POR_ISR'
    end
    object QMTipoRetCUENTA_ISR: TFIBStringField
      DisplayLabel = 'Cta. ISR'
      FieldName = 'CUENTA_ISR'
      Size = 15
    end
    object QMTipoRetCALCULO_SOBRE_BASE: TIntegerField
      DisplayLabel = 'Calc. Sobre Base'
      FieldName = 'CALCULO_SOBRE_BASE'
    end
  end
  object DSQMTipoRet: TDataSource
    DataSet = QMTipoRet
    Left = 128
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 128
    Top = 8
  end
end
