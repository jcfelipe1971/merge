object DMSIILROE: TDMSIILROE
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 275
  Top = 234
  Height = 285
  Width = 552
  object xPresentacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_LROE_PRESENTACION'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SII_LROE_PRESENTACION'
      
        '  (ID,EMPRESA,CANAL,MODELO,CAPITULO,SUBCAPITULO,OPERACION,EJERCI' +
        'CIO,OBLIGADOTRIBUTARIO_NIF,OBLIGADOTRIBUTARIO_NOMBRE,ESTADO_ENVI' +
        'O,DESCRIPCION_ESTADO)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?CANAL,?MODELO,?CAPITULO,?SUBCAPITULO,?OPERACION' +
        ',?EJERCICIO,?OBLIGADOTRIBUTARIO_NIF,?OBLIGADOTRIBUTARIO_NOMBRE,?' +
        'ESTADO_ENVIO,?DESCRIPCION_ESTADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_LROE_PRESENTACION'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_LROE_PRESENTACION'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL'
      'ORDER BY ID DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_LROE_PRESENTACION'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,MODELO=?MODELO '
      '  ,CAPITULO=?CAPITULO '
      '  ,SUBCAPITULO=?SUBCAPITULO '
      '  ,OPERACION=?OPERACION '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,OBLIGADOTRIBUTARIO_NIF=?OBLIGADOTRIBUTARIO_NIF '
      '  ,OBLIGADOTRIBUTARIO_NOMBRE=?OBLIGADOTRIBUTARIO_NOMBRE '
      '  ,ESTADO_ENVIO=?ESTADO_ENVIO '
      '  ,DESCRIPCION_ESTADO=?DESCRIPCION_ESTADO '
      'WHERE'
      '  ID=?ID ')
    Plan.Strings = (
      ' ')
    AfterOpen = xPresentacionAfterOpen
    BeforeClose = xPresentacionBeforeClose
    BeforePost = xPresentacionBeforePost
    OnNewRecord = xPresentacionNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_LROE_PRESENTACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object xPresentacionID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xPresentacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPresentacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPresentacionMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 3
    end
    object xPresentacionCAPITULO: TFIBStringField
      DisplayLabel = 'Capitulo'
      FieldName = 'CAPITULO'
      Size = 3
    end
    object xPresentacionSUBCAPITULO: TFIBStringField
      DisplayLabel = 'Subcapitulo'
      FieldName = 'SUBCAPITULO'
      Size = 3
    end
    object xPresentacionOPERACION: TFIBStringField
      DisplayLabel = 'Operacion'
      FieldName = 'OPERACION'
      Size = 3
    end
    object xPresentacionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPresentacionOBLIGADOTRIBUTARIO_NIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'OBLIGADOTRIBUTARIO_NIF'
    end
    object xPresentacionOBLIGADOTRIBUTARIO_NOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'OBLIGADOTRIBUTARIO_NOMBRE'
      Size = 120
    end
    object xPresentacionESTADO_ENVIO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_ENVIO'
      Size = 40
    end
    object xPresentacionDESCRIPCION_ESTADO: TFIBStringField
      DisplayLabel = 'Descripcion Estado'
      FieldName = 'DESCRIPCION_ESTADO'
      Size = 256
    end
  end
  object DSPresentacion: TDataSource
    DataSet = xPresentacion
    Left = 184
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 360
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 480
    Top = 8
  end
  object xDocumentos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_LROE_DOCUMENTO'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SII_LROE_DOCUMENTO'
      '  (ID,ID_PRESENTACION,ID_DOC,ESTADO_ENVIO,DESCRIPCION_ESTADO)'
      'VALUES'
      
        '  (?ID,?ID_PRESENTACION,?ID_DOC,?ESTADO_ENVIO,?DESCRIPCION_ESTAD' +
        'O)')
    RefreshSQL.Strings = (
      
        'SELECT L.ID, L.ESTADO_ENVIO, L.DESCRIPCION_ESTADO, I.ID_I, F.TIP' +
        'O, F.SERIE, F.RIG, T.CODIGO_IDENTIFICATIVO, T.CSV,'
      '       T.FECHA_RECEPCION, F.ID_S'
      'FROM SII_LROE_DOCUMENTO L'
      'JOIN EMP_REGISTRO_IVA I ON L.ID_DOC = I.ID_I'
      
        'LEFT JOIN GES_CABECERAS_S_FAC F ON I.EMPRESA = F.EMPRESA AND I.E' +
        'JERCICIO = F.EJERCICIO AND I.CANAL = F.CANAL AND I.DOC_SERIE = F' +
        '.SERIE AND I.DOC_TIPO = F.TIPO AND I.DOC_NUMERO = F.RIG'
      
        'LEFT JOIN GES_CABECERAS_S_FAC_TBAI T ON T.ID_S = F.ID_S AND T.TI' +
        'PO = F.TIPO'
      'WHERE'
      'L.ID = :ID')
    SelectSQL.Strings = (
      
        'SELECT L.ID, L.ESTADO_ENVIO, L.DESCRIPCION_ESTADO, I.ID_I, F.TIP' +
        'O, F.SERIE, F.RIG, T.CODIGO_IDENTIFICATIVO, T.CSV,'
      '       T.FECHA_RECEPCION, F.ID_S'
      'FROM SII_LROE_DOCUMENTO L'
      'JOIN EMP_REGISTRO_IVA I ON L.ID_DOC = I.ID_I'
      
        'LEFT JOIN GES_CABECERAS_S_FAC F ON I.EMPRESA = F.EMPRESA AND I.E' +
        'JERCICIO = F.EJERCICIO AND I.CANAL = F.CANAL AND I.DOC_SERIE = F' +
        '.SERIE AND I.DOC_TIPO = F.TIPO AND I.DOC_NUMERO = F.RIG'
      
        'LEFT JOIN GES_CABECERAS_S_FAC_TBAI T ON T.ID_S = F.ID_S AND T.TI' +
        'PO = F.TIPO'
      'WHERE'
      'L.ID_PRESENTACION = :ID'
      'ORDER BY L.ESTADO_ENVIO DESC, F.EJERCICIO, F.SERIE, F.RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_LROE_DOCUMENTO'
      'SET'
      '  ID_PRESENTACION=?ID_PRESENTACION '
      '  ,ID_DOC=?ID_DOC '
      '  ,ESTADO_ENVIO=?ESTADO_ENVIO '
      '  ,DESCRIPCION_ESTADO=?DESCRIPCION_ESTADO '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSPresentacion
    Plan.Strings = (
      ' ')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_LROE_DOCUMENTO'
    BloqOpt = True
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 48
    Top = 56
    object xDocumentosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xDocumentosESTADO_ENVIO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_ENVIO'
      Size = 40
    end
    object xDocumentosDESCRIPCION_ESTADO: TFIBStringField
      DisplayLabel = 'Desc. Estado'
      FieldName = 'DESCRIPCION_ESTADO'
      Size = 256
    end
    object xDocumentosID_I: TIntegerField
      DisplayLabel = 'Id Reg. IVA'
      FieldName = 'ID_I'
    end
    object xDocumentosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDocumentosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDocumentosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDocumentosCODIGO_IDENTIFICATIVO: TFIBStringField
      DisplayLabel = 'Codigo Identificativo'
      FieldName = 'CODIGO_IDENTIFICATIVO'
      Size = 60
    end
    object xDocumentosCSV: TFIBStringField
      DisplayLabel = 'C.S.V.'
      FieldName = 'CSV'
      Size = 100
    end
    object xDocumentosFECHA_RECEPCION: TFIBStringField
      DisplayLabel = 'Fec. Recepcion'
      FieldName = 'FECHA_RECEPCION'
      Size = 40
    end
    object xDocumentosID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
  end
  object DSDocumentos: TDataSource
    DataSet = xDocumentos
    Left = 184
    Top = 56
  end
  object xDisponibles: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_FAC_TBAI'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_FAC_TBAI'
      
        '  (XML,SIGNATURE_VALUE,SERIE,RIG,ID_S,EMPRESA,EJERCICIO,CANAL,CO' +
        'DIGO_IDENTIFICATIVO,TIPO,CSV,SECUENCIA,FECHA_RECEPCION,XML_BAJA)'
      'VALUES'
      
        '  (?XML,?SIGNATURE_VALUE,?SERIE,?RIG,?ID_S,?EMPRESA,?EJERCICIO,?' +
        'CANAL,?CODIGO_IDENTIFICATIVO,?TIPO,?CSV,?SECUENCIA,?FECHA_RECEPC' +
        'ION,?XML_BAJA)')
    RefreshSQL.Strings = (
      
        'SELECT I.ID_I, F.TIPO, F.SERIE, F.RIG, T.CODIGO_IDENTIFICATIVO, ' +
        'T.CSV, T.FECHA_RECEPCION'
      'FROM EMP_REGISTRO_IVA I'
      
        'LEFT JOIN GES_CABECERAS_S C ON I.EMPRESA = C.EMPRESA AND I.EJERC' +
        'ICIO = C.EJERCICIO AND I.CANAL = C.CANAL AND I.DOC_SERIE = C.SER' +
        'IE AND I.DOC_TIPO = C.TIPO AND I.DOC_NUMERO = C.RIG'
      'LEFT JOIN GES_CABECERAS_S_FAC F ON C.ID_S = F.ID_S'
      
        'LEFT JOIN GES_CABECERAS_S_FAC_TBAI T ON T.ID_S = F.ID_S AND T.TI' +
        'PO = F.TIPO'
      'LEFT JOIN SII_LROE_DOCUMENTO L ON I.ID_I = L.ID_DOC'
      'WHERE'
      'I.ID_I = :ID_I')
    SelectSQL.Strings = (
      
        'SELECT I.ID_I, F.TIPO, F.SERIE, F.RIG, T.CODIGO_IDENTIFICATIVO, ' +
        'T.CSV, T.FECHA_RECEPCION'
      'FROM EMP_REGISTRO_IVA I'
      
        'LEFT JOIN GES_CABECERAS_S C ON I.EMPRESA = C.EMPRESA AND I.EJERC' +
        'ICIO = C.EJERCICIO AND I.CANAL = C.CANAL AND I.DOC_SERIE = C.SER' +
        'IE AND I.DOC_TIPO = C.TIPO AND I.DOC_NUMERO = C.RIG'
      'LEFT JOIN GES_CABECERAS_S_FAC F ON C.ID_S = F.ID_S'
      
        'LEFT JOIN GES_CABECERAS_S_FAC_TBAI T ON T.ID_S = F.ID_S AND T.TI' +
        'PO = F.TIPO'
      'LEFT JOIN SII_LROE_DOCUMENTO L ON I.ID_I = L.ID_DOC'
      'WHERE'
      'I.EMPRESA = :EMPRESA AND'
      'I.EJERCICIO = :EJERCICIO AND'
      'I.CANAL = :CANAL AND'
      'I.SIGNO = '#39'R'#39' AND'
      'C.ESTADO <> 6 AND'
      'C.FECHA >= '#39'2024.07.01'#39' AND'
      '((L.ID_DOC IS NULL) '
      '/*'
      'OR'
      '--'
      '((NOT EXISTS(SELECT ID'
      '             FROM SII_LROE_DOCUMENTO'
      '             WHERE'
      '             ID_DOC = F.ID_S AND'
      '             ESTADO_ENVIO = '#39'CORRECTO'#39')) AND'
      '--'
      '(NOT EXISTS(SELECT ID'
      '            FROM SII_LROE_DOCUMENTO'
      '            WHERE'
      '            ID_DOC = F.ID_S AND'
      '            ESTADO_ENVIO = '#39#39')))'
      '*/'
      ')'
      'ORDER BY F.SERIE, F.TIPO, F.RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_FAC_TBAI'
      'SET'
      '  XML=?XML '
      '  ,SIGNATURE_VALUE=?SIGNATURE_VALUE '
      '  ,ID_S=?ID_S '
      '  ,CODIGO_IDENTIFICATIVO=?CODIGO_IDENTIFICATIVO '
      '  ,CSV=?CSV '
      '  ,SECUENCIA=?SECUENCIA '
      '  ,FECHA_RECEPCION=?FECHA_RECEPCION '
      '  ,XML_BAJA=?XML_BAJA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    DataSource = DSPresentacion
    Plan.Strings = (
      ' ')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_FAC_TBAI'
    BloqOpt = True
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 48
    Top = 104
    object xDisponiblesID_I: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'ID_I'
    end
    object xDisponiblesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDisponiblesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDisponiblesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDisponiblesCODIGO_IDENTIFICATIVO: TFIBStringField
      DisplayLabel = 'Codigo Identificativo'
      FieldName = 'CODIGO_IDENTIFICATIVO'
      Size = 60
    end
    object xDisponiblesCSV: TFIBStringField
      DisplayLabel = 'C.S.V.'
      FieldName = 'CSV'
      Size = 100
    end
    object xDisponiblesFECHA_RECEPCION: TFIBStringField
      DisplayLabel = 'Fec. Recepcion'
      FieldName = 'FECHA_RECEPCION'
      Size = 40
    end
  end
  object DSDisponibles: TDataSource
    DataSet = xDisponibles
    Left = 184
    Top = 104
  end
end
