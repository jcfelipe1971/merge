object DMNumerosDeAutorizacion: TDMNumerosDeAutorizacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 576
  Top = 263
  Height = 271
  Width = 412
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 344
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 344
    Top = 56
  end
  object QMNumerosDeAutorizacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SFV_AUTORIZACIONES'
      'WHERE'
      '  AUTORIZACION=?old_AUTORIZACION AND '
      '  TIPO=?old_TIPO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO SFV_AUTORIZACIONES'
      
        '  (EMPRESA,TIPO,AUTORIZACION,LLAVE_DOSIFICACION,CONTADOR,FECHA_D' +
        'ESDE,FECHA_HASTA,COD_CLI_PRO)'
      'VALUES'
      
        '  (?EMPRESA,?TIPO,?AUTORIZACION,?LLAVE_DOSIFICACION,?CONTADOR,?F' +
        'ECHA_DESDE,?FECHA_HASTA,?COD_CLI_PRO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SFV_AUTORIZACIONES'
      'WHERE'
      '  AUTORIZACION=?AUTORIZACION AND '
      '  TIPO=?TIPO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM SFV_AUTORIZACIONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO '
      'ORDER BY FECHA_DESDE DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SFV_AUTORIZACIONES'
      'SET'
      '  LLAVE_DOSIFICACION=?LLAVE_DOSIFICACION '
      '  ,CONTADOR=?CONTADOR '
      '  ,FECHA_DESDE=?FECHA_DESDE '
      '  ,FECHA_HASTA=?FECHA_HASTA '
      '  ,COD_CLI_PRO=?COD_CLI_PRO '
      'WHERE'
      '  AUTORIZACION=?AUTORIZACION AND '
      '  TIPO=?TIPO AND '
      '  EMPRESA=?EMPRESA ')
    BeforePost = QMNumerosDeAutorizacionBeforePost
    ClavesPrimarias.Strings = (
      'AUTORIZACION '
      'TIPO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SFV_AUTORIZACIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 8
    object QMNumerosDeAutorizacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNumerosDeAutorizacionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object QMNumerosDeAutorizacionAUTORIZACION: TFIBStringField
      DisplayLabel = 'Autorizacion'
      FieldName = 'AUTORIZACION'
    end
    object QMNumerosDeAutorizacionLLAVE_DOSIFICACION: TFIBStringField
      DisplayLabel = 'Llave Dosificacion'
      FieldName = 'LLAVE_DOSIFICACION'
      Size = 256
    end
    object QMNumerosDeAutorizacionCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMNumerosDeAutorizacionFECHA_DESDE: TDateTimeField
      DisplayLabel = 'Desde'
      FieldName = 'FECHA_DESDE'
    end
    object QMNumerosDeAutorizacionFECHA_HASTA: TDateTimeField
      DisplayLabel = 'Hasta'
      FieldName = 'FECHA_HASTA'
    end
    object QMNumerosDeAutorizacionCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
  end
  object DSQMNumerosDeAutorizacion: TDataSource
    DataSet = QMNumerosDeAutorizacion
    Left = 208
    Top = 8
  end
end
