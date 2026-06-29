object DMPreciosCosteKri: TDMPreciosCosteKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 139
  Width = 411
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 240
    Top = 20
  end
  object DSQMPreciosCoste: TDataSource
    DataSet = QMPreciosCoste
    Left = 146
    Top = 22
  end
  object QMPreciosCoste: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_PRECIOS_COSTE_KRI'
      'WHERE'
      '  ALMACEN=?old_ALMACEN AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_PRECIOS_COSTE_KRI'
      
        '  (EMPRESA,EJERCICIO,CANAL,ARTICULO,ALMACEN,PCOSTE,TITULO,FAMILI' +
        'A,ID_A,ID_C_A)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?ARTICULO,?ALMACEN,?PCOSTE,?TITULO' +
        ',?FAMILIA,?ID_A,?ID_C_A)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_PRECIOS_COSTE_KRI'
      'WHERE'
      '  ALMACEN=?ALMACEN AND '
      '  ARTICULO=?ARTICULO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_PRECIOS_COSTE_KRI '
      'WHERE'
      '  ALMACEN=?ALMACEN AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA '
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_PRECIOS_COSTE_KRI'
      'SET'
      '  PCOSTE=?PCOSTE '
      'WHERE'
      '  ALMACEN=?ALMACEN AND '
      '  ARTICULO=?ARTICULO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterPost = QMPreciosCosteAfterPost
    BeforeDelete = QMPreciosCosteBeforeDelete
    BeforeInsert = QMPreciosCosteBeforeInsert
    OnNewRecord = QMPreciosCosteNewRecord
    ClavesPrimarias.Strings = (
      'ALMACEN '
      'ARTICULO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_PRECIOS_COSTE_KRI'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 22
    object QMPreciosCosteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPreciosCosteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPreciosCosteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPreciosCosteARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPreciosCosteALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMPreciosCostePCOSTE: TFloatField
      DisplayLabel = 'Precio Coste'
      FieldName = 'PCOSTE'
    end
    object QMPreciosCosteTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMPreciosCosteFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMPreciosCosteID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMPreciosCosteID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 320
    Top = 20
  end
end
