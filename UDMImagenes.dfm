object DMImagenes: TDMImagenes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 303
  Top = 159
  Height = 198
  Width = 390
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 224
    Top = 24
  end
  object DSQMImagenes: TDataSource
    DataSet = QMImagenes
    Left = 128
    Top = 24
  end
  object QMImagenes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_IMAGENES'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_IMAGENES'
      
        '  (ULT_MODIFICACION,IMAGEN,CODIGO,RUTA_WEB,REPOSITORIO,RUTA,SINC' +
        '_REFERENCIA,SINC_TIPO,NOMBRE,FORMATO)'
      'VALUES'
      
        '  (?ULT_MODIFICACION,?IMAGEN,?CODIGO,?RUTA_WEB,?REPOSITORIO,?RUT' +
        'A,?SINC_REFERENCIA,?SINC_TIPO,?NOMBRE,?FORMATO)')
    RefreshSQL.Strings = (
      
        'SELECT SYS_IMAGENES.*, CAST(OCTET_LENGTH(SYS_IMAGENES.IMAGEN) AS' +
        ' INTEGER) IMAGE_SIZE FROM SYS_IMAGENES '
      'WHERE'
      'SYS_IMAGENES.CODIGO=?CODIGO')
    SelectSQL.Strings = (
      
        'SELECT SYS_IMAGENES.*, CAST(OCTET_LENGTH(SYS_IMAGENES.IMAGEN) AS' +
        ' INTEGER) IMAGE_SIZE FROM SYS_IMAGENES'
      'ORDER BY SYS_IMAGENES.CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_IMAGENES'
      'SET'
      '  ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,IMAGEN=?IMAGEN '
      '  ,RUTA_WEB=?RUTA_WEB '
      '  ,REPOSITORIO=?REPOSITORIO '
      '  ,RUTA=?RUTA '
      '  ,SINC_REFERENCIA=?SINC_REFERENCIA '
      '  ,SINC_TIPO=?SINC_TIPO '
      '  ,NOMBRE=?NOMBRE '
      '  ,FORMATO=?FORMATO '
      'WHERE'
      '  CODIGO=?CODIGO ')
    Plan.Strings = (
      ' ')
    AfterPost = QMImagenesAfterPost
    BeforeEdit = QMImagenesBeforeEdit
    BeforePost = QMImagenesBeforePost
    OnNewRecord = QMImagenesNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO'#13)
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_IMAGENES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMImagenesCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMImagenesNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 35
    end
    object QMImagenesIMAGEN: TBlobField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
      Size = 8
    end
    object QMImagenesFORMATO: TFIBStringField
      DisplayLabel = 'Formato'
      FieldName = 'FORMATO'
      Size = 5
    end
    object QMImagenesREPOSITORIO: TIntegerField
      DisplayLabel = 'Repositorio'
      FieldName = 'REPOSITORIO'
    end
    object QMImagenesRUTA: TFIBStringField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
      Size = 200
    end
    object QMImagenesRUTA_WEB: TFIBStringField
      DisplayLabel = 'Ruta Web'
      FieldName = 'RUTA_WEB'
      Size = 200
    end
    object QMImagenesSINC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Sinc.'
      FieldName = 'SINC_TIPO'
      Size = 3
    end
    object QMImagenesSINC_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia Sinc.'
      FieldName = 'SINC_REFERENCIA'
      Size = 15
    end
    object QMImagenesDESCRIPCION_REPOSITORIO: TStringField
      DisplayLabel = 'Repositorio'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'DESCRIPCION_REPOSITORIO'
      OnGetText = QMImagenesDESCRIPCION_REPOSITORIOGetText
      Size = 30
      Calculated = True
    end
    object QMImagenesIMAGE_SIZE: TIntegerField
      DisplayLabel = 'Tama'#241'o (bytes)'
      FieldName = 'IMAGE_SIZE'
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
    Left = 296
    Top = 24
  end
end
