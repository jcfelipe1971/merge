object DMTarifaPArticulo: TDMTarifaPArticulo
  OldCreateOrder = False
  OnCreate = DMTarifaPArticuloCreate
  Left = 732
  Top = 316
  Height = 207
  Width = 376
  object QMTarifasArticulo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_PRECIOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TARIFA=?TARIFA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    InsertSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_PRECIOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TARIFA=?TARIFA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_PRECIOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TARIFA=?TARIFA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_PRECIOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TARIFA=?TARIFA '
      'ORDER BY ARTICULO, UNID_MINIMAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      '/* La vista solo actualiza estos campos */'
      'UPDATE VER_ART_TARIFAS_PRECIOS'
      'SET'
      '  PRECIO_VENTA=?PRECIO_VENTA '
      '  ,COMISION=?COMISION '
      '  ,BLOQUEADO=?BLOQUEADO '
      '  ,MARGEN=?MARGEN '
      '  ,DESCUENTO_COMPRA=?DESCUENTO_COMPRA '
      '  ,DESCUENTO_COMPRA_2=?DESCUENTO_COMPRA_2 '
      '  ,DESCUENTO_COMPRA_3=?DESCUENTO_COMPRA_3 '
      '  ,PRECIO_COMPRA=?PRECIO_COMPRA '
      '  ,PRECIO_COSTE=?PRECIO_COSTE '
      '  ,CODIGO_ARTICULO_TARIFA=?CODIGO_ARTICULO_TARIFA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TARIFA=?TARIFA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    Plan.Strings = (
      'PLAN JOIN (VER_ART_TARIFAS_PRECIOS TAF INDEX (PK_ART_TARIFAS_C),'
      
        '           VER_ART_TARIFAS_PRECIOS TAR INDEX (PK_ART_TARIFAS_PRE' +
        'CIOS),'
      
        '           VER_ART_TARIFAS_PRECIOS CAL INDEX (PK_ART_TARIFAS_CAL' +
        'CULOS),'
      '           VER_ART_TARIFAS_PRECIOS ART INDEX (ID_A))')
    AfterOpen = QMTarifasArticuloAfterOpen
    AfterPost = Graba
    BeforeClose = QMTarifasArticuloBeforeClose
    OnCalcFields = QMTarifasArticuloCalcFields
    OnNewRecord = QMTarifasArticuloNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TARIFA '
      'ARTICULO '
      'LINEA ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_TARIFAS_PRECIOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMTarifasArticuloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTarifasArticuloTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMTarifasArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMTarifasArticuloTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMTarifasArticuloLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMTarifasArticuloCALCULO: TIntegerField
      DisplayLabel = 'C'#225'lculo'
      FieldName = 'CALCULO'
    end
    object QMTarifasArticuloTITULO_CALCULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo Calc.'
      FieldName = 'TITULO_CALCULO'
      Size = 60
    end
    object QMTarifasArticuloUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object QMTarifasArticuloUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object QMTarifasArticuloPRECIO_BASE: TFloatField
      DisplayLabel = 'Precio Base'
      FieldName = 'PRECIO_BASE'
    end
    object QMTarifasArticuloPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMTarifasArticuloMARGEN_PC: TFloatField
      DisplayLabel = 'Margen PC'
      FieldName = 'MARGEN_PC'
    end
    object QMTarifasArticuloMARGEN_PV: TFloatField
      DisplayLabel = 'Margen PV'
      FieldName = 'MARGEN_PV'
    end
    object QMTarifasArticuloCOMISION: TFloatField
      DisplayLabel = 'Comisi'#243'n'
      FieldName = 'COMISION'
    end
    object QMTarifasArticuloBLOQUEADO: TIntegerField
      DisplayLabel = 'Bloqueo'
      FieldName = 'BLOQUEADO'
    end
    object QMTarifasArticuloFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMTarifasArticuloMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMTarifasArticuloPRECIO_BASE_CANAL: TFloatField
      DisplayLabel = 'Precio Base Can.'
      FieldKind = fkCalculated
      FieldName = 'PRECIO_BASE_CANAL'
      OnGetText = QMTarifasArticuloPRECIO_BASE_CANALGetText
      Calculated = True
    end
    object QMTarifasArticuloCOMISION_CANAL: TFloatField
      DisplayLabel = 'Comisi'#243'n Can.'
      FieldKind = fkCalculated
      FieldName = 'COMISION_CANAL'
      OnGetText = QMTarifasArticuloCOMISION_CANALGetText
      Calculated = True
    end
    object QMTarifasArticuloPRECIO_VENTA_CANAL: TFloatField
      DisplayLabel = 'Precio Venta Can.'
      FieldKind = fkCalculated
      FieldName = 'PRECIO_VENTA_CANAL'
      Calculated = True
    end
    object QMTarifasArticuloACTIVA: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVA'
    end
    object QMTarifasArticuloMARGEN: TFloatField
      DisplayLabel = 'M'#225'rgen'
      FieldName = 'MARGEN'
    end
    object QMTarifasArticuloID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMTarifasArticuloBARRAS: TFIBStringField
      DisplayLabel = 'Cod. Barras'
      FieldName = 'BARRAS'
      Size = 25
    end
    object QMTarifasArticuloSUBFAMILIA: TFIBStringField
      DisplayLabel = 'Subfamilia'
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
    object QMTarifasArticuloDESCUENTO_COMPRA: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO_COMPRA'
    end
    object QMTarifasArticuloPRECIO_COMPRA: TFloatField
      DisplayLabel = 'P. Compra'
      FieldName = 'PRECIO_COMPRA'
    end
    object QMTarifasArticuloPRECIO_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'PRECIO_COSTE'
    end
    object QMTarifasArticuloDESCUENTO_COMPRA_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_COMPRA_2'
    end
    object QMTarifasArticuloDESCUENTO_COMPRA_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_COMPRA_3'
    end
    object QMTarifasArticuloCODIGO_ARTICULO_TARIFA: TFIBStringField
      DisplayLabel = 'Cod. Art'#237'ciulo Tarifa'
      FieldName = 'CODIGO_ARTICULO_TARIFA'
      Size = 40
    end
    object QMTarifasArticuloPRECIO_SIN_IVA: TFloatField
      DisplayLabel = 'Precio sin IVA'
      FieldKind = fkCalculated
      FieldName = 'PRECIO_SIN_IVA'
      Calculated = True
    end
    object QMTarifasArticuloPRECIO_CON_IVA: TFloatField
      DisplayLabel = 'Precio con IVA'
      FieldKind = fkCalculated
      FieldName = 'PRECIO_CON_IVA'
      Calculated = True
    end
    object QMTarifasArticuloIVA_INCLUIDO: TIntegerField
      DisplayLabel = 'IVA Incluido'
      FieldName = 'IVA_INCLUIDO'
    end
    object QMTarifasArticuloTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMTarifasArticuloP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMTarifasArticuloEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTarifasArticuloCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTarifasArticuloFABRICANTE: TIntegerField
      DisplayLabel = 'Fab.'
      FieldName = 'FABRICANTE'
    end
    object QMTarifasArticuloDISPONIBILIDAD: TIntegerField
      DisplayLabel = 'Disp.'
      FieldName = 'DISPONIBILIDAD'
    end
    object QMTarifasArticuloBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMTarifasArticuloALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMTarifasArticuloALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMTarifasArticuloALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMTarifasArticuloALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMTarifasArticuloALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMTarifasArticuloALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMTarifasArticuloALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMTarifasArticuloALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMTarifasArticuloBLISTER: TFIBStringField
      DisplayLabel = 'Blister'
      FieldName = 'BLISTER'
      Size = 15
    end
    object QMTarifasArticuloTITULO_BLISTER: TFIBStringField
      DisplayLabel = 'Titulo Blister'
      FieldName = 'TITULO_BLISTER'
      Size = 256
    end
    object QMTarifasArticuloP_COSTE_BLISTER: TFloatField
      DisplayLabel = 'P. Coste Blister'
      FieldName = 'P_COSTE_BLISTER'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 8
  end
  object DSQMTarifasArticulo: TDataSource
    DataSet = QMTarifasArticulo
    Left = 136
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 304
    Top = 8
  end
  object xTipoIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT P_IVA, P_RECARGO, TITULO FROM SYS_TIPO_IVA   '
      'WHERE PAIS=?PAIS AND TIPO=?TIPO_IVA')
    UniDirectional = False
    DataSource = DSQMTarifasArticulo
    Left = 40
    Top = 56
    object xTipoIvaP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xTipoIvaP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object xTipoIvaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object DSxTipoIva: TDataSource
    DataSet = xTipoIva
    Left = 136
    Top = 56
  end
end
