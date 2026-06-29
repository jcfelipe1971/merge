object ObrDMLstPartidasOferta: TObrDMLstPartidasOferta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 335
  Top = 107
  Height = 348
  Width = 550
  object frPartidas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frPartidasGetValue
    OnBeforePrint = frPartidasBeforePrint
    OnEnterRect = frPartidasBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabPartida: TfrDBDataSet
    DataSource = DSQMCabPartida
    Left = 224
    Top = 104
  end
  object DSQMCabPartida: TDataSource
    DataSet = QMCabPartida
    Left = 128
    Top = 104
  end
  object QMCabPartida: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM obr_partida_ofc_cab'
      'WHERE ID_S = ?ID_S'
      'order by orden, linea')
    UniDirectional = False
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_OFERTA_C CAB INDEX (GES_CABECERAS_S_ID)' +
        ','
      
        '           VER_CABECERAS_OFERTA_C OFC INDEX (GES_CABECERAS_S_OFC' +
        '_ID),'
      '           VER_CABECERAS_OFERTA_C TER INDEX (PK_SYS_TERCEROS))')
    Left = 32
    Top = 104
  end
  object frDBDetPartida: TfrDBDataSet
    DataSource = DSQMDetPartida
    Left = 224
    Top = 152
  end
  object DSQMDetPartida: TDataSource
    DataSet = QMDetPartida
    Left = 128
    Top = 152
  end
  object QMDetPartida: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM obr_ver_partida_ofc_det'
      'WHERE ID_S = ?ID_S and linea_partida=?linea'
      'order by orden')
    UniDirectional = False
    DataSource = DSQMCabPartida
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_OFERTA_C CAB INDEX (GES_CABECERAS_S_ID)' +
        ','
      
        '           VER_CABECERAS_OFERTA_C OFC INDEX (GES_CABECERAS_S_OFC' +
        '_ID),'
      '           VER_CABECERAS_OFERTA_C TER INDEX (PK_SYS_TERCEROS))')
    Left = 32
    Top = 152
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 128
    Top = 8
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_OFERTA_C'
      'WHERE ID_S = ?ID_S'
      'order by rig')
    UniDirectional = False
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_OFERTA_C CAB INDEX (GES_CABECERAS_S_ID)' +
        ','
      
        '           VER_CABECERAS_OFERTA_C OFC INDEX (GES_CABECERAS_S_OFC' +
        '_ID),'
      '           VER_CABECERAS_OFERTA_C TER INDEX (PK_SYS_TERCEROS))')
    Left = 32
    Top = 56
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabeceraALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMCabeceraMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabeceraTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCabeceraDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabeceraSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMCabeceraFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMCabeceraCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object QMCabeceraNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMCabeceraLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object QMCabeceraBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMCabeceraI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object QMCabeceraS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object QMCabeceraM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMCabeceraC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
    end
    object QMCabeceraAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCabeceraS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object QMCabeceraS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object QMCabeceraB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMCabeceraDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object QMCabeceraDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object QMCabeceraI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object QMCabeceraI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object QMCabeceraB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object QMCabeceraI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object QMCabeceraPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCabeceraI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object QMCabeceraLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCabeceraENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMCabeceraNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabeceraTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMCabeceraID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMCabeceraIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMCabeceraTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object QMCabeceraPOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object QMCabeceraI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object QMCabeceraI_PORTES_CANAL: TFloatField
      DisplayLabel = 'Imp. Portes Canal'
      FieldName = 'I_PORTES_CANAL'
    end
    object QMCabeceraCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object QMCabeceraVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Cambio Fijo'
      FieldName = 'VALOR_CAMB_FIJO'
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 128
    Top = 56
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM DAME_DATOS_CLIENTE(?EMPRESA,?EJERCICIO,?CLIENTE,'
      '?CANAL,?ID_S)')
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterScroll = xClienteAfterScroll
    Left = 344
    Top = 40
  end
  object xDireccion_Cliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM ut_justifica_domicilio_3(?tercero,?cliente,?id_s,0' +
        ')'
      'where (num=?Direccion or num=0)')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 344
    Top = 88
  end
  object DSxDireccion_Cliente: TDataSource
    DataSet = xCliente
    Left = 448
    Top = 88
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 448
    Top = 40
  end
  object xDireccionFiscal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?tercero)'
      'where (num=1)')
    UniDirectional = False
    Left = 344
    Top = 136
  end
  object DSxDireccionFiscal: TDataSource
    DataSet = xDireccionFiscal
    Left = 448
    Top = 136
  end
  object QMDetPartida0: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM obr_ver_partida_ofc_det'
      
        'WHERE ID_S = ?ID_S and (linea_partida=0 or linea_partida is null' +
        ')'
      'order by orden')
    UniDirectional = False
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_OFERTA_C CAB INDEX (GES_CABECERAS_S_ID)' +
        ','
      
        '           VER_CABECERAS_OFERTA_C OFC INDEX (GES_CABECERAS_S_OFC' +
        '_ID),'
      '           VER_CABECERAS_OFERTA_C TER INDEX (PK_SYS_TERCEROS))')
    Left = 32
    Top = 200
  end
  object DSQMDetPartida0: TDataSource
    DataSet = QMDetPartida0
    Left = 128
    Top = 200
  end
  object frDBDetPartida0: TfrDBDataSet
    DataSource = DSQMDetPartida0
    Left = 224
    Top = 200
  end
end
