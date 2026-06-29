object DMMarca: TDMMarca
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 182
  Width = 366
  object DSQMMarca: TDataSource
    DataSet = QMMarca
    Left = 120
    Top = 24
  end
  object QMMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_MOD_MARCAS'
      'WHERE'
      '  ID_MARCA=?old_ID_MARCA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_MOD_MARCAS'
      '  (ID_MARCA,EMPRESA,MARCA,TITULO,IMAGEN,ID_GALERIA,NOTAS)'
      'VALUES'
      '  (?ID_MARCA,?EMPRESA,?MARCA,?TITULO,?IMAGEN,?ID_GALERIA,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_MOD_MARCAS'
      'WHERE'
      '  ID_MARCA=?ID_MARCA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_MOD_MARCAS'
      'WHERE'
      'ID_MARCA > 0 AND'
      'EMPRESA = ?EMPRESA'
      'ORDER BY MARCA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_MOD_MARCAS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,MARCA=?MARCA '
      '  ,TITULO=?TITULO '
      '  ,IMAGEN=?IMAGEN '
      '  ,ID_GALERIA=?ID_GALERIA '
      '  ,NOTAS=?NOTAS '
      'WHERE'
      '  ID_MARCA=?ID_MARCA ')
    BeforePost = QMMarcaBeforePost
    OnNewRecord = QMMarcaNewRecord
    ClavesPrimarias.Strings = (
      'ID_MARCA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_MOD_MARCAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMMarcaID_MARCA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_MARCA'
    end
    object QMMarcaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMarcaMARCA: TFIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 5
    end
    object QMMarcaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMMarcaIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMMarcaID_GALERIA: TIntegerField
      DisplayLabel = 'Galeria'
      FieldName = 'ID_GALERIA'
    end
    object QMMarcaNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 208
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 280
    Top = 24
  end
end
