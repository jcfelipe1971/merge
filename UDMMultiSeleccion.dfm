object DMMultiSeleccion: TDMMultiSeleccion
  OldCreateOrder = False
  OnCreate = DMMultiSeleccionCreate
  Left = 684
  Top = 200
  Height = 229
  Width = 320
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
    Top = 24
  end
  object DSxMultiSeleccion: TDataSource
    DataSet = xMultiSeleccion
    Left = 144
    Top = 24
  end
  object xMultiSeleccion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'SELECT * FROM TMP_MULTISELECCION'
      'WHERE ENTRADA=?ENTRADA')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_MULTISELECCION'
      'WHERE'
      '  ALMACEN=?ALMACEN AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_MULTISELECCION'
      'WHERE ENTRADA=?ENTRADA'
      '/*dji lrk kri*/'
      'order by canal,almacen')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_MULTISELECCION'
      'SET'
      '  MARCADO=?MARCADO '
      'WHERE'
      '  ALMACEN=?ALMACEN AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    OnNewRecord = xMultiSeleccionNewRecord
    ClavesPrimarias.Strings = (
      'ALMACEN '
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_MULTISELECCION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 24
    object xMultiSeleccionENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xMultiSeleccionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xMultiSeleccionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xMultiSeleccionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xMultiSeleccionTITULO_CANAL: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CANAL'
      Size = 40
    end
    object xMultiSeleccionALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xMultiSeleccionTITULO_ALMACEN: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_ALMACEN'
      Size = 40
    end
    object xMultiSeleccionMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
      OnChange = xMultiSeleccionMARCADOChange
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 72
  end
end
