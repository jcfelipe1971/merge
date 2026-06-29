object DMTiposRedondeo: TDMTiposRedondeo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 455
  Top = 226
  Height = 112
  Width = 342
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 16
    Top = 8
  end
  object QMTiposRedondeo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_REDONDEOS'
      'WHERE'
      '  TIPO_REDONDEO=?old_TIPO_REDONDEO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_REDONDEOS'
      
        '  (VALOR,DECIMALES,ALZA_BAJA_TERMINACION,TIPO_TERMINACION,SISTEM' +
        'A,USO_TRUNCA,USO_MULT,TIPO_REDONDEO,TITULO)'
      'VALUES'
      
        '  (?VALOR,?DECIMALES,?ALZA_BAJA_TERMINACION,?TIPO_TERMINACION,?S' +
        'ISTEMA,?USO_TRUNCA,?USO_MULT,?TIPO_REDONDEO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_REDONDEOS'
      'WHERE'
      '  TIPO_REDONDEO=?TIPO_REDONDEO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_REDONDEOS'
      'WHERE SISTEMA = 0')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_REDONDEOS'
      'SET'
      '  VALOR=?VALOR '
      '  ,DECIMALES=?DECIMALES '
      '  ,ALZA_BAJA_TERMINACION=?ALZA_BAJA_TERMINACION '
      '  ,TIPO_TERMINACION=?TIPO_TERMINACION '
      '  ,SISTEMA=0'
      '  ,USO_TRUNCA=?USO_TRUNCA '
      '  ,USO_MULT=?USO_MULT '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  TIPO_REDONDEO=?TIPO_REDONDEO ')
    Plan.Strings = (
      'PLAN (SYS_TIPO_REDONDEOS NATURAL)')
    AfterPost = QMTiposRedondeoAfterPost
    BeforePost = QMTiposRedondeoBeforePost
    OnNewRecord = QMTiposRedondeoNewRecord
    ClavesPrimarias.Strings = (
      'TIPO_REDONDEO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_REDONDEOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 160
    Top = 16
    object QMTiposRedondeoTIPO_REDONDEO: TIntegerField
      DisplayLabel = 'Tipo Redondeo'
      FieldName = 'TIPO_REDONDEO'
    end
    object QMTiposRedondeoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
    object QMTiposRedondeoSISTEMA: TIntegerField
      DisplayLabel = 'Sistema'
      FieldName = 'SISTEMA'
    end
    object QMTiposRedondeoUSO_TRUNCA: TIntegerField
      DisplayLabel = 'Trunca'
      FieldName = 'USO_TRUNCA'
    end
    object QMTiposRedondeoUSO_MULT: TIntegerField
      DisplayLabel = 'Mult.'
      FieldName = 'USO_MULT'
    end
    object QMTiposRedondeoVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object QMTiposRedondeoDECIMALES: TIntegerField
      DisplayLabel = 'Decimales'
      FieldName = 'DECIMALES'
    end
    object QMTiposRedondeoALZA_BAJA_TERMINACION: TIntegerField
      DisplayLabel = 'Alza baja term.'
      FieldName = 'ALZA_BAJA_TERMINACION'
    end
    object QMTiposRedondeoTIPO_TERMINACION: TIntegerField
      DisplayLabel = 'Tipo Terminacion'
      FieldName = 'TIPO_TERMINACION'
    end
  end
  object DSQMTiposRedondeo: TDataSource
    DataSet = QMTiposRedondeo
    Left = 248
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 88
    Top = 8
  end
end
