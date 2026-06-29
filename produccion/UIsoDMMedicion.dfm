object IsoDMMedicion: TIsoDMMedicion
  OldCreateOrder = False
  OnCreate = DMIsoMedicionCreate
  Left = 491
  Top = 205
  Height = 407
  Width = 535
  object QMMedicionC: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_MEDICION_C'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_MEDICION_C'
      
        '  (RIG,'#13#10'DENOMINACION,CODID,FECHA_COMPRA,FABRICANTE,NSERIE,DESCR' +
        'IPCION,UBICACION,PRCAL,USUARIO,RANGOM,'#13#10'DIVESCALA,INCERTIDUMBRE,' +
        'OBSERVACIONES,FRECUENCIA,CERTIFICADO,EMPRESA,ID_ISO_MEDICION_C)'
      'VALUES'
      
        '  (?RIG,'#13#10'?DENOMINACION,?CODID,?FECHA_COMPRA,?FABRICANTE,?NSERIE' +
        ',?DESCRIPCION,?UBICACION,?PRCAL,?USUARIO,?RANGOM,'#13#10'?DIVESCALA,?I' +
        'NCERTIDUMBRE,?OBSERVACIONES,?FRECUENCIA,?CERTIFICADO,?EMPRESA,?I' +
        'D_ISO_MEDICION_C)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_MEDICION_C'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_MEDICION_C'
      'WHERE'
      'EMPRESA=?EMPRESA '
      'ORDER BY RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_MEDICION_C'
      'SET'
      '  DENOMINACION=?DENOMINACION '
      '  ,CODID=?CODID '
      '  ,FECHA_COMPRA=?FECHA_COMPRA '
      '  ,FABRICANTE=?FABRICANTE '
      '  ,NSERIE=?NSERIE '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,UBICACION=?UBICACION '
      '  ,PRCAL=?PRCAL '
      '  ,USUARIO=?USUARIO '
      '  ,RANGOM=?RANGOM '
      '  ,DIVESCALA=?DIVESCALA '
      '  ,INCERTIDUMBRE=?INCERTIDUMBRE '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,CERTIFICADO=?CERTIFICADO '
      '  ,ID_ISO_MEDICION_C=?ID_ISO_MEDICION_C '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIG=?RIG ')
    AutoCalcFields = False
    AfterDelete = Graba
    AfterOpen = QMMedicionCAfterOpen
    AfterPost = Graba
    BeforeClose = QMMedicionCBeforeClose
    BeforePost = QMMedicionCBeforePost
    OnNewRecord = QMMedicionCNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'RIG')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_MEDICION_C'
    UpdateTransaction = TLocal
    Left = 40
    Top = 32
    object QMMedicionCRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMMedicionCDENOMINACION: TFIBStringField
      DisplayLabel = 'Denominaci'#243'n'
      FieldName = 'DENOMINACION'
      Size = 40
    end
    object QMMedicionCCODID: TFIBStringField
      DisplayLabel = 'Cod. Identificaci'#243'n'
      FieldName = 'CODID'
    end
    object QMMedicionCFECHA_COMPRA: TDateTimeField
      DisplayLabel = 'Fecha Adquisi'#243'n'
      FieldName = 'FECHA_COMPRA'
    end
    object QMMedicionCFABRICANTE: TFIBStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
      Size = 40
    end
    object QMMedicionCNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 10
    end
    object QMMedicionCDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMMedicionCPRCAL: TFIBStringField
      DisplayLabel = 'Calibraci'#243'n'
      FieldName = 'PRCAL'
      Size = 25
    end
    object QMMedicionCUBICACION: TFIBStringField
      DisplayLabel = 'Ubicaci'#243'n'
      FieldName = 'UBICACION'
      Size = 40
    end
    object QMMedicionCUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
      OnChange = QMMedicionCUSUARIOChange
    end
    object QMMedicionCxDescUsuario: TStringField
      DisplayLabel = 'Desc. Usuario'
      FieldKind = fkCalculated
      FieldName = 'xDescUsuario'
      Size = 40
      Calculated = True
    end
    object QMMedicionCRANGOM: TFIBStringField
      DisplayLabel = 'Rango de Medida'
      FieldName = 'RANGOM'
      Size = 25
    end
    object QMMedicionCDIVESCALA: TFIBStringField
      DisplayLabel = 'Divisi'#243'n de Escala'
      FieldName = 'DIVESCALA'
      Size = 25
    end
    object QMMedicionCINCERTIDUMBRE: TFIBStringField
      DisplayLabel = 'Incertidumbre'
      FieldName = 'INCERTIDUMBRE'
      Size = 25
    end
    object QMMedicionCOBSERVACIONES: TBlobField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object QMMedicionCFRECUENCIA: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
    object QMMedicionCEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMedicionCCERTIFICADO: TFIBStringField
      DisplayLabel = 'Certificado'
      FieldName = 'CERTIFICADO'
    end
    object QMMedicionCID_ISO_MEDICION_C: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_ISO_MEDICION_C'
    end
  end
  object DSQMMedicionC: TDataSource
    DataSet = QMMedicionC
    Left = 144
    Top = 32
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 384
    Top = 32
  end
  object QMMedicionD: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_MEDICION_D'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_MEDICION_D'
      
        '  (RIG,'#13#10'FECHA_ULT,FECHA_PROX,RESULTADO,LABORATORIO,LINEA,EMPRES' +
        'A)'
      'VALUES'
      
        '  (?RIG,'#13#10'?FECHA_ULT,?FECHA_PROX,?RESULTADO,?LABORATORIO,?LINEA,' +
        '?EMPRESA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_MEDICION_D'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_MEDICION_D'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIG=?RIG  '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_MEDICION_D'
      'SET'
      '  FECHA_ULT=?FECHA_ULT '
      '  ,FECHA_PROX=?FECHA_PROX '
      '  ,RESULTADO=?RESULTADO '
      '  ,LABORATORIO=?LABORATORIO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMMedicionC
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMMedicionDNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'RIG'
      'LINEA')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_MEDICION_D'
    UpdateTransaction = TLocal
    Left = 40
    Top = 80
    object QMMedicionDRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMMedicionDLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMMedicionDFECHA_ULT: TDateTimeField
      DisplayLabel = #218'ltima Calibraci'#243'n'
      FieldName = 'FECHA_ULT'
      OnChange = QMMedicionDFECHA_ULTChange
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMMedicionDFECHA_PROX: TDateTimeField
      DisplayLabel = 'Pr'#243'xima Calibraci'#243'n'
      FieldName = 'FECHA_PROX'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMMedicionDRESULTADO: TFIBStringField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
      Size = 25
    end
    object QMMedicionDLABORATORIO: TFIBStringField
      DisplayLabel = 'Laboratorio'
      FieldName = 'LABORATORIO'
      Size = 25
    end
    object QMMedicionDEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
  end
  object DSQMMedicionD: TDataSource
    DataSet = QMMedicionD
    Left = 144
    Top = 80
  end
  object xUsuarios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMPLEADOS_EF'
      'where empresa=?empresa and empleado=?usuario')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMPLEADOS_EF'
    UpdateTransaction = TLocal
    Left = 40
    Top = 128
    object xUsuariosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xUsuariosEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xUsuariosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xUsuariosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xUsuariosNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
  end
  object DSxUsuarios: TDataSource
    DataSet = xUsuarios
    Left = 144
    Top = 128
  end
  object frIsoInc: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Z_ESETRI_FICHA_EQ_MEDICION'
    RebuildPrinter = False
    OnGetValue = frIsoIncGetValue
    OnBeforePrint = frIsoIncEnterRect
    OnEnterRect = frIsoIncEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 384
    Top = 80
    ReportForm = {19000000}
  end
  object frDBQMDetalle: TfrDBDataSet
    DataSource = DSQMMedicionD
    Left = 248
    Top = 80
  end
end
