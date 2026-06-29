object ProDMTipoRevionesMaq: TProDMTipoRevionesMaq
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 645
  Top = 305
  Height = 279
  Width = 421
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 296
    Top = 32
  end
  object QMTipoRevisionesMaq: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_TIPO_REVISIONES_MAQ'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_TIPO_REVISIONES_MAQ'
      '  (TIPO,TITULO,NOTAS)'
      'VALUES'
      '  (?TIPO,?TITULO,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_TIPO_REVISIONES_MAQ'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_TIPO_REVISIONES_MAQ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_TIPO_REVISIONES_MAQ'
      'SET'
      '  TITULO=?TITULO '
      '  ,NOTAS=?NOTAS '
      'WHERE'
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'TIPO')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_TIPO_REVISIONES_MAQ'
    UpdateTransaction = TLocal
    Left = 56
    Top = 40
    object QMTipoRevisionesMaqTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMTipoRevisionesMaqTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMTipoRevisionesMaqNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSTipoRevisionesMaq: TDataSource
    DataSet = QMTipoRevisionesMaq
    Left = 192
    Top = 40
  end
end
