object ProDMArticulosImg: TProDMArticulosImg
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 484
  Top = 519
  Height = 322
  Width = 387
  object LstArticulos: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'Imagen'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Articulo'
        DataType = ftString
        Size = 20
      end>
    Left = 32
    Top = 130
  end
  object DSLstArticulos: TDataSource
    DataSet = LstArticulos
    Left = 112
    Top = 131
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 227
    Top = 18
  end
  object DSQMVerArticulos: TDataSource
    DataSet = QMVerArticulos
    Left = 129
    Top = 18
  end
  object xVerArticulosProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_CODPROV'
      'WHERE'
      '  ID_A=?ID_A'
      'ORDER BY PROVEEDOR, CODIGO_PROVEEDOR')
    UniDirectional = False
    DataSource = DSQMVerArticulos
    Left = 32
    Top = 66
    object xVerArticulosProvEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerArticulosProvARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xVerArticulosProvPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xVerArticulosProvCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'C'#243'd. Prov.'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 15
    end
    object xVerArticulosProvID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
  end
  object DSxVerArticulosProv: TDataSource
    DataSet = xVerArticulosProv
    Left = 130
    Top = 66
  end
  object QMVerArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND'
      '  ARTICULO=?ARTICULO AND'
      '  FAMILIA<>?FAMILIASYS'
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterOpen = QMVerArticulosAfterOpen
    AfterScroll = QMVerArticulosAfterScroll
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_CUENTAS'
    UpdateTransaction = TLocal
    Left = 28
    Top = 17
    object QMVerArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMVerArticulosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMVerArticulosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMVerArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMVerArticulosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMVerArticulosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMVerArticulosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMVerArticulosABIERTO: TIntegerField
      DisplayLabel = 'Abierto'
      FieldName = 'ABIERTO'
    end
    object QMVerArticulosVIRTUAL: TIntegerField
      DisplayLabel = 'Virtual'
      FieldName = 'VIRTUAL'
    end
    object QMVerArticulosCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Ctrol. Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object QMVerArticulosPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMVerArticulosTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMVerArticulosCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Compras'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object QMVerArticulosCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object QMVerArticulosCTA_DEVOLUCION_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. compras'
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object QMVerArticulosCTA_DEVOLUCION_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object QMVerArticulosCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Compras'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object QMVerArticulosCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Ventas'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
    object QMVerArticulosENTRADA: TIntegerField
      DisplayLabel = 'entrada'
      FieldName = 'ENTRADA'
    end
    object QMVerArticulosUNIDADES: TFIBStringField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      Size = 2
    end
    object QMVerArticulosTITULO_CORTO: TFIBStringField
      DisplayLabel = 'T'#237'tulo Corto'
      FieldName = 'TITULO_CORTO'
    end
    object QMVerArticulosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMVerArticulosDISPONIBILIDAD: TIntegerField
      DisplayLabel = 'Disponibilidad'
      FieldName = 'DISPONIBILIDAD'
    end
    object QMVerArticulosACTUALIZA_VENTA: TIntegerField
      DisplayLabel = 'Actualiza Venta'
      FieldName = 'ACTUALIZA_VENTA'
    end
    object QMVerArticulosPTO_VERDE: TFloatField
      DisplayLabel = 'Pto. Verde'
      FieldName = 'PTO_VERDE'
    end
    object QMVerArticulosCONTROLA_MEDIDAS: TIntegerField
      DisplayLabel = 'Controla Medidas'
      FieldName = 'CONTROLA_MEDIDAS'
    end
    object QMVerArticulosSERIALIZADO: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO'
    end
    object QMVerArticulosGARANTIA: TIntegerField
      DisplayLabel = 'Garant'#237'a'
      FieldName = 'GARANTIA'
    end
    object QMVerArticulosPRODUCCION: TIntegerField
      DisplayLabel = 'Producci'#243'n'
      FieldName = 'PRODUCCION'
    end
    object QMVerArticulosDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object QMVerArticulosDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMVerArticulosDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMVerArticulosIVA_ESCANDALLO: TIntegerField
      DisplayLabel = 'IVA Esc.'
      FieldName = 'IVA_ESCANDALLO'
    end
    object QMVerArticulosPVP_POR_UD_SECUNDARIA: TIntegerField
      DisplayLabel = 'PVP Por Uds. Sec.'
      FieldName = 'PVP_POR_UD_SECUNDARIA'
    end
    object QMVerArticulosLOTES: TIntegerField
      DisplayLabel = 'Lotes'
      FieldName = 'LOTES'
    end
    object QMVerArticulosMULTIPLO_1: TFloatField
      DisplayLabel = 'Mult. 1'
      FieldName = 'MULTIPLO_1'
    end
    object QMVerArticulosMULTIPLO_2: TFloatField
      DisplayLabel = 'Mult. 2'
      FieldName = 'MULTIPLO_2'
    end
    object QMVerArticulosMULTIPLO_3: TFloatField
      DisplayLabel = 'Mult. 3'
      FieldName = 'MULTIPLO_3'
    end
    object QMVerArticulosMULTIPLO_4: TFloatField
      DisplayLabel = 'Mult. 4'
      FieldName = 'MULTIPLO_4'
    end
    object QMVerArticulosFACTOR_ESCALA: TFloatField
      DisplayLabel = 'Factor Escala'
      FieldName = 'FACTOR_ESCALA'
    end
    object QMVerArticulosUD_MINIMO_COMPRA: TFloatField
      DisplayLabel = 'Uds. M'#237'n. Compra'
      FieldName = 'UD_MINIMO_COMPRA'
    end
    object QMVerArticulosUD_MINIMO_VENTA: TFloatField
      DisplayLabel = 'Uds. Min. Venta'
      FieldName = 'UD_MINIMO_VENTA'
    end
    object QMVerArticulosID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMVerArticulosID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
    object QMVerArticulosIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMVerArticulosCODIGO_INTRA: TFIBStringField
      DisplayLabel = 'Cod. Intra.'
      FieldName = 'CODIGO_INTRA'
      Size = 10
    end
    object QMVerArticulosPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMVerArticulosUBICABLE: TIntegerField
      DisplayLabel = 'Ubicable'
      FieldName = 'UBICABLE'
    end
    object QMVerArticulosVOLUMEN_UNIT: TFloatField
      DisplayLabel = 'Vol. Unit.'
      FieldName = 'VOLUMEN_UNIT'
    end
    object QMVerArticulosDIAMETRO_UNIT: TFloatField
      DisplayLabel = 'Diam. Unit.'
      FieldName = 'DIAMETRO_UNIT'
    end
    object QMVerArticulosDEFECTO_UD_SECUNDARIA: TFloatField
      DisplayLabel = 'Fed. Uds. Sec.'
      FieldName = 'DEFECTO_UD_SECUNDARIA'
    end
    object QMVerArticulosANTICIPO: TIntegerField
      DisplayLabel = 'Anticipo'
      FieldName = 'ANTICIPO'
    end
    object QMVerArticulosANTICIPO_CONTADO: TIntegerField
      DisplayLabel = 'Anticipo Cont.'
      FieldName = 'ANTICIPO_CONTADO'
    end
    object QMVerArticulosANTICIPO_PREG_DATOS: TIntegerField
      DisplayLabel = 'Anticipo Preg. Datos'
      FieldName = 'ANTICIPO_PREG_DATOS'
    end
    object QMVerArticulosWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
    object QMVerArticulosFABRICANTE: TIntegerField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
    end
  end
end
