object DMAsistenteImpArtIdiomas: TDMAsistenteImpArtIdiomas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 277
  Top = 239
  Height = 468
  Width = 601
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 392
    Top = 8
  end
  object XLApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 392
    Top = 56
  end
  object QMImpArtidiomas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_IMPORTAR_ART_IDIOMAS'
      'WHERE'
      '  ENTRADA=?old_ENTRADA AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_IMPORTAR_ART_IDIOMAS'
      
        '  (ENTRADA,'#13#10'LINEA,EMPRESA,ARTICULO,IDIOMA,IMPORTAR,UNICODE,TITU' +
        'LO)'
      'VALUES'
      
        '  (?ENTRADA,'#13#10'?LINEA,?EMPRESA,?ARTICULO,?IDIOMA,?IMPORTAR,?UNICO' +
        'DE,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_IMPORTAR_ART_IDIOMAS'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_IMPORTAR_ART_IDIOMAS'
      'WHERE '
      'ENTRADA=?ENTRADA'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_IMPORTAR_ART_IDIOMAS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,ARTICULO=?ARTICULO '
      '  ,IDIOMA=?IDIOMA '
      '  ,IMPORTAR=?IMPORTAR '
      '  ,UNICODE=?UNICODE '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  LINEA=?LINEA ')
    AfterPost = QMImpArtidiomasAfterPost
    OnNewRecord = QMImpArtidiomasNewRecord
    ClavesPrimarias.Strings = (
      'ENTRADA'
      'LINEA')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_IMPORTAR_ART_IDIOMAS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 56
    object QMImpArtidiomasENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMImpArtidiomasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMImpArtidiomasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMImpArtidiomasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMImpArtidiomasIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMImpArtidiomasUNICODE: TMemoField
      FieldName = 'UNICODE'
      BlobType = ftMemo
      Size = 8
    end
    object QMImpArtidiomasIMPORTAR: TIntegerField
      DisplayLabel = 'Importar'
      FieldName = 'IMPORTAR'
    end
    object QMImpArtidiomasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSQMImpArtIdiomas: TDataSource
    DataSet = QMImpArtidiomas
    Left = 136
    Top = 56
  end
  object xArtIdiomas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT IDIOMA'
      'FROM SYS_IDIOMAS'
      'WHERE'
      'IDIOMA = :IDIOMA')
    UniDirectional = False
    Left = 40
    Top = 8
    object xArtIdiomasIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
  end
  object DSxArtIdiomas: TDataSource
    DataSet = xArtIdiomas
    Left = 136
    Top = 8
  end
end
