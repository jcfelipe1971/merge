object DMVerifactu: TDMVerifactu
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 420
  Top = 200
  Height = 600
  Width = 541
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 48
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
    Left = 176
    Top = 8
  end
  object xRegFacturas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VF_SECUENCIA'
      'WHERE'
      '  ID_SECUENCIA=?old_ID_SECUENCIA ')
    InsertSQL.Strings = (
      'INSERT INTO VF_SECUENCIA'
      
        '  (ID_SECUENCIA,'#13#10'TIPO_REGISTRO,ENCADENAMIENTO_PRIMERREG,ENC_RA_' +
        'IDEMISORFACTURA,ENC_RA_NUMSERIEFACTURA,ENC_RA_FECHAEXPEDICIONFAC' +
        'TURA,ENC_RA_HUELLA,FECHAHORAHUSOGENREGISTRO,ID_SISTEMAINFORMATIC' +
        'O,TIPOHUELLA,INFO_HUELLA,'#13#10'HUELLA,ID_REMISION,EMPRESA,CANAL,ESTA' +
        'DO_REGISTRO,CODIGO_ERROR_REGISTRO,DESCRIPCIONERRORREGISTRO,ACTIV' +
        'O)'
      'VALUES'
      
        '  (?ID_SECUENCIA,'#13#10'?TIPO_REGISTRO,?ENCADENAMIENTO_PRIMERREG,?ENC' +
        '_RA_IDEMISORFACTURA,?ENC_RA_NUMSERIEFACTURA,?ENC_RA_FECHAEXPEDIC' +
        'IONFACTURA,?ENC_RA_HUELLA,?FECHAHORAHUSOGENREGISTRO,?ID_SISTEMAI' +
        'NFORMATICO,?TIPOHUELLA,?INFO_HUELLA,'#13#10'?HUELLA,?ID_REMISION,?EMPR' +
        'ESA,?CANAL,?ESTADO_REGISTRO,?CODIGO_ERROR_REGISTRO,?DESCRIPCIONE' +
        'RRORREGISTRO,?ACTIVO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VF_SECUENCIA'
      'WHERE'
      '  ID_SECUENCIA=?ID_SECUENCIA ')
    SelectSQL.Strings = (
      'SELECT * FROM VF_SECUENCIA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'ID_REMISION = 0'
      'ORDER BY ID_SECUENCIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VF_SECUENCIA'
      'SET'
      '  TIPO_REGISTRO=?TIPO_REGISTRO '
      '  ,ENCADENAMIENTO_PRIMERREG=?ENCADENAMIENTO_PRIMERREG '
      '  ,ENC_RA_IDEMISORFACTURA=?ENC_RA_IDEMISORFACTURA '
      '  ,ENC_RA_NUMSERIEFACTURA=?ENC_RA_NUMSERIEFACTURA '
      '  ,ENC_RA_FECHAEXPEDICIONFACTURA=?ENC_RA_FECHAEXPEDICIONFACTURA '
      '  ,ENC_RA_HUELLA=?ENC_RA_HUELLA '
      '  ,FECHAHORAHUSOGENREGISTRO=?FECHAHORAHUSOGENREGISTRO '
      '  ,ID_SISTEMAINFORMATICO=?ID_SISTEMAINFORMATICO '
      '  ,TIPOHUELLA=?TIPOHUELLA '
      '  ,INFO_HUELLA=?INFO_HUELLA '
      '  ,HUELLA=?HUELLA '
      '  ,ID_REMISION=?ID_REMISION '
      '  ,EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,ESTADO_REGISTRO=?ESTADO_REGISTRO '
      '  ,CODIGO_ERROR_REGISTRO=?CODIGO_ERROR_REGISTRO '
      '  ,DESCRIPCIONERRORREGISTRO=?DESCRIPCIONERRORREGISTRO '
      '  ,ACTIVO=?ACTIVO '
      'WHERE'
      '  ID_SECUENCIA=?ID_SECUENCIA ')
    Plan.Strings = (
      ' ')
    AfterOpen = xRegFacturasAfterOpen
    BeforeClose = xRegFacturasBeforeClose
    ClavesPrimarias.Strings = (
      'ID_SECUENCIA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VF_SECUENCIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object xRegFacturasID_SECUENCIA: TIntegerField
      DisplayLabel = 'Id Secuencia'
      FieldName = 'ID_SECUENCIA'
    end
    object xRegFacturasTIPO_REGISTRO: TFIBStringField
      DisplayLabel = 'Tipo Reg.'
      FieldName = 'TIPO_REGISTRO'
      Size = 3
    end
    object xRegFacturasENCADENAMIENTO_PRIMERREG: TFIBStringField
      DisplayLabel = 'Enc. - Primer Reg.'
      FieldName = 'ENCADENAMIENTO_PRIMERREG'
      Size = 1
    end
    object xRegFacturasENC_RA_IDEMISORFACTURA: TFIBStringField
      DisplayLabel = 'Enc. - Reg. Ant. Id Emisor'
      FieldName = 'ENC_RA_IDEMISORFACTURA'
      Size = 9
    end
    object xRegFacturasENC_RA_NUMSERIEFACTURA: TFIBStringField
      DisplayLabel = 'Enc. - Reg. Ant. Num Fact.'
      FieldName = 'ENC_RA_NUMSERIEFACTURA'
      Size = 60
    end
    object xRegFacturasENC_RA_FECHAEXPEDICIONFACTURA: TDateTimeField
      DisplayLabel = 'Enc. - Reg. Ant. Fec. Exp.'
      FieldName = 'ENC_RA_FECHAEXPEDICIONFACTURA'
    end
    object xRegFacturasENC_RA_HUELLA: TFIBStringField
      DisplayLabel = 'Enc. - Reg. Ant. Huella'
      FieldName = 'ENC_RA_HUELLA'
      Size = 65
    end
    object xRegFacturasFECHAHORAHUSOGENREGISTRO: TFIBStringField
      DisplayLabel = 'Fecha Reg.'
      FieldName = 'FECHAHORAHUSOGENREGISTRO'
      Size = 34
    end
    object xRegFacturasID_SISTEMAINFORMATICO: TIntegerField
      DisplayLabel = 'Id Sistema Infor.'
      FieldName = 'ID_SISTEMAINFORMATICO'
    end
    object xRegFacturasTIPOHUELLA: TFIBStringField
      DisplayLabel = 'Tipo Huella'
      FieldName = 'TIPOHUELLA'
      Size = 2
    end
    object xRegFacturasINFO_HUELLA: TFIBStringField
      DisplayLabel = 'Info Huella'
      FieldName = 'INFO_HUELLA'
      Size = 500
    end
    object xRegFacturasHUELLA: TFIBStringField
      DisplayLabel = 'Huella'
      FieldName = 'HUELLA'
      Size = 65
    end
    object xRegFacturasID_REMISION: TIntegerField
      DisplayLabel = 'Id Remision'
      FieldName = 'ID_REMISION'
    end
    object xRegFacturasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRegFacturasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRegFacturasESTADO_REGISTRO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_REGISTRO'
    end
    object xRegFacturasCODIGO_ERROR_REGISTRO: TFIBStringField
      DisplayLabel = 'Cod. Error'
      FieldName = 'CODIGO_ERROR_REGISTRO'
    end
    object xRegFacturasDESCRIPCIONERRORREGISTRO: TFIBStringField
      DisplayLabel = 'Desc. Error'
      FieldName = 'DESCRIPCIONERRORREGISTRO'
      Size = 500
    end
    object xRegFacturasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSRegFacturasPend: TDataSource
    DataSet = xRegFacturas
    Left = 176
    Top = 56
  end
  object xRegFactAlta: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VF_REGISTRO_ALTA'
      'WHERE'
      '  ID_SECUENCIA=?old_ID_SECUENCIA ')
    InsertSQL.Strings = (
      'INSERT INTO VF_REGISTRO_ALTA'
      
        '  (ID_SECUENCIA,'#13#10'ID_I,ID_S,IDVERSION,IDFACTURA_IDEMISORFACTURA,' +
        'IDFACTURA_NUMSERIEFACTURA,IDFACTURA_FECHAEXPEDICIONFAC,REFEXTERN' +
        'A,NOMBRERAZONEMISOR,SUBSANACION,RECHAZOPREVIO,'#13#10'TIPOFACTURA,TIPO' +
        'RECTIFICATIVA,FR_IDFR_IDEMISORFACTURA,FR_IDFR_NUMSERIEFACTURA,FR' +
        '_IDFR_FECHAEXPEDICIONFAC,FS_IDFS_IDEMISORFACTURA,FS_IDFS_NUMSERI' +
        'EFACTURA,FS_IDFS_FECHAEXPEDICIONFAC,IMPORTERECT_BASERECTIFICADA,' +
        'IMPORTERECT_CUOTARECTIFICADA,'#13#10'IMPORTERECT_CUOTARECARGORECT,FECH' +
        'AOPERACION,DESCRIPCIONOPERACION,FACTURASIMPLIFICADAART7273,FACTU' +
        'RASINIDENTIFDEST,MACRODATO,EMITIDAPORTERCEROODEST,TERCERO_NOMBRE' +
        'RAZON,TERCERO_NIF,TERCERO_IDOTRO_CODIGOPAIS,'#13#10'TERCERO_IDOTRO_IDT' +
        'YPE,TERCERO_IDOTRO_ID,DEST_IDD_NOMBRERAZON,DEST_IDD_NIF,DEST_IDD' +
        '_IDOTRO_CODIGOPAIS,DEST_IDD_IDOTRO_IDTYPE,DEST_IDD_IDOTRO_ID,CUP' +
        'ON,CUOTATOTAL,IMPORTETOTAL,'#13#10'NUMREGISTROACUERDOFACTURACION,IDACU' +
        'ERDOSISTEMAINFORMATICO,INFO_QR,EMPRESA,CANAL)'
      'VALUES'
      
        '  (?ID_SECUENCIA,'#13#10'?ID_I,?ID_S,?IDVERSION,?IDFACTURA_IDEMISORFAC' +
        'TURA,?IDFACTURA_NUMSERIEFACTURA,?IDFACTURA_FECHAEXPEDICIONFAC,?R' +
        'EFEXTERNA,?NOMBRERAZONEMISOR,?SUBSANACION,?RECHAZOPREVIO,'#13#10'?TIPO' +
        'FACTURA,?TIPORECTIFICATIVA,?FR_IDFR_IDEMISORFACTURA,?FR_IDFR_NUM' +
        'SERIEFACTURA,?FR_IDFR_FECHAEXPEDICIONFAC,?FS_IDFS_IDEMISORFACTUR' +
        'A,?FS_IDFS_NUMSERIEFACTURA,?FS_IDFS_FECHAEXPEDICIONFAC,?IMPORTER' +
        'ECT_BASERECTIFICADA,?IMPORTERECT_CUOTARECTIFICADA,'#13#10'?IMPORTERECT' +
        '_CUOTARECARGORECT,?FECHAOPERACION,?DESCRIPCIONOPERACION,?FACTURA' +
        'SIMPLIFICADAART7273,?FACTURASINIDENTIFDEST,?MACRODATO,?EMITIDAPO' +
        'RTERCEROODEST,?TERCERO_NOMBRERAZON,?TERCERO_NIF,?TERCERO_IDOTRO_' +
        'CODIGOPAIS,'#13#10'?TERCERO_IDOTRO_IDTYPE,?TERCERO_IDOTRO_ID,?DEST_IDD' +
        '_NOMBRERAZON,?DEST_IDD_NIF,?DEST_IDD_IDOTRO_CODIGOPAIS,?DEST_IDD' +
        '_IDOTRO_IDTYPE,?DEST_IDD_IDOTRO_ID,?CUPON,?CUOTATOTAL,?IMPORTETO' +
        'TAL,'#13#10'?NUMREGISTROACUERDOFACTURACION,?IDACUERDOSISTEMAINFORMATIC' +
        'O,?INFO_QR,?EMPRESA,?CANAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VF_REGISTRO_ALTA'
      'WHERE'
      '  ID_SECUENCIA=?ID_SECUENCIA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VF_REGISTRO_ALTA'
      'WHERE'
      '  ID_SECUENCIA=?ID_SECUENCIA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VF_REGISTRO_ALTA'
      'SET'
      '  ID_I=?ID_I '
      '  ,ID_S=?ID_S '
      '  ,IDVERSION=?IDVERSION '
      '  ,IDFACTURA_IDEMISORFACTURA=?IDFACTURA_IDEMISORFACTURA '
      '  ,IDFACTURA_NUMSERIEFACTURA=?IDFACTURA_NUMSERIEFACTURA '
      '  ,IDFACTURA_FECHAEXPEDICIONFAC=?IDFACTURA_FECHAEXPEDICIONFAC '
      '  ,REFEXTERNA=?REFEXTERNA '
      '  ,NOMBRERAZONEMISOR=?NOMBRERAZONEMISOR '
      '  ,SUBSANACION=?SUBSANACION '
      '  ,RECHAZOPREVIO=?RECHAZOPREVIO '
      '  ,TIPOFACTURA=?TIPOFACTURA '
      '  ,TIPORECTIFICATIVA=?TIPORECTIFICATIVA '
      '  ,FR_IDFR_IDEMISORFACTURA=?FR_IDFR_IDEMISORFACTURA '
      '  ,FR_IDFR_NUMSERIEFACTURA=?FR_IDFR_NUMSERIEFACTURA '
      '  ,FR_IDFR_FECHAEXPEDICIONFAC=?FR_IDFR_FECHAEXPEDICIONFAC '
      '  ,FS_IDFS_IDEMISORFACTURA=?FS_IDFS_IDEMISORFACTURA '
      '  ,FS_IDFS_NUMSERIEFACTURA=?FS_IDFS_NUMSERIEFACTURA '
      '  ,FS_IDFS_FECHAEXPEDICIONFAC=?FS_IDFS_FECHAEXPEDICIONFAC '
      '  ,IMPORTERECT_BASERECTIFICADA=?IMPORTERECT_BASERECTIFICADA '
      '  ,IMPORTERECT_CUOTARECTIFICADA=?IMPORTERECT_CUOTARECTIFICADA '
      '  ,IMPORTERECT_CUOTARECARGORECT=?IMPORTERECT_CUOTARECARGORECT '
      '  ,FECHAOPERACION=?FECHAOPERACION '
      '  ,DESCRIPCIONOPERACION=?DESCRIPCIONOPERACION '
      '  ,FACTURASIMPLIFICADAART7273=?FACTURASIMPLIFICADAART7273 '
      '  ,FACTURASINIDENTIFDEST=?FACTURASINIDENTIFDEST '
      '  ,MACRODATO=?MACRODATO '
      '  ,EMITIDAPORTERCEROODEST=?EMITIDAPORTERCEROODEST '
      '  ,TERCERO_NOMBRERAZON=?TERCERO_NOMBRERAZON '
      '  ,TERCERO_NIF=?TERCERO_NIF '
      '  ,TERCERO_IDOTRO_CODIGOPAIS=?TERCERO_IDOTRO_CODIGOPAIS '
      '  ,TERCERO_IDOTRO_IDTYPE=?TERCERO_IDOTRO_IDTYPE '
      '  ,TERCERO_IDOTRO_ID=?TERCERO_IDOTRO_ID '
      '  ,DEST_IDD_NOMBRERAZON=?DEST_IDD_NOMBRERAZON '
      '  ,DEST_IDD_NIF=?DEST_IDD_NIF '
      '  ,DEST_IDD_IDOTRO_CODIGOPAIS=?DEST_IDD_IDOTRO_CODIGOPAIS '
      '  ,DEST_IDD_IDOTRO_IDTYPE=?DEST_IDD_IDOTRO_IDTYPE '
      '  ,DEST_IDD_IDOTRO_ID=?DEST_IDD_IDOTRO_ID '
      '  ,CUPON=?CUPON '
      '  ,CUOTATOTAL=?CUOTATOTAL '
      '  ,IMPORTETOTAL=?IMPORTETOTAL '
      '  ,NUMREGISTROACUERDOFACTURACION=?NUMREGISTROACUERDOFACTURACION '
      '  ,IDACUERDOSISTEMAINFORMATICO=?IDACUERDOSISTEMAINFORMATICO '
      '  ,INFO_QR=?INFO_QR '
      '  ,EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      'WHERE'
      '  ID_SECUENCIA=?ID_SECUENCIA ')
    DataSource = DSRegFacturasPend
    Plan.Strings = (
      ' ')
    AfterOpen = xRegFactAltaAfterOpen
    BeforeClose = xRegFactAltaBeforeClose
    ClavesPrimarias.Strings = (
      'ID_SECUENCIA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VF_REGISTRO_ALTA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 104
    object xRegFactAltaID_SECUENCIA: TIntegerField
      DisplayLabel = 'Id Secuencia'
      FieldName = 'ID_SECUENCIA'
    end
    object xRegFactAltaID_I: TIntegerField
      DisplayLabel = 'ID Reg. IVA'
      FieldName = 'ID_I'
    end
    object xRegFactAltaID_S: TIntegerField
      DisplayLabel = 'Id Doc,'
      FieldName = 'ID_S'
    end
    object xRegFactAltaIDVERSION: TFIBStringField
      DisplayLabel = 'ID Version'
      FieldName = 'IDVERSION'
      Size = 3
    end
    object xRegFactAltaIDFACTURA_IDEMISORFACTURA: TFIBStringField
      FieldName = 'IDFACTURA_IDEMISORFACTURA'
      Size = 9
    end
    object xRegFactAltaIDFACTURA_NUMSERIEFACTURA: TFIBStringField
      FieldName = 'IDFACTURA_NUMSERIEFACTURA'
      Size = 60
    end
    object xRegFactAltaIDFACTURA_FECHAEXPEDICIONFAC: TDateTimeField
      FieldName = 'IDFACTURA_FECHAEXPEDICIONFAC'
    end
    object xRegFactAltaREFEXTERNA: TFIBStringField
      FieldName = 'REFEXTERNA'
      Size = 60
    end
    object xRegFactAltaNOMBRERAZONEMISOR: TFIBStringField
      FieldName = 'NOMBRERAZONEMISOR'
      Size = 120
    end
    object xRegFactAltaSUBSANACION: TFIBStringField
      FieldName = 'SUBSANACION'
      Size = 1
    end
    object xRegFactAltaRECHAZOPREVIO: TFIBStringField
      FieldName = 'RECHAZOPREVIO'
      Size = 1
    end
    object xRegFactAltaTIPOFACTURA: TFIBStringField
      FieldName = 'TIPOFACTURA'
      Size = 2
    end
    object xRegFactAltaTIPORECTIFICATIVA: TFIBStringField
      FieldName = 'TIPORECTIFICATIVA'
      Size = 1
    end
    object xRegFactAltaFR_IDFR_IDEMISORFACTURA: TFIBStringField
      FieldName = 'FR_IDFR_IDEMISORFACTURA'
      Size = 9
    end
    object xRegFactAltaFR_IDFR_NUMSERIEFACTURA: TFIBStringField
      FieldName = 'FR_IDFR_NUMSERIEFACTURA'
      Size = 60
    end
    object xRegFactAltaFR_IDFR_FECHAEXPEDICIONFAC: TDateTimeField
      FieldName = 'FR_IDFR_FECHAEXPEDICIONFAC'
    end
    object xRegFactAltaFS_IDFS_IDEMISORFACTURA: TFIBStringField
      FieldName = 'FS_IDFS_IDEMISORFACTURA'
      Size = 9
    end
    object xRegFactAltaFS_IDFS_NUMSERIEFACTURA: TFIBStringField
      FieldName = 'FS_IDFS_NUMSERIEFACTURA'
      Size = 60
    end
    object xRegFactAltaFS_IDFS_FECHAEXPEDICIONFAC: TDateTimeField
      FieldName = 'FS_IDFS_FECHAEXPEDICIONFAC'
    end
    object xRegFactAltaIMPORTERECT_BASERECTIFICADA: TFloatField
      FieldName = 'IMPORTERECT_BASERECTIFICADA'
    end
    object xRegFactAltaIMPORTERECT_CUOTARECTIFICADA: TFloatField
      FieldName = 'IMPORTERECT_CUOTARECTIFICADA'
    end
    object xRegFactAltaIMPORTERECT_CUOTARECARGORECT: TFloatField
      FieldName = 'IMPORTERECT_CUOTARECARGORECT'
    end
    object xRegFactAltaFECHAOPERACION: TDateTimeField
      FieldName = 'FECHAOPERACION'
    end
    object xRegFactAltaDESCRIPCIONOPERACION: TFIBStringField
      FieldName = 'DESCRIPCIONOPERACION'
      Size = 500
    end
    object xRegFactAltaFACTURASIMPLIFICADAART7273: TFIBStringField
      FieldName = 'FACTURASIMPLIFICADAART7273'
      Size = 1
    end
    object xRegFactAltaFACTURASINIDENTIFDEST: TFIBStringField
      FieldName = 'FACTURASINIDENTIFDEST'
      Size = 1
    end
    object xRegFactAltaMACRODATO: TFIBStringField
      FieldName = 'MACRODATO'
      Size = 1
    end
    object xRegFactAltaEMITIDAPORTERCEROODEST: TFIBStringField
      FieldName = 'EMITIDAPORTERCEROODEST'
      Size = 1
    end
    object xRegFactAltaTERCERO_NOMBRERAZON: TFIBStringField
      FieldName = 'TERCERO_NOMBRERAZON'
      Size = 120
    end
    object xRegFactAltaTERCERO_NIF: TFIBStringField
      FieldName = 'TERCERO_NIF'
      Size = 9
    end
    object xRegFactAltaTERCERO_IDOTRO_CODIGOPAIS: TFIBStringField
      FieldName = 'TERCERO_IDOTRO_CODIGOPAIS'
      Size = 2
    end
    object xRegFactAltaTERCERO_IDOTRO_IDTYPE: TFIBStringField
      FieldName = 'TERCERO_IDOTRO_IDTYPE'
      Size = 2
    end
    object xRegFactAltaTERCERO_IDOTRO_ID: TFIBStringField
      FieldName = 'TERCERO_IDOTRO_ID'
    end
    object xRegFactAltaDEST_IDD_NOMBRERAZON: TFIBStringField
      FieldName = 'DEST_IDD_NOMBRERAZON'
      Size = 120
    end
    object xRegFactAltaDEST_IDD_NIF: TFIBStringField
      FieldName = 'DEST_IDD_NIF'
      Size = 9
    end
    object xRegFactAltaDEST_IDD_IDOTRO_CODIGOPAIS: TFIBStringField
      FieldName = 'DEST_IDD_IDOTRO_CODIGOPAIS'
      Size = 2
    end
    object xRegFactAltaDEST_IDD_IDOTRO_IDTYPE: TFIBStringField
      FieldName = 'DEST_IDD_IDOTRO_IDTYPE'
      Size = 2
    end
    object xRegFactAltaDEST_IDD_IDOTRO_ID: TFIBStringField
      FieldName = 'DEST_IDD_IDOTRO_ID'
    end
    object xRegFactAltaCUPON: TFIBStringField
      FieldName = 'CUPON'
      Size = 1
    end
    object xRegFactAltaCUOTATOTAL: TFloatField
      FieldName = 'CUOTATOTAL'
    end
    object xRegFactAltaIMPORTETOTAL: TFloatField
      FieldName = 'IMPORTETOTAL'
    end
    object xRegFactAltaNUMREGISTROACUERDOFACTURACION: TFIBStringField
      FieldName = 'NUMREGISTROACUERDOFACTURACION'
    end
    object xRegFactAltaIDACUERDOSISTEMAINFORMATICO: TFIBStringField
      FieldName = 'IDACUERDOSISTEMAINFORMATICO'
    end
    object xRegFactAltaINFO_QR: TFIBStringField
      FieldName = 'INFO_QR'
      Size = 500
    end
    object xRegFactAltaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRegFactAltaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
  end
  object DSRegFactAlta: TDataSource
    DataSet = xRegFactAlta
    Left = 176
    Top = 104
  end
  object xRegFactAltaDesg: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM VF_REGISTRO_ALTA_DESGLOSE'
      'WHERE'
      'ID_SECUENCIA = :ID_SECUENCIA AND'
      'IMPUESTO = :IMPUESTO AND'
      'CLAVEREGIMEN = :CLAVEREGIMEN AND'
      'CALIFICACIONOPERACION = :CALIFICACIONOPERACION AND'
      'OPERACIONEXENTA = :OPERACIONEXENTA AND'
      'TIPOIMPOSITIVO = :OPERACIONEXENTA')
    SelectSQL.Strings = (
      'SELECT * FROM VF_REGISTRO_ALTA_DESGLOSE'
      'WHERE'
      'ID_SECUENCIA = :ID_SECUENCIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSRegFactAlta
    Plan.Strings = (
      ' ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VF_REGISTRO_ALTA_DESGLOSE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 152
    object xRegFactAltaDesgID_SECUENCIA: TIntegerField
      DisplayLabel = 'Id Secuencia'
      FieldName = 'ID_SECUENCIA'
    end
    object xRegFactAltaDesgIMPUESTO: TFIBStringField
      DisplayLabel = 'Impuesto'
      FieldName = 'IMPUESTO'
      Size = 2
    end
    object xRegFactAltaDesgCLAVEREGIMEN: TFIBStringField
      DisplayLabel = 'Clave Regimen'
      FieldName = 'CLAVEREGIMEN'
      Size = 2
    end
    object xRegFactAltaDesgCALIFICACIONOPERACION: TFIBStringField
      DisplayLabel = 'Calsif. Oper.'
      FieldName = 'CALIFICACIONOPERACION'
      Size = 2
    end
    object xRegFactAltaDesgOPERACIONEXENTA: TFIBStringField
      DisplayLabel = 'Oper. Exenta'
      FieldName = 'OPERACIONEXENTA'
      Size = 2
    end
    object xRegFactAltaDesgTIPOIMPOSITIVO: TFloatField
      DisplayLabel = 'Tipo Impositivo'
      FieldName = 'TIPOIMPOSITIVO'
    end
    object xRegFactAltaDesgBASEIMPONIBLEOIMPORTENOSUJETO: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'BASEIMPONIBLEOIMPORTENOSUJETO'
    end
    object xRegFactAltaDesgBASEIMPONIBLEACOSTE: TFloatField
      DisplayLabel = 'B. Imponible a Coste'
      FieldName = 'BASEIMPONIBLEACOSTE'
    end
    object xRegFactAltaDesgCUOTAREPERCUTIDA: TFloatField
      DisplayLabel = 'Cuota Repercutida'
      FieldName = 'CUOTAREPERCUTIDA'
    end
    object xRegFactAltaDesgTIPORECARGOEQUIVALENCIA: TFloatField
      DisplayLabel = 'Tipo Rec. Eq.'
      FieldName = 'TIPORECARGOEQUIVALENCIA'
    end
    object xRegFactAltaDesgCUOTARECARGOEQUIVALENCIA: TFloatField
      DisplayLabel = 'Cuota Reg.Eq.'
      FieldName = 'CUOTARECARGOEQUIVALENCIA'
    end
  end
  object DSRegFactAltaDesg: TDataSource
    DataSet = xRegFactAltaDesg
    Left = 176
    Top = 152
  end
  object xRegFactAnulacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VF_REGISTRO_ANULACION'
      'WHERE'
      '  ID_SECUENCIA=?old_ID_SECUENCIA ')
    InsertSQL.Strings = (
      'INSERT INTO VF_REGISTRO_ANULACION'
      
        '  (ID_SECUENCIA,'#13#10'ID_I,ID_S,IDVERSION,IDEMISORFACTURAANULADA,NUM' +
        'SERIEFACTURAANULADA,FECHAEXPEDICIONFACTURAANULADA,REFEXTERNA,SIN' +
        'REGISTROPREVIO,RECHAZOPREVIO,GENERADOPOR,'#13#10'GENERADOR_NOMBRERAZON' +
        ',GENERADOR_NIF,GENERADOR_IDOTRO_CODIGOPAIS,GENERADOR_IDOTRO_IDTY' +
        'PE,GENERADOR_IDOTRO_ID,EMPRESA,CANAL)'
      'VALUES'
      
        '  (?ID_SECUENCIA,'#13#10'?ID_I,?ID_S,?IDVERSION,?IDEMISORFACTURAANULAD' +
        'A,?NUMSERIEFACTURAANULADA,?FECHAEXPEDICIONFACTURAANULADA,?REFEXT' +
        'ERNA,?SINREGISTROPREVIO,?RECHAZOPREVIO,?GENERADOPOR,'#13#10'?GENERADOR' +
        '_NOMBRERAZON,?GENERADOR_NIF,?GENERADOR_IDOTRO_CODIGOPAIS,?GENERA' +
        'DOR_IDOTRO_IDTYPE,?GENERADOR_IDOTRO_ID,?EMPRESA,?CANAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VF_REGISTRO_ANULACION'
      'WHERE'
      '  ID_SECUENCIA=?ID_SECUENCIA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VF_REGISTRO_ANULACION'
      'WHERE'
      '  ID_SECUENCIA=?ID_SECUENCIA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VF_REGISTRO_ANULACION'
      'SET'
      '  ID_I=?ID_I '
      '  ,ID_S=?ID_S '
      '  ,IDVERSION=?IDVERSION '
      '  ,IDEMISORFACTURAANULADA=?IDEMISORFACTURAANULADA '
      '  ,NUMSERIEFACTURAANULADA=?NUMSERIEFACTURAANULADA '
      '  ,FECHAEXPEDICIONFACTURAANULADA=?FECHAEXPEDICIONFACTURAANULADA '
      '  ,REFEXTERNA=?REFEXTERNA '
      '  ,SINREGISTROPREVIO=?SINREGISTROPREVIO '
      '  ,RECHAZOPREVIO=?RECHAZOPREVIO '
      '  ,GENERADOPOR=?GENERADOPOR '
      '  ,GENERADOR_NOMBRERAZON=?GENERADOR_NOMBRERAZON '
      '  ,GENERADOR_NIF=?GENERADOR_NIF '
      '  ,GENERADOR_IDOTRO_CODIGOPAIS=?GENERADOR_IDOTRO_CODIGOPAIS '
      '  ,GENERADOR_IDOTRO_IDTYPE=?GENERADOR_IDOTRO_IDTYPE '
      '  ,GENERADOR_IDOTRO_ID=?GENERADOR_IDOTRO_ID '
      '  ,EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      'WHERE'
      '  ID_SECUENCIA=?ID_SECUENCIA ')
    DataSource = DSRegFacturasPend
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_SECUENCIA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VF_REGISTRO_ANULACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 200
    object xRegFactAnulacionID_SECUENCIA: TIntegerField
      DisplayLabel = 'Id Secuencia'
      FieldName = 'ID_SECUENCIA'
    end
    object xRegFactAnulacionID_I: TIntegerField
      DisplayLabel = 'Id Reg. IVA'
      FieldName = 'ID_I'
    end
    object xRegFactAnulacionID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object xRegFactAnulacionIDVERSION: TFIBStringField
      DisplayLabel = 'Id Version'
      FieldName = 'IDVERSION'
      Size = 3
    end
    object xRegFactAnulacionIDEMISORFACTURAANULADA: TFIBStringField
      FieldName = 'IDEMISORFACTURAANULADA'
      Size = 9
    end
    object xRegFactAnulacionNUMSERIEFACTURAANULADA: TFIBStringField
      FieldName = 'NUMSERIEFACTURAANULADA'
      Size = 60
    end
    object xRegFactAnulacionFECHAEXPEDICIONFACTURAANULADA: TDateTimeField
      FieldName = 'FECHAEXPEDICIONFACTURAANULADA'
    end
    object xRegFactAnulacionREFEXTERNA: TFIBStringField
      FieldName = 'REFEXTERNA'
      Size = 60
    end
    object xRegFactAnulacionSINREGISTROPREVIO: TFIBStringField
      FieldName = 'SINREGISTROPREVIO'
      Size = 1
    end
    object xRegFactAnulacionRECHAZOPREVIO: TFIBStringField
      FieldName = 'RECHAZOPREVIO'
      Size = 1
    end
    object xRegFactAnulacionGENERADOPOR: TFIBStringField
      FieldName = 'GENERADOPOR'
      Size = 1
    end
    object xRegFactAnulacionGENERADOR_NOMBRERAZON: TFIBStringField
      FieldName = 'GENERADOR_NOMBRERAZON'
      Size = 120
    end
    object xRegFactAnulacionGENERADOR_NIF: TFIBStringField
      FieldName = 'GENERADOR_NIF'
      Size = 9
    end
    object xRegFactAnulacionGENERADOR_IDOTRO_CODIGOPAIS: TFIBStringField
      FieldName = 'GENERADOR_IDOTRO_CODIGOPAIS'
      Size = 2
    end
    object xRegFactAnulacionGENERADOR_IDOTRO_IDTYPE: TFIBStringField
      FieldName = 'GENERADOR_IDOTRO_IDTYPE'
      Size = 2
    end
    object xRegFactAnulacionGENERADOR_IDOTRO_ID: TFIBStringField
      FieldName = 'GENERADOR_IDOTRO_ID'
    end
    object xRegFactAnulacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRegFactAnulacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
  end
  object DSRegFactAnulacion: TDataSource
    DataSet = xRegFactAnulacion
    Left = 176
    Top = 200
  end
  object xRemision: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VF_REMISION'
      'WHERE'
      '  ID_REMISION=?old_ID_REMISION ')
    InsertSQL.Strings = (
      'INSERT INTO VF_REMISION'
      
        '  (EMPRESA,'#13#10'CANAL,TIPO,ID_REMISION,OBLIGADOEMISION_NOMBRERAZON,' +
        'OBLIGADOEMISION_NIF,REPRESENTANTE_NOMBRERAZON,REPRESENTANTE_NIF,' +
        'REMISIONVOL_FECHAFINVERIFACTU,REMISIONVOL_INCIDENCIA,REMISIONREQ' +
        'UERIMIENTO_REFREQ,'#13#10'REMISIONREQUERIMIENTO_FINREQ,SOAP_REQUEST,SO' +
        'AP_RESPONSE,CSV,TIMESTAMPPRESENTACION,ESTADO_ENVIO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?CANAL,?TIPO,?ID_REMISION,?OBLIGADOEMISION_NOMBRER' +
        'AZON,?OBLIGADOEMISION_NIF,?REPRESENTANTE_NOMBRERAZON,?REPRESENTA' +
        'NTE_NIF,?REMISIONVOL_FECHAFINVERIFACTU,?REMISIONVOL_INCIDENCIA,?' +
        'REMISIONREQUERIMIENTO_REFREQ,'#13#10'?REMISIONREQUERIMIENTO_FINREQ,?SO' +
        'AP_REQUEST,?SOAP_RESPONSE,?CSV,?TIMESTAMPPRESENTACION,?ESTADO_EN' +
        'VIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VF_REMISION'
      'WHERE'
      '  ID_REMISION=?ID_REMISION ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VF_REMISION'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'ID_REMISION <> 0 '
      'ORDER BY ID_REMISION DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VF_REMISION'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,TIPO=?TIPO '
      '  ,OBLIGADOEMISION_NOMBRERAZON=?OBLIGADOEMISION_NOMBRERAZON '
      '  ,OBLIGADOEMISION_NIF=?OBLIGADOEMISION_NIF '
      '  ,REPRESENTANTE_NOMBRERAZON=?REPRESENTANTE_NOMBRERAZON '
      '  ,REPRESENTANTE_NIF=?REPRESENTANTE_NIF '
      '  ,REMISIONVOL_FECHAFINVERIFACTU=?REMISIONVOL_FECHAFINVERIFACTU '
      '  ,REMISIONVOL_INCIDENCIA=?REMISIONVOL_INCIDENCIA '
      '  ,REMISIONREQUERIMIENTO_REFREQ=?REMISIONREQUERIMIENTO_REFREQ '
      '  ,REMISIONREQUERIMIENTO_FINREQ=?REMISIONREQUERIMIENTO_FINREQ '
      '  ,SOAP_REQUEST=?SOAP_REQUEST '
      '  ,SOAP_RESPONSE=?SOAP_RESPONSE '
      '  ,CSV=?CSV '
      '  ,TIMESTAMPPRESENTACION=?TIMESTAMPPRESENTACION '
      '  ,ESTADO_ENVIO=?ESTADO_ENVIO '
      'WHERE'
      '  ID_REMISION=?ID_REMISION ')
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_REMISION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VF_REMISION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 304
    Top = 8
    object xRemisionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRemisionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRemisionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xRemisionID_REMISION: TIntegerField
      DisplayLabel = 'Id Remision'
      FieldName = 'ID_REMISION'
    end
    object xRemisionOBLIGADOEMISION_NOMBRERAZON: TFIBStringField
      DisplayLabel = 'Obligado Nombre Razon'
      FieldName = 'OBLIGADOEMISION_NOMBRERAZON'
      Size = 120
    end
    object xRemisionOBLIGADOEMISION_NIF: TFIBStringField
      DisplayLabel = 'Obligado NIF'
      FieldName = 'OBLIGADOEMISION_NIF'
      Size = 9
    end
    object xRemisionREPRESENTANTE_NOMBRERAZON: TFIBStringField
      DisplayLabel = 'Repres. Nombre Razon'
      FieldName = 'REPRESENTANTE_NOMBRERAZON'
      Size = 120
    end
    object xRemisionREPRESENTANTE_NIF: TFIBStringField
      DisplayLabel = 'Repres. NIF'
      FieldName = 'REPRESENTANTE_NIF'
      Size = 9
    end
    object xRemisionREMISIONVOL_FECHAFINVERIFACTU: TDateTimeField
      DisplayLabel = 'Rem. Vol. Fecha Fin VF'
      FieldName = 'REMISIONVOL_FECHAFINVERIFACTU'
    end
    object xRemisionREMISIONVOL_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Rem. Vol. Inicidencia'
      FieldName = 'REMISIONVOL_INCIDENCIA'
      Size = 1
    end
    object xRemisionREMISIONREQUERIMIENTO_REFREQ: TFIBStringField
      DisplayLabel = 'Rem. Req. Referencia'
      FieldName = 'REMISIONREQUERIMIENTO_REFREQ'
    end
    object xRemisionREMISIONREQUERIMIENTO_FINREQ: TFIBStringField
      DisplayLabel = 'Rem. Req. Fin Reg.'
      FieldName = 'REMISIONREQUERIMIENTO_FINREQ'
      Size = 1
    end
    object xRemisionCSV: TFIBStringField
      FieldName = 'CSV'
    end
    object xRemisionTIMESTAMPPRESENTACION: TFIBStringField
      DisplayLabel = 'TimeStamp Presentacion'
      FieldName = 'TIMESTAMPPRESENTACION'
      Size = 34
    end
    object xRemisionESTADO_ENVIO: TFIBStringField
      DisplayLabel = 'Estado Envio'
      FieldName = 'ESTADO_ENVIO'
    end
  end
  object DSRemision: TDataSource
    DataSet = xRemision
    Left = 432
    Top = 8
  end
  object xRemisionSOAP: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VF_REMISION'
      'WHERE'
      '  ID_REMISION=?old_ID_REMISION ')
    InsertSQL.Strings = (
      'INSERT INTO VF_REMISION'
      
        '  (EMPRESA,'#13#10'CANAL,TIPO,ID_REMISION,OBLIGADOEMISION_NOMBRERAZON,' +
        'OBLIGADOEMISION_NIF,REPRESENTANTE_NOMBRERAZON,REPRESENTANTE_NIF,' +
        'REMISIONVOL_FECHAFINVERIFACTU,REMISIONVOL_INCIDENCIA,REMISIONREQ' +
        'UERIMIENTO_REFREQ,'#13#10'REMISIONREQUERIMIENTO_FINREQ,SOAP_REQUEST,SO' +
        'AP_RESPONSE,CSV,TIMESTAMPPRESENTACION,ESTADO_ENVIO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?CANAL,?TIPO,?ID_REMISION,?OBLIGADOEMISION_NOMBRER' +
        'AZON,?OBLIGADOEMISION_NIF,?REPRESENTANTE_NOMBRERAZON,?REPRESENTA' +
        'NTE_NIF,?REMISIONVOL_FECHAFINVERIFACTU,?REMISIONVOL_INCIDENCIA,?' +
        'REMISIONREQUERIMIENTO_REFREQ,'#13#10'?REMISIONREQUERIMIENTO_FINREQ,?SO' +
        'AP_REQUEST,?SOAP_RESPONSE,?CSV,?TIMESTAMPPRESENTACION,?ESTADO_EN' +
        'VIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VF_REMISION'
      'WHERE'
      '  ID_REMISION=?ID_REMISION ')
    SelectSQL.Strings = (
      'SELECT'
      '  SOAP_REQUEST, SOAP_RESPONSE'
      'FROM VF_REMISION'
      'WHERE'
      'ID_REMISION = :ID_REMISION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VF_REMISION'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,TIPO=?TIPO '
      '  ,OBLIGADOEMISION_NOMBRERAZON=?OBLIGADOEMISION_NOMBRERAZON '
      '  ,OBLIGADOEMISION_NIF=?OBLIGADOEMISION_NIF '
      '  ,REPRESENTANTE_NOMBRERAZON=?REPRESENTANTE_NOMBRERAZON '
      '  ,REPRESENTANTE_NIF=?REPRESENTANTE_NIF '
      '  ,REMISIONVOL_FECHAFINVERIFACTU=?REMISIONVOL_FECHAFINVERIFACTU '
      '  ,REMISIONVOL_INCIDENCIA=?REMISIONVOL_INCIDENCIA '
      '  ,REMISIONREQUERIMIENTO_REFREQ=?REMISIONREQUERIMIENTO_REFREQ '
      '  ,REMISIONREQUERIMIENTO_FINREQ=?REMISIONREQUERIMIENTO_FINREQ '
      '  ,SOAP_REQUEST=?SOAP_REQUEST '
      '  ,SOAP_RESPONSE=?SOAP_RESPONSE '
      '  ,CSV=?CSV '
      '  ,TIMESTAMPPRESENTACION=?TIMESTAMPPRESENTACION '
      '  ,ESTADO_ENVIO=?ESTADO_ENVIO '
      'WHERE'
      '  ID_REMISION=?ID_REMISION ')
    DataSource = DSRemision
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_REMISION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VF_REMISION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 304
    Top = 56
    object xRemisionSOAPSOAP_REQUEST: TMemoField
      FieldName = 'SOAP_REQUEST'
      BlobType = ftMemo
      Size = 8
    end
    object xRemisionSOAPSOAP_RESPONSE: TMemoField
      FieldName = 'SOAP_RESPONSE'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSRemisionSOAP: TDataSource
    DataSet = xRemisionSOAP
    Left = 432
    Top = 56
  end
  object xConfiguracion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VF_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL ')
    InsertSQL.Strings = (
      'INSERT INTO VF_CONFIGURACION'
      
        '  (EMPRESA,'#13#10'CANAL,CERTIFICADO,NOMBRERAZON,NIF,IDOTRO_CODIGOPAIS' +
        ',IDOTRO_IDTYPE,IDOTRO_ID,NOMBRESISTEMAINFORMATICO,IDSISTEMAINFOR' +
        'MATICO,NUMEROINSTALACION,'#13#10'TIPOUSOPOSIBLESOLOVERIFACTU,TIPOUSOPO' +
        'SIBLEMULTIOT,INDICADORMULTIPLESOT,ENTORNO_PREUBAS,INTERVALO_REFR' +
        'ESCO,VERSION_SIF,CERTIFICADO_FICHERO,CERTIFICADO_VENCIMIENTO,CER' +
        'TIFICADO_CLAVE)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?CANAL,?CERTIFICADO,?NOMBRERAZON,?NIF,?IDOTRO_CODI' +
        'GOPAIS,?IDOTRO_IDTYPE,?IDOTRO_ID,?NOMBRESISTEMAINFORMATICO,?IDSI' +
        'STEMAINFORMATICO,?NUMEROINSTALACION,'#13#10'?TIPOUSOPOSIBLESOLOVERIFAC' +
        'TU,?TIPOUSOPOSIBLEMULTIOT,?INDICADORMULTIPLESOT,?ENTORNO_PREUBAS' +
        ',?INTERVALO_REFRESCO,?VERSION_SIF,?CERTIFICADO_FICHERO,?CERTIFIC' +
        'ADO_VENCIMIENTO,?CERTIFICADO_CLAVE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VF_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL ')
    SelectSQL.Strings = (
      'SELECT * FROM VF_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VF_CONFIGURACION'
      'SET'
      '  CERTIFICADO=?CERTIFICADO '
      '  ,NOMBRERAZON=?NOMBRERAZON '
      '  ,NIF=?NIF '
      '  ,IDOTRO_CODIGOPAIS=?IDOTRO_CODIGOPAIS '
      '  ,IDOTRO_IDTYPE=?IDOTRO_IDTYPE '
      '  ,IDOTRO_ID=?IDOTRO_ID '
      '  ,NOMBRESISTEMAINFORMATICO=?NOMBRESISTEMAINFORMATICO '
      '  ,IDSISTEMAINFORMATICO=?IDSISTEMAINFORMATICO '
      '  ,NUMEROINSTALACION=?NUMEROINSTALACION '
      '  ,TIPOUSOPOSIBLESOLOVERIFACTU=?TIPOUSOPOSIBLESOLOVERIFACTU '
      '  ,TIPOUSOPOSIBLEMULTIOT=?TIPOUSOPOSIBLEMULTIOT '
      '  ,INDICADORMULTIPLESOT=?INDICADORMULTIPLESOT '
      '  ,ENTORNO_PREUBAS=?ENTORNO_PREUBAS '
      '  ,INTERVALO_REFRESCO=?INTERVALO_REFRESCO '
      '  ,VERSION_SIF=?VERSION_SIF '
      '  ,CERTIFICADO_FICHERO=?CERTIFICADO_FICHERO '
      '  ,CERTIFICADO_VENCIMIENTO=?CERTIFICADO_VENCIMIENTO '
      '  ,CERTIFICADO_CLAVE=?CERTIFICADO_CLAVE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL ')
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VF_CONFIGURACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 248
    object xConfiguracionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xConfiguracionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xConfiguracionCERTIFICADO: TBlobField
      DisplayLabel = 'Certificado'
      FieldName = 'CERTIFICADO'
      Size = 8
    end
    object xConfiguracionCERTIFICADO_CLAVE: TFIBStringField
      DisplayLabel = 'Clave Cert.'
      FieldName = 'CERTIFICADO_CLAVE'
      Size = 256
    end
    object xConfiguracionCERTIFICADO_FICHERO: TFIBStringField
      DisplayLabel = 'Fichero Cert.'
      FieldName = 'CERTIFICADO_FICHERO'
      Size = 256
    end
    object xConfiguracionCERTIFICADO_VENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento Cert.'
      FieldName = 'CERTIFICADO_VENCIMIENTO'
    end
    object xConfiguracionNOMBRERAZON: TFIBStringField
      DisplayLabel = 'NombreRazon'
      FieldName = 'NOMBRERAZON'
      Size = 120
    end
    object xConfiguracionNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
      Size = 9
    end
    object xConfiguracionIDOTRO_CODIGOPAIS: TFIBStringField
      DisplayLabel = 'Cod. Pais'
      FieldName = 'IDOTRO_CODIGOPAIS'
      Size = 2
    end
    object xConfiguracionIDOTRO_IDTYPE: TFIBStringField
      DisplayLabel = 'Id Type'
      FieldName = 'IDOTRO_IDTYPE'
      Size = 2
    end
    object xConfiguracionIDOTRO_ID: TFIBStringField
      DisplayLabel = 'Id'
      FieldName = 'IDOTRO_ID'
    end
    object xConfiguracionNOMBRESISTEMAINFORMATICO: TFIBStringField
      DisplayLabel = 'Nombre Sistema Informatico'
      FieldName = 'NOMBRESISTEMAINFORMATICO'
      Size = 34
    end
    object xConfiguracionIDSISTEMAINFORMATICO: TFIBStringField
      DisplayLabel = 'Id Sistema Informatico'
      FieldName = 'IDSISTEMAINFORMATICO'
      Size = 2
    end
    object xConfiguracionNUMEROINSTALACION: TFIBStringField
      DisplayLabel = 'Numero Instalacion'
      FieldName = 'NUMEROINSTALACION'
      Size = 100
    end
    object xConfiguracionVERSION_SIF: TFIBStringField
      DisplayLabel = 'Version'
      FieldName = 'VERSION_SIF'
      Size = 65
    end
    object xConfiguracionTIPOUSOPOSIBLESOLOVERIFACTU: TFIBStringField
      DisplayLabel = 'Tipo Uso Posible Solo Verifactu'
      FieldName = 'TIPOUSOPOSIBLESOLOVERIFACTU'
      Size = 1
    end
    object xConfiguracionTIPOUSOPOSIBLEMULTIOT: TFIBStringField
      DisplayLabel = 'Tipo Uso Posible Multi OT'
      FieldName = 'TIPOUSOPOSIBLEMULTIOT'
      Size = 1
    end
    object xConfiguracionINDICADORMULTIPLESOT: TFIBStringField
      DisplayLabel = 'Indicador Multriples OT'
      FieldName = 'INDICADORMULTIPLESOT'
      Size = 1
    end
    object xConfiguracionENTORNO_PREUBAS: TIntegerField
      DisplayLabel = 'Entorno Pruebas'
      FieldName = 'ENTORNO_PREUBAS'
    end
    object xConfiguracionINTERVALO_REFRESCO: TIntegerField
      DisplayLabel = 'Intervalo Refresco'
      FieldName = 'INTERVALO_REFRESCO'
    end
    object xConfiguracionCERTIFICADO_CARGADO: TStringField
      DisplayLabel = 'Cert. Cargado'
      FieldKind = fkCalculated
      FieldName = 'CERTIFICADO_CARGADO'
      OnGetText = xConfiguracionCERTIFICADO_CARGADOGetText
      Calculated = True
    end
  end
  object DSConfiguracion: TDataSource
    DataSet = xConfiguracion
    Left = 176
    Top = 248
  end
  object DSxErrores: TDataSource
    DataSet = xErrores
    Left = 176
    Top = 296
  end
  object xErrores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_S, VFSA.TIPO_REGISTRO,'
      
        '       COALESCE(VFA.ID_SECUENCIA, 0) ID_SECUENCIA, COALESCE(VFSA' +
        '.ID_REMISION, 0) ID_REMISION,'
      
        '       COALESCE(VFSA.ESTADO_REGISTRO, '#39#39') ESTADO_REGISTRO, COALE' +
        'SCE(VFSA.CODIGO_ERROR_REGISTRO, '#39#39') CODIGO_ERROR,'
      
        '       COALESCE(VFSA.DESCRIPCIONERRORREGISTRO, '#39#39') DESCRIPCION_E' +
        'RROR'
      'FROM GES_CABECERAS_S C'
      '-- VERIFACTU - REGISTRO DE ALTA'
      
        'LEFT JOIN VF_REGISTRO_ALTA VFA ON C.ID_S = VFA.ID_S AND VFA.ULTI' +
        'MO_REGISTRO = 1'
      
        'LEFT JOIN VF_SECUENCIA VFSA ON VFA.ID_SECUENCIA = VFSA.ID_SECUEN' +
        'CIA'
      'WHERE'
      'C.ID_S = :ID_S'
      ''
      'UNION'
      ''
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_S, VFSB.TIPO_REGISTRO,'
      
        '       COALESCE(VFB.ID_SECUENCIA, 0) ID_SECUENCIA, COALESCE(VFSB' +
        '.ID_REMISION, 0) ID_REMISION,'
      
        '       COALESCE(VFSB.ESTADO_REGISTRO, '#39#39') ESTADO_REGISTRO, COALE' +
        'SCE(VFSB.CODIGO_ERROR_REGISTRO, '#39#39') CODIGO_ERROR,'
      
        '       COALESCE(VFSB.DESCRIPCIONERRORREGISTRO, '#39#39') DESCRIPCION_E' +
        'RROR'
      'FROM GES_CABECERAS_S C'
      '-- VERIFACTU - REGISTRO DE ANULACION'
      
        'LEFT JOIN VF_REGISTRO_ANULACION VFB ON C.ID_S = VFB.ID_S AND VFB' +
        '.ULTIMO_REGISTRO = 1'
      
        'LEFT JOIN VF_SECUENCIA VFSB ON VFB.ID_SECUENCIA = VFSB.ID_SECUEN' +
        'CIA'
      'WHERE'
      'C.ID_S = :ID_S'
      ''
      'ORDER BY 1, 2, 3, 4, 5, 6, 7')
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_S, VFSA.TIPO_REGISTRO,'
      
        '       COALESCE(VFA.ID_SECUENCIA, 0) ID_SECUENCIA, COALESCE(VFSA' +
        '.ID_REMISION, 0) ID_REMISION,'
      
        '       COALESCE(VFSA.ESTADO_REGISTRO, '#39#39') ESTADO_REGISTRO, COALE' +
        'SCE(VFSA.CODIGO_ERROR_REGISTRO, '#39#39') CODIGO_ERROR,'
      
        '       COALESCE(VFSA.DESCRIPCIONERRORREGISTRO, '#39#39') DESCRIPCION_E' +
        'RROR'
      'FROM GES_CABECERAS_S C'
      '-- VERIFACTU - REGISTRO DE ALTA'
      
        'LEFT JOIN VF_REGISTRO_ALTA VFA ON C.ID_S = VFA.ID_S AND VFA.ULTI' +
        'MO_REGISTRO = 1'
      
        'LEFT JOIN VF_SECUENCIA VFSA ON VFA.ID_SECUENCIA = VFSA.ID_SECUEN' +
        'CIA'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO >= 2026 AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = '#39'FAC'#39' AND'
      '((C.ESTADO = 2) OR (C.ESTADO = 5)) AND'
      '-- FACTURAS NO PRESENTADAS'
      'COALESCE(VFSA.CODIGO_ERROR_REGISTRO, '#39'9999'#39') <> '#39'0'#39
      ''
      'UNION'
      ''
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_S, VFSB.TIPO_REGISTRO,'
      
        '       COALESCE(VFB.ID_SECUENCIA, 0) ID_SECUENCIA, COALESCE(VFSB' +
        '.ID_REMISION, 0) ID_REMISION,'
      
        '       COALESCE(VFSB.ESTADO_REGISTRO, '#39#39') ESTADO_REGISTRO, COALE' +
        'SCE(VFSB.CODIGO_ERROR_REGISTRO, '#39#39') CODIGO_ERROR,'
      
        '       COALESCE(VFSB.DESCRIPCIONERRORREGISTRO, '#39#39') DESCRIPCION_E' +
        'RROR'
      'FROM GES_CABECERAS_S C'
      '-- VERIFACTU - REGISTRO DE ANULACION'
      
        'LEFT JOIN VF_REGISTRO_ANULACION VFB ON C.ID_S = VFB.ID_S AND VFB' +
        '.ULTIMO_REGISTRO = 1'
      
        'LEFT JOIN VF_SECUENCIA VFSB ON VFB.ID_SECUENCIA = VFSB.ID_SECUEN' +
        'CIA'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO >= 2026 AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = '#39'FAC'#39' AND'
      '((C.ESTADO = 2) OR (C.ESTADO = 5)) AND'
      'COALESCE(VFSB.ID_SECUENCIA, 0) <> 0 AND'
      'COALESCE(VFSB.CODIGO_ERROR_REGISTRO, '#39'0'#39') <> '#39'0'#39
      'ORDER BY 1, 2, 3, 4, 5, 6, 7')
    UniDirectional = False
    Left = 48
    Top = 296
    object xErroresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xErroresEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xErroresCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xErroresSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xErroresTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xErroresRIG: TIntegerField
      FieldName = 'RIG'
    end
    object xErroresID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object xErroresTIPO_REGISTRO: TFIBStringField
      DisplayLabel = 'Tipo Reg.'
      FieldName = 'TIPO_REGISTRO'
      Size = 3
    end
    object xErroresID_SECUENCIA: TIntegerField
      DisplayLabel = 'Id Sec.'
      FieldName = 'ID_SECUENCIA'
    end
    object xErroresID_REMISION: TIntegerField
      DisplayLabel = 'Id Remision'
      FieldName = 'ID_REMISION'
    end
    object xErroresESTADO_REGISTRO: TFIBStringField
      DisplayLabel = 'Estado Reg.'
      FieldName = 'ESTADO_REGISTRO'
    end
    object xErroresCODIGO_ERROR: TFIBStringField
      DisplayLabel = 'Cod. Error'
      FieldName = 'CODIGO_ERROR'
    end
    object xErroresDESCRIPCION_ERROR: TFIBStringField
      DisplayLabel = 'Desc. Error'
      FieldName = 'DESCRIPCION_ERROR'
      Size = 500
    end
  end
end
