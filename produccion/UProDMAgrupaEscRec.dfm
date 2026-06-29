object ProDMAgrupaEscRec: TProDMAgrupaEscRec
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 448
  Top = 189
  Height = 150
  Width = 335
  object DSQMProEscRec: TDataSource
    DataSet = QMProEscRec
    Left = 144
    Top = 12
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 230
    Top = 12
  end
  object QMProEscRec: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ESCANDALLO_RECURSO'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ESCANDALLO_RECURSO'
      '  (LINEA_FASE,RECURSO,PRECIO,id_esc)'
      'VALUES'
      '  (?LINEA_FASE,?RECURSO,?PRECIO,?id_esc)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ESCANDALLO_RECURSO'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ESCANDALLO_RECURSO'
      'order by id_esc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ESCANDALLO_RECURSO'
      'SET'
      '   LINEA_FASE=?LINEA_FASE '
      '  ,RECURSO=?RECURSO '
      '  ,PRECIO=?PRECIO '
      '  ,ID_ESC=?ID_ESC'
      'WHERE'
      '  ID=?ID ')
    AfterDelete = Graba
    AfterPost = Graba
    AfterScroll = QMProEscRecAfterScroll
    OnNewRecord = QMProEscRecNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ESCANDALLO_RECURSO'
    UpdateTransaction = TLocal
    Left = 44
    Top = 16
    object QMProEscRecID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMProEscRecID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
      OnChange = QMProEscRecID_ESCChange
    end
    object QMProEscRecLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
      OnChange = QMProEscRecLINEA_FASEChange
    end
    object QMProEscRecRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      OnChange = QMProEscRecRECURSOChange
      Size = 5
    end
    object QMProEscRecPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
  end
end
