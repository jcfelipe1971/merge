object ProDMCarpetas: TProDMCarpetas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 725
  Top = 465
  Height = 256
  Width = 374
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 240
    Top = 36
  end
  object QMCarpetas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_CARPETAS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_CARPETAS'
      '  (ID,LINEA,TIPO,ID_REGISTRO,RUTA,DESCRIPCION)'
      'VALUES'
      '  (?ID,?LINEA,?TIPO,?ID_REGISTRO,?RUTA,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_CARPETAS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_CARPETAS'
      'where (id_registro=?id_registro and tipo=?tipo_registro)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_CARPETAS'
      'SET'
      '  LINEA=?LINEA '
      '  ,TIPO=?TIPO '
      '  ,ID_REGISTRO=?ID_REGISTRO '
      '  ,RUTA=?RUTA '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  ID=?ID ')
    AfterPost = Graba
    AfterScroll = QMCarpetasAfterScroll
    OnNewRecord = QMCarpetasNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_CARPETAS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 40
    object QMCarpetasID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCarpetasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCarpetasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCarpetasID_REGISTRO: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_REGISTRO'
    end
    object QMCarpetasRUTA: TFIBStringField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
      Size = 200
    end
    object QMCarpetasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSCarpetas: TDataSource
    DataSet = QMCarpetas
    Left = 120
    Top = 28
  end
  object QLinia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea) as linea'
      'from pro_carpetas'
      'where (id_registro=?id_registro and tipo=?tipo_registro) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 236
    Top = 108
  end
  object xRutas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select ruta from pro_carpetas'
      'where id=?id')
    UniDirectional = False
    Left = 40
    Top = 104
    object xRutasRUTA: TFIBStringField
      DisplayLabel = 'Carpeta'
      FieldName = 'RUTA'
      Size = 200
    end
  end
end
