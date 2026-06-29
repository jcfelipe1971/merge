object ZDMReplicacionModelosDet: TZDMReplicacionModelosDet
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 424
  Top = 248
  Height = 298
  Width = 391
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 320
    Top = 8
  end
  object QInsertarTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into Z_REPLICAR_MODELOS_TEMP (modelo,linea,salida)'
      'values (?modelo,?linea,?salida)')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 64
  end
  object QMTempModelos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_REPLICAR_MODELOS_TEMP'
      'WHERE'
      '  SALIDA=?old_SALIDA AND '
      '  LINEA=?old_LINEA AND '
      '  MODELO=?old_MODELO ')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM Z_REPLICAR_MODELOS_TEMP TEMP'
      'LEFT JOIN Z_SYS_MODELOS_DET ZMOD'
      'ON'
      '(TEMP.MODELO = ZMOD.CODIGO AND'
      'TEMP.LINEA = ZMOD.LINEA AND'
      'TEMP.SALIDA = ZMOD.SALIDA)'
      'WHERE'
      'TEMP.ENTRADA = ?ENTRADA AND'
      'TEMP.MODELO = ?MODELO AND'
      'TEMP.LINEA = ?LINEA AND'
      'TEMP.SALIDA = ?SALIDA'
      'ORDER BY TEMP.MODELO, TEMP.LINEA, TEMP.SALIDA')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_REPLICAR_MODELOS_TEMP TEMP'
      'LEFT JOIN Z_SYS_MODELOS_DET ZMOD'
      'ON'
      '(TEMP.MODELO = ZMOD.CODIGO AND '
      'TEMP.LINEA = ZMOD.LINEA AND '
      'TEMP.SALIDA = ZMOD.SALIDA)'
      'WHERE'
      'TEMP.ENTRADA = ?ENTRADA AND'
      'TEMP.MODELO = ?MODELO'
      'ORDER BY TEMP.MODELO, TEMP.LINEA, TEMP.SALIDA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_REPLICAR_MODELOS_TEMP'
      'SET'
      '  MARCADO=?MARCADO '
      'WHERE'
      '  SALIDA=?SALIDA AND '
      '  LINEA=?LINEA AND '
      '  MODELO=?MODELO AND'
      '  ENTRADA=?ENTRADA ')
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'MODELO '
      'LINEA '
      'SALIDA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_REPLICAR_MODELOS_TEMP'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMTempModelosMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 5
    end
    object QMTempModelosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMTempModelosSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
    object QMTempModelosMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
      OnChange = QMTempModelosMARCADOChange
    end
    object QMTempModelosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMTempModelosESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
  end
  object DSTempModelos: TDataSource
    DataSet = QMTempModelos
    Left = 144
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 320
    Top = 56
  end
end
