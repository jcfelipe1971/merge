object DMRegistroIVA: TDMRegistroIVA
  OldCreateOrder = False
  OnCreate = DMRegistroIVACreate
  OnDestroy = DMRegistroIVADestroy
  Left = 459
  Top = 138
  Height = 455
  Width = 410
  object DSQMRegistroIVA: TDataSource
    DataSet = QMRegistroIVA
    Left = 184
    Top = 8
  end
  object DSQMRegistroIVADetalle: TDataSource
    DataSet = QMRegistroIVADetalle
    Left = 184
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 336
    Top = 8
  end
  object QMRegistroIVA: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_REGISTRO_IVA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SIGNO=?old_SIGNO AND '
      '  REGISTRO=?old_REGISTRO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_REGISTRO_IVA'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SIGNO,REGISTRO,FECHA_REGISTRO,CUENT' +
        'A,DOC_NUMERO,DOC_SERIE,DOC_FECHA,DOC_TIPO,'#13#10'MODO,DESCRIPCION_CTA' +
        ',ACTIVO,ENLACE_ASIENTO,LIQUIDO,S_RECARGOS,S_BASES,S_IVAS,RIG_VIS' +
        'IBLE,ANYO_NATURAL,'#13#10'TERCERO,RETENCION,LIQUIDO_TOTAL,NIF,ADQUISIC' +
        'ION,ID_I,NOMBRE,DIRECCION,C_POSTAL,PROVINCIA,'#13#10'PAIS,CUENTA_PGC,R' +
        'ECC,INVERSION_SUJETO_PASIVO,NIF_347,S_IMPUESTO_ADICIONAL,EMITIDA' +
        '_POR_TERCEROS,ANULADO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SIGNO,?REGISTRO,?FECHA_REGISTRO' +
        ',?CUENTA,?DOC_NUMERO,?DOC_SERIE,?DOC_FECHA,?DOC_TIPO,'#13#10'?MODO,?DE' +
        'SCRIPCION_CTA,?ACTIVO,?ENLACE_ASIENTO,?LIQUIDO,?S_RECARGOS,?S_BA' +
        'SES,?S_IVAS,?RIG_VISIBLE,?ANYO_NATURAL,'#13#10'?TERCERO,?RETENCION,?LI' +
        'QUIDO_TOTAL,?NIF,?ADQUISICION,?ID_I,?NOMBRE,?DIRECCION,?C_POSTAL' +
        ',?PROVINCIA,'#13#10'?PAIS,?CUENTA_PGC,?RECC,?INVERSION_SUJETO_PASIVO,?' +
        'NIF_347,?S_IMPUESTO_ADICIONAL,?EMITIDA_POR_TERCEROS,?ANULADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_REGISTRO_IVA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_REGISTRO_IVA'
      'WHERE '
      'EMPRESA = ?EMPRESA AND '
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND '
      'SIGNO = ?SIGNO'
      'ORDER BY RIG_VISIBLE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_REGISTRO_IVA'
      'SET'
      '  FECHA_REGISTRO=?FECHA_REGISTRO '
      '  ,CUENTA=?CUENTA '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,DOC_FECHA=?DOC_FECHA '
      '  ,DOC_TIPO=?DOC_TIPO '
      '  ,MODO=?MODO '
      '  ,DESCRIPCION_CTA=?DESCRIPCION_CTA '
      '  ,ACTIVO=?ACTIVO '
      '  ,ENLACE_ASIENTO=?ENLACE_ASIENTO '
      '  ,LIQUIDO=?LIQUIDO '
      '  ,S_RECARGOS=?S_RECARGOS '
      '  ,S_BASES=?S_BASES '
      '  ,S_IVAS=?S_IVAS '
      '  ,RIG_VISIBLE=?RIG_VISIBLE '
      '  ,ANYO_NATURAL=?ANYO_NATURAL '
      '  ,TERCERO=?TERCERO '
      '  ,RETENCION=?RETENCION '
      '  ,LIQUIDO_TOTAL=?LIQUIDO_TOTAL '
      '  ,NIF=?NIF '
      '  ,ADQUISICION=?ADQUISICION '
      '  ,ID_I=?ID_I '
      '  ,NOMBRE=?NOMBRE '
      '  ,DIRECCION=?DIRECCION '
      '  ,C_POSTAL=?C_POSTAL '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,PAIS=?PAIS '
      '  ,CUENTA_PGC=?CUENTA_PGC '
      '  ,RECC=?RECC '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,NIF_347=?NIF_347 '
      '  ,S_IMPUESTO_ADICIONAL=?S_IMPUESTO_ADICIONAL '
      '  ,EMITIDA_POR_TERCEROS=?EMITIDA_POR_TERCEROS '
      '  ,ANULADO=?ANULADO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO ')
    AfterOpen = QMRegistroIVAAfterOpen
    BeforeClose = QMRegistroIVABeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SIGNO '
      'REGISTRO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_REGISTRO_IVA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMRegistroIVAEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRegistroIVAEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMRegistroIVACANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMRegistroIVASIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMRegistroIVAREGISTRO: TIntegerField
      DisplayLabel = 'Registro Interno'
      FieldName = 'REGISTRO'
    end
    object QMRegistroIVAFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object QMRegistroIVACUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMRegistroIVADOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMRegistroIVADOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMRegistroIVADOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMRegistroIVALIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMRegistroIVAMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object QMRegistroIVAS_RECARGOS: TFloatField
      DisplayLabel = 'Total Recargos'
      FieldName = 'S_RECARGOS'
    end
    object QMRegistroIVAS_BASES: TFloatField
      DisplayLabel = 'Total Bases'
      FieldName = 'S_BASES'
    end
    object QMRegistroIVAS_IVAS: TFloatField
      DisplayLabel = 'Total IVA'
      FieldName = 'S_IVAS'
    end
    object QMRegistroIVADESCRIPCION_CTA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'DESCRIPCION_CTA'
      Size = 150
    end
    object QMRegistroIVARIG_VISIBLE: TIntegerField
      DisplayLabel = 'Registro Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMRegistroIVADOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMRegistroIVADOC_TIPO_TITULO: TStringField
      DisplayLabel = 'Tipo Doc.'
      FieldKind = fkCalculated
      FieldName = 'DOC_TIPO_TITULO'
      OnGetText = QMRegistroIVADOC_TIPO_TITULOGetText
      Size = 25
      Calculated = True
    end
    object QMRegistroIVATERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMRegistroIVAID_I: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_I'
    end
    object QMRegistroIVANIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMRegistroIVARECC: TIntegerField
      DisplayLabel = 'Reg. Esp. Criterio de Caja'
      FieldName = 'RECC'
    end
    object QMRegistroIVAS_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = 'Imp. Adicional'
      FieldName = 'S_IMPUESTO_ADICIONAL'
    end
    object QMRegistroIVANUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMRegistroIVARETENCION: TFloatField
      DisplayLabel = 'Retencion'
      FieldName = 'RETENCION'
    end
    object QMRegistroIVAEMITIDA_POR_TERCEROS: TIntegerField
      DisplayLabel = 'Emit. x Terceros'
      FieldName = 'EMITIDA_POR_TERCEROS'
    end
    object QMRegistroIVAANULADO: TIntegerField
      DisplayLabel = 'Anulado'
      FieldName = 'ANULADO'
    end
  end
  object QMRegistroIVADetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_REGISTRO_IVA_DETALLE'
      'WHERE'
      '  ID_DETALLES_I = ?ID_DETALLES_I')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_REGISTRO_IVA_DETALLE'
      'WHERE'
      '  ID_I = ?ID_I'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_REGISTRO_IVA_DETALLE'
      'SET'
      '  B_IMPONIBLE=?B_IMPONIBLE '
      '  ,I_IVA=?I_IVA '
      '  ,I_REC=?I_REC '
      '  ,P_IVA=?P_IVA '
      '  ,DEDUCIBLE=?DEDUCIBLE '
      '  ,P_REC=?P_REC '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO'
      'WHERE'
      '  ID_DETALLES_I = ?ID_DETALLES_I')
    DataSource = DSQMRegistroIVA
    AfterOpen = QMRegistroIVADetalleAfterOpen
    AfterPost = QMRegistroIVADetalleAfterPost
    BeforeClose = QMRegistroIVADetalleBeforeClose
    ClavesPrimarias.Strings = (
      'ID_DETALLES_I'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_REGISTRO_IVA_DETALLE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMRegistroIVADetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMRegistroIVADetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMRegistroIVADetalleP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMRegistroIVADetalleP_REC: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_REC'
    end
    object QMRegistroIVADetalleDesc_Tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Desc_Tipo'
      OnGetText = QMRegistroIVADetalleDesc_TipoGetText
      Size = 15
      Calculated = True
    end
    object QMRegistroIVADetalleI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMRegistroIVADetalleI_REC: TFloatField
      DisplayLabel = 'Imp. Rec.'
      FieldName = 'I_REC'
    end
    object QMRegistroIVADetalleID_I: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_I'
    end
    object QMRegistroIVADetalleID_DETALLES_I: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_DETALLES_I'
    end
    object QMRegistroIVADetalleDEDUCIBLE: TIntegerField
      DisplayLabel = 'Deducible'
      FieldName = 'DEDUCIBLE'
    end
    object QMRegistroIVADetalleINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'Inv. Sujeto Pasivo'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object QMRegistroIVADetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField
      DisplayLabel = 'Tipo Imp. Adicional'
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
    end
    object QMRegistroIVADetalleP_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = '% Imp. Adicional'
      FieldName = 'P_IMPUESTO_ADICIONAL'
    end
    object QMRegistroIVADetalleI_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = 'Imp. Adicional'
      FieldName = 'I_IMPUESTO_ADICIONAL'
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
    Left = 336
    Top = 56
  end
  object DSQMRegistroIVADetalleRECC: TDataSource
    DataSet = QMRegistroIVADetalleRECC
    Left = 184
    Top = 104
  end
  object QMRegistroIVADetalleRECC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT FECHA_PRESENTACION, B_IMPONIBLE, I_IVA, I_REC'
      'FROM EMP_REGISTRO_IVA_DET_RECC'
      'WHERE'
      'ID_DETALLES_I_RECC = ?ID_DETALLES_I_RECC')
    SelectSQL.Strings = (
      
        'SELECT FECHA_PRESENTACION, B_IMPONIBLE, I_IVA, I_REC, ID_CARTERA' +
        '_DETALLE'
      'FROM EMP_REGISTRO_IVA_DET_RECC'
      'WHERE'
      'ID_DETALLES_I = ?ID_DETALLES_I'
      'ORDER BY FECHA_PRESENTACION')
    UniDirectional = False
    DataSource = DSQMRegistroIVADetalle
    Left = 56
    Top = 104
    object QMRegistroIVADetalleRECCFECHA_PRESENTACION: TDateTimeField
      DisplayLabel = 'Fec. Presentacion'
      FieldName = 'FECHA_PRESENTACION'
    end
    object QMRegistroIVADetalleRECCB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMRegistroIVADetalleRECCI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMRegistroIVADetalleRECCI_REC: TFloatField
      DisplayLabel = 'Imp. Recargo'
      FieldName = 'I_REC'
    end
    object QMRegistroIVADetalleRECCID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'Id Cartera Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMRegistroIVADetalleRECCREGISTRO_CARTERA: TStringField
      DisplayLabel = 'Reg. Cartera'
      FieldKind = fkCalculated
      FieldName = 'REGISTRO_CARTERA'
      OnGetText = QMRegistroIVADetalleRECCREGISTRO_CARTERAGetText
      Size = 15
      Calculated = True
    end
  end
  object xRLRFacEmi: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_REGLRFACTURASEMITIDAS'
      'WHERE'
      
        '  ID_SII_REGLRFACTURASEMITIDAS=?old_ID_SII_REGLRFACTURASEMITIDAS' +
        ' ')
    InsertSQL.Strings = (
      'INSERT INTO SII_REGLRFACTURASEMITIDAS ('
      
        'ID_SII_PRESENTACION, ID_SII_REGLRFACTURASEMITIDAS, ID_SII_SUMLRF' +
        'ACTURASEMITIDAS, ID_I, PERIODOIMPOSITIVO_EJERCICIO,'
      
        ' PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, IDFAC_EMISOR_NUMSE' +
        'RIEFAC, IDFAC_EMISOR_NUMSERIEFACFIN,'
      
        ' IDFAC_EMISOR_FECHA_EXPEDICION, FACEXP_TIPOFACTURA, FACEXP_TIPOR' +
        'ECTIFICATIVA, FACEXP_FAGR_NUMSERIEFACEMISOR,'
      
        ' FACEXP_FAGR_FECHAEXPEDICION, FACEXP_FRECT_NUMSERIEFACEMISOR, FA' +
        'CEXP_FRECT_FECHAEXPEDICION, FACEXP_IMPRECT_BASERECT,'
      
        ' FACEXP_IMPRECT_CUOTARECT, FACEXP_IMPRECT_CUOTARECRECT, FACEXP_F' +
        'ECHAOPERACION, FACEXP_CLAVE_REG_ESP,'
      
        ' FACEXP_CLAVE_REG_ESP1, FACEXP_CLAVE_REG_ESP2, FACEXP_NUMREGACUE' +
        'RDOFAC, FACEXP_IMPORTE_TOTAL,'
      
        ' FACEXP_BASEIMPONIBLEACOSTE, FACEXP_DESCRIPCION, FACEXP_INMUEBLE' +
        '_SITUACIONINM, FACEXP_INMUEBLE_REFCATASTRAL,'
      
        ' FACEXP_IMPORTETRANSMSUJETAIVA, FACEXP_EMITIDA_POR_TERCEROS, FAC' +
        'EXP_VARIOSDESTINATARIOS, FACEXP_CUPON,'
      
        ' FACEXP_CONTRAP_NOMBRE_RAZON, FACEXP_CONTRAP_NIF_REPRES, FACEXP_' +
        'CONTRAP_NIF, FACEXP_CONTRAPARTE_CODPAIS,'
      
        ' FACEXP_CONTRAPARTE_IDTYPE, FACEXP_CONTRAPARTE_ID, TIPO_DESGLOSE' +
        ', TIPO_DESGLOSE_OPERACION)'
      'VALUES ('
      
        '?ID_SII_PRESENTACION, ?ID_SII_REGLRFACTURASEMITIDAS, ?ID_SII_SUM' +
        'LRFACTURASEMITIDAS, ?ID_I,'
      
        ' ?PERIODOIMPOSITIVO_EJERCICIO, ?PERIODOIMPOSITIVO_PERIODO, ?IDFA' +
        'C_EMISOR_NIF, ?IDFAC_EMISOR_NUMSERIEFAC,'
      
        ' ?IDFAC_EMISOR_NUMSERIEFACFIN, ?IDFAC_EMISOR_FECHA_EXPEDICION, ?' +
        'FACEXP_TIPOFACTURA, ?FACEXP_TIPORECTIFICATIVA,'
      
        ' ?FACEXP_FAGR_NUMSERIEFACEMISOR, ?FACEXP_FAGR_FECHAEXPEDICION, ?' +
        'FACEXP_FRECT_NUMSERIEFACEMISOR,'
      
        ' ?FACEXP_FRECT_FECHAEXPEDICION, ?FACEXP_IMPRECT_BASERECT, ?FACEX' +
        'P_IMPRECT_CUOTARECT, ?FACEXP_IMPRECT_CUOTARECRECT,'
      
        ' ?FACEXP_FECHAOPERACION, ?FACEXP_CLAVE_REG_ESP, ?FACEXP_CLAVE_RE' +
        'G_ESP1, ?FACEXP_CLAVE_REG_ESP2,'
      
        ' ?FACEXP_NUMREGACUERDOFAC, ?FACEXP_IMPORTE_TOTAL, ?FACEXP_BASEIM' +
        'PONIBLEACOSTE, ?FACEXP_DESCRIPCION,'
      
        ' ?FACEXP_INMUEBLE_SITUACIONINM, ?FACEXP_INMUEBLE_REFCATASTRAL, ?' +
        'FACEXP_IMPORTETRANSMSUJETAIVA,'
      
        ' ?FACEXP_EMITIDA_POR_TERCEROS, ?FACEXP_VARIOSDESTINATARIOS, ?FAC' +
        'EXP_CUPON, ?FACEXP_CONTRAP_NOMBRE_RAZON,'
      
        ' ?FACEXP_CONTRAP_NIF_REPRES, ?FACEXP_CONTRAP_NIF, ?FACEXP_CONTRA' +
        'PARTE_CODPAIS, ?FACEXP_CONTRAPARTE_IDTYPE,'
      
        ' ?FACEXP_CONTRAPARTE_ID, ?TIPO_DESGLOSE, ?TIPO_DESGLOSE_OPERACIO' +
        'N)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_REGLRFACTURASEMITIDAS'
      'WHERE'
      '  ID_SII_REGLRFACTURASEMITIDAS=?ID_SII_REGLRFACTURASEMITIDAS ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_REGLRFACTURASEMITIDAS'
      'WHERE'
      '  ID_I=?ID_I'
      'ORDER BY'
      '  ID_SII_REGLRFACTURASEMITIDAS DESC')
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
      '  ,TIPO_DESGLOSE_OPERACION=?TIPO_DESGLOSE_OPERACION'
      '  ,TIPOCOMUNICACION_DESTINO=?TIPOCOMUNICACION_DESTINO '
      'WHERE'
      '  ID_SII_REGLRFACTURASEMITIDAS=?ID_SII_REGLRFACTURASEMITIDAS ')
    DataSource = DSQMRegistroIVA
    Plan.Strings = (
      ' ')
    AfterOpen = xRLRFacEmiAfterOpen
    BeforeClose = xRLRFacEmiBeforeClose
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
    Left = 56
    Top = 152
    object xRLRFacEmiID_SII_PRESENTACION: TIntegerField
      FieldName = 'ID_SII_PRESENTACION'
    end
    object xRLRFacEmiID_SII_REGLRFACTURASEMITIDAS: TIntegerField
      FieldName = 'ID_SII_REGLRFACTURASEMITIDAS'
    end
    object xRLRFacEmiID_SII_SUMLRFACTURASEMITIDAS: TIntegerField
      FieldName = 'ID_SII_SUMLRFACTURASEMITIDAS'
    end
    object xRLRFacEmiID_I: TIntegerField
      FieldName = 'ID_I'
    end
    object xRLRFacEmiPERIODOIMPOSITIVO_EJERCICIO: TIntegerField
      FieldName = 'PERIODOIMPOSITIVO_EJERCICIO'
    end
    object xRLRFacEmiPERIODOIMPOSITIVO_PERIODO: TFIBStringField
      FieldName = 'PERIODOIMPOSITIVO_PERIODO'
      Size = 2
    end
    object xRLRFacEmiIDFAC_EMISOR_NIF: TFIBStringField
      FieldName = 'IDFAC_EMISOR_NIF'
      Size = 9
    end
    object xRLRFacEmiIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField
      FieldName = 'IDFAC_EMISOR_NUMSERIEFAC'
      Size = 60
    end
    object xRLRFacEmiIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField
      FieldName = 'IDFAC_EMISOR_NUMSERIEFACFIN'
      Size = 60
    end
    object xRLRFacEmiIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField
      FieldName = 'IDFAC_EMISOR_FECHA_EXPEDICION'
    end
    object xRLRFacEmiFACEXP_TIPOFACTURA: TFIBStringField
      FieldName = 'FACEXP_TIPOFACTURA'
      Size = 2
    end
    object xRLRFacEmiFACEXP_TIPORECTIFICATIVA: TFIBStringField
      FieldName = 'FACEXP_TIPORECTIFICATIVA'
      Size = 1
    end
    object xRLRFacEmiFACEXP_FAGR_NUMSERIEFACEMISOR: TFIBStringField
      FieldName = 'FACEXP_FAGR_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacEmiFACEXP_FAGR_FECHAEXPEDICION: TDateTimeField
      FieldName = 'FACEXP_FAGR_FECHAEXPEDICION'
    end
    object xRLRFacEmiFACEXP_FRECT_NUMSERIEFACEMISOR: TFIBStringField
      FieldName = 'FACEXP_FRECT_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacEmiFACEXP_FRECT_FECHAEXPEDICION: TDateTimeField
      FieldName = 'FACEXP_FRECT_FECHAEXPEDICION'
    end
    object xRLRFacEmiFACEXP_IMPRECT_BASERECT: TFloatField
      FieldName = 'FACEXP_IMPRECT_BASERECT'
    end
    object xRLRFacEmiFACEXP_IMPRECT_CUOTARECT: TFloatField
      FieldName = 'FACEXP_IMPRECT_CUOTARECT'
    end
    object xRLRFacEmiFACEXP_IMPRECT_CUOTARECRECT: TFloatField
      FieldName = 'FACEXP_IMPRECT_CUOTARECRECT'
    end
    object xRLRFacEmiFACEXP_FECHAOPERACION: TDateTimeField
      FieldName = 'FACEXP_FECHAOPERACION'
    end
    object xRLRFacEmiFACEXP_CLAVE_REG_ESP: TFIBStringField
      FieldName = 'FACEXP_CLAVE_REG_ESP'
      Size = 2
    end
    object xRLRFacEmiFACEXP_CLAVE_REG_ESP1: TFIBStringField
      FieldName = 'FACEXP_CLAVE_REG_ESP1'
      Size = 2
    end
    object xRLRFacEmiFACEXP_CLAVE_REG_ESP2: TFIBStringField
      FieldName = 'FACEXP_CLAVE_REG_ESP2'
      Size = 2
    end
    object xRLRFacEmiFACEXP_NUMREGACUERDOFAC: TFIBStringField
      FieldName = 'FACEXP_NUMREGACUERDOFAC'
      Size = 15
    end
    object xRLRFacEmiFACEXP_IMPORTE_TOTAL: TFloatField
      FieldName = 'FACEXP_IMPORTE_TOTAL'
    end
    object xRLRFacEmiFACEXP_BASEIMPONIBLEACOSTE: TFloatField
      FieldName = 'FACEXP_BASEIMPONIBLEACOSTE'
    end
    object xRLRFacEmiFACEXP_DESCRIPCION: TFIBStringField
      FieldName = 'FACEXP_DESCRIPCION'
      Size = 150
    end
    object xRLRFacEmiFACEXP_INMUEBLE_SITUACIONINM: TFIBStringField
      FieldName = 'FACEXP_INMUEBLE_SITUACIONINM'
      Size = 1
    end
    object xRLRFacEmiFACEXP_INMUEBLE_REFCATASTRAL: TFIBStringField
      FieldName = 'FACEXP_INMUEBLE_REFCATASTRAL'
      Size = 25
    end
    object xRLRFacEmiFACEXP_IMPORTETRANSMSUJETAIVA: TFloatField
      FieldName = 'FACEXP_IMPORTETRANSMSUJETAIVA'
    end
    object xRLRFacEmiFACEXP_EMITIDA_POR_TERCEROS: TFIBStringField
      FieldName = 'FACEXP_EMITIDA_POR_TERCEROS'
      Size = 1
    end
    object xRLRFacEmiFACEXP_VARIOSDESTINATARIOS: TFIBStringField
      FieldName = 'FACEXP_VARIOSDESTINATARIOS'
      Size = 1
    end
    object xRLRFacEmiFACEXP_CUPON: TFIBStringField
      FieldName = 'FACEXP_CUPON'
      Size = 1
    end
    object xRLRFacEmiFACEXP_CONTRAP_NOMBRE_RAZON: TFIBStringField
      FieldName = 'FACEXP_CONTRAP_NOMBRE_RAZON'
      Size = 120
    end
    object xRLRFacEmiFACEXP_CONTRAP_NIF_REPRES: TFIBStringField
      FieldName = 'FACEXP_CONTRAP_NIF_REPRES'
      Size = 9
    end
    object xRLRFacEmiFACEXP_CONTRAP_NIF: TFIBStringField
      FieldName = 'FACEXP_CONTRAP_NIF'
      Size = 9
    end
    object xRLRFacEmiFACEXP_CONTRAPARTE_CODPAIS: TFIBStringField
      FieldName = 'FACEXP_CONTRAPARTE_CODPAIS'
      Size = 2
    end
    object xRLRFacEmiFACEXP_CONTRAPARTE_IDTYPE: TFIBStringField
      FieldName = 'FACEXP_CONTRAPARTE_IDTYPE'
      Size = 2
    end
    object xRLRFacEmiFACEXP_CONTRAPARTE_ID: TFIBStringField
      FieldName = 'FACEXP_CONTRAPARTE_ID'
    end
    object xRLRFacEmiTIPO_DESGLOSE: TFIBStringField
      FieldName = 'TIPO_DESGLOSE'
      Size = 1
    end
    object xRLRFacEmiTIPO_DESGLOSE_OPERACION: TFIBStringField
      FieldName = 'TIPO_DESGLOSE_OPERACION'
      Size = 1
    end
    object xRLRFacEmiESTADO_REGISTRO: TFIBStringField
      FieldName = 'ESTADO_REGISTRO'
      Size = 40
    end
    object xRLRFacEmiCODIGO_ERROR: TFIBStringField
      FieldName = 'CODIGO_ERROR'
    end
    object xRLRFacEmiDESCRIPCION_ERROR: TFIBStringField
      FieldName = 'DESCRIPCION_ERROR'
      Size = 150
    end
    object xRLRFacEmiTIPOCOMUNICACION_DESTINO: TFIBStringField
      DisplayLabel = 'Tipo Comunic.'
      FieldName = 'TIPOCOMUNICACION_DESTINO'
      Size = 2
    end
  end
  object DSRLRFacEmi: TDataSource
    DataSet = xRLRFacEmi
    Left = 160
    Top = 152
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
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_DESGLOSEFACTURA_EMI'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
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
    Left = 168
    Top = 200
  end
  object xRLRFacRec: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_REGLRFACTURASRECIBIDAS'
      'WHERE'
      
        '  ID_SII_REGLRFACTURASRECIBIDAS=?old_ID_SII_REGLRFACTURASRECIBID' +
        'AS ')
    InsertSQL.Strings = (
      'INSERT INTO SII_REGLRFACTURASRECIBIDAS'
      
        '  (IDFAC_EMISOR_FECHA_EXPEDICION,FACREC_FAGR_FECHAEXPEDICION,FAC' +
        'REC_FRECT_FECHAEXPEDICION,FACREC_IMPRECT_BASERECT,FACREC_IMPRECT' +
        '_CUOTARECT,FACREC_IMPRECT_CUOTARECRECT,FACREC_FECHAOPERACION,FAC' +
        'REC_IMPORTE_TOTAL,FACREC_BASEIMPONIBLEACOSTE,FACREC_ADUANAS_FECH' +
        'AREGCONTDUA,FACREC_FECHAREGCONTABLE,FACREC_CUOTA_DEDUCIBLE,ID_SI' +
        'I_PRESENTACION,ID_SII_REGLRFACTURASRECIBIDAS,ID_SII_SUMLRFACTURA' +
        'SRECIBIDAS,ID_I,PERIODOIMPOSITIVO_EJERCICIO,PERIODOIMPOSITIVO_PE' +
        'RIODO,IDFAC_EMISOR_OTRO_CODPAIS,IDFAC_EMISOR_OTRO_IDTYPE,FACREC_' +
        'TIPOFACTURA,FACREC_CLAVE_REG_ESP,FACREC_CLAVE_REG_ESP1,FACREC_CL' +
        'AVE_REG_ESP2,FACREC_CONTRAPARTE_CODPAIS,FACREC_CONTRAPARTE_IDTYP' +
        'E,TIPOCOMUNICACION_DESTINO,IDFAC_EMISOR_OTRO_ID,IDFAC_EMISOR_NUM' +
        'SERIEFAC,IDFAC_EMISOR_NUMSERIEFACFIN,FACREC_FAGR_NUMSERIEFACEMIS' +
        'OR,FACREC_FRECT_NUMSERIEFACEMISOR,FACREC_DESCRIPCION,FACREC_ADUA' +
        'NAS_NUMERODUA,FACREC_CONTRAP_NOMBRE_RAZON,FACREC_CONTRAPARTE_ID,' +
        'ESTADO_REGISTRO,CODIGO_ERROR,DESCRIPCION_ERROR,FACREC_INMUEBLE_S' +
        'ITUACIONINM,FACREC_INMUEBLE_REFCATASTRAL,IDFAC_EMISOR_NIF,FACREC' +
        '_TIPORECTIFICATIVA,FACREC_NUMREGACUERDOFAC,FACREC_CONTRAP_NIF_RE' +
        'PRES,FACREC_CONTRAP_NIF)'
      'VALUES'
      
        '  (?IDFAC_EMISOR_FECHA_EXPEDICION,?FACREC_FAGR_FECHAEXPEDICION,?' +
        'FACREC_FRECT_FECHAEXPEDICION,?FACREC_IMPRECT_BASERECT,?FACREC_IM' +
        'PRECT_CUOTARECT,?FACREC_IMPRECT_CUOTARECRECT,?FACREC_FECHAOPERAC' +
        'ION,?FACREC_IMPORTE_TOTAL,?FACREC_BASEIMPONIBLEACOSTE,?FACREC_AD' +
        'UANAS_FECHAREGCONTDUA,?FACREC_FECHAREGCONTABLE,?FACREC_CUOTA_DED' +
        'UCIBLE,?ID_SII_PRESENTACION,?ID_SII_REGLRFACTURASRECIBIDAS,?ID_S' +
        'II_SUMLRFACTURASRECIBIDAS,?ID_I,?PERIODOIMPOSITIVO_EJERCICIO,?PE' +
        'RIODOIMPOSITIVO_PERIODO,?IDFAC_EMISOR_OTRO_CODPAIS,?IDFAC_EMISOR' +
        '_OTRO_IDTYPE,?FACREC_TIPOFACTURA,?FACREC_CLAVE_REG_ESP,?FACREC_C' +
        'LAVE_REG_ESP1,?FACREC_CLAVE_REG_ESP2,?FACREC_CONTRAPARTE_CODPAIS' +
        ',?FACREC_CONTRAPARTE_IDTYPE,?TIPOCOMUNICACION_DESTINO,?IDFAC_EMI' +
        'SOR_OTRO_ID,?IDFAC_EMISOR_NUMSERIEFAC,?IDFAC_EMISOR_NUMSERIEFACF' +
        'IN,?FACREC_FAGR_NUMSERIEFACEMISOR,?FACREC_FRECT_NUMSERIEFACEMISO' +
        'R,?FACREC_DESCRIPCION,?FACREC_ADUANAS_NUMERODUA,?FACREC_CONTRAP_' +
        'NOMBRE_RAZON,?FACREC_CONTRAPARTE_ID,?ESTADO_REGISTRO,?CODIGO_ERR' +
        'OR,?DESCRIPCION_ERROR,?FACREC_INMUEBLE_SITUACIONINM,?FACREC_INMU' +
        'EBLE_REFCATASTRAL,?IDFAC_EMISOR_NIF,?FACREC_TIPORECTIFICATIVA,?F' +
        'ACREC_NUMREGACUERDOFAC,?FACREC_CONTRAP_NIF_REPRES,?FACREC_CONTRA' +
        'P_NIF)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_REGLRFACTURASRECIBIDAS'
      'WHERE'
      '  ID_SII_REGLRFACTURASRECIBIDAS=?ID_SII_REGLRFACTURASRECIBIDAS ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_REGLRFACTURASRECIBIDAS'
      'WHERE'
      '  ID_I=?ID_I'
      'ORDER BY'
      '  ID_SII_REGLRFACTURASRECIBIDAS DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_REGLRFACTURASRECIBIDAS'
      'SET'
      '  IDFAC_EMISOR_FECHA_EXPEDICION=?IDFAC_EMISOR_FECHA_EXPEDICION '
      '  ,FACREC_FAGR_FECHAEXPEDICION=?FACREC_FAGR_FECHAEXPEDICION '
      '  ,FACREC_FRECT_FECHAEXPEDICION=?FACREC_FRECT_FECHAEXPEDICION '
      '  ,FACREC_IMPRECT_BASERECT=?FACREC_IMPRECT_BASERECT '
      '  ,FACREC_IMPRECT_CUOTARECT=?FACREC_IMPRECT_CUOTARECT '
      '  ,FACREC_IMPRECT_CUOTARECRECT=?FACREC_IMPRECT_CUOTARECRECT '
      '  ,FACREC_FECHAOPERACION=?FACREC_FECHAOPERACION '
      '  ,FACREC_IMPORTE_TOTAL=?FACREC_IMPORTE_TOTAL '
      '  ,FACREC_BASEIMPONIBLEACOSTE=?FACREC_BASEIMPONIBLEACOSTE '
      
        '  ,FACREC_ADUANAS_FECHAREGCONTDUA=?FACREC_ADUANAS_FECHAREGCONTDU' +
        'A '
      '  ,FACREC_FECHAREGCONTABLE=?FACREC_FECHAREGCONTABLE '
      '  ,FACREC_CUOTA_DEDUCIBLE=?FACREC_CUOTA_DEDUCIBLE '
      '  ,ID_SII_PRESENTACION=?ID_SII_PRESENTACION '
      '  ,ID_SII_SUMLRFACTURASRECIBIDAS=?ID_SII_SUMLRFACTURASRECIBIDAS '
      '  ,ID_I=?ID_I '
      '  ,PERIODOIMPOSITIVO_EJERCICIO=?PERIODOIMPOSITIVO_EJERCICIO '
      '  ,PERIODOIMPOSITIVO_PERIODO=?PERIODOIMPOSITIVO_PERIODO '
      '  ,IDFAC_EMISOR_OTRO_CODPAIS=?IDFAC_EMISOR_OTRO_CODPAIS '
      '  ,IDFAC_EMISOR_OTRO_IDTYPE=?IDFAC_EMISOR_OTRO_IDTYPE '
      '  ,FACREC_TIPOFACTURA=?FACREC_TIPOFACTURA '
      '  ,FACREC_CLAVE_REG_ESP=?FACREC_CLAVE_REG_ESP '
      '  ,FACREC_CLAVE_REG_ESP1=?FACREC_CLAVE_REG_ESP1 '
      '  ,FACREC_CLAVE_REG_ESP2=?FACREC_CLAVE_REG_ESP2 '
      '  ,FACREC_CONTRAPARTE_CODPAIS=?FACREC_CONTRAPARTE_CODPAIS '
      '  ,FACREC_CONTRAPARTE_IDTYPE=?FACREC_CONTRAPARTE_IDTYPE '
      '  ,TIPOCOMUNICACION_DESTINO=?TIPOCOMUNICACION_DESTINO '
      '  ,IDFAC_EMISOR_OTRO_ID=?IDFAC_EMISOR_OTRO_ID '
      '  ,IDFAC_EMISOR_NUMSERIEFAC=?IDFAC_EMISOR_NUMSERIEFAC '
      '  ,IDFAC_EMISOR_NUMSERIEFACFIN=?IDFAC_EMISOR_NUMSERIEFACFIN '
      '  ,FACREC_FAGR_NUMSERIEFACEMISOR=?FACREC_FAGR_NUMSERIEFACEMISOR '
      
        '  ,FACREC_FRECT_NUMSERIEFACEMISOR=?FACREC_FRECT_NUMSERIEFACEMISO' +
        'R '
      '  ,FACREC_DESCRIPCION=?FACREC_DESCRIPCION '
      '  ,FACREC_ADUANAS_NUMERODUA=?FACREC_ADUANAS_NUMERODUA '
      '  ,FACREC_CONTRAP_NOMBRE_RAZON=?FACREC_CONTRAP_NOMBRE_RAZON '
      '  ,FACREC_CONTRAPARTE_ID=?FACREC_CONTRAPARTE_ID '
      '  ,ESTADO_REGISTRO=?ESTADO_REGISTRO '
      '  ,CODIGO_ERROR=?CODIGO_ERROR '
      '  ,DESCRIPCION_ERROR=?DESCRIPCION_ERROR '
      '  ,FACREC_INMUEBLE_SITUACIONINM=?FACREC_INMUEBLE_SITUACIONINM '
      '  ,FACREC_INMUEBLE_REFCATASTRAL=?FACREC_INMUEBLE_REFCATASTRAL '
      '  ,IDFAC_EMISOR_NIF=?IDFAC_EMISOR_NIF '
      '  ,FACREC_TIPORECTIFICATIVA=?FACREC_TIPORECTIFICATIVA '
      '  ,FACREC_NUMREGACUERDOFAC=?FACREC_NUMREGACUERDOFAC '
      '  ,FACREC_CONTRAP_NIF_REPRES=?FACREC_CONTRAP_NIF_REPRES '
      '  ,FACREC_CONTRAP_NIF=?FACREC_CONTRAP_NIF '
      'WHERE'
      '  ID_SII_REGLRFACTURASRECIBIDAS=?ID_SII_REGLRFACTURASRECIBIDAS ')
    DataSource = DSQMRegistroIVA
    Plan.Strings = (
      ' ')
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
    Left = 56
    Top = 248
    object xRLRFacRecID_SII_PRESENTACION: TIntegerField
      FieldName = 'ID_SII_PRESENTACION'
    end
    object xRLRFacRecID_SII_REGLRFACTURASRECIBIDAS: TIntegerField
      FieldName = 'ID_SII_REGLRFACTURASRECIBIDAS'
    end
    object xRLRFacRecID_SII_SUMLRFACTURASRECIBIDAS: TIntegerField
      FieldName = 'ID_SII_SUMLRFACTURASRECIBIDAS'
    end
    object xRLRFacRecID_I: TIntegerField
      FieldName = 'ID_I'
    end
    object xRLRFacRecPERIODOIMPOSITIVO_EJERCICIO: TIntegerField
      FieldName = 'PERIODOIMPOSITIVO_EJERCICIO'
    end
    object xRLRFacRecPERIODOIMPOSITIVO_PERIODO: TFIBStringField
      FieldName = 'PERIODOIMPOSITIVO_PERIODO'
      Size = 2
    end
    object xRLRFacRecIDFAC_EMISOR_NIF: TFIBStringField
      FieldName = 'IDFAC_EMISOR_NIF'
      Size = 9
    end
    object xRLRFacRecIDFAC_EMISOR_OTRO_CODPAIS: TFIBStringField
      FieldName = 'IDFAC_EMISOR_OTRO_CODPAIS'
      Size = 2
    end
    object xRLRFacRecIDFAC_EMISOR_OTRO_IDTYPE: TFIBStringField
      FieldName = 'IDFAC_EMISOR_OTRO_IDTYPE'
      Size = 2
    end
    object xRLRFacRecIDFAC_EMISOR_OTRO_ID: TFIBStringField
      FieldName = 'IDFAC_EMISOR_OTRO_ID'
    end
    object xRLRFacRecIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField
      FieldName = 'IDFAC_EMISOR_NUMSERIEFAC'
      Size = 60
    end
    object xRLRFacRecIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField
      FieldName = 'IDFAC_EMISOR_NUMSERIEFACFIN'
      Size = 60
    end
    object xRLRFacRecIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField
      FieldName = 'IDFAC_EMISOR_FECHA_EXPEDICION'
    end
    object xRLRFacRecFACREC_TIPOFACTURA: TFIBStringField
      FieldName = 'FACREC_TIPOFACTURA'
      Size = 2
    end
    object xRLRFacRecFACREC_TIPORECTIFICATIVA: TFIBStringField
      FieldName = 'FACREC_TIPORECTIFICATIVA'
      Size = 1
    end
    object xRLRFacRecFACREC_FAGR_NUMSERIEFACEMISOR: TFIBStringField
      FieldName = 'FACREC_FAGR_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacRecFACREC_FAGR_FECHAEXPEDICION: TDateTimeField
      FieldName = 'FACREC_FAGR_FECHAEXPEDICION'
    end
    object xRLRFacRecFACREC_FRECT_NUMSERIEFACEMISOR: TFIBStringField
      FieldName = 'FACREC_FRECT_NUMSERIEFACEMISOR'
      Size = 60
    end
    object xRLRFacRecFACREC_FRECT_FECHAEXPEDICION: TDateTimeField
      FieldName = 'FACREC_FRECT_FECHAEXPEDICION'
    end
    object xRLRFacRecFACREC_IMPRECT_BASERECT: TFloatField
      FieldName = 'FACREC_IMPRECT_BASERECT'
    end
    object xRLRFacRecFACREC_IMPRECT_CUOTARECT: TFloatField
      FieldName = 'FACREC_IMPRECT_CUOTARECT'
    end
    object xRLRFacRecFACREC_IMPRECT_CUOTARECRECT: TFloatField
      FieldName = 'FACREC_IMPRECT_CUOTARECRECT'
    end
    object xRLRFacRecFACREC_FECHAOPERACION: TDateTimeField
      FieldName = 'FACREC_FECHAOPERACION'
    end
    object xRLRFacRecFACREC_CLAVE_REG_ESP: TFIBStringField
      FieldName = 'FACREC_CLAVE_REG_ESP'
      Size = 2
    end
    object xRLRFacRecFACREC_CLAVE_REG_ESP1: TFIBStringField
      FieldName = 'FACREC_CLAVE_REG_ESP1'
      Size = 2
    end
    object xRLRFacRecFACREC_CLAVE_REG_ESP2: TFIBStringField
      FieldName = 'FACREC_CLAVE_REG_ESP2'
      Size = 2
    end
    object xRLRFacRecFACREC_NUMREGACUERDOFAC: TFIBStringField
      FieldName = 'FACREC_NUMREGACUERDOFAC'
      Size = 15
    end
    object xRLRFacRecFACREC_IMPORTE_TOTAL: TFloatField
      FieldName = 'FACREC_IMPORTE_TOTAL'
    end
    object xRLRFacRecFACREC_BASEIMPONIBLEACOSTE: TFloatField
      FieldName = 'FACREC_BASEIMPONIBLEACOSTE'
    end
    object xRLRFacRecFACREC_DESCRIPCION: TFIBStringField
      FieldName = 'FACREC_DESCRIPCION'
      Size = 150
    end
    object xRLRFacRecFACREC_ADUANAS_NUMERODUA: TFIBStringField
      FieldName = 'FACREC_ADUANAS_NUMERODUA'
      Size = 40
    end
    object xRLRFacRecFACREC_ADUANAS_FECHAREGCONTDUA: TDateTimeField
      FieldName = 'FACREC_ADUANAS_FECHAREGCONTDUA'
    end
    object xRLRFacRecFACREC_CONTRAP_NOMBRE_RAZON: TFIBStringField
      FieldName = 'FACREC_CONTRAP_NOMBRE_RAZON'
      Size = 120
    end
    object xRLRFacRecFACREC_CONTRAP_NIF_REPRES: TFIBStringField
      FieldName = 'FACREC_CONTRAP_NIF_REPRES'
      Size = 9
    end
    object xRLRFacRecFACREC_CONTRAP_NIF: TFIBStringField
      FieldName = 'FACREC_CONTRAP_NIF'
      Size = 9
    end
    object xRLRFacRecFACREC_CONTRAPARTE_CODPAIS: TFIBStringField
      FieldName = 'FACREC_CONTRAPARTE_CODPAIS'
      Size = 2
    end
    object xRLRFacRecFACREC_CONTRAPARTE_IDTYPE: TFIBStringField
      FieldName = 'FACREC_CONTRAPARTE_IDTYPE'
      Size = 2
    end
    object xRLRFacRecFACREC_CONTRAPARTE_ID: TFIBStringField
      FieldName = 'FACREC_CONTRAPARTE_ID'
    end
    object xRLRFacRecFACREC_FECHAREGCONTABLE: TDateTimeField
      FieldName = 'FACREC_FECHAREGCONTABLE'
    end
    object xRLRFacRecFACREC_CUOTA_DEDUCIBLE: TFloatField
      FieldName = 'FACREC_CUOTA_DEDUCIBLE'
    end
    object xRLRFacRecESTADO_REGISTRO: TFIBStringField
      FieldName = 'ESTADO_REGISTRO'
      Size = 40
    end
    object xRLRFacRecCODIGO_ERROR: TFIBStringField
      FieldName = 'CODIGO_ERROR'
    end
    object xRLRFacRecDESCRIPCION_ERROR: TFIBStringField
      FieldName = 'DESCRIPCION_ERROR'
      Size = 150
    end
    object xRLRFacRecTIPOCOMUNICACION_DESTINO: TFIBStringField
      DisplayLabel = 'Tipo Comunic.'
      FieldName = 'TIPOCOMUNICACION_DESTINO'
      Size = 2
    end
    object xRLRFacRecFACREC_INMUEBLE_SITUACIONINM: TFIBStringField
      DefaultExpression = 'Situacion Inmueble'
      FieldName = 'FACREC_INMUEBLE_SITUACIONINM'
      Size = 1
    end
    object xRLRFacRecFACREC_INMUEBLE_REFCATASTRAL: TFIBStringField
      DefaultExpression = 'Ref. Catastral'
      FieldName = 'FACREC_INMUEBLE_REFCATASTRAL'
      Size = 25
    end
  end
  object DSRLRFacRec: TDataSource
    DataSet = xRLRFacRec
    Left = 160
    Top = 248
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
      '  ID_SII_REGLRFACTURASRECIBIDAS=?ID_SII_REGLRFACTURASRECIBIDAS'
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
    Left = 64
    Top = 296
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
    Left = 168
    Top = 296
  end
end
