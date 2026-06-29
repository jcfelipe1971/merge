object DMSII: TDMSII
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 433
  Top = 328
  Height = 484
  Width = 664
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
  object xRegIVA: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM EMP_REGISTRO_IVA'
      'WHERE'
      'ID_I = ?ID_I')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 360
    Top = 56
  end
  object DSRegIVA: TDataSource
    DataSet = xRegIVA
    Left = 480
    Top = 56
  end
  object RegIVADetalle: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM EMP_REGISTRO_IVA_DETALLE'
      'WHERE'
      'ID_I = ?ID_I'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSRegIVA
    Left = 360
    Top = 104
  end
  object DSRegIVADetalle: TDataSource
    DataSet = RegIVADetalle
    Left = 480
    Top = 104
  end
  object RegIVADetalleDUA: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM EMP_REGISTRO_IVA_DETALLE_DUA'
      'WHERE'
      'ID_DETALLES_I = ?ID_DETALLES_I'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSRegIVADetalle
    Left = 360
    Top = 152
  end
  object DSRegIVADetalleDUA: TDataSource
    DataSet = RegIVADetalleDUA
    Left = 480
    Top = 152
  end
  object RegIVADetalleRECC: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM EMP_REGISTRO_IVA_DET_RECC'
      'WHERE'
      'ID_DETALLES_I = ?ID_DETALLES_I')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSRegIVADetalle
    Left = 360
    Top = 200
  end
  object DSRegIVADetalleRECC: TDataSource
    DataSet = RegIVADetalleRECC
    Left = 480
    Top = 200
  end
  object xPresentacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_PRESENTACION'
      'WHERE'
      '  ID_SII_PRESENTACION=?old_ID_SII_PRESENTACION ')
    InsertSQL.Strings = (
      'INSERT INTO SII_PRESENTACION'
      '  (ID_SII_PRESENTACION,EMPRESA,CANAL,TIPO_PRESENTACION)'
      'VALUES'
      '  (?ID_SII_PRESENTACION,?EMPRESA,?CANAL,?TIPO_PRESENTACION)')
    RefreshSQL.Strings = (
      '/* No traigo campos BLOB para optimizar velocidad */'
      'SELECT ID_SII_PRESENTACION, EMPRESA, CANAL, TIPO_PRESENTACION '
      'FROM SII_PRESENTACION'
      'WHERE'
      '  ID_SII_PRESENTACION=?ID_SII_PRESENTACION ')
    SelectSQL.Strings = (
      '/* No traigo campos BLOB para optimizar velocidad */'
      
        'SELECT ID_SII_PRESENTACION, EMPRESA, CANAL, TIPO_PRESENTACION FR' +
        'OM SII_PRESENTACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  CANAL=?CANAL '
      'ORDER BY'
      '  ID_SII_PRESENTACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_PRESENTACION'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,TIPO_PRESENTACION=?TIPO_PRESENTACION '
      'WHERE'
      '  ID_SII_PRESENTACION=?ID_SII_PRESENTACION ')
    Plan.Strings = (
      ' ')
    AfterOpen = xPresentacionAfterOpen
    AfterPost = xPresentacionAfterPost
    AfterScroll = xPresentacionAfterScroll
    BeforeClose = xPresentacionBeforeClose
    BeforePost = xPresentacionBeforePost
    OnNewRecord = xPresentacionNewRecord
    ClavesPrimarias.Strings = (
      'ID_SII_PRESENTACION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_PRESENTACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object xPresentacionID_SII_PRESENTACION: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_SII_PRESENTACION'
    end
    object xPresentacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPresentacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPresentacionTIPO_PRESENTACION: TFIBStringField
      DisplayLabel = 'Tipo Presentacion'
      FieldName = 'TIPO_PRESENTACION'
      Size = 3
    end
  end
  object DSPresentacion: TDataSource
    DataSet = xPresentacion
    Left = 184
    Top = 8
  end
  object xSLRFacEmi: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_SUMLRFACTURASEMITIDAS'
      'WHERE'
      
        '  ID_SII_SUMLRFACTURASEMITIDAS=?old_ID_SII_SUMLRFACTURASEMITIDAS' +
        ' ')
    InsertSQL.Strings = (
      'INSERT INTO SII_SUMLRFACTURASEMITIDAS'
      
        '  (ID_SII_PRESENTACION,ID_SII_SUMLRFACTURASEMITIDAS,IDVERSIONSII' +
        ',TITULAR_NOMBRE_RAZON,NIF_REPRESENTANTE,NIF,TIPOCOMUNICACION,FEC' +
        'HA_CREACION,FECHA_PRESENTACION,CSV,ESTADO_ENVIO)'
      'VALUES'
      
        '  (?ID_SII_PRESENTACION,?ID_SII_SUMLRFACTURASEMITIDAS,?IDVERSION' +
        'SII,?TITULAR_NOMBRE_RAZON,?NIF_REPRESENTANTE,?NIF,?TIPOCOMUNICAC' +
        'ION,?FECHA_CREACION,?FECHA_PRESENTACION,?CSV,?ESTADO_ENVIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_SUMLRFACTURASEMITIDAS'
      'WHERE'
      '  ID_SII_SUMLRFACTURASEMITIDAS=?ID_SII_SUMLRFACTURASEMITIDAS ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_SUMLRFACTURASEMITIDAS'
      'WHERE'
      '  ID_SII_PRESENTACION=?ID_SII_PRESENTACION '
      'ORDER BY'
      '  ID_SII_SUMLRFACTURASEMITIDAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_SUMLRFACTURASEMITIDAS'
      'SET'
      '  ID_SII_PRESENTACION=?ID_SII_PRESENTACION '
      '  ,IDVERSIONSII=?IDVERSIONSII '
      '  ,TITULAR_NOMBRE_RAZON=?TITULAR_NOMBRE_RAZON '
      '  ,NIF_REPRESENTANTE=?NIF_REPRESENTANTE '
      '  ,NIF=?NIF '
      '  ,TIPOCOMUNICACION=?TIPOCOMUNICACION '
      '  ,FECHA_CREACION=?FECHA_CREACION '
      '  ,FECHA_PRESENTACION=?FECHA_PRESENTACION '
      '  ,CSV=?CSV'
      '  ,ESTADO_ENVIO=?ESTADO_ENVIO'
      'WHERE'
      '  ID_SII_SUMLRFACTURASEMITIDAS=?ID_SII_SUMLRFACTURASEMITIDAS ')
    DataSource = DSPresentacion
    Plan.Strings = (
      ' ')
    AfterOpen = xSLRFacEmiAfterOpen
    AfterScroll = xSLRFacEmiAfterScroll
    BeforeClose = xSLRFacEmiBeforeClose
    BeforePost = xSLRFacEmiBeforePost
    OnNewRecord = xSLRFacEmiNewRecord
    ClavesPrimarias.Strings = (
      'ID_SII_SUMLRFACTURASEMITIDAS ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_SUMLRFACTURASEMITIDAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object xSLRFacEmiID_SII_PRESENTACION: TIntegerField
      FieldName = 'ID_SII_PRESENTACION'
    end
    object xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS: TIntegerField
      FieldName = 'ID_SII_SUMLRFACTURASEMITIDAS'
    end
    object xSLRFacEmiIDVERSIONSII: TFIBStringField
      FieldName = 'IDVERSIONSII'
      Size = 3
    end
    object xSLRFacEmiTITULAR_NOMBRE_RAZON: TFIBStringField
      FieldName = 'TITULAR_NOMBRE_RAZON'
      Size = 40
    end
    object xSLRFacEmiNIF_REPRESENTANTE: TFIBStringField
      FieldName = 'NIF_REPRESENTANTE'
      Size = 9
    end
    object xSLRFacEmiNIF: TFIBStringField
      FieldName = 'NIF'
      Size = 9
    end
    object xSLRFacEmiTIPOCOMUNICACION: TFIBStringField
      FieldName = 'TIPOCOMUNICACION'
      Size = 2
    end
    object xSLRFacEmiFECHA_CREACION: TDateTimeField
      FieldName = 'FECHA_CREACION'
    end
    object xSLRFacEmiFECHA_PRESENTACION: TDateTimeField
      FieldName = 'FECHA_PRESENTACION'
    end
    object xSLRFacEmiCSV: TFIBStringField
      FieldName = 'CSV'
    end
    object xSLRFacEmiESTADO_ENVIO: TFIBStringField
      FieldName = 'ESTADO_ENVIO'
      Size = 40
    end
  end
  object DSSLRFacEmi: TDataSource
    DataSet = xSLRFacEmi
    Left = 192
    Top = 56
  end
  object xSLRFacRec: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_SUMLRFACTURASRECIBIDAS'
      'WHERE'
      
        '  ID_SII_SUMLRFACTURASRECIBIDAS=?old_ID_SII_SUMLRFACTURASRECIBID' +
        'AS ')
    InsertSQL.Strings = (
      'INSERT INTO SII_SUMLRFACTURASRECIBIDAS'
      
        '  (ID_SII_PRESENTACION,ID_SII_SUMLRFACTURASRECIBIDAS,IDVERSIONSI' +
        'I,TITULAR_NOMBRE_RAZON,NIF_REPRESENTANTE,NIF,TIPOCOMUNICACION,FE' +
        'CHA_CREACION,FECHA_PRESENTACION,CSV,ESTADO_ENVIO)'
      'VALUES'
      
        '  (?ID_SII_PRESENTACION,?ID_SII_SUMLRFACTURASRECIBIDAS,?IDVERSIO' +
        'NSII,?TITULAR_NOMBRE_RAZON,?NIF_REPRESENTANTE,?NIF,?TIPOCOMUNICA' +
        'CION,?FECHA_CREACION,?FECHA_PRESENTACION,?CSV,?ESTADO_ENVIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_SUMLRFACTURASRECIBIDAS'
      'WHERE'
      '  ID_SII_SUMLRFACTURASRECIBIDAS=?ID_SII_SUMLRFACTURASRECIBIDAS ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_SUMLRFACTURASRECIBIDAS'
      'WHERE'
      '  ID_SII_PRESENTACION=?ID_SII_PRESENTACION '
      'ORDER BY'
      '  ID_SII_SUMLRFACTURASRECIBIDAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_SUMLRFACTURASRECIBIDAS'
      'SET'
      '  ID_SII_PRESENTACION=?ID_SII_PRESENTACION '
      '  ,IDVERSIONSII=?IDVERSIONSII '
      '  ,TITULAR_NOMBRE_RAZON=?TITULAR_NOMBRE_RAZON '
      '  ,NIF_REPRESENTANTE=?NIF_REPRESENTANTE '
      '  ,NIF=?NIF '
      '  ,TIPOCOMUNICACION=?TIPOCOMUNICACION '
      '  ,FECHA_CREACION=?FECHA_CREACION '
      '  ,FECHA_PRESENTACION=?FECHA_PRESENTACION '
      '  ,CSV=?CSV'
      '  ,ESTADO_ENVIO=?ESTADO_ENVIO'
      'WHERE'
      '  ID_SII_SUMLRFACTURASRECIBIDAS=?ID_SII_SUMLRFACTURASRECIBIDAS ')
    DataSource = DSPresentacion
    Plan.Strings = (
      ' ')
    AfterOpen = xSLRFacRecAfterOpen
    AfterScroll = xSLRFacRecAfterScroll
    BeforeClose = xSLRFacRecBeforeClose
    BeforePost = xSLRFacRecBeforePost
    OnNewRecord = xSLRFacRecNewRecord
    ClavesPrimarias.Strings = (
      'ID_SII_SUMLRFACTURASRECIBIDAS ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_SUMLRFACTURASRECIBIDAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 248
    object xSLRFacRecID_SII_PRESENTACION: TIntegerField
      FieldName = 'ID_SII_PRESENTACION'
    end
    object xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS: TIntegerField
      FieldName = 'ID_SII_SUMLRFACTURASRECIBIDAS'
    end
    object xSLRFacRecIDVERSIONSII: TFIBStringField
      FieldName = 'IDVERSIONSII'
      Size = 3
    end
    object xSLRFacRecTITULAR_NOMBRE_RAZON: TFIBStringField
      FieldName = 'TITULAR_NOMBRE_RAZON'
      Size = 40
    end
    object xSLRFacRecNIF_REPRESENTANTE: TFIBStringField
      FieldName = 'NIF_REPRESENTANTE'
      Size = 9
    end
    object xSLRFacRecNIF: TFIBStringField
      FieldName = 'NIF'
      Size = 9
    end
    object xSLRFacRecTIPOCOMUNICACION: TFIBStringField
      FieldName = 'TIPOCOMUNICACION'
      Size = 2
    end
    object xSLRFacRecFECHA_CREACION: TDateTimeField
      FieldName = 'FECHA_CREACION'
    end
    object xSLRFacRecFECHA_PRESENTACION: TDateTimeField
      FieldName = 'FECHA_PRESENTACION'
    end
    object xSLRFacRecCSV: TFIBStringField
      FieldName = 'CSV'
    end
    object xSLRFacRecESTADO_ENVIO: TFIBStringField
      FieldName = 'ESTADO_ENVIO'
      Size = 40
    end
  end
  object DSSLRFacRec: TDataSource
    DataSet = xSLRFacRec
    Left = 192
    Top = 248
  end
  object xRLRFacEmi: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'UPDATE SII_REGLRFACTURASEMITIDAS'
      'SET '
      '  ID_SII_SUMLRFACTURASEMITIDAS = 0'
      'WHERE'
      
        '  ID_SII_REGLRFACTURASEMITIDAS=?old_ID_SII_REGLRFACTURASEMITIDAS' +
        ' ')
    InsertSQL.Strings = (
      'INSERT INTO SII_REGLRFACTURASEMITIDAS'
      
        '  (ID_SII_PRESENTACION,ID_SII_REGLRFACTURASEMITIDAS,ID_SII_SUMLR' +
        'FACTURASEMITIDAS,ID_I,'
      
        'PERIODOIMPOSITIVO_EJERCICIO,PERIODOIMPOSITIVO_PERIODO,IDFAC_EMIS' +
        'OR_NIF,IDFAC_EMISOR_NUMSERIEFAC,'
      
        'IDFAC_EMISOR_NUMSERIEFACFIN,IDFAC_EMISOR_FECHA_EXPEDICION,FACEXP' +
        '_TIPOFACTURA,FACEXP_TIPORECTIFICATIVA,'
      
        'FACEXP_FAGR_NUMSERIEFACEMISOR,FACEXP_FAGR_FECHAEXPEDICION,FACEXP' +
        '_FRECT_NUMSERIEFACEMISOR,'
      
        'FACEXP_FRECT_FECHAEXPEDICION,FACEXP_IMPRECT_BASERECT,FACEXP_IMPR' +
        'ECT_CUOTARECT,'
      
        'FACEXP_IMPRECT_CUOTARECRECT,FACEXP_FECHAOPERACION,FACEXP_CLAVE_R' +
        'EG_ESP,FACEXP_CLAVE_REG_ESP1,'
      
        'FACEXP_CLAVE_REG_ESP2,FACEXP_NUMREGACUERDOFAC,FACEXP_IMPORTE_TOT' +
        'AL,FACEXP_BASEIMPONIBLEACOSTE,'
      
        'FACEXP_DESCRIPCION,FACEXP_INMUEBLE_SITUACIONINM,FACEXP_INMUEBLE_' +
        'REFCATASTRAL,'
      
        'FACEXP_IMPORTETRANSMSUJETAIVA,FACEXP_EMITIDA_POR_TERCEROS,FACEXP' +
        '_VARIOSDESTINATARIOS,FACEXP_CUPON,'
      
        'FACEXP_CONTRAP_NOMBRE_RAZON,FACEXP_CONTRAP_NIF_REPRES,FACEXP_CON' +
        'TRAP_NIF,'
      
        'FACEXP_CONTRAPARTE_CODPAIS,FACEXP_CONTRAPARTE_IDTYPE,FACEXP_CONT' +
        'RAPARTE_ID,TIPO_DESGLOSE,'
      'TIPO_DESGLOSE_OPERACION)'
      'VALUES'
      
        '  (?ID_SII_PRESENTACION,?ID_SII_REGLRFACTURASEMITIDAS,?ID_SII_SU' +
        'MLRFACTURASEMITIDAS,?ID_I,'
      
        '?PERIODOIMPOSITIVO_EJERCICIO,?PERIODOIMPOSITIVO_PERIODO,?IDFAC_E' +
        'MISOR_NIF,?IDFAC_EMISOR_NUMSERIEFAC,'
      
        '?IDFAC_EMISOR_NUMSERIEFACFIN,?IDFAC_EMISOR_FECHA_EXPEDICION,?FAC' +
        'EXP_TIPOFACTURA,?FACEXP_TIPORECTIFICATIVA,'
      
        '?FACEXP_FAGR_NUMSERIEFACEMISOR,?FACEXP_FAGR_FECHAEXPEDICION,?FAC' +
        'EXP_FRECT_NUMSERIEFACEMISOR,'
      
        '?FACEXP_FRECT_FECHAEXPEDICION,?FACEXP_IMPRECT_BASERECT,?FACEXP_I' +
        'MPRECT_CUOTARECT,'
      
        '?FACEXP_IMPRECT_CUOTARECRECT,?FACEXP_FECHAOPERACION,?FACEXP_CLAV' +
        'E_REG_ESP,?FACEXP_CLAVE_REG_ESP1,'
      
        '?FACEXP_CLAVE_REG_ESP2,?FACEXP_NUMREGACUERDOFAC,?FACEXP_IMPORTE_' +
        'TOTAL,?FACEXP_BASEIMPONIBLEACOSTE,'
      
        '?FACEXP_DESCRIPCION,?FACEXP_INMUEBLE_SITUACIONINM,?FACEXP_INMUEB' +
        'LE_REFCATASTRAL,'
      
        '?FACEXP_IMPORTETRANSMSUJETAIVA,?FACEXP_EMITIDA_POR_TERCEROS,?FAC' +
        'EXP_VARIOSDESTINATARIOS,'
      
        '?FACEXP_CUPON,?FACEXP_CONTRAP_NOMBRE_RAZON,?FACEXP_CONTRAP_NIF_R' +
        'EPRES,?FACEXP_CONTRAP_NIF,'
      
        '?FACEXP_CONTRAPARTE_CODPAIS,?FACEXP_CONTRAPARTE_IDTYPE,?FACEXP_C' +
        'ONTRAPARTE_ID,?TIPO_DESGLOSE,'
      '?TIPO_DESGLOSE_OPERACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_REGLRFACTURASEMITIDAS'
      'WHERE'
      '  ID_SII_REGLRFACTURASEMITIDAS=?ID_SII_REGLRFACTURASEMITIDAS ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_REGLRFACTURASEMITIDAS'
      'WHERE'
      '  ID_SII_SUMLRFACTURASEMITIDAS=?ID_SII_SUMLRFACTURASEMITIDAS'
      'ORDER BY'
      '  CODIGO_ERROR DESC, ID_SII_REGLRFACTURASEMITIDAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_REGLRFACTURASEMITIDAS'
      'SET'
      '  ID_SII_PRESENTACION=?ID_SII_PRESENTACION '
      '  ,ID_SII_SUMLRFACTURASEMITIDAS=?ID_SII_SUMLRFACTURASEMITIDAS '
      '  ,ID_I=?ID_I '
      '  ,PERIODOIMPOSITIVO_EJERCICIO=?PERIODOIMPOSITIVO_EJERCICIO '
      '  ,PERIODOIMPOSITIVO_PERIODO=?PERIODOIMPOSITIVO_PERIODO '
      '  ,IDFAC_EMISOR_NIF=?IDFAC_EMISOR_NIF '
      '  ,IDFAC_EMISOR_NUMSERIEFAC=?IDFAC_EMISOR_NUMSERIEFAC '
      '  ,IDFAC_EMISOR_NUMSERIEFACFIN=?IDFAC_EMISOR_NUMSERIEFACFIN '
      '  ,IDFAC_EMISOR_FECHA_EXPEDICION=?IDFAC_EMISOR_FECHA_EXPEDICION '
      '  ,FACEXP_TIPOFACTURA=?FACEXP_TIPOFACTURA '
      '  ,FACEXP_TIPORECTIFICATIVA=?FACEXP_TIPORECTIFICATIVA '
      '  ,FACEXP_FAGR_NUMSERIEFACEMISOR=?FACEXP_FAGR_NUMSERIEFACEMISOR '
      '  ,FACEXP_FAGR_FECHAEXPEDICION=?FACEXP_FAGR_FECHAEXPEDICION '
      
        '  ,FACEXP_FRECT_NUMSERIEFACEMISOR=?FACEXP_FRECT_NUMSERIEFACEMISO' +
        'R '
      '  ,FACEXP_FRECT_FECHAEXPEDICION=?FACEXP_FRECT_FECHAEXPEDICION '
      '  ,FACEXP_IMPRECT_BASERECT=?FACEXP_IMPRECT_BASERECT '
      '  ,FACEXP_IMPRECT_CUOTARECT=?FACEXP_IMPRECT_CUOTARECT '
      '  ,FACEXP_IMPRECT_CUOTARECRECT=?FACEXP_IMPRECT_CUOTARECRECT '
      '  ,FACEXP_FECHAOPERACION=?FACEXP_FECHAOPERACION '
      '  ,FACEXP_CLAVE_REG_ESP=?FACEXP_CLAVE_REG_ESP '
      '  ,FACEXP_CLAVE_REG_ESP1=?FACEXP_CLAVE_REG_ESP1 '
      '  ,FACEXP_CLAVE_REG_ESP2=?FACEXP_CLAVE_REG_ESP2 '
      '  ,FACEXP_NUMREGACUERDOFAC=?FACEXP_NUMREGACUERDOFAC '
      '  ,FACEXP_IMPORTE_TOTAL=?FACEXP_IMPORTE_TOTAL '
      '  ,FACEXP_BASEIMPONIBLEACOSTE=?FACEXP_BASEIMPONIBLEACOSTE '
      '  ,FACEXP_DESCRIPCION=?FACEXP_DESCRIPCION '
      '  ,FACEXP_INMUEBLE_SITUACIONINM=?FACEXP_INMUEBLE_SITUACIONINM '
      '  ,FACEXP_INMUEBLE_REFCATASTRAL=?FACEXP_INMUEBLE_REFCATASTRAL '
      '  ,FACEXP_IMPORTETRANSMSUJETAIVA=?FACEXP_IMPORTETRANSMSUJETAIVA '
      '  ,FACEXP_EMITIDA_POR_TERCEROS=?FACEXP_EMITIDA_POR_TERCEROS '
      '  ,FACEXP_VARIOSDESTINATARIOS=?FACEXP_VARIOSDESTINATARIOS '
      '  ,FACEXP_CUPON=?FACEXP_CUPON '
      '  ,FACEXP_CONTRAP_NOMBRE_RAZON=?FACEXP_CONTRAP_NOMBRE_RAZON '
      '  ,FACEXP_CONTRAP_NIF_REPRES=?FACEXP_CONTRAP_NIF_REPRES '
      '  ,FACEXP_CONTRAP_NIF=?FACEXP_CONTRAP_NIF '
      '  ,FACEXP_CONTRAPARTE_CODPAIS=?FACEXP_CONTRAPARTE_CODPAIS '
      '  ,FACEXP_CONTRAPARTE_IDTYPE=?FACEXP_CONTRAPARTE_IDTYPE '
      '  ,FACEXP_CONTRAPARTE_ID=?FACEXP_CONTRAPARTE_ID '
      '  ,TIPO_DESGLOSE=?TIPO_DESGLOSE '
      '  ,TIPO_DESGLOSE_OPERACION=?TIPO_DESGLOSE_OPERACION '
      'WHERE'
      '  ID_SII_REGLRFACTURASEMITIDAS=?ID_SII_REGLRFACTURASEMITIDAS ')
    DataSource = DSSLRFacEmi
    Plan.Strings = (
      ' ')
    AfterDelete = xRLRFacEmiAfterDelete
    AfterOpen = xRLRFacEmiAfterOpen
    BeforeClose = xRLRFacEmiBeforeClose
    ClavesPrimarias.Strings = (
      'ID_SII_REGLRFACTURASEMITIDAS ')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_REGLRFACTURASEMITIDAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 104
    object xRLRFacEmiID_SII_PRESENTACION: TIntegerField
      DisplayLabel = 'Id Presentacion'
      FieldName = 'ID_SII_PRESENTACION'
    end
    object xRLRFacEmiID_SII_REGLRFACTURASEMITIDAS: TIntegerField
      DisplayLabel = 'Id Registro'
      FieldName = 'ID_SII_REGLRFACTURASEMITIDAS'
    end
    object xRLRFacEmiID_SII_SUMLRFACTURASEMITIDAS: TIntegerField
      DisplayLabel = 'Id Suministro'
      FieldName = 'ID_SII_SUMLRFACTURASEMITIDAS'
    end
    object xRLRFacEmiPERIODOIMPOSITIVO_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejerc.'
      FieldName = 'PERIODOIMPOSITIVO_EJERCICIO'
    end
    object xRLRFacEmiPERIODOIMPOSITIVO_PERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODOIMPOSITIVO_PERIODO'
      Size = 2
    end
    object xRLRFacEmiIDFAC_EMISOR_NIF: TFIBStringField
      DisplayLabel = 'NIF Emisor'
      FieldName = 'IDFAC_EMISOR_NIF'
      Size = 9
    end
    object xRLRFacEmiIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField
      DisplayLabel = 'Serie, Nro. Fac.'
      FieldName = 'IDFAC_EMISOR_NUMSERIEFAC'
      Size = 60
    end
    object xRLRFacEmiIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField
      DisplayLabel = 'Serie, Nro. Fac. Fin'
      FieldName = 'IDFAC_EMISOR_NUMSERIEFACFIN'
      Size = 60
    end
    object xRLRFacEmiIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField
      DisplayLabel = 'Fec. Exped.'
      FieldName = 'IDFAC_EMISOR_FECHA_EXPEDICION'
    end
    object xRLRFacEmiFACEXP_TIPOFACTURA: TFIBStringField
      DisplayLabel = 'Tipo Fac.'
      FieldName = 'FACEXP_TIPOFACTURA'
      Size = 2
    end
    object xRLRFacEmiFACEXP_TIPORECTIFICATIVA: TFIBStringField
      DisplayLabel = 'Tipo Rect.'
      FieldName = 'FACEXP_TIPORECTIFICATIVA'
      Size = 1
    end
    object xRLRFacEmiFACEXP_FAGR_NUMSERIEFACEMISOR: TFIBStringField
      DisplayLabel = 'F. Agrup. Serie, Nro. Fac.'
      FieldName = 'FACEXP_FAGR_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacEmiFACEXP_FAGR_FECHAEXPEDICION: TDateTimeField
      DisplayLabel = 'F. Agrup. Fec. Exped.'
      FieldName = 'FACEXP_FAGR_FECHAEXPEDICION'
    end
    object xRLRFacEmiFACEXP_NUMREGACUERDOFAC: TFIBStringField
      DisplayLabel = 'Nro. Reg. Acuerdo'
      FieldName = 'FACEXP_NUMREGACUERDOFAC'
      Size = 15
    end
    object xRLRFacEmiFACEXP_FRECT_NUMSERIEFACEMISOR: TFIBStringField
      DisplayLabel = 'F. Rect. Serie, Nro. Fac.'
      FieldName = 'FACEXP_FRECT_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacEmiFACEXP_FRECT_FECHAEXPEDICION: TDateTimeField
      DisplayLabel = 'F. Rect. Fec. Exped.'
      FieldName = 'FACEXP_FRECT_FECHAEXPEDICION'
    end
    object xRLRFacEmiFACEXP_IMPRECT_BASERECT: TFloatField
      DisplayLabel = 'Base Rect.'
      FieldName = 'FACEXP_IMPRECT_BASERECT'
    end
    object xRLRFacEmiFACEXP_IMPRECT_CUOTARECT: TFloatField
      DisplayLabel = 'Cuota Rect.'
      FieldName = 'FACEXP_IMPRECT_CUOTARECT'
    end
    object xRLRFacEmiFACEXP_IMPRECT_CUOTARECRECT: TFloatField
      DisplayLabel = 'Cuota RE Rect.'
      FieldName = 'FACEXP_IMPRECT_CUOTARECRECT'
    end
    object xRLRFacEmiFACEXP_FECHAOPERACION: TDateTimeField
      DisplayLabel = 'Fec. Operacion'
      FieldName = 'FACEXP_FECHAOPERACION'
    end
    object xRLRFacEmiFACEXP_CLAVE_REG_ESP: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp.'
      FieldName = 'FACEXP_CLAVE_REG_ESP'
      Size = 2
    end
    object xRLRFacEmiFACEXP_CLAVE_REG_ESP1: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp. 1'
      FieldName = 'FACEXP_CLAVE_REG_ESP1'
      Size = 2
    end
    object xRLRFacEmiFACEXP_CLAVE_REG_ESP2: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp. 2'
      FieldName = 'FACEXP_CLAVE_REG_ESP2'
      Size = 2
    end
    object xRLRFacEmiFACEXP_IMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Importe Total'
      FieldName = 'FACEXP_IMPORTE_TOTAL'
    end
    object xRLRFacEmiFACEXP_BASEIMPONIBLEACOSTE: TFloatField
      DisplayLabel = 'B. Imponible a Coste'
      FieldName = 'FACEXP_BASEIMPONIBLEACOSTE'
    end
    object xRLRFacEmiFACEXP_DESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'FACEXP_DESCRIPCION'
      Size = 500
    end
    object xRLRFacEmiFACEXP_INMUEBLE_SITUACIONINM: TFIBStringField
      DisplayLabel = 'Situacion Inmueble'
      FieldName = 'FACEXP_INMUEBLE_SITUACIONINM'
      Size = 1
    end
    object xRLRFacEmiFACEXP_INMUEBLE_REFCATASTRAL: TFIBStringField
      DisplayLabel = 'Ref. Catastral'
      FieldName = 'FACEXP_INMUEBLE_REFCATASTRAL'
      Size = 25
    end
    object xRLRFacEmiFACEXP_IMPORTETRANSMSUJETAIVA: TFloatField
      DisplayLabel = 'Importe Transm. Sujeta IVA'
      FieldName = 'FACEXP_IMPORTETRANSMSUJETAIVA'
    end
    object xRLRFacEmiFACEXP_EMITIDA_POR_TERCEROS: TFIBStringField
      DisplayLabel = 'Emit. por Terceros'
      FieldName = 'FACEXP_EMITIDA_POR_TERCEROS'
      Size = 1
    end
    object xRLRFacEmiFACEXP_VARIOSDESTINATARIOS: TFIBStringField
      DisplayLabel = 'Varios Destinatarios'
      FieldName = 'FACEXP_VARIOSDESTINATARIOS'
      Size = 1
    end
    object xRLRFacEmiFACEXP_CUPON: TFIBStringField
      DisplayLabel = 'Cupon'
      FieldName = 'FACEXP_CUPON'
      Size = 1
    end
    object xRLRFacEmiFACEXP_CONTRAP_NOMBRE_RAZON: TFIBStringField
      DisplayLabel = 'Nombre Razon Contrap.'
      FieldName = 'FACEXP_CONTRAP_NOMBRE_RAZON'
      Size = 120
    end
    object xRLRFacEmiFACEXP_CONTRAP_NIF_REPRES: TFIBStringField
      DisplayLabel = 'NIF Repr. Contrap.'
      FieldName = 'FACEXP_CONTRAP_NIF_REPRES'
      Size = 9
    end
    object xRLRFacEmiFACEXP_CONTRAP_NIF: TFIBStringField
      DisplayLabel = 'NIF Contrap.'
      FieldName = 'FACEXP_CONTRAP_NIF'
      Size = 9
    end
    object xRLRFacEmiFACEXP_CONTRAPARTE_CODPAIS: TFIBStringField
      DisplayLabel = 'Cod. Pais Contrap.'
      FieldName = 'FACEXP_CONTRAPARTE_CODPAIS'
      Size = 2
    end
    object xRLRFacEmiFACEXP_CONTRAPARTE_IDTYPE: TFIBStringField
      DisplayLabel = 'Tipo NIF Contrap.'
      FieldName = 'FACEXP_CONTRAPARTE_IDTYPE'
      Size = 2
    end
    object xRLRFacEmiFACEXP_CONTRAPARTE_ID: TFIBStringField
      DisplayLabel = 'NIF Otro Contrap.'
      FieldName = 'FACEXP_CONTRAPARTE_ID'
    end
    object xRLRFacEmiID_I: TIntegerField
      DisplayLabel = 'Id Reg. IVA'
      FieldName = 'ID_I'
    end
    object xRLRFacEmiTIPO_DESGLOSE: TFIBStringField
      DisplayLabel = 'Tipo Desglose'
      FieldName = 'TIPO_DESGLOSE'
      Size = 1
    end
    object xRLRFacEmiTIPO_DESGLOSE_OPERACION: TFIBStringField
      DisplayLabel = 'Tipo Desglose Oper.'
      FieldName = 'TIPO_DESGLOSE_OPERACION'
      Size = 1
    end
    object xRLRFacEmiESTADO_REGISTRO: TFIBStringField
      DisplayLabel = 'Estado Reg.'
      FieldName = 'ESTADO_REGISTRO'
      Size = 40
    end
    object xRLRFacEmiCODIGO_ERROR: TFIBStringField
      DisplayLabel = 'Codigo Error'
      FieldName = 'CODIGO_ERROR'
    end
    object xRLRFacEmiDESCRIPCION_ERROR: TFIBStringField
      DisplayLabel = 'Descripcion Error'
      DisplayWidth = 500
      FieldName = 'DESCRIPCION_ERROR'
      Size = 500
    end
  end
  object DSRLRFacEmi: TDataSource
    DataSet = xRLRFacEmi
    Left = 200
    Top = 104
  end
  object xRLRFacRec: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'UPDATE SII_REGLRFACTURASRECIBIDAS'
      'SET'
      '  ID_SII_SUMLRFACTURASRECIBIDAS = 0'
      'WHERE'
      
        '  ID_SII_REGLRFACTURASRECIBIDAS=?old_ID_SII_REGLRFACTURASRECIBID' +
        'AS ')
    InsertSQL.Strings = (
      'INSERT INTO SII_REGLRFACTURASRECIBIDAS'
      
        '  (ID_SII_PRESENTACION,ID_SII_REGLRFACTURASRECIBIDAS,ID_SII_SUML' +
        'RFACTURASRECIBIDAS,ID_I,PERIODOIMPOSITIVO_EJERCICIO,PERIODOIMPOS' +
        'ITIVO_PERIODO,IDFAC_EMISOR_NIF,IDFAC_EMISOR_OTRO_CODPAIS,IDFAC_E' +
        'MISOR_OTRO_IDTYPE,IDFAC_EMISOR_OTRO_ID,IDFAC_EMISOR_NUMSERIEFAC,' +
        'IDFAC_EMISOR_NUMSERIEFACFIN,IDFAC_EMISOR_FECHA_EXPEDICION,FACREC' +
        '_TIPOFACTURA,FACREC_TIPORECTIFICATIVA,FACREC_FAGR_NUMSERIEFACEMI' +
        'SOR,FACREC_FAGR_FECHAEXPEDICION,FACREC_FRECT_NUMSERIEFACEMISOR,F' +
        'ACREC_FRECT_FECHAEXPEDICION,FACREC_IMPRECT_BASERECT,FACREC_IMPRE' +
        'CT_CUOTARECT,FACREC_IMPRECT_CUOTARECRECT,FACREC_FECHAOPERACION,F' +
        'ACREC_CLAVE_REG_ESP,FACREC_CLAVE_REG_ESP1,FACREC_CLAVE_REG_ESP2,' +
        'FACREC_NUMREGACUERDOFAC,FACREC_IMPORTE_TOTAL,FACREC_BASEIMPONIBL' +
        'EACOSTE,FACREC_DESCRIPCION,FACREC_ADUANAS_NUMERODUA,FACREC_ADUAN' +
        'AS_FECHAREGCONTDUA,FACREC_CONTRAP_NOMBRE_RAZON,FACREC_CONTRAP_NI' +
        'F_REPRES,FACREC_CONTRAP_NIF,FACREC_CONTRAPARTE_CODPAIS,FACREC_CO' +
        'NTRAPARTE_IDTYPE,FACREC_CONTRAPARTE_ID,FACREC_FECHAREGCONTABLE,F' +
        'ACREC_CUOTA_DEDUCIBLE)'
      'VALUES'
      
        '  (?ID_SII_PRESENTACION,?ID_SII_REGLRFACTURASRECIBIDAS,?ID_SII_S' +
        'UMLRFACTURASRECIBIDAS,?ID_I,?PERIODOIMPOSITIVO_EJERCICIO,?PERIOD' +
        'OIMPOSITIVO_PERIODO,?IDFAC_EMISOR_NIF,?IDFAC_EMISOR_OTRO_CODPAIS' +
        ',?IDFAC_EMISOR_OTRO_IDTYPE,?IDFAC_EMISOR_OTRO_ID,?IDFAC_EMISOR_N' +
        'UMSERIEFAC,?IDFAC_EMISOR_NUMSERIEFACFIN,?IDFAC_EMISOR_FECHA_EXPE' +
        'DICION,?FACREC_TIPOFACTURA,?FACREC_TIPORECTIFICATIVA,?FACREC_FAG' +
        'R_NUMSERIEFACEMISOR,?FACREC_FAGR_FECHAEXPEDICION,?FACREC_FRECT_N' +
        'UMSERIEFACEMISOR,?FACREC_FRECT_FECHAEXPEDICION,?FACREC_IMPRECT_B' +
        'ASERECT,?FACREC_IMPRECT_CUOTARECT,?FACREC_IMPRECT_CUOTARECRECT,?' +
        'FACREC_FECHAOPERACION,?FACREC_CLAVE_REG_ESP,?FACREC_CLAVE_REG_ES' +
        'P1,?FACREC_CLAVE_REG_ESP2,?FACREC_NUMREGACUERDOFAC,?FACREC_IMPOR' +
        'TE_TOTAL,?FACREC_BASEIMPONIBLEACOSTE,?FACREC_DESCRIPCION,?FACREC' +
        '_ADUANAS_NUMERODUA,?FACREC_ADUANAS_FECHAREGCONTDUA,?FACREC_CONTR' +
        'AP_NOMBRE_RAZON,?FACREC_CONTRAP_NIF_REPRES,?FACREC_CONTRAP_NIF,?' +
        'FACREC_CONTRAPARTE_CODPAIS,?FACREC_CONTRAPARTE_IDTYPE,?FACREC_CO' +
        'NTRAPARTE_ID,?FACREC_FECHAREGCONTABLE,?FACREC_CUOTA_DEDUCIBLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_REGLRFACTURASRECIBIDAS'
      'WHERE'
      '  ID_SII_REGLRFACTURASRECIBIDAS=?ID_SII_REGLRFACTURASRECIBIDAS ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_REGLRFACTURASRECIBIDAS'
      'WHERE'
      '  ID_SII_SUMLRFACTURASRECIBIDAS=?ID_SII_SUMLRFACTURASRECIBIDAS'
      'ORDER BY'
      '  CODIGO_ERROR DESC, ID_SII_REGLRFACTURASRECIBIDAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_REGLRFACTURASRECIBIDAS'
      'SET'
      '  ID_SII_PRESENTACION=?ID_SII_PRESENTACION '
      '  ,ID_SII_SUMLRFACTURASRECIBIDAS=?ID_SII_SUMLRFACTURASRECIBIDAS '
      '  ,ID_I=?ID_I '
      '  ,PERIODOIMPOSITIVO_EJERCICIO=?PERIODOIMPOSITIVO_EJERCICIO '
      '  ,PERIODOIMPOSITIVO_PERIODO=?PERIODOIMPOSITIVO_PERIODO '
      '  ,IDFAC_EMISOR_NIF=?IDFAC_EMISOR_NIF '
      '  ,IDFAC_EMISOR_OTRO_CODPAIS=?IDFAC_EMISOR_OTRO_CODPAIS '
      '  ,IDFAC_EMISOR_OTRO_IDTYPE=?IDFAC_EMISOR_OTRO_IDTYPE '
      '  ,IDFAC_EMISOR_OTRO_ID=?IDFAC_EMISOR_OTRO_ID '
      '  ,IDFAC_EMISOR_NUMSERIEFAC=?IDFAC_EMISOR_NUMSERIEFAC '
      '  ,IDFAC_EMISOR_NUMSERIEFACFIN=?IDFAC_EMISOR_NUMSERIEFACFIN '
      '  ,IDFAC_EMISOR_FECHA_EXPEDICION=?IDFAC_EMISOR_FECHA_EXPEDICION '
      '  ,FACREC_TIPOFACTURA=?FACREC_TIPOFACTURA '
      '  ,FACREC_TIPORECTIFICATIVA=?FACREC_TIPORECTIFICATIVA '
      '  ,FACREC_FAGR_NUMSERIEFACEMISOR=?FACREC_FAGR_NUMSERIEFACEMISOR '
      '  ,FACREC_FAGR_FECHAEXPEDICION=?FACREC_FAGR_FECHAEXPEDICION '
      
        '  ,FACREC_FRECT_NUMSERIEFACEMISOR=?FACREC_FRECT_NUMSERIEFACEMISO' +
        'R '
      '  ,FACREC_FRECT_FECHAEXPEDICION=?FACREC_FRECT_FECHAEXPEDICION '
      '  ,FACREC_IMPRECT_BASERECT=?FACREC_IMPRECT_BASERECT '
      '  ,FACREC_IMPRECT_CUOTARECT=?FACREC_IMPRECT_CUOTARECT '
      '  ,FACREC_IMPRECT_CUOTARECRECT=?FACREC_IMPRECT_CUOTARECRECT '
      '  ,FACREC_FECHAOPERACION=?FACREC_FECHAOPERACION '
      '  ,FACREC_CLAVE_REG_ESP=?FACREC_CLAVE_REG_ESP '
      '  ,FACREC_CLAVE_REG_ESP1=?FACREC_CLAVE_REG_ESP1 '
      '  ,FACREC_CLAVE_REG_ESP2=?FACREC_CLAVE_REG_ESP2 '
      '  ,FACREC_NUMREGACUERDOFAC=?FACREC_NUMREGACUERDOFAC '
      '  ,FACREC_IMPORTE_TOTAL=?FACREC_IMPORTE_TOTAL '
      '  ,FACREC_BASEIMPONIBLEACOSTE=?FACREC_BASEIMPONIBLEACOSTE '
      '  ,FACREC_DESCRIPCION=?FACREC_DESCRIPCION '
      '  ,FACREC_ADUANAS_NUMERODUA=?FACREC_ADUANAS_NUMERODUA '
      
        '  ,FACREC_ADUANAS_FECHAREGCONTDUA=?FACREC_ADUANAS_FECHAREGCONTDU' +
        'A '
      '  ,FACREC_CONTRAP_NOMBRE_RAZON=?FACREC_CONTRAP_NOMBRE_RAZON '
      '  ,FACREC_CONTRAP_NIF_REPRES=?FACREC_CONTRAP_NIF_REPRES '
      '  ,FACREC_CONTRAP_NIF=?FACREC_CONTRAP_NIF '
      '  ,FACREC_CONTRAPARTE_CODPAIS=?FACREC_CONTRAPARTE_CODPAIS '
      '  ,FACREC_CONTRAPARTE_IDTYPE=?FACREC_CONTRAPARTE_IDTYPE '
      '  ,FACREC_CONTRAPARTE_ID=?FACREC_CONTRAPARTE_ID '
      '  ,FACREC_FECHAREGCONTABLE=?FACREC_FECHAREGCONTABLE '
      '  ,FACREC_CUOTA_DEDUCIBLE=?FACREC_CUOTA_DEDUCIBLE '
      'WHERE'
      '  ID_SII_REGLRFACTURASRECIBIDAS=?ID_SII_REGLRFACTURASRECIBIDAS ')
    DataSource = DSSLRFacRec
    Plan.Strings = (
      ' ')
    AfterDelete = xRLRFacRecAfterDelete
    AfterOpen = xRLRFacRecAfterOpen
    BeforeClose = xRLRFacRecBeforeClose
    ClavesPrimarias.Strings = (
      'ID_SII_REGLRFACTURASRECIBIDAS ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_REGLRFACTURASRECIBIDAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 296
    object xRLRFacRecID_SII_PRESENTACION: TIntegerField
      DisplayLabel = 'Id Presentacion'
      FieldName = 'ID_SII_PRESENTACION'
    end
    object xRLRFacRecID_SII_REGLRFACTURASRECIBIDAS: TIntegerField
      DisplayLabel = 'Id Registro'
      FieldName = 'ID_SII_REGLRFACTURASRECIBIDAS'
    end
    object xRLRFacRecID_SII_SUMLRFACTURASRECIBIDAS: TIntegerField
      DisplayLabel = 'Id Suministro'
      FieldName = 'ID_SII_SUMLRFACTURASRECIBIDAS'
    end
    object xRLRFacRecPERIODOIMPOSITIVO_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'PERIODOIMPOSITIVO_EJERCICIO'
    end
    object xRLRFacRecPERIODOIMPOSITIVO_PERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODOIMPOSITIVO_PERIODO'
      Size = 2
    end
    object xRLRFacRecIDFAC_EMISOR_NIF: TFIBStringField
      DisplayLabel = 'NIF Emisor'
      FieldName = 'IDFAC_EMISOR_NIF'
      Size = 9
    end
    object xRLRFacRecIDFAC_EMISOR_OTRO_CODPAIS: TFIBStringField
      DisplayLabel = 'Cod. Pais'
      FieldName = 'IDFAC_EMISOR_OTRO_CODPAIS'
      Size = 2
    end
    object xRLRFacRecIDFAC_EMISOR_OTRO_IDTYPE: TFIBStringField
      DisplayLabel = 'Tipo NIF'
      FieldName = 'IDFAC_EMISOR_OTRO_IDTYPE'
      Size = 2
    end
    object xRLRFacRecIDFAC_EMISOR_OTRO_ID: TFIBStringField
      DisplayLabel = 'NIF Otro'
      FieldName = 'IDFAC_EMISOR_OTRO_ID'
    end
    object xRLRFacRecIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField
      DisplayLabel = 'Serie, Nro. Fac.'
      FieldName = 'IDFAC_EMISOR_NUMSERIEFAC'
      Size = 60
    end
    object xRLRFacRecIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField
      DisplayLabel = 'Serie, Nro. Fac. Fin'
      FieldName = 'IDFAC_EMISOR_NUMSERIEFACFIN'
      Size = 60
    end
    object xRLRFacRecIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField
      DisplayLabel = 'Fec. Exped.'
      FieldName = 'IDFAC_EMISOR_FECHA_EXPEDICION'
    end
    object xRLRFacRecFACREC_TIPOFACTURA: TFIBStringField
      DisplayLabel = 'Tipo Fac.'
      FieldName = 'FACREC_TIPOFACTURA'
      Size = 2
    end
    object xRLRFacRecFACREC_TIPORECTIFICATIVA: TFIBStringField
      DisplayLabel = 'Tipo Rect.'
      FieldName = 'FACREC_TIPORECTIFICATIVA'
      Size = 1
    end
    object xRLRFacRecFACREC_FAGR_NUMSERIEFACEMISOR: TFIBStringField
      DisplayLabel = 'F. Agrup. Serie, Nro. Fac.'
      FieldName = 'FACREC_FAGR_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacRecFACREC_FAGR_FECHAEXPEDICION: TDateTimeField
      DisplayLabel = 'F. Agrup. Fec. Exped.'
      FieldName = 'FACREC_FAGR_FECHAEXPEDICION'
    end
    object xRLRFacRecFACREC_FRECT_NUMSERIEFACEMISOR: TFIBStringField
      DisplayLabel = 'F. Rect. Serie, Nro. Fac.'
      FieldName = 'FACREC_FRECT_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacRecFACREC_FRECT_FECHAEXPEDICION: TDateTimeField
      DisplayLabel = 'F. Rect. Fec. Exped.'
      FieldName = 'FACREC_FRECT_FECHAEXPEDICION'
    end
    object xRLRFacRecFACREC_IMPRECT_BASERECT: TFloatField
      DisplayLabel = 'Base Rect.'
      FieldName = 'FACREC_IMPRECT_BASERECT'
    end
    object xRLRFacRecFACREC_IMPRECT_CUOTARECT: TFloatField
      DisplayLabel = 'Cuota Rect.'
      FieldName = 'FACREC_IMPRECT_CUOTARECT'
    end
    object xRLRFacRecFACREC_IMPRECT_CUOTARECRECT: TFloatField
      DisplayLabel = 'Cuota RE Rect.'
      FieldName = 'FACREC_IMPRECT_CUOTARECRECT'
    end
    object xRLRFacRecFACREC_FECHAOPERACION: TDateTimeField
      DisplayLabel = 'Fec. Operacion'
      FieldName = 'FACREC_FECHAOPERACION'
    end
    object xRLRFacRecFACREC_CLAVE_REG_ESP: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp.'
      FieldName = 'FACREC_CLAVE_REG_ESP'
      Size = 2
    end
    object xRLRFacRecFACREC_CLAVE_REG_ESP1: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp. 1'
      FieldName = 'FACREC_CLAVE_REG_ESP1'
      Size = 2
    end
    object xRLRFacRecFACREC_CLAVE_REG_ESP2: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp. 2'
      FieldName = 'FACREC_CLAVE_REG_ESP2'
      Size = 2
    end
    object xRLRFacRecFACREC_NUMREGACUERDOFAC: TFIBStringField
      DisplayLabel = 'Nro. Reg. Acuerdo'
      FieldName = 'FACREC_NUMREGACUERDOFAC'
      Size = 15
    end
    object xRLRFacRecFACREC_IMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Importe Total'
      FieldName = 'FACREC_IMPORTE_TOTAL'
    end
    object xRLRFacRecFACREC_BASEIMPONIBLEACOSTE: TFloatField
      DisplayLabel = 'B. Imponible a Coste'
      FieldName = 'FACREC_BASEIMPONIBLEACOSTE'
    end
    object xRLRFacRecFACREC_DESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'FACREC_DESCRIPCION'
      Size = 500
    end
    object xRLRFacRecFACREC_ADUANAS_NUMERODUA: TFIBStringField
      DisplayLabel = 'Nro. DUA'
      FieldName = 'FACREC_ADUANAS_NUMERODUA'
      Size = 40
    end
    object xRLRFacRecFACREC_ADUANAS_FECHAREGCONTDUA: TDateTimeField
      DisplayLabel = 'Fec. Cont. DUA'
      FieldName = 'FACREC_ADUANAS_FECHAREGCONTDUA'
    end
    object xRLRFacRecFACREC_CONTRAP_NOMBRE_RAZON: TFIBStringField
      DisplayLabel = 'Nombre Razon Contrap.'
      FieldName = 'FACREC_CONTRAP_NOMBRE_RAZON'
      Size = 120
    end
    object xRLRFacRecFACREC_CONTRAP_NIF_REPRES: TFIBStringField
      DisplayLabel = 'NIF Repr. Contrap.'
      FieldName = 'FACREC_CONTRAP_NIF_REPRES'
      Size = 9
    end
    object xRLRFacRecFACREC_CONTRAP_NIF: TFIBStringField
      DisplayLabel = 'NIF Contrap.'
      FieldName = 'FACREC_CONTRAP_NIF'
      Size = 9
    end
    object xRLRFacRecFACREC_CONTRAPARTE_CODPAIS: TFIBStringField
      DisplayLabel = 'Cod. Pais Contrap.'
      FieldName = 'FACREC_CONTRAPARTE_CODPAIS'
      Size = 2
    end
    object xRLRFacRecFACREC_CONTRAPARTE_IDTYPE: TFIBStringField
      DisplayLabel = 'Tipo NIF Contrap.'
      FieldName = 'FACREC_CONTRAPARTE_IDTYPE'
      Size = 2
    end
    object xRLRFacRecFACREC_CONTRAPARTE_ID: TFIBStringField
      DisplayLabel = 'NIF Otro Contrap.'
      FieldName = 'FACREC_CONTRAPARTE_ID'
    end
    object xRLRFacRecFACREC_FECHAREGCONTABLE: TDateTimeField
      DisplayLabel = 'Fec. Reg Contable'
      FieldName = 'FACREC_FECHAREGCONTABLE'
    end
    object xRLRFacRecFACREC_CUOTA_DEDUCIBLE: TFloatField
      DisplayLabel = 'Cuota Deducible'
      FieldName = 'FACREC_CUOTA_DEDUCIBLE'
    end
    object xRLRFacRecID_I: TIntegerField
      DisplayLabel = 'Id Reg. IVA'
      FieldName = 'ID_I'
    end
    object xRLRFacRecESTADO_REGISTRO: TFIBStringField
      DisplayLabel = 'Estado Reg.'
      FieldName = 'ESTADO_REGISTRO'
      Size = 40
    end
    object xRLRFacRecCODIGO_ERROR: TFIBStringField
      DisplayLabel = 'Cod. Error'
      FieldName = 'CODIGO_ERROR'
    end
    object xRLRFacRecDESCRIPCION_ERROR: TFIBStringField
      DisplayLabel = 'Descripcion Error'
      DisplayWidth = 500
      FieldName = 'DESCRIPCION_ERROR'
      Size = 500
    end
    object xRLRFacRecTIPOCOMUNICACION_DESTINO: TFIBStringField
      DisplayLabel = 'Tipo Comunicacion Destino'
      FieldName = 'TIPOCOMUNICACION_DESTINO'
      Size = 2
    end
    object xRLRFacRecFACREC_INMUEBLE_SITUACIONINM: TFIBStringField
      DisplayLabel = 'Situacion Inmueble'
      FieldName = 'FACREC_INMUEBLE_SITUACIONINM'
      Size = 1
    end
    object xRLRFacRecFACREC_INMUEBLE_REFCATASTRAL: TFIBStringField
      DisplayLabel = 'Ref. Catastral'
      FieldName = 'FACREC_INMUEBLE_REFCATASTRAL'
      Size = 25
    end
  end
  object DSRLRFacRec: TDataSource
    DataSet = xRLRFacRec
    Left = 200
    Top = 296
  end
  object xDesgloseFacEmi: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_DESGLOSEFACTURA_EMI'
      'WHERE'
      '  ID_SII_DESGLOSEFACTURA_EMI=?old_ID_SII_DESGLOSEFACTURA_EMI ')
    InsertSQL.Strings = (
      'INSERT INTO SII_DESGLOSEFACTURA_EMI'
      
        '  (NO_SUJETA_IMPORTE_ART_7_14,NO_SUJETA_IMPORTE_TAI,ID_SII_PRESE' +
        'NTACION,ID_SII_REGLRFACTURASEMITIDAS,ID_SII_DESGLOSEFACTURA_EMI,' +
        'SUJETA_EXENTA_CAUSA,SUJETA_EXENTA_BASEIMPONIBLE,SUJETA_NO_EXENTA' +
        '_TIPO,SUJETA_NO_EXENTA_TIPOIMP,SUJETA_NO_EXENTA_BASEIMP,SUJETA_N' +
        'O_EXENTA_CUOTAREP,SUJETA_NO_EXENTA_TIPOREC,SUJETA_NO_EXENTA_CUOT' +
        'AREC)'
      'VALUES'
      
        '  (?NO_SUJETA_IMPORTE_ART_7_14,?NO_SUJETA_IMPORTE_TAI,?ID_SII_PR' +
        'ESENTACION,?ID_SII_REGLRFACTURASEMITIDAS,?ID_SII_DESGLOSEFACTURA' +
        '_EMI,?SUJETA_EXENTA_CAUSA,?SUJETA_EXENTA_BASEIMPONIBLE,?SUJETA_N' +
        'O_EXENTA_TIPO,?SUJETA_NO_EXENTA_TIPOIMP,?SUJETA_NO_EXENTA_BASEIM' +
        'P,?SUJETA_NO_EXENTA_CUOTAREP,?SUJETA_NO_EXENTA_TIPOREC,?SUJETA_N' +
        'O_EXENTA_CUOTAREC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_DESGLOSEFACTURA_EMI'
      'WHERE'
      '  ID_SII_DESGLOSEFACTURA_EMI=?ID_SII_DESGLOSEFACTURA_EMI ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_DESGLOSEFACTURA_EMI'
      'WHERE'
      '  ID_SII_REGLRFACTURASEMITIDAS=?ID_SII_REGLRFACTURASEMITIDAS '
      'ORDER BY'
      '  ID_SII_DESGLOSEFACTURA_EMI')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_DESGLOSEFACTURA_EMI'
      'SET'
      '  NO_SUJETA_IMPORTE_ART_7_14=?NO_SUJETA_IMPORTE_ART_7_14 '
      '  ,NO_SUJETA_IMPORTE_TAI=?NO_SUJETA_IMPORTE_TAI '
      '  ,ID_SII_PRESENTACION=?ID_SII_PRESENTACION '
      '  ,ID_SII_REGLRFACTURASEMITIDAS=?ID_SII_REGLRFACTURASEMITIDAS '
      '  ,SUJETA_EXENTA_CAUSA=?SUJETA_EXENTA_CAUSA '
      '  ,SUJETA_EXENTA_BASEIMPONIBLE=?SUJETA_EXENTA_BASEIMPONIBLE '
      '  ,SUJETA_NO_EXENTA_TIPO=?SUJETA_NO_EXENTA_TIPO '
      '  ,SUJETA_NO_EXENTA_TIPOIMP=?SUJETA_NO_EXENTA_TIPOIMP '
      '  ,SUJETA_NO_EXENTA_BASEIMP=?SUJETA_NO_EXENTA_BASEIMP '
      '  ,SUJETA_NO_EXENTA_CUOTAREP=?SUJETA_NO_EXENTA_CUOTAREP '
      '  ,SUJETA_NO_EXENTA_TIPOREC=?SUJETA_NO_EXENTA_TIPOREC '
      '  ,SUJETA_NO_EXENTA_CUOTAREC=?SUJETA_NO_EXENTA_CUOTAREC '
      'WHERE'
      '  ID_SII_DESGLOSEFACTURA_EMI=?ID_SII_DESGLOSEFACTURA_EMI ')
    DataSource = DSRLRFacEmi
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_SII_DESGLOSEFACTURA_EMI ')
    AccionesInhibidas = [Borrar, Insertar, Modificar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_DESGLOSEFACTURA_EMI'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 200
    object xDesgloseFacEmiID_SII_PRESENTACION: TIntegerField
      FieldName = 'ID_SII_PRESENTACION'
    end
    object xDesgloseFacEmiID_SII_REGLRFACTURASEMITIDAS: TIntegerField
      FieldName = 'ID_SII_REGLRFACTURASEMITIDAS'
    end
    object xDesgloseFacEmiID_SII_DESGLOSEFACTURA_EMI: TIntegerField
      FieldName = 'ID_SII_DESGLOSEFACTURA_EMI'
    end
    object xDesgloseFacEmiSUJETA_EXENTA_CAUSA: TFIBStringField
      FieldName = 'SUJETA_EXENTA_CAUSA'
      Size = 2
    end
    object xDesgloseFacEmiSUJETA_EXENTA_BASEIMPONIBLE: TFloatField
      FieldName = 'SUJETA_EXENTA_BASEIMPONIBLE'
    end
    object xDesgloseFacEmiSUJETA_NO_EXENTA_TIPO: TFIBStringField
      FieldName = 'SUJETA_NO_EXENTA_TIPO'
      Size = 2
    end
    object xDesgloseFacEmiSUJETA_NO_EXENTA_TIPOIMP: TFloatField
      FieldName = 'SUJETA_NO_EXENTA_TIPOIMP'
    end
    object xDesgloseFacEmiSUJETA_NO_EXENTA_BASEIMP: TFloatField
      FieldName = 'SUJETA_NO_EXENTA_BASEIMP'
    end
    object xDesgloseFacEmiSUJETA_NO_EXENTA_CUOTAREP: TFloatField
      FieldName = 'SUJETA_NO_EXENTA_CUOTAREP'
    end
    object xDesgloseFacEmiSUJETA_NO_EXENTA_TIPOREC: TFloatField
      FieldName = 'SUJETA_NO_EXENTA_TIPOREC'
    end
    object xDesgloseFacEmiSUJETA_NO_EXENTA_CUOTAREC: TFloatField
      FieldName = 'SUJETA_NO_EXENTA_CUOTAREC'
    end
    object xDesgloseFacEmiNO_SUJETA_IMPORTE_ART_7_14: TFloatField
      FieldName = 'NO_SUJETA_IMPORTE_ART_7_14'
    end
    object xDesgloseFacEmiNO_SUJETA_IMPORTE_TAI: TFloatField
      FieldName = 'NO_SUJETA_IMPORTE_TAI'
    end
  end
  object DSDesgloseFacEmi: TDataSource
    DataSet = xDesgloseFacEmi
    Left = 208
    Top = 200
  end
  object xDesgloseFacRec: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_DESGLOSEFACTURA_REC'
      'WHERE'
      '  ID_SII_DESGLOSEFACTURA_REC=?old_ID_SII_DESGLOSEFACTURA_REC ')
    InsertSQL.Strings = (
      'INSERT INTO SII_DESGLOSEFACTURA_REC'
      
        '  (ID_SII_PRESENTACION,ID_SII_REGLRFACTURASRECIBIDAS,ID_SII_DESG' +
        'LOSEFACTURA_REC,ISP_TIPOIMPOSITIVO,ISP_BASEIMPONIBLE,ISP_CUOTASO' +
        'PORTADA,ISP_TIPORECARGOEQUIVALENCIA,ISP_CUOTARECARGOEQUIVALENCIA' +
        ',DI_TIPOIMPOSITIVO,DI_BASEIMPONIBLE,DI_CUOTASOPORTADA,DI_TIPOREC' +
        'ARGOEQUIVALENCIA,DI_CUOTARECARGOEQUIVALENCIA,DI_PORCENTCOMPSENSA' +
        'CIONREAGYP,DI_IMPORTECOMPSENSACIONREAGYP)'
      'VALUES'
      
        '  (?ID_SII_PRESENTACION,?ID_SII_REGLRFACTURASRECIBIDAS,?ID_SII_D' +
        'ESGLOSEFACTURA_REC,?ISP_TIPOIMPOSITIVO,?ISP_BASEIMPONIBLE,?ISP_C' +
        'UOTASOPORTADA,?ISP_TIPORECARGOEQUIVALENCIA,?ISP_CUOTARECARGOEQUI' +
        'VALENCIA,?DI_TIPOIMPOSITIVO,?DI_BASEIMPONIBLE,?DI_CUOTASOPORTADA' +
        ',?DI_TIPORECARGOEQUIVALENCIA,?DI_CUOTARECARGOEQUIVALENCIA,?DI_PO' +
        'RCENTCOMPSENSACIONREAGYP,?DI_IMPORTECOMPSENSACIONREAGYP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_DESGLOSEFACTURA_REC'
      'WHERE'
      '  ID_SII_DESGLOSEFACTURA_REC=?ID_SII_DESGLOSEFACTURA_REC ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_DESGLOSEFACTURA_REC'
      'WHERE'
      '  ID_SII_REGLRFACTURASRECIBIDAS=?ID_SII_REGLRFACTURASRECIBIDAS '
      'ORDER BY'
      '  ID_SII_DESGLOSEFACTURA_REC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_DESGLOSEFACTURA_REC'
      'SET'
      '  ID_SII_PRESENTACION=?ID_SII_PRESENTACION '
      '  ,ID_SII_REGLRFACTURASRECIBIDAS=?ID_SII_REGLRFACTURASRECIBIDAS '
      '  ,ISP_TIPOIMPOSITIVO=?ISP_TIPOIMPOSITIVO '
      '  ,ISP_BASEIMPONIBLE=?ISP_BASEIMPONIBLE '
      '  ,ISP_CUOTASOPORTADA=?ISP_CUOTASOPORTADA '
      '  ,ISP_TIPORECARGOEQUIVALENCIA=?ISP_TIPORECARGOEQUIVALENCIA '
      '  ,ISP_CUOTARECARGOEQUIVALENCIA=?ISP_CUOTARECARGOEQUIVALENCIA '
      '  ,DI_TIPOIMPOSITIVO=?DI_TIPOIMPOSITIVO '
      '  ,DI_BASEIMPONIBLE=?DI_BASEIMPONIBLE '
      '  ,DI_CUOTASOPORTADA=?DI_CUOTASOPORTADA '
      '  ,DI_TIPORECARGOEQUIVALENCIA=?DI_TIPORECARGOEQUIVALENCIA '
      '  ,DI_CUOTARECARGOEQUIVALENCIA=?DI_CUOTARECARGOEQUIVALENCIA '
      '  ,DI_PORCENTCOMPSENSACIONREAGYP=?DI_PORCENTCOMPSENSACIONREAGYP '
      '  ,DI_IMPORTECOMPSENSACIONREAGYP=?DI_IMPORTECOMPSENSACIONREAGYP '
      'WHERE'
      '  ID_SII_DESGLOSEFACTURA_REC=?ID_SII_DESGLOSEFACTURA_REC ')
    DataSource = DSRLRFacRec
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_SII_DESGLOSEFACTURA_REC ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_DESGLOSEFACTURA_REC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 392
    object xDesgloseFacRecID_SII_PRESENTACION: TIntegerField
      FieldName = 'ID_SII_PRESENTACION'
    end
    object xDesgloseFacRecID_SII_REGLRFACTURASRECIBIDAS: TIntegerField
      FieldName = 'ID_SII_REGLRFACTURASRECIBIDAS'
    end
    object xDesgloseFacRecID_SII_DESGLOSEFACTURA_REC: TIntegerField
      FieldName = 'ID_SII_DESGLOSEFACTURA_REC'
    end
    object xDesgloseFacRecISP_TIPOIMPOSITIVO: TFloatField
      FieldName = 'ISP_TIPOIMPOSITIVO'
    end
    object xDesgloseFacRecISP_BASEIMPONIBLE: TFloatField
      FieldName = 'ISP_BASEIMPONIBLE'
    end
    object xDesgloseFacRecISP_CUOTASOPORTADA: TFloatField
      FieldName = 'ISP_CUOTASOPORTADA'
    end
    object xDesgloseFacRecISP_TIPORECARGOEQUIVALENCIA: TFloatField
      FieldName = 'ISP_TIPORECARGOEQUIVALENCIA'
    end
    object xDesgloseFacRecISP_CUOTARECARGOEQUIVALENCIA: TFloatField
      FieldName = 'ISP_CUOTARECARGOEQUIVALENCIA'
    end
    object xDesgloseFacRecDI_TIPOIMPOSITIVO: TFloatField
      FieldName = 'DI_TIPOIMPOSITIVO'
    end
    object xDesgloseFacRecDI_BASEIMPONIBLE: TFloatField
      FieldName = 'DI_BASEIMPONIBLE'
    end
    object xDesgloseFacRecDI_CUOTASOPORTADA: TFloatField
      FieldName = 'DI_CUOTASOPORTADA'
    end
    object xDesgloseFacRecDI_TIPORECARGOEQUIVALENCIA: TFloatField
      FieldName = 'DI_TIPORECARGOEQUIVALENCIA'
    end
    object xDesgloseFacRecDI_CUOTARECARGOEQUIVALENCIA: TFloatField
      FieldName = 'DI_CUOTARECARGOEQUIVALENCIA'
    end
    object xDesgloseFacRecDI_PORCENTCOMPSENSACIONREAGYP: TFloatField
      FieldName = 'DI_PORCENTCOMPSENSACIONREAGYP'
    end
    object xDesgloseFacRecDI_IMPORTECOMPSENSACIONREAGYP: TFloatField
      FieldName = 'DI_IMPORTECOMPSENSACIONREAGYP'
    end
  end
  object DSDesgloseFacRec: TDataSource
    DataSet = xDesgloseFacRec
    Left = 208
    Top = 392
  end
  object xRLRFacEmiDisponibles: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_REGLRFACTURASEMITIDAS'
      'WHERE'
      '  ID_SII_REGLRFACTURASEMITIDAS=?ID_SII_REGLRFACTURASEMITIDAS ')
    SelectSQL.Strings = (
      'SELECT E.* FROM SII_REGLRFACTURASEMITIDAS E'
      'JOIN EMP_REGISTRO_IVA I ON E.ID_I = I.ID_I'
      'WHERE'
      '  E.ID_SII_SUMLRFACTURASEMITIDAS = 0'
      '  AND E.TIPOCOMUNICACION_DESTINO = :TIPOCOMUNICACION'
      '  AND I.EMPRESA = :EMPRESA'
      '  AND I.CANAL = :CANAL'
      'ORDER BY'
      
        '  E.IDFAC_EMISOR_FECHA_EXPEDICION DESC, E.ID_SII_REGLRFACTURASEM' +
        'ITIDAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSSLRFacEmi
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_SII_REGLRFACTURASEMITIDAS ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_REGLRFACTURASEMITIDAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 152
    object xRLRFacEmiDisponiblesID_SII_PRESENTACION: TIntegerField
      DisplayLabel = 'Id Presentacion'
      FieldName = 'ID_SII_PRESENTACION'
    end
    object xRLRFacEmiDisponiblesID_SII_REGLRFACTURASEMITIDAS: TIntegerField
      DisplayLabel = 'Id Registro'
      FieldName = 'ID_SII_REGLRFACTURASEMITIDAS'
    end
    object xRLRFacEmiDisponiblesID_SII_SUMLRFACTURASEMITIDAS: TIntegerField
      DisplayLabel = 'Id Suministro'
      FieldName = 'ID_SII_SUMLRFACTURASEMITIDAS'
    end
    object xRLRFacEmiDisponiblesID_I: TIntegerField
      DisplayLabel = 'Id Reg. IVA'
      FieldName = 'ID_I'
    end
    object xRLRFacEmiDisponiblesPERIODOIMPOSITIVO_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejerc.'
      FieldName = 'PERIODOIMPOSITIVO_EJERCICIO'
    end
    object xRLRFacEmiDisponiblesPERIODOIMPOSITIVO_PERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODOIMPOSITIVO_PERIODO'
      Size = 2
    end
    object xRLRFacEmiDisponiblesIDFAC_EMISOR_NIF: TFIBStringField
      DisplayLabel = 'NIF Emisor'
      FieldName = 'IDFAC_EMISOR_NIF'
      Size = 9
    end
    object xRLRFacEmiDisponiblesIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField
      DisplayLabel = 'Serie, Nro. Fac.'
      FieldName = 'IDFAC_EMISOR_NUMSERIEFAC'
      Size = 60
    end
    object xRLRFacEmiDisponiblesIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField
      DisplayLabel = 'Serie, Nro. Fac. Fin'
      FieldName = 'IDFAC_EMISOR_NUMSERIEFACFIN'
      Size = 60
    end
    object xRLRFacEmiDisponiblesIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField
      DisplayLabel = 'Fec. Exped.'
      FieldName = 'IDFAC_EMISOR_FECHA_EXPEDICION'
    end
    object xRLRFacEmiDisponiblesFACEXP_TIPOFACTURA: TFIBStringField
      DisplayLabel = 'Tipo Fac.'
      FieldName = 'FACEXP_TIPOFACTURA'
      Size = 2
    end
    object xRLRFacEmiDisponiblesFACEXP_TIPORECTIFICATIVA: TFIBStringField
      DisplayLabel = 'Tipo Rect.'
      FieldName = 'FACEXP_TIPORECTIFICATIVA'
      Size = 1
    end
    object xRLRFacEmiDisponiblesFACEXP_FAGR_NUMSERIEFACEMISOR: TFIBStringField
      DisplayLabel = 'F. Agrup. Serie, Nro. Fac.'
      FieldName = 'FACEXP_FAGR_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacEmiDisponiblesFACEXP_FAGR_FECHAEXPEDICION: TDateTimeField
      DisplayLabel = 'F. Agrup. Fec. Exped.'
      FieldName = 'FACEXP_FAGR_FECHAEXPEDICION'
    end
    object xRLRFacEmiDisponiblesFACEXP_FRECT_NUMSERIEFACEMISOR: TFIBStringField
      DisplayLabel = 'F. Rect. Serie, Nro. Fac.'
      FieldName = 'FACEXP_FRECT_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacEmiDisponiblesFACEXP_FRECT_FECHAEXPEDICION: TDateTimeField
      DisplayLabel = 'F. Rect. Fec. Exped.'
      FieldName = 'FACEXP_FRECT_FECHAEXPEDICION'
    end
    object xRLRFacEmiDisponiblesFACEXP_IMPRECT_BASERECT: TFloatField
      DisplayLabel = 'Base Rect.'
      FieldName = 'FACEXP_IMPRECT_BASERECT'
    end
    object xRLRFacEmiDisponiblesFACEXP_IMPRECT_CUOTARECT: TFloatField
      DisplayLabel = 'Cuota Rect.'
      FieldName = 'FACEXP_IMPRECT_CUOTARECT'
    end
    object xRLRFacEmiDisponiblesFACEXP_IMPRECT_CUOTARECRECT: TFloatField
      DisplayLabel = 'Cuota RE Rect.'
      FieldName = 'FACEXP_IMPRECT_CUOTARECRECT'
    end
    object xRLRFacEmiDisponiblesFACEXP_FECHAOPERACION: TDateTimeField
      DisplayLabel = 'Fec. Operacion'
      FieldName = 'FACEXP_FECHAOPERACION'
    end
    object xRLRFacEmiDisponiblesFACEXP_CLAVE_REG_ESP: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp.'
      FieldName = 'FACEXP_CLAVE_REG_ESP'
      Size = 2
    end
    object xRLRFacEmiDisponiblesFACEXP_CLAVE_REG_ESP1: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp. 1'
      FieldName = 'FACEXP_CLAVE_REG_ESP1'
      Size = 2
    end
    object xRLRFacEmiDisponiblesFACEXP_CLAVE_REG_ESP2: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp. 2'
      FieldName = 'FACEXP_CLAVE_REG_ESP2'
      Size = 2
    end
    object xRLRFacEmiDisponiblesFACEXP_NUMREGACUERDOFAC: TFIBStringField
      DisplayLabel = 'Nro. Reg. Acuerdo'
      FieldName = 'FACEXP_NUMREGACUERDOFAC'
      Size = 15
    end
    object xRLRFacEmiDisponiblesFACEXP_IMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Importe Total'
      FieldName = 'FACEXP_IMPORTE_TOTAL'
    end
    object xRLRFacEmiDisponiblesFACEXP_BASEIMPONIBLEACOSTE: TFloatField
      DisplayLabel = 'B. Imponible a Coste'
      FieldName = 'FACEXP_BASEIMPONIBLEACOSTE'
    end
    object xRLRFacEmiDisponiblesFACEXP_DESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'FACEXP_DESCRIPCION'
      Size = 150
    end
    object xRLRFacEmiDisponiblesFACEXP_INMUEBLE_SITUACIONINM: TFIBStringField
      DisplayLabel = 'Situacion Inmueble'
      FieldName = 'FACEXP_INMUEBLE_SITUACIONINM'
      Size = 1
    end
    object xRLRFacEmiDisponiblesFACEXP_INMUEBLE_REFCATASTRAL: TFIBStringField
      DisplayLabel = 'Ref. Catastral'
      FieldName = 'FACEXP_INMUEBLE_REFCATASTRAL'
      Size = 25
    end
    object xRLRFacEmiDisponiblesFACEXP_IMPORTETRANSMSUJETAIVA: TFloatField
      DisplayLabel = 'Importe Transm. Sujeta IVA'
      FieldName = 'FACEXP_IMPORTETRANSMSUJETAIVA'
    end
    object xRLRFacEmiDisponiblesFACEXP_EMITIDA_POR_TERCEROS: TFIBStringField
      DisplayLabel = 'Emit. por Terceros'
      FieldName = 'FACEXP_EMITIDA_POR_TERCEROS'
      Size = 1
    end
    object xRLRFacEmiDisponiblesFACEXP_VARIOSDESTINATARIOS: TFIBStringField
      DisplayLabel = 'Varios Destinatarios'
      FieldName = 'FACEXP_VARIOSDESTINATARIOS'
      Size = 1
    end
    object xRLRFacEmiDisponiblesFACEXP_CUPON: TFIBStringField
      DisplayLabel = 'Cupon'
      FieldName = 'FACEXP_CUPON'
      Size = 1
    end
    object xRLRFacEmiDisponiblesFACEXP_CONTRAP_NOMBRE_RAZON: TFIBStringField
      DisplayLabel = 'Nombre Razon Contrap.'
      FieldName = 'FACEXP_CONTRAP_NOMBRE_RAZON'
      Size = 120
    end
    object xRLRFacEmiDisponiblesFACEXP_CONTRAP_NIF_REPRES: TFIBStringField
      DisplayLabel = 'NIF Repr. Contrap.'
      FieldName = 'FACEXP_CONTRAP_NIF_REPRES'
      Size = 9
    end
    object xRLRFacEmiDisponiblesFACEXP_CONTRAP_NIF: TFIBStringField
      DisplayLabel = 'NIF Contrap.'
      FieldName = 'FACEXP_CONTRAP_NIF'
      Size = 9
    end
    object xRLRFacEmiDisponiblesFACEXP_CONTRAPARTE_CODPAIS: TFIBStringField
      DisplayLabel = 'Cod. Pais Contrap.'
      FieldName = 'FACEXP_CONTRAPARTE_CODPAIS'
      Size = 2
    end
    object xRLRFacEmiDisponiblesFACEXP_CONTRAPARTE_IDTYPE: TFIBStringField
      DisplayLabel = 'Tipo NIF Contrap.'
      FieldName = 'FACEXP_CONTRAPARTE_IDTYPE'
      Size = 2
    end
    object xRLRFacEmiDisponiblesFACEXP_CONTRAPARTE_ID: TFIBStringField
      DisplayLabel = 'NIF Otro Contrap.'
      FieldName = 'FACEXP_CONTRAPARTE_ID'
    end
    object xRLRFacEmiDisponiblesTIPO_DESGLOSE: TFIBStringField
      DisplayLabel = 'Tipo Desglose'
      FieldName = 'TIPO_DESGLOSE'
      Size = 1
    end
    object xRLRFacEmiDisponiblesTIPO_DESGLOSE_OPERACION: TFIBStringField
      DisplayLabel = 'Tipo Desglose Oper.'
      FieldName = 'TIPO_DESGLOSE_OPERACION'
      Size = 1
    end
    object xRLRFacEmiDisponiblesESTADO_REGISTRO: TFIBStringField
      DisplayLabel = 'Estado Reg.'
      FieldName = 'ESTADO_REGISTRO'
      Size = 40
    end
    object xRLRFacEmiDisponiblesCODIGO_ERROR: TFIBStringField
      DisplayLabel = 'Codigo Error'
      FieldName = 'CODIGO_ERROR'
    end
    object xRLRFacEmiDisponiblesDESCRIPCION_ERROR: TFIBStringField
      DisplayLabel = 'Descripcion Error'
      DisplayWidth = 500
      FieldName = 'DESCRIPCION_ERROR'
      Size = 500
    end
  end
  object DSRLRFacEmiDisponibles: TDataSource
    DataSet = xRLRFacEmiDisponibles
    Left = 200
    Top = 152
  end
  object xRLRFacRecDisponibles: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_REGLRFACTURASRECIBIDAS'
      'WHERE'
      '  ID_SII_REGLRFACTURASRECIBIDAS=?ID_SII_REGLRFACTURASRECIBIDAS ')
    SelectSQL.Strings = (
      'SELECT R.* FROM SII_REGLRFACTURASRECIBIDAS R'
      'JOIN EMP_REGISTRO_IVA I ON R.ID_I = I.ID_I'
      'WHERE'
      '  R.ID_SII_SUMLRFACTURASRECIBIDAS = 0'
      '  AND R.TIPOCOMUNICACION_DESTINO = :TIPOCOMUNICACION'
      '  AND I.EMPRESA = :EMPRESA'
      '  AND I.CANAL = :CANAL'
      'ORDER BY'
      
        '  R.FACREC_FECHAREGCONTABLE DESC, R.ID_SII_REGLRFACTURASRECIBIDA' +
        'S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSSLRFacRec
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_SII_REGLRFACTURASRECIBIDAS ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_REGLRFACTURASRECIBIDAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 344
    object xRLRFacRecDisponiblesID_SII_PRESENTACION: TIntegerField
      DisplayLabel = 'Id Presentacion'
      FieldName = 'ID_SII_PRESENTACION'
    end
    object xRLRFacRecDisponiblesID_SII_REGLRFACTURASRECIBIDAS: TIntegerField
      DisplayLabel = 'Id Registro'
      FieldName = 'ID_SII_REGLRFACTURASRECIBIDAS'
    end
    object xRLRFacRecDisponiblesID_SII_SUMLRFACTURASRECIBIDAS: TIntegerField
      DisplayLabel = 'Id Suministro'
      FieldName = 'ID_SII_SUMLRFACTURASRECIBIDAS'
    end
    object xRLRFacRecDisponiblesID_I: TIntegerField
      DisplayLabel = 'Id Reg. IVA'
      FieldName = 'ID_I'
    end
    object xRLRFacRecDisponiblesPERIODOIMPOSITIVO_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'PERIODOIMPOSITIVO_EJERCICIO'
    end
    object xRLRFacRecDisponiblesPERIODOIMPOSITIVO_PERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODOIMPOSITIVO_PERIODO'
      Size = 2
    end
    object xRLRFacRecDisponiblesIDFAC_EMISOR_NIF: TFIBStringField
      DisplayLabel = 'NIF Emisor'
      FieldName = 'IDFAC_EMISOR_NIF'
      Size = 9
    end
    object xRLRFacRecDisponiblesIDFAC_EMISOR_OTRO_CODPAIS: TFIBStringField
      DisplayLabel = 'Cod. Pais'
      FieldName = 'IDFAC_EMISOR_OTRO_CODPAIS'
      Size = 2
    end
    object xRLRFacRecDisponiblesIDFAC_EMISOR_OTRO_IDTYPE: TFIBStringField
      DisplayLabel = 'Tipo NIF'
      FieldName = 'IDFAC_EMISOR_OTRO_IDTYPE'
      Size = 2
    end
    object xRLRFacRecDisponiblesIDFAC_EMISOR_OTRO_ID: TFIBStringField
      DisplayLabel = 'NIF Otro'
      FieldName = 'IDFAC_EMISOR_OTRO_ID'
    end
    object xRLRFacRecDisponiblesIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField
      DisplayLabel = 'Serie, Nro. Fac.'
      FieldName = 'IDFAC_EMISOR_NUMSERIEFAC'
      Size = 60
    end
    object xRLRFacRecDisponiblesIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField
      DisplayLabel = 'Serie, Nro. Fac. Fin'
      FieldName = 'IDFAC_EMISOR_NUMSERIEFACFIN'
      Size = 60
    end
    object xRLRFacRecDisponiblesIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField
      DisplayLabel = 'Fec. Exped.'
      FieldName = 'IDFAC_EMISOR_FECHA_EXPEDICION'
    end
    object xRLRFacRecDisponiblesFACREC_TIPOFACTURA: TFIBStringField
      DisplayLabel = 'Tipo Fac.'
      FieldName = 'FACREC_TIPOFACTURA'
      Size = 2
    end
    object xRLRFacRecDisponiblesFACREC_TIPORECTIFICATIVA: TFIBStringField
      DisplayLabel = 'Tipo Rect.'
      FieldName = 'FACREC_TIPORECTIFICATIVA'
      Size = 1
    end
    object xRLRFacRecDisponiblesFACREC_FAGR_NUMSERIEFACEMISOR: TFIBStringField
      DisplayLabel = 'F. Agrup. Serie, Nro. Fac.'
      FieldName = 'FACREC_FAGR_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacRecDisponiblesFACREC_FAGR_FECHAEXPEDICION: TDateTimeField
      DisplayLabel = 'F. Agrup. Fec. Exped.'
      FieldName = 'FACREC_FAGR_FECHAEXPEDICION'
    end
    object xRLRFacRecDisponiblesFACREC_FRECT_NUMSERIEFACEMISOR: TFIBStringField
      DisplayLabel = 'F. Rect. Serie, Nro. Fac.'
      FieldName = 'FACREC_FRECT_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacRecDisponiblesFACREC_FRECT_FECHAEXPEDICION: TDateTimeField
      DisplayLabel = 'F. Rect. Fec. Exped.'
      FieldName = 'FACREC_FRECT_FECHAEXPEDICION'
    end
    object xRLRFacRecDisponiblesFACREC_IMPRECT_BASERECT: TFloatField
      DisplayLabel = 'Base Rect.'
      FieldName = 'FACREC_IMPRECT_BASERECT'
    end
    object xRLRFacRecDisponiblesFACREC_IMPRECT_CUOTARECT: TFloatField
      DisplayLabel = 'Cuota Rect.'
      FieldName = 'FACREC_IMPRECT_CUOTARECT'
    end
    object xRLRFacRecDisponiblesFACREC_IMPRECT_CUOTARECRECT: TFloatField
      DisplayLabel = 'Cuota RE Rect.'
      FieldName = 'FACREC_IMPRECT_CUOTARECRECT'
    end
    object xRLRFacRecDisponiblesFACREC_FECHAOPERACION: TDateTimeField
      DisplayLabel = 'Fec. Operacion'
      FieldName = 'FACREC_FECHAOPERACION'
    end
    object xRLRFacRecDisponiblesFACREC_CLAVE_REG_ESP: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp.'
      FieldName = 'FACREC_CLAVE_REG_ESP'
      Size = 2
    end
    object xRLRFacRecDisponiblesFACREC_CLAVE_REG_ESP1: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp. 1'
      FieldName = 'FACREC_CLAVE_REG_ESP1'
      Size = 2
    end
    object xRLRFacRecDisponiblesFACREC_CLAVE_REG_ESP2: TFIBStringField
      DisplayLabel = 'Clave Reg. Esp. 2'
      FieldName = 'FACREC_CLAVE_REG_ESP2'
      Size = 2
    end
    object xRLRFacRecDisponiblesFACREC_NUMREGACUERDOFAC: TFIBStringField
      DisplayLabel = 'Nro. Reg. Acuerdo'
      FieldName = 'FACREC_NUMREGACUERDOFAC'
      Size = 15
    end
    object xRLRFacRecDisponiblesFACREC_IMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Importe Total'
      FieldName = 'FACREC_IMPORTE_TOTAL'
    end
    object xRLRFacRecDisponiblesFACREC_BASEIMPONIBLEACOSTE: TFloatField
      DisplayLabel = 'B. Imponible a Coste'
      FieldName = 'FACREC_BASEIMPONIBLEACOSTE'
    end
    object xRLRFacRecDisponiblesFACREC_DESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'FACREC_DESCRIPCION'
      Size = 150
    end
    object xRLRFacRecDisponiblesFACREC_ADUANAS_NUMERODUA: TFIBStringField
      DisplayLabel = 'Nro. DUA'
      FieldName = 'FACREC_ADUANAS_NUMERODUA'
      Size = 40
    end
    object xRLRFacRecDisponiblesFACREC_ADUANAS_FECHAREGCONTDUA: TDateTimeField
      DisplayLabel = 'Fec. Cont. DUA'
      FieldName = 'FACREC_ADUANAS_FECHAREGCONTDUA'
    end
    object xRLRFacRecDisponiblesFACREC_CONTRAP_NOMBRE_RAZON: TFIBStringField
      DisplayLabel = 'Nombre Razon Contrap.'
      FieldName = 'FACREC_CONTRAP_NOMBRE_RAZON'
      Size = 120
    end
    object xRLRFacRecDisponiblesFACREC_CONTRAP_NIF_REPRES: TFIBStringField
      DisplayLabel = 'NIF Repr. Contrap.'
      FieldName = 'FACREC_CONTRAP_NIF_REPRES'
      Size = 9
    end
    object xRLRFacRecDisponiblesFACREC_CONTRAP_NIF: TFIBStringField
      DisplayLabel = 'NIF Contrap.'
      FieldName = 'FACREC_CONTRAP_NIF'
      Size = 9
    end
    object xRLRFacRecDisponiblesFACREC_CONTRAPARTE_CODPAIS: TFIBStringField
      DisplayLabel = 'Cod. Pais Contrap.'
      FieldName = 'FACREC_CONTRAPARTE_CODPAIS'
      Size = 2
    end
    object xRLRFacRecDisponiblesFACREC_CONTRAPARTE_IDTYPE: TFIBStringField
      DisplayLabel = 'Tipo NIF Contrap.'
      FieldName = 'FACREC_CONTRAPARTE_IDTYPE'
      Size = 2
    end
    object xRLRFacRecDisponiblesFACREC_CONTRAPARTE_ID: TFIBStringField
      DisplayLabel = 'NIF Otro Contrap.'
      FieldName = 'FACREC_CONTRAPARTE_ID'
    end
    object xRLRFacRecDisponiblesFACREC_FECHAREGCONTABLE: TDateTimeField
      DisplayLabel = 'Fec. Reg Contable'
      FieldName = 'FACREC_FECHAREGCONTABLE'
    end
    object xRLRFacRecDisponiblesFACREC_CUOTA_DEDUCIBLE: TFloatField
      DisplayLabel = 'Cuota Deducible'
      FieldName = 'FACREC_CUOTA_DEDUCIBLE'
    end
    object xRLRFacRecDisponiblesESTADO_REGISTRO: TFIBStringField
      DisplayLabel = 'Estado Reg.'
      FieldName = 'ESTADO_REGISTRO'
      Size = 40
    end
    object xRLRFacRecDisponiblesCODIGO_ERROR: TFIBStringField
      DisplayLabel = 'Cod. Error'
      FieldName = 'CODIGO_ERROR'
    end
    object xRLRFacRecDisponiblesDESCRIPCION_ERROR: TFIBStringField
      DisplayLabel = 'Descripcion Error'
      DisplayWidth = 500
      FieldName = 'DESCRIPCION_ERROR'
      Size = 500
    end
    object xRLRFacRecDisponiblesTIPOCOMUNICACION_DESTINO: TFIBStringField
      DisplayLabel = 'Tipo Comunicacion Destino'
      FieldName = 'TIPOCOMUNICACION_DESTINO'
      Size = 2
    end
    object xRLRFacRecDisponiblesFACREC_INMUEBLE_SITUACIONINM: TFIBStringField
      DisplayLabel = 'Situacion Inmueble'
      FieldName = 'FACREC_INMUEBLE_SITUACIONINM'
      Size = 1
    end
    object xRLRFacRecDisponiblesFACREC_INMUEBLE_REFCATASTRAL: TFIBStringField
      DisplayLabel = 'Ref. Catastral'
      FieldName = 'FACREC_INMUEBLE_REFCATASTRAL'
      Size = 25
    end
  end
  object DSRLRFacRecDisponibles: TDataSource
    DataSet = xRLRFacRecDisponibles
    Left = 200
    Top = 344
  end
end
