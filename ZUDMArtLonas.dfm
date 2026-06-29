object ZDMArtLonas: TZDMArtLonas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 434
  Top = 330
  Height = 178
  Width = 325
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 232
    Top = 16
  end
  object QMLonasDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_LONA_DET'
      'WHERE'
      '  DETALLE=?old_DETALLE AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_LONA_DET'
      '  (EMPRESA,ARTICULO,ID_A,DETALLE,ID_A_DET,ESCANDALLO_DEF)'
      'VALUES'
      '  (?EMPRESA,?ARTICULO,?ID_A,?DETALLE,?ID_A_DET,?ESCANDALLO_DEF)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_LONA_DET'
      'WHERE'
      '  DETALLE=?DETALLE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_LONA_DET'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_LONA_DET'
      'SET'
      '  ID_A=?ID_A '
      '  ,ID_A_DET=?ID_A_DET '
      '  ,ESCANDALLO_DEF=?ESCANDALLO_DEF'
      'WHERE'
      '  DETALLE=?DETALLE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMLonasDetNewRecord
    ClavesPrimarias.Strings = (
      'DETALLE '
      'ARTICULO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_LONA_DET'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 32
    Top = 16
    object QMLonasDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLonasDetARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMLonasDetID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMLonasDetDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object QMLonasDetID_A_DET: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_DET'
    end
    object QMLonasDetTipoArt: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkCalculated
      FieldName = 'TipoArt'
      OnGetText = QMLonasDetTipoArtGetText
      Size = 1
      Calculated = True
    end
    object QMLonasDetDescArt: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescArt'
      OnGetText = QMLonasDetDescArtGetText
      Size = 60
      Calculated = True
    end
    object QMLonasDetESCANDALLO_DEF: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO_DEF'
    end
  end
  object DSQMLonasDet: TDataSource
    DataSet = QMLonasDet
    Left = 128
    Top = 16
  end
  object xDatosDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo, TIPO_ARTICULO_TYC from art_articulos'
      'where id_a=?id_a_det')
    UniDirectional = False
    DataSource = DSQMLonasDet
    Left = 32
    Top = 64
    object xDatosDetalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDatosDetalleTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo Art.'
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 3
    end
  end
end
