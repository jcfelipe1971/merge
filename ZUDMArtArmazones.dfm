object ZDMArtArmazones: TZDMArtArmazones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 434
  Top = 330
  Height = 178
  Width = 323
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 16
  end
  object QMArmazonesDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_ART_ARTICULOS_ARMAZON_DET'
      'WHERE'
      '  DETALLE=?old_DETALLE AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_ART_ARTICULOS_ARMAZON_DET'
      '  (EMPRESA,ARTICULO,ID_A,DETALLE,ID_A_DET,ESCANDALLO_DEF)'
      'VALUES'
      '  (?EMPRESA,?ARTICULO,?ID_A,?DETALLE,?ID_A_DET,?ESCANDALLO_DEF)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_ART_ARTICULOS_ARMAZON_DET'
      'WHERE'
      '  DETALLE=?DETALLE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_ART_ARTICULOS_ARMAZON_DET'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_ART_ARTICULOS_ARMAZON_DET'
      'SET'
      '  ID_A=?ID_A '
      '  ,ID_A_DET=?ID_A_DET '
      '  ,ESCANDALLO_DEF=?ESCANDALLO_DEF '
      'WHERE'
      '  DETALLE=?DETALLE AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMArmazonesDetNewRecord
    ClavesPrimarias.Strings = (
      'DETALLE '
      'ARTICULO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_ART_ARTICULOS_ARMAZON_DET'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 40
    Top = 16
    object QMArmazonesDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArmazonesDetARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArmazonesDetID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMArmazonesDetDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object QMArmazonesDetID_A_DET: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_DET'
    end
    object QMArmazonesDetTipoArt: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkCalculated
      FieldName = 'TipoArt'
      OnGetText = QMArmazonesDetTipoArtGetText
      Size = 1
      Calculated = True
    end
    object QMArmazonesDetDescArt: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescArt'
      OnGetText = QMArmazonesDetDescArtGetText
      Size = 60
      Calculated = True
    end
    object QMArmazonesDetESCANDALLO_DEF: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO_DEF'
    end
  end
  object DSQMArmazonesDet: TDataSource
    DataSet = QMArmazonesDet
    Left = 144
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
    DataSource = DSQMArmazonesDet
    Left = 40
    Top = 64
    object xDatosDetalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDatosDetalleTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo Art.'
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 1
    end
  end
end
