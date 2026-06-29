object ZDMModelosFechas: TZDMModelosFechas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 483
  Top = 250
  Height = 350
  Width = 365
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
    Top = 8
  end
  object QMModelosFechas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_MODELOS_FECHAS'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_MODELOS_FECHAS'
      '  (CODIGO,LINEA,FECHA_INI,FECHA_FIN,DIAS_SERVIR,COLOR)'
      'VALUES'
      '  (?CODIGO,?LINEA,?FECHA_INI,?FECHA_FIN,?DIAS_SERVIR,?COLOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_MODELOS_FECHAS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_MODELOS_FECHAS'
      'WHERE CODIGO = ?CODIGO'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_MODELOS_FECHAS'
      'SET'
      '  FECHA_INI=?FECHA_INI '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,DIAS_SERVIR=?DIAS_SERVIR'
      '  ,COLOR=?COLOR '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO ')
    OnNewRecord = QMModelosFechasNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_MODELOS_FECHAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMModelosFechasCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMModelosFechasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMModelosFechasFECHA_INI: TDateTimeField
      DisplayLabel = 'Fecha Ini.'
      FieldName = 'FECHA_INI'
    end
    object QMModelosFechasFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin.'
      FieldName = 'FECHA_FIN'
    end
    object QMModelosFechasDIAS_SERVIR: TIntegerField
      DisplayLabel = 'D'#237'as a servir'
      FieldName = 'DIAS_SERVIR'
    end
    object QMModelosFechasCOLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
      Size = 2
    end
  end
  object DSModelosFechas: TDataSource
    DataSet = QMModelosFechas
    Left = 136
    Top = 8
  end
  object xDescModelo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_MODELOS'
      'where codigo=?codigo')
    UniDirectional = False
    Left = 40
    Top = 56
    object xDescModeloCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object xDescModeloDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxDescModelo: TDataSource
    DataSet = xDescModelo
    Left = 136
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
    Left = 264
    Top = 56
  end
end
