object DMDTEChl: TDMDTEChl
  OldCreateOrder = False
  OnCreate = DMDTEChlCreate
  Left = 595
  Top = 155
  Height = 524
  Width = 522
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 312
    Top = 16
  end
  object QMCabeceraFEChile: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FE_CHL '
      'WHERE '
      'ID_S = :ID_S')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FE_CHL'
      'WHERE '
      'ID_S = :ID_S')
    UniDirectional = False
    Left = 40
    Top = 160
    object QMCabeceraFEChileID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object QMCabeceraFEChileINDSERVICIO: TIntegerField
      FieldName = 'INDSERVICIO'
    end
    object QMCabeceraFEChileMNTBRUTO: TFloatField
      FieldName = 'MNTBRUTO'
    end
    object QMCabeceraFEChileTPOTRANCOMPRA: TIntegerField
      FieldName = 'TPOTRANCOMPRA'
    end
    object QMCabeceraFEChileTPOTRANVENTA: TIntegerField
      FieldName = 'TPOTRANVENTA'
    end
    object QMCabeceraFEChileFMAPAGO: TIntegerField
      FieldName = 'FMAPAGO'
    end
    object QMCabeceraFEChileFCHCANCEL: TDateTimeField
      FieldName = 'FCHCANCEL'
    end
    object QMCabeceraFEChileMNTCANCEL: TFloatField
      FieldName = 'MNTCANCEL'
    end
    object QMCabeceraFEChileSALDOINSOL: TFloatField
      FieldName = 'SALDOINSOL'
    end
    object QMCabeceraFEChileMEDIOPAGO: TFIBStringField
      FieldName = 'MEDIOPAGO'
      Size = 15
    end
    object QMCabeceraFEChileTIPOCTAPAGO: TFIBStringField
      FieldName = 'TIPOCTAPAGO'
      Size = 15
    end
    object QMCabeceraFEChileNUMCTAPAGO: TFIBStringField
      FieldName = 'NUMCTAPAGO'
      Size = 15
    end
    object QMCabeceraFEChileBCOPAGO: TFIBStringField
      FieldName = 'BCOPAGO'
      Size = 40
    end
    object QMCabeceraFEChileTERMPAGOCDG: TFIBStringField
      FieldName = 'TERMPAGOCDG'
      Size = 15
    end
    object QMCabeceraFEChileTERMPAGOGLOSA: TFIBStringField
      FieldName = 'TERMPAGOGLOSA'
      Size = 100
    end
    object QMCabeceraFEChileTERMPAGODIAS: TFloatField
      FieldName = 'TERMPAGODIAS'
    end
    object QMCabeceraFEChileFCHVENC: TDateTimeField
      FieldName = 'FCHVENC'
    end
    object QMCabeceraFEChileTIPOFACTESP: TFloatField
      FieldName = 'TIPOFACTESP'
    end
    object QMCabeceraFEChileGIROEMIS: TFIBStringField
      FieldName = 'GIROEMIS'
      Size = 100
    end
    object QMCabeceraFEChileRUTEMISOR: TFIBStringField
      FieldName = 'RUTEMISOR'
      Size = 15
    end
    object QMCabeceraFEChileRZNSOC: TFIBStringField
      FieldName = 'RZNSOC'
      Size = 100
    end
    object QMCabeceraFEChileTELEFONO: TFIBStringField
      FieldName = 'TELEFONO'
      Size = 15
    end
    object QMCabeceraFEChileCORREOEMISOR: TFIBStringField
      FieldName = 'CORREOEMISOR'
      Size = 100
    end
    object QMCabeceraFEChileACTECO: TIntegerField
      FieldName = 'ACTECO'
    end
    object QMCabeceraFEChileSUCURSAL: TFIBStringField
      FieldName = 'SUCURSAL'
      Size = 100
    end
    object QMCabeceraFEChileCDGSIISUCUR: TIntegerField
      FieldName = 'CDGSIISUCUR'
    end
    object QMCabeceraFEChileDIRORIGEN: TFIBStringField
      FieldName = 'DIRORIGEN'
      Size = 100
    end
    object QMCabeceraFEChileCMNAORIGEN: TFIBStringField
      FieldName = 'CMNAORIGEN'
    end
    object QMCabeceraFEChileCIUDADORIGEN: TFIBStringField
      FieldName = 'CIUDADORIGEN'
    end
    object QMCabeceraFEChileCDGVENDEDOR: TFIBStringField
      FieldName = 'CDGVENDEDOR'
      Size = 100
    end
    object QMCabeceraFEChileRUTMANDANTE: TFIBStringField
      FieldName = 'RUTMANDANTE'
      Size = 15
    end
    object QMCabeceraFEChileRUTRECEP: TFIBStringField
      FieldName = 'RUTRECEP'
      Size = 15
    end
    object QMCabeceraFEChileCDGINTRECEP: TFIBStringField
      FieldName = 'CDGINTRECEP'
    end
    object QMCabeceraFEChileRZNSOCRECEP: TFIBStringField
      FieldName = 'RZNSOCRECEP'
      Size = 100
    end
    object QMCabeceraFEChileNUMID: TFIBStringField
      FieldName = 'NUMID'
    end
    object QMCabeceraFEChileNACIONALIDAD: TFIBStringField
      FieldName = 'NACIONALIDAD'
      Size = 15
    end
    object QMCabeceraFEChileTIPODOCID: TFIBStringField
      FieldName = 'TIPODOCID'
    end
    object QMCabeceraFEChileGIRORECEP: TFIBStringField
      FieldName = 'GIRORECEP'
      Size = 40
    end
    object QMCabeceraFEChileCONTACTO: TFIBStringField
      FieldName = 'CONTACTO'
      Size = 100
    end
    object QMCabeceraFEChileCORREORECEP: TFIBStringField
      FieldName = 'CORREORECEP'
      Size = 100
    end
    object QMCabeceraFEChileDIRRECEP: TFIBStringField
      FieldName = 'DIRRECEP'
      Size = 100
    end
    object QMCabeceraFEChileCMNARECEP: TFIBStringField
      FieldName = 'CMNARECEP'
    end
    object QMCabeceraFEChileCIUDADRECEP: TFIBStringField
      FieldName = 'CIUDADRECEP'
    end
    object QMCabeceraFEChileDIRPOSTAL: TFIBStringField
      FieldName = 'DIRPOSTAL'
      Size = 100
    end
    object QMCabeceraFEChileCMNAPOSTAL: TFIBStringField
      FieldName = 'CMNAPOSTAL'
    end
    object QMCabeceraFEChileCIUDADPOSTAL: TFIBStringField
      FieldName = 'CIUDADPOSTAL'
    end
    object QMCabeceraFEChileRUTSOLICITA: TFIBStringField
      FieldName = 'RUTSOLICITA'
    end
    object QMCabeceraFEChilePATENTE: TFIBStringField
      FieldName = 'PATENTE'
    end
    object QMCabeceraFEChileRUTTRANS: TFIBStringField
      FieldName = 'RUTTRANS'
    end
    object QMCabeceraFEChileRUTCHOFER: TFIBStringField
      FieldName = 'RUTCHOFER'
    end
    object QMCabeceraFEChileNOMBRECHOFER: TFIBStringField
      FieldName = 'NOMBRECHOFER'
      Size = 40
    end
    object QMCabeceraFEChileDIRDEST: TFIBStringField
      FieldName = 'DIRDEST'
      Size = 100
    end
    object QMCabeceraFEChileCMNADEST: TFIBStringField
      FieldName = 'CMNADEST'
    end
    object QMCabeceraFEChileCIUDADDEST: TFIBStringField
      FieldName = 'CIUDADDEST'
    end
    object QMCabeceraFEChileMNTNETO: TFloatField
      FieldName = 'MNTNETO'
    end
    object QMCabeceraFEChileMNTEXE: TFloatField
      FieldName = 'MNTEXE'
    end
    object QMCabeceraFEChileMNTBASE: TFloatField
      FieldName = 'MNTBASE'
    end
    object QMCabeceraFEChileMNTMARGENCOM: TFloatField
      FieldName = 'MNTMARGENCOM'
    end
    object QMCabeceraFEChileTASAIVA: TFloatField
      FieldName = 'TASAIVA'
    end
    object QMCabeceraFEChileIVA: TFloatField
      FieldName = 'IVA'
    end
    object QMCabeceraFEChileVAPROP: TFloatField
      FieldName = 'VAPROP'
    end
    object QMCabeceraFEChileIVATERC: TFloatField
      FieldName = 'IVATERC'
    end
    object QMCabeceraFEChileCREDEC: TFloatField
      FieldName = 'CREDEC'
    end
    object QMCabeceraFEChileGRNTDEP: TFloatField
      FieldName = 'GRNTDEP'
    end
    object QMCabeceraFEChileMNTTOTAL: TFloatField
      FieldName = 'MNTTOTAL'
    end
    object QMCabeceraFEChileMONTONF: TFloatField
      FieldName = 'MONTONF'
    end
    object QMCabeceraFEChileMONTOPERIODO: TFloatField
      FieldName = 'MONTOPERIODO'
    end
    object QMCabeceraFEChileSALDOANTERIOR: TFloatField
      FieldName = 'SALDOANTERIOR'
    end
    object QMCabeceraFEChileVLRPAGAR: TFloatField
      FieldName = 'VLRPAGAR'
    end
    object QMCabeceraFEChileTPOMONEDA: TFIBStringField
      FieldName = 'TPOMONEDA'
    end
    object QMCabeceraFEChileTPOCAMBIO: TFloatField
      FieldName = 'TPOCAMBIO'
    end
    object QMCabeceraFEChileMNTNETOOTRMNDA: TFloatField
      FieldName = 'MNTNETOOTRMNDA'
    end
    object QMCabeceraFEChileMNTEXEOTRMNDA: TFloatField
      FieldName = 'MNTEXEOTRMNDA'
    end
    object QMCabeceraFEChileMNTFAECARNEOTRMNDA: TFloatField
      FieldName = 'MNTFAECARNEOTRMNDA'
    end
    object QMCabeceraFEChileMNTMARGCOMOTRMNDA: TFloatField
      FieldName = 'MNTMARGCOMOTRMNDA'
    end
    object QMCabeceraFEChileIVAOTRMNDA: TFloatField
      FieldName = 'IVAOTRMNDA'
    end
    object QMCabeceraFEChileVANORETOTRMNDA: TFloatField
      FieldName = 'VANORETOTRMNDA'
    end
    object QMCabeceraFEChileMNTTOTOTRMNDA: TFloatField
      FieldName = 'MNTTOTOTRMNDA'
    end
    object QMCabeceraFEChileXML_GENERADO: TMemoField
      FieldName = 'XML_GENERADO'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraFEChileSII_TRACKID: TFIBStringField
      FieldName = 'SII_TRACKID'
    end
    object QMCabeceraFEChileXML_RESPUESTA: TMemoField
      FieldName = 'XML_RESPUESTA'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraFEChileNROLINREF: TIntegerField
      FieldName = 'NROLINREF'
    end
    object QMCabeceraFEChileTPODOCREF: TFIBStringField
      FieldName = 'TPODOCREF'
      Size = 3
    end
    object QMCabeceraFEChileRUTOTR: TFIBStringField
      FieldName = 'RUTOTR'
    end
    object QMCabeceraFEChileFCHREF: TDateTimeField
      FieldName = 'FCHREF'
    end
    object QMCabeceraFEChileCODREF: TIntegerField
      FieldName = 'CODREF'
    end
    object QMCabeceraFEChileRAZONREF: TFIBStringField
      FieldName = 'RAZONREF'
      Size = 100
    end
    object QMCabeceraFEChileTIMBRE_TEXTO: TMemoField
      FieldName = 'TIMBRE_TEXTO'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraFEChileTIMBRE_COD_BARRA: TBlobField
      FieldName = 'TIMBRE_COD_BARRA'
      Size = 8
    end
    object QMCabeceraFEChileFOLIOREF: TFIBStringField
      FieldName = 'FOLIOREF'
      Size = 40
    end
    object QMCabeceraFEChileTIPO_DOC_TRIBUTARIO: TFIBStringField
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
  end
  object DSCabeceraFEChile: TDataSource
    DataSet = QMCabeceraFEChile
    Left = 160
    Top = 160
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 384
    Top = 16
  end
  object IdPOP31: TIdPOP3
    AutoLogin = True
    SASLMechanisms = <>
    Left = 312
    Top = 72
  end
  object xFacturaCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT FIRST 1 *'
      
        'FROM (SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, TERCER' +
        'O, B_COMISION, I_COMISION, LIQUIDO, NIF, FOLIO,'
      
        '             TIPO_DOC_TRIBUTARIO, SII_FMA_PAGO, FECHA, VENCIMIEN' +
        'TO, ID_TIPO_GIRO_CLIENTE, ID_TIPO_GIRO_EMPRESA,'
      
        '             CODIGO_GIRO_CLIENTE, TITULO_GIRO_CLIENTE, CODIGO_GI' +
        'RO_EMPRESA, DIR_COMPLETA, ID_S, CLIENTE, SU_REFERENCIA, 0 AS IND' +
        'TRASLADO'
      '      FROM VER_CABECERAS_FACTURA F'
      '      WHERE'
      '      ID_S = :ID_S'
      '      UNION'
      
        '      SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, TERCER' +
        'O, B_COMISION, I_COMISION, LIQUIDO,'
      '             (SELECT NIF'
      '              FROM SYS_TERCEROS'
      '              WHERE'
      
        '              TERCERO = A.TERCERO) AS NIF, FOLIO, TIPO_DOC_TRIBU' +
        'TARIO, SII_FMA_PAGO, FECHA,'
      
        '             FECHA_SERVIDO AS VENCIMIENTO, ID_TIPO_GIRO_CLIENTE,' +
        ' ID_TIPO_GIRO_EMPRESA, CODIGO_GIRO_CLIENTE, TITULO_GIRO_CLIENTE,'
      
        '             CODIGO_GIRO_EMPRESA, DIR_COMPLETA, ID_S, CLIENTE, S' +
        'U_REFERENCIA, INDTRASLADO'
      '      FROM VER_CABECERAS_ALBARAN A'
      '      WHERE'
      '      ID_S = :ID_S)  ')
    SelectSQL.Strings = (
      'SELECT FIRST 1 *'
      
        'FROM (SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, TERCER' +
        'O, B_COMISION, I_COMISION, LIQUIDO, NIF, FOLIO,'
      
        '             TIPO_DOC_TRIBUTARIO, SII_FMA_PAGO, FECHA, VENCIMIEN' +
        'TO, ID_TIPO_GIRO_CLIENTE, ID_TIPO_GIRO_EMPRESA,'
      
        '             CODIGO_GIRO_CLIENTE, TITULO_GIRO_CLIENTE, CODIGO_GI' +
        'RO_EMPRESA, DIR_COMPLETA, ID_S, CLIENTE, SU_REFERENCIA, 0 AS IND' +
        'TRASLADO'
      '      FROM VER_CABECERAS_FACTURA F'
      '      WHERE'
      '      ID_S = :ID_S'
      '      UNION'
      
        '      SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, TERCER' +
        'O, B_COMISION, I_COMISION, LIQUIDO,'
      '             (SELECT NIF'
      '              FROM SYS_TERCEROS'
      '              WHERE'
      
        '              TERCERO = A.TERCERO) AS NIF, FOLIO, TIPO_DOC_TRIBU' +
        'TARIO, SII_FMA_PAGO, FECHA,'
      
        '             FECHA_SERVIDO AS VENCIMIENTO, ID_TIPO_GIRO_CLIENTE,' +
        ' ID_TIPO_GIRO_EMPRESA, CODIGO_GIRO_CLIENTE, TITULO_GIRO_CLIENTE,'
      
        '             CODIGO_GIRO_EMPRESA, DIR_COMPLETA, ID_S, CLIENTE, S' +
        'U_REFERENCIA, INDTRASLADO'
      '      FROM VER_CABECERAS_ALBARAN A'
      '      WHERE'
      '      ID_S = :ID_S)  ')
    UniDirectional = False
    AfterOpen = xFacturaCabeceraAfterOpen
    BeforeClose = xFacturaCabeceraBeforeClose
    Left = 40
    Top = 16
    object xFacturaCabeceraEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xFacturaCabeceraEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xFacturaCabeceraCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xFacturaCabeceraSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xFacturaCabeceraTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object xFacturaCabeceraRIG: TIntegerField
      FieldName = 'RIG'
    end
    object xFacturaCabeceraTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object xFacturaCabeceraB_COMISION: TFloatField
      FieldName = 'B_COMISION'
    end
    object xFacturaCabeceraI_COMISION: TFloatField
      FieldName = 'I_COMISION'
    end
    object xFacturaCabeceraLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object xFacturaCabeceraNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xFacturaCabeceraFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object xFacturaCabeceraTIPO_DOC_TRIBUTARIO: TFIBStringField
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object xFacturaCabeceraSII_FMA_PAGO: TIntegerField
      FieldName = 'SII_FMA_PAGO'
    end
    object xFacturaCabeceraFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object xFacturaCabeceraVENCIMIENTO: TDateTimeField
      FieldName = 'VENCIMIENTO'
    end
    object xFacturaCabeceraID_TIPO_GIRO_CLIENTE: TIntegerField
      FieldName = 'ID_TIPO_GIRO_CLIENTE'
    end
    object xFacturaCabeceraID_TIPO_GIRO_EMPRESA: TIntegerField
      FieldName = 'ID_TIPO_GIRO_EMPRESA'
    end
    object xFacturaCabeceraCODIGO_GIRO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_GIRO_CLIENTE'
    end
    object xFacturaCabeceraCODIGO_GIRO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_GIRO_EMPRESA'
    end
    object xFacturaCabeceraDIR_COMPLETA: TFIBStringField
      FieldName = 'DIR_COMPLETA'
      Size = 76
    end
    object xFacturaCabeceraID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object xFacturaCabeceraCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object xFacturaCabeceraSU_REFERENCIA: TFIBStringField
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xFacturaCabeceraINDTRASLADO: TIntegerField
      FieldName = 'INDTRASLADO'
    end
    object xFacturaCabeceraTITULO_GIRO_CLIENTE: TFIBStringField
      FieldName = 'TITULO_GIRO_CLIENTE'
      Size = 150
    end
  end
  object DSxFacturaCabecera: TDataSource
    DataSet = xFacturaCabecera
    Left = 160
    Top = 16
  end
  object xTerceroClienteDte: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM VER_TERCEROS_EDICION'
      'WHERE'
      'TERCERO = :TERCERO')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_TERCEROS_EDICION'
      'WHERE'
      'TERCERO = :TERCERO')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 40
    Top = 112
    object xTerceroClienteDteTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object xTerceroClienteDteNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xTerceroClienteDteNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R: Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xTerceroClienteDteTIPO_RAZON: TFIBStringField
      DisplayLabel = 'T.Razon'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object xTerceroClienteDteNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xTerceroClienteDteDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Dir Nombre'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xTerceroClienteDteTELEFONO01: TFIBStringField
      DisplayLabel = 'Telefono 01'
      FieldName = 'TELEFONO01'
    end
    object xTerceroClienteDteEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object xTerceroClienteDteTITULO_REGION: TFIBStringField
      DisplayLabel = 'T. Region'
      FieldName = 'TITULO_REGION'
      Size = 40
    end
    object xTerceroClienteDteTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'T. Provincia'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object xTerceroClienteDteTITULO_POBLACION: TFIBStringField
      DisplayLabel = 'T. Poblacion'
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
    object xTerceroClienteDteTITULO_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'T. Codigo Postal'
      FieldName = 'TITULO_CODIGO_POSTAL'
      Size = 40
    end
    object xTerceroClienteDtePAIS_DIRECCION: TFIBStringField
      FieldName = 'PAIS_DIRECCION'
      Size = 3
    end
    object xTerceroClienteDtePROVINCIA_DIRECCION: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA_DIRECCION'
      Size = 2
    end
    object xTerceroClienteDteREGION_DIRECCION: TFIBStringField
      DisplayLabel = 'Region'
      FieldName = 'REGION_DIRECCION'
      Size = 15
    end
    object xTerceroClienteDtePOBLACION_DIRECCION: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'POBLACION_DIRECCION'
      Size = 15
    end
    object xTerceroClienteDteDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xTerceroClienteDteDIRECCION_LITERAL: TMemoField
      DisplayLabel = 'Dir. Literal'
      FieldName = 'DIRECCION_LITERAL'
      BlobType = ftMemo
      Size = 8
    end
    object xTerceroClienteDteDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Dir Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
  end
  object DSxTerceroClienteDte: TDataSource
    DataSet = xTerceroClienteDte
    Left = 160
    Top = 112
  end
  object xEmisor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT T.NIF, T.NOMBRE_R_SOCIAL, T.TELEFONO01, T.EMAIL, D.DIR_CO' +
        'MPLETA_N, P.TITULO AS TITULO_POBLACION, D.POBLACION,'
      '       D.PROVINCIA, D.REGION, D.PAIS_DIRECCION, T.WEB'
      'FROM SYS_EMPRESAS E'
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO'
      'JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO'
      'JOIN SYS_POBLACION P ON D.POBLACION = P.POBLACION'
      'WHERE'
      'E.EMPRESA = :EMPRESA AND'
      'D.DIR_DEFECTO = 1')
    SelectSQL.Strings = (
      
        'SELECT T.NIF, T.NOMBRE_R_SOCIAL, T.TELEFONO01, T.EMAIL, D.DIR_CO' +
        'MPLETA_N, P.TITULO AS TITULO_POBLACION, D.POBLACION,'
      '       D.PROVINCIA, D.REGION, D.PAIS_DIRECCION, T.WEB'
      'FROM SYS_EMPRESAS E'
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO'
      'JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO'
      'JOIN SYS_POBLACION P ON D.POBLACION = P.POBLACION'
      'WHERE'
      'E.EMPRESA = :EMPRESA AND'
      'D.DIR_DEFECTO = 1')
    UniDirectional = False
    Left = 40
    Top = 304
    object xEmisorNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xEmisorNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xEmisorTELEFONO01: TFIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEFONO01'
    end
    object xEmisorEMAIL: TFIBStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xEmisorDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Dir Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object xEmisorTITULO_POBLACION: TFIBStringField
      DisplayLabel = 'Comuna'
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
    object xEmisorPOBLACION: TFIBStringField
      FieldName = 'POBLACION'
      Size = 15
    end
    object xEmisorPROVINCIA: TFIBStringField
      FieldName = 'PROVINCIA'
      Size = 2
    end
    object xEmisorREGION: TFIBStringField
      FieldName = 'REGION'
      Size = 15
    end
    object xEmisorPAIS_DIRECCION: TFIBStringField
      FieldName = 'PAIS_DIRECCION'
      Size = 3
    end
    object xEmisorWEB: TFIBStringField
      FieldName = 'WEB'
      Size = 60
    end
  end
  object DSxEmisor: TDataSource
    DataSet = xEmisor
    Left = 160
    Top = 304
  end
  object xCertificado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM SII_CERTIFICADOS'
      'WHERE'
      'EMPRESA = :EMPRESA')
    SelectSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM SII_CERTIFICADOS'
      'WHERE'
      'EMPRESA = :EMPRESA'
      'ORDER BY FECHA_RESOLUCION DESC')
    UniDirectional = False
    Left = 40
    Top = 208
    object xCertificadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCertificadoCERTIFICADO: TBlobField
      DisplayLabel = 'Certificado'
      FieldName = 'CERTIFICADO'
      Size = 8
    end
    object xCertificadoCONTRASENYA: TFIBStringField
      DisplayLabel = 'Contrasenya'
      FieldName = 'CONTRASENYA'
      Size = 40
    end
    object xCertificadoRUT: TFIBStringField
      FieldName = 'RUT'
    end
    object xCertificadoFECHA_RESOLUCION: TDateTimeField
      DisplayLabel = 'Fecha Resolucion'
      FieldName = 'FECHA_RESOLUCION'
    end
    object xCertificadoNRO_RESOLUCION: TIntegerField
      DisplayLabel = 'Nro. Resolucion'
      FieldName = 'NRO_RESOLUCION'
    end
    object xCertificadoNOMBRE_RESPONSABLE: TFIBStringField
      DisplayLabel = 'Nombre Responsable'
      FieldName = 'NOMBRE_RESPONSABLE'
      Size = 60
    end
    object xCertificadoEXPONENT: TFIBStringField
      DisplayLabel = 'Exponent'
      FieldName = 'EXPONENT'
      Size = 40
    end
    object xCertificadoMODULO: TBlobField
      DisplayLabel = 'Modulo'
      FieldName = 'MODULO'
      Size = 8
    end
    object xCertificadoLLAVE_PUBLICA_X509: TBlobField
      DisplayLabel = 'Llave Publica X509'
      FieldName = 'LLAVE_PUBLICA_X509'
      Size = 8
    end
    object xCertificadoLLAVE_PRIVADA_RSA: TBlobField
      DisplayLabel = 'Llave Privada RSA'
      FieldName = 'LLAVE_PRIVADA_RSA'
      Size = 8
    end
    object xCertificadoLLAVE_PRIVADA_2: TBlobField
      DisplayLabel = 'Llave Privada 2'
      FieldName = 'LLAVE_PRIVADA_2'
      Size = 8
    end
    object xCertificadoSUCSII: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCSII'
      Size = 40
    end
  end
  object DSxCertificado: TDataSource
    DataSet = xCertificado
    Left = 160
    Top = 208
  end
  object xCAF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT FIRST 1 XML_AUTORIZACION_FOLIOS, NUMERO_FINAL, CONTADOR, ' +
        'ID'
      'FROM SII_FOLIOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND'
      'ACTIVO = 1 AND'
      ':FOLIO BETWEEN NUMERO_INICIO AND NUMERO_FINAL'
      'ORDER BY FECHA_AUTORIZACION DESC')
    SelectSQL.Strings = (
      
        'SELECT FIRST 1 XML_AUTORIZACION_FOLIOS, NUMERO_FINAL, CONTADOR, ' +
        'ID'
      'FROM SII_FOLIOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND'
      'ACTIVO = 1 AND'
      ':FOLIO BETWEEN NUMERO_INICIO AND NUMERO_FINAL'
      'ORDER BY FECHA_AUTORIZACION DESC')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 40
    Top = 256
    object xCAFXML_AUTORIZACION_FOLIOS: TMemoField
      FieldName = 'XML_AUTORIZACION_FOLIOS'
      BlobType = ftMemo
      Size = 8
    end
    object xCAFNUMERO_FINAL: TIntegerField
      FieldName = 'NUMERO_FINAL'
    end
    object xCAFCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
    end
    object xCAFID: TIntegerField
      FieldName = 'ID'
    end
  end
  object DSxCAF: TDataSource
    DataSet = xCAF
    Left = 160
    Top = 256
  end
  object DSxFacturaDetalle: TDataSource
    DataSet = xFacturaDetalle
    Left = 160
    Top = 64
  end
  object xFacturaDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT  *'
      
        'FROM (SELECT ORDEN, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, I' +
        '_DESCUENTO, NOTAS, DESCUENTO, SIGNO_UNIDADES, TIPO_IVA, LIQUIDO'
      '      FROM VER_DETALLE_FACTURA'
      '      WHERE'
      '      ID_S = :ID_S'
      ''
      '      UNION'
      
        '      SELECT ORDEN, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, I' +
        '_DESCUENTO, NOTAS, DESCUENTO, SIGNO_UNIDADES, TIPO_IVA, LIQUIDO'
      '      FROM VER_DETALLE_ALBARAN'
      '      WHERE'
      '      ID_S = :ID_S)  ')
    SelectSQL.Strings = (
      'SELECT  *'
      
        'FROM (SELECT ORDEN, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, I' +
        '_DESCUENTO, NOTAS, DESCUENTO, SIGNO_UNIDADES, TIPO_IVA, LIQUIDO'
      '      FROM VER_DETALLE_FACTURA'
      '      WHERE'
      '      ID_S = :ID_S'
      ''
      '      UNION'
      
        '      SELECT ORDEN, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, I' +
        '_DESCUENTO, NOTAS, DESCUENTO, SIGNO_UNIDADES, TIPO_IVA, LIQUIDO'
      '      FROM VER_DETALLE_ALBARAN'
      '      WHERE'
      '      ID_S = :ID_S)  ')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 40
    Top = 64
    object xFacturaDetalleORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
    object xFacturaDetalleLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object xFacturaDetalleARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xFacturaDetalleTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 256
    end
    object xFacturaDetalleUNIDADES: TFloatField
      FieldName = 'UNIDADES'
    end
    object xFacturaDetallePRECIO: TFloatField
      FieldName = 'PRECIO'
    end
    object xFacturaDetalleI_DESCUENTO: TFloatField
      FieldName = 'I_DESCUENTO'
    end
    object xFacturaDetalleNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xFacturaDetalleDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
    object xFacturaDetalleSIGNO_UNIDADES: TFIBStringField
      DisplayLabel = 'Signo Unidades'
      FieldName = 'SIGNO_UNIDADES'
      Size = 3
    end
    object xFacturaDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xFacturaDetalleLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
  end
  object DSxFacCabeceraNIF: TDataSource
    DataSet = xFacCabeceraNIF
    Left = 160
    Top = 352
  end
  object xFacCabeceraNIF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S_FAC_NIF N'
      'WHERE'
      'N.ID_S = :ID_S   ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S_FAC_NIF N'
      'WHERE'
      'N.ID_S = :ID_S   ')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 40
    Top = 352
    object xFacCabeceraNIFEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xFacCabeceraNIFEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xFacCabeceraNIFCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xFacCabeceraNIFSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xFacCabeceraNIFTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object xFacCabeceraNIFRIG: TIntegerField
      FieldName = 'RIG'
    end
    object xFacCabeceraNIFNOMBRE: TFIBStringField
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xFacCabeceraNIFNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xFacCabeceraNIFDIRECCION: TFIBStringField
      FieldName = 'DIRECCION'
      Size = 100
    end
    object xFacCabeceraNIFC_POSTAL: TFIBStringField
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object xFacCabeceraNIFPROVINCIA: TFIBStringField
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xFacCabeceraNIFID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object xFacCabeceraNIFPAIS: TFIBStringField
      FieldName = 'PAIS'
      Size = 3
    end
    object xFacCabeceraNIFLOCALIDAD: TFIBStringField
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object xFacCabeceraNIFTELEFONO01: TFIBStringField
      FieldName = 'TELEFONO01'
    end
    object xFacCabeceraNIFTELEFONO02: TFIBStringField
      FieldName = 'TELEFONO02'
    end
    object xFacCabeceraNIFTELEFAX: TFIBStringField
      FieldName = 'TELEFAX'
    end
    object xFacCabeceraNIFEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object xFacCabeceraNIFNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xFacCabeceraNIFCOLONIA: TFIBStringField
      FieldName = 'COLONIA'
      Size = 40
    end
    object xFacCabeceraNIFTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object xFacCabeceraNIFCARNET_APLICADOR: TFIBStringField
      FieldName = 'CARNET_APLICADOR'
    end
    object xFacCabeceraNIFNOMBRE_CONTACTO: TFIBStringField
      FieldName = 'NOMBRE_CONTACTO'
      Size = 60
    end
    object xFacCabeceraNIFCOMO_NOS_CONOCIERON: TIntegerField
      FieldName = 'COMO_NOS_CONOCIERON'
    end
  end
  object xDteReferencias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT DTE.*, FAC.FOLIO'
      'FROM SII_DTE_REFERENCIA DTE'
      'LEFT JOIN GES_CABECERAS_S_FAC FAC ON (DTE.ID_S_REF = FAC.ID_S)'
      'WHERE'
      'DTE.ID_S = :ID_S'
      'ORDER BY DTE.NROLINREF')
    SelectSQL.Strings = (
      'SELECT DTE.*, FAC.FOLIO'
      'FROM SII_DTE_REFERENCIA DTE'
      'LEFT JOIN GES_CABECERAS_S_FAC FAC ON (DTE.ID_S_REF = FAC.ID_S)'
      'WHERE'
      'DTE.ID_S = :ID_S'
      'ORDER BY DTE.NROLINREF')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 32
    Top = 432
    object xDteReferenciasID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object xDteReferenciasNROLINREF: TIntegerField
      FieldName = 'NROLINREF'
    end
    object xDteReferenciasID_S_REF: TIntegerField
      FieldName = 'ID_S_REF'
    end
    object xDteReferenciasTPODOCREF: TFIBStringField
      FieldName = 'TPODOCREF'
      Size = 3
    end
    object xDteReferenciasFOLIOREF: TFIBStringField
      FieldName = 'FOLIOREF'
    end
    object xDteReferenciasFCHREF: TDateTimeField
      FieldName = 'FCHREF'
    end
    object xDteReferenciasCODREF: TIntegerField
      FieldName = 'CODREF'
    end
    object xDteReferenciasRAZONREF: TFIBStringField
      FieldName = 'RAZONREF'
      Size = 100
    end
    object xDteReferenciasRUTOTR: TFIBStringField
      FieldName = 'RUTOTR'
    end
    object xDteReferenciasFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
  end
  object DSxDteReferencias: TDataSource
    DataSet = xDteReferencias
    Left = 152
    Top = 432
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/5.0'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 304
    Top = 176
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 408
    Top = 72
  end
end
