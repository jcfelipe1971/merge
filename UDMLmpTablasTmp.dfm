object DMLmpTablasTmp: TDMLmpTablasTmp
  OldCreateOrder = False
  OnCreate = DMLmpTablasTmpCreate
  OnDestroy = DataModuleDestroy
  Left = 604
  Top = 411
  Height = 277
  Width = 267
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 46
    Top = 10
  end
  object DSQMTablasTemporales: TDataSource
    DataSet = QMTablasTemporales
    Left = 165
    Top = 61
  end
  object QMTablasTemporales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_TEMPORALES'
      'WHERE'
      '  NOMBRE=?old_NOMBRE AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_TEMPORALES'
      '  (NOMBRE,'#13#10'ENTRADA,MARCADO)'
      'VALUES'
      '  (?NOMBRE,'#13#10'?ENTRADA,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_TEMPORALES'
      'WHERE'
      '  NOMBRE=?NOMBRE AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_TEMPORALES'
      'where '
      'entrada=?entrada'
      'order by nombre')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_TEMPORALES'
      'SET'
      '  MARCADO=?MARCADO '
      'WHERE'
      '  NOMBRE=?NOMBRE AND '
      '  ENTRADA=?ENTRADA ')
    OnNewRecord = QMTablasTemporalesNewRecord
    ClavesPrimarias.Strings = (
      'NOMBRE '
      'ENTRADA ')
    AccionesInhibidas = [Borrar]
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_TEMPORALES'
    UpdateTransaction = TLocal
    Left = 48
    Top = 61
    object QMTablasTemporalesNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 25
    end
    object QMTablasTemporalesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMTablasTemporalesMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
      OnChange = QMTablasTemporalesMARCADOChange
    end
  end
  object xTablasMarcadas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM TMP_TEMPORALES'
      'WHERE'
      'ENTRADA = :ENTRADA AND'
      'MARCADO = 1')
    UniDirectional = False
    Left = 49
    Top = 111
  end
end
