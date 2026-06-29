object DMFactoringChl: TDMFactoringChl
  OldCreateOrder = False
  OnCreate = DMFactoringChlCreate
  Left = 819
  Top = 182
  Height = 469
  Width = 508
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
    Left = 56
    Top = 64
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
  end
  object DSCabeceraFEChile: TDataSource
    DataSet = QMCabeceraFEChile
    Left = 168
    Top = 64
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
  object SSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 384
    Top = 72
  end
  object xFactura: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA'
      'WHERE ID_S=:ID_S')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA'
      'WHERE ID_S=:ID_S')
    UniDirectional = False
    Left = 56
    Top = 16
    object xFacturaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFacturaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFacturaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFacturaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xFacturaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xFacturaRIG: TIntegerField
      FieldName = 'RIG'
    end
    object xFacturaTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xFacturaB_COMISION: TFloatField
      DisplayLabel = 'B Comision'
      FieldName = 'B_COMISION'
    end
    object xFacturaI_COMISION: TFloatField
      DisplayLabel = 'I Comision'
      FieldName = 'I_COMISION'
    end
    object xFacturaLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xFacturaNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xFacturaFOLIO: TIntegerField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
    end
    object xFacturaTIPO_DOC_TRIBUTARIO: TFIBStringField
      DisplayLabel = 'Tipo Doc. Tributario'
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object xFacturaSII_FMA_PAGO: TIntegerField
      DisplayLabel = 'SII F. Pago'
      FieldName = 'SII_FMA_PAGO'
    end
    object xFacturaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xFacturaVENCIMIENTO: TDateTimeField
      DisplayLabel = 'F. Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
  end
  object DSxFactura: TDataSource
    DataSet = xFactura
    Left = 168
    Top = 16
  end
  object xTerceroClienteDte: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
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
    DataSource = DSxFactura
    Left = 56
    Top = 304
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
  end
  object DSxTerceroClienteDte: TDataSource
    DataSet = xTerceroClienteDte
    Left = 168
    Top = 304
  end
  object DSxTerceroCedente: TDataSource
    DataSet = xTerceroCedente
    Left = 168
    Top = 352
  end
  object xTerceroCedente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM VER_TERCEROS_EDICION'
      'WHERE'
      'TERCERO = (SELECT TERCERO'
      '           FROM SYS_EMPRESAS'
      '           WHERE'
      '           EMPRESA = :EMPRESA)')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_TERCEROS_EDICION'
      'WHERE'
      'TERCERO = (SELECT TERCERO'
      '           FROM SYS_EMPRESAS'
      '           WHERE'
      '           EMPRESA = :EMPRESA)')
    UniDirectional = False
    Left = 56
    Top = 352
    object xTerceroCedenteTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xTerceroCedenteNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xTerceroCedenteNOMBRE_R_SOCIAL: TFIBStringField
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xTerceroCedenteNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xTerceroCedenteDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Dir Nombre'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xTerceroCedentePROVINCIA_DIRECCION: TFIBStringField
      DisplayLabel = 'PROVINCIA'
      FieldName = 'PROVINCIA_DIRECCION'
      Size = 2
    end
    object xTerceroCedenteREGION_DIRECCION: TFIBStringField
      DisplayLabel = 'REGION'
      FieldName = 'REGION_DIRECCION'
      Size = 15
    end
    object xTerceroCedentePOBLACION_DIRECCION: TFIBStringField
      DisplayLabel = 'POBLACION'
      FieldName = 'POBLACION_DIRECCION'
      Size = 15
    end
    object xTerceroCedenteDIRECCION: TIntegerField
      FieldName = 'DIRECCION'
    end
    object xTerceroCedenteTITULO_REGION: TFIBStringField
      DisplayLabel = 'T. Region'
      FieldName = 'TITULO_REGION'
      Size = 40
    end
    object xTerceroCedenteTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'T. Provincia'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object xTerceroCedenteTITULO_POBLACION: TFIBStringField
      DisplayLabel = 'T. Poblacion'
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
    object xTerceroCedenteTITULO_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Codigo Postal'
      FieldName = 'TITULO_CODIGO_POSTAL'
      Size = 40
    end
    object xTerceroCedenteDIRECCION_LITERAL: TMemoField
      FieldName = 'DIRECCION_LITERAL'
      BlobType = ftMemo
      Size = 8
    end
    object xTerceroCedenteEMAIL: TFIBStringField
      DisplayLabel = 'E-MAIL'
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object xTerceroCesionario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
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
    Left = 56
    Top = 112
    object xTerceroCesionarioTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xTerceroCesionarioNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xTerceroCesionarioNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xTerceroCesionarioNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xTerceroCesionarioDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Dir Nombre'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xTerceroCesionarioTELEFONO01: TFIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEFONO01'
    end
    object xTerceroCesionarioPAIS_DIRECCION: TFIBStringField
      DisplayLabel = 'PAIS'
      FieldName = 'PAIS_DIRECCION'
      Size = 3
    end
    object xTerceroCesionarioPROVINCIA_DIRECCION: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA_DIRECCION'
      Size = 2
    end
    object xTerceroCesionarioREGION_DIRECCION: TFIBStringField
      DisplayLabel = 'Region'
      FieldName = 'REGION_DIRECCION'
      Size = 15
    end
    object xTerceroCesionarioPOBLACION_DIRECCION: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'POBLACION_DIRECCION'
      Size = 15
    end
    object xTerceroCesionarioTITULO_REGION: TFIBStringField
      DisplayLabel = 'T. Region'
      FieldName = 'TITULO_REGION'
      Size = 40
    end
    object xTerceroCesionarioTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'T. Provincia'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object xTerceroCesionarioTITULO_POBLACION: TFIBStringField
      DisplayLabel = 'T. Poblacion'
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
    object xTerceroCesionarioTITULO_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Codigo Postal'
      FieldName = 'TITULO_CODIGO_POSTAL'
      Size = 40
    end
    object xTerceroCesionarioEMAIL: TFIBStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object DSxTerceroCesionario: TDataSource
    DataSet = xTerceroCesionario
    Left = 168
    Top = 112
  end
  object xTerceroCesionarioContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM SYS_TERCEROS_CONTACTOS C'
      'JOIN SYS_TERCEROS_DIRECCIONES D ON (C.TERCERO = D.TERCERO AND'
      '      C.DIRECCION = D.DIRECCION)'
      'WHERE'
      'TERCERO = :TERCERO   ')
    SelectSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM SYS_TERCEROS_CONTACTOS C'
      'JOIN SYS_TERCEROS_DIRECCIONES D ON (C.TERCERO = D.TERCERO AND'
      '      C.DIRECCION = D.DIRECCION)'
      'WHERE'
      'TERCERO = :TERCERO   '
      'ORDER BY CONTACTO')
    UniDirectional = False
    Left = 56
    Top = 160
    object xTerceroCesionarioContactoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xTerceroCesionarioContactoCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xTerceroCesionarioContactoNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 40
    end
    object xTerceroCesionarioContactoAPELLIDOS: TFIBStringField
      DisplayLabel = 'Apellidos'
      FieldName = 'APELLIDOS'
      Size = 40
    end
    object xTerceroCesionarioContactoTELEFONO: TFIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEFONO'
    end
    object xTerceroCesionarioContactoCORREO: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'CORREO'
      Size = 100
    end
    object xTerceroCesionarioContactoDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xTerceroCesionarioContactoDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Dir Nombre'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xTerceroCesionarioContactoDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Dir Completa'
      FieldName = 'DIR_COMPLETA'
      Size = 68
    end
    object xTerceroCesionarioContactoDIRECCION_LITERAL: TMemoField
      DisplayLabel = 'Direccion literal'
      FieldName = 'DIRECCION_LITERAL'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSxTerceroCesionarioContacto: TDataSource
    DataSet = xTerceroCesionarioContacto
    Left = 168
    Top = 160
  end
  object xEmisor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT T.NIF, T.NOMBRE_R_SOCIAL, T.TELEFONO01, T.EMAIL, '
      'D.DIR_COMPLETA_N, P.TITULO AS TITULO_POBLACION '
      'FROM SYS_EMPRESAS E '
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO '
      'JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO '
      'JOIN SYS_POBLACION P ON D.POBLACION = P.POBLACION '
      'WHERE '
      'E.EMPRESA = :EMPRESA AND '
      'D.DIR_DEFECTO = 1 ')
    SelectSQL.Strings = (
      'SELECT T.NIF, T.NOMBRE_R_SOCIAL, T.TELEFONO01, T.EMAIL, '
      'D.DIR_COMPLETA_N, P.TITULO AS TITULO_POBLACION '
      'FROM SYS_EMPRESAS E '
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO '
      'JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO '
      'JOIN SYS_POBLACION P ON D.POBLACION = P.POBLACION '
      'WHERE '
      'E.EMPRESA = :EMPRESA AND '
      'D.DIR_DEFECTO = 1 ')
    UniDirectional = False
    Left = 56
    Top = 208
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
      DisplayLabel = 'Titulo Poblacion'
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
  end
  object DSxEmisor: TDataSource
    DataSet = xEmisor
    Left = 168
    Top = 208
  end
  object xCertificado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
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
      'EMPRESA = :EMPRESA')
    UniDirectional = False
    Left = 56
    Top = 256
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
  end
  object DSxCertificado: TDataSource
    DataSet = xCertificado
    Left = 168
    Top = 256
  end
end
