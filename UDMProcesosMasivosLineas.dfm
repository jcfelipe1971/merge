object DMProcesosMasivosLineas: TDMProcesosMasivosLineas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 288
  Top = 228
  Height = 226
  Width = 456
  object QMDocLineas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      '/* Se modifica dinamicamente */'
      
        'SELECT T.ENTRADA, T.ID_DOC, T.ID_DETALLES_DOC, T.SELECCIONADO, D' +
        '.LINEA, D.ORDEN, D.ARTICULO, D.TITULO, UNIDADES'
      'FROM TMP_DOC_LINEAS_A_PROC T'
      'JOIN GES_DETALLES_S D ON T.ID_DETALLES_DOC = D.ID_DETALLES_S'
      'WHERE'
      'T.ID_DETALLES_DOC=?ID_DETALLES_DOC AND '
      'T.ID_DOC=?ID_DOC AND '
      'T.ENTRADA=?ENTRADA AND'
      'D.TIPO = :TIPO'
      'UNION'
      
        'SELECT T.ENTRADA, T.ID_DOC, T.ID_DETALLES_DOC, T.SELECCIONADO, D' +
        '.LINEA, D.ORDEN, D.ARTICULO, D.TITULO, UNIDADES'
      'FROM TMP_DOC_LINEAS_A_PROC T'
      'JOIN GES_DETALLES_E D ON T.ID_DETALLES_DOC = D.ID_DETALLES_E'
      'WHERE'
      'T.ID_DETALLES_DOC=?ID_DETALLES_DOC AND '
      'T.ID_DOC=?ID_DOC AND '
      'T.ENTRADA=?ENTRADA AND'
      'D.TIPO = :TIPO')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      
        'SELECT T.ENTRADA, T.ID_DOC, T.ID_DETALLES_DOC, T.SELECCIONADO, D' +
        '.LINEA, D.ORDEN, D.ARTICULO, D.TITULO, UNIDADES'
      'FROM TMP_DOC_LINEAS_A_PROC T'
      'JOIN GES_DETALLES_S D ON T.ID_DETALLES_DOC = D.ID_DETALLES_S'
      'WHERE'
      'T.ENTRADA = :ENTRADA AND'
      'D.TIPO = :TIPO'
      'UNION'
      
        'SELECT T.ENTRADA, T.ID_DOC, T.ID_DETALLES_DOC, T.SELECCIONADO, D' +
        '.LINEA, D.ORDEN, D.ARTICULO, D.TITULO, UNIDADES'
      'FROM TMP_DOC_LINEAS_A_PROC T'
      'JOIN GES_DETALLES_E D ON T.ID_DETALLES_DOC = D.ID_DETALLES_E'
      'WHERE'
      'T.ENTRADA = :ENTRADA AND'
      'D.TIPO = :TIPO'
      'ORDER BY 6 /*D.ORDEN*/')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_DOC_LINEAS_A_PROC'
      'SET'
      '  SELECCIONADO=?SELECCIONADO '
      'WHERE'
      '  ID_DETALLES_DOC=?ID_DETALLES_DOC AND '
      '  ID_DOC=?ID_DOC AND '
      '  ENTRADA=?ENTRADA ')
    ClavesPrimarias.Strings = (
      'ID_DETALLES_DOC '
      'ID_DOC '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_DOC_LINEAS_A_PROC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object QMDocLineasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDocLineasID_DOC: TIntegerField
      DisplayLabel = 'Id Documento'
      FieldName = 'ID_DOC'
    end
    object QMDocLineasID_DETALLES_DOC: TIntegerField
      DisplayLabel = 'Id Detalle Doc.'
      FieldName = 'ID_DETALLES_DOC'
    end
    object QMDocLineasSELECCIONADO: TIntegerField
      DisplayLabel = 'Seleccionado'
      FieldName = 'SELECCIONADO'
    end
    object QMDocLineasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDocLineasORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDocLineasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDocLineasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDocLineasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object DSQMDocLineas: TDataSource
    DataSet = QMDocLineas
    Left = 152
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 304
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 376
    Top = 16
  end
end
