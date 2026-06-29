object DMLstFamilias: TDMLstFamilias
  OldCreateOrder = False
  OnCreate = DMLstFamiliasCreate
  OnDestroy = DMLstFamiliasDestroy
  Left = 414
  Top = 170
  Height = 533
  Width = 554
  object QMinFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ARTICULO) AS MINIMO FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    Transaction = TLocal
    AutoTrans = True
    Left = 333
    Top = 237
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 218
    Top = 20
  end
  object frFamilias: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frFamiliasGetValue
    OnBeforePrint = frFamiliasEnterRect
    OnEnterRect = frFamiliasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 28
    Top = 20
    ReportForm = {19000000}
  end
  object xArt_Mov_Stock: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM lst_movimientos_art_por_fam (?EMP, ?EJE, ?CAN,'
      
        ' ?DESDE_ARTICULO, ?HASTA_ARTICULO, ?FAMILIA, ?MONEDA,?FECHAD,?FE' +
        'CHAH)')
    UniDirectional = False
    Left = 30
    Top = 257
    object xArt_Mov_StockEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArt_Mov_StockEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xArt_Mov_StockCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xArt_Mov_StockN_MOV_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
      FieldName = 'N_MOV_STOCK'
    end
    object xArt_Mov_StockPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xArt_Mov_StockALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xArt_Mov_StockARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArt_Mov_StockTIPO_OPER: TFIBStringField
      DisplayLabel = 'Tipo Operacion'
      FieldName = 'TIPO_OPER'
      Size = 1
    end
    object xArt_Mov_StockFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xArt_Mov_StockCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object xArt_Mov_StockUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xArt_Mov_StockPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xArt_Mov_StockORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 3
    end
    object xArt_Mov_StockIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xArt_Mov_StockDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object xArt_Mov_StockDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xArt_Mov_StockENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xArt_Mov_StockACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xArt_Mov_StockUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object xArt_Mov_StockPRECIO_SIN_DTO: TFloatField
      DisplayLabel = 'Precio Sin Descuento'
      FieldName = 'PRECIO_SIN_DTO'
    end
    object xArt_Mov_StockMOV_VIRTUAL: TIntegerField
      DisplayLabel = 'Mov Virtual'
      FieldName = 'MOV_VIRTUAL'
    end
  end
  object xArt_Articulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'WHERE FAMILIA=?FAMILIA AND EMPRESA=?EMPRESA')
    UniDirectional = False
    DataSource = DSxArt_Mov_Stock
    Plan.Strings = (
      'PLAN (ART_ARTICULOS INDEX (ART_ARTICULOS_FAMILIA))')
    Left = 121
    Top = 312
    object xArt_ArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArt_ArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArt_ArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xArt_ArticulosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xArt_ArticulosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xArt_ArticulosABIERTO: TIntegerField
      DisplayLabel = 'Abierto'
      FieldName = 'ABIERTO'
    end
    object xArt_ArticulosCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Ctrol. Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object xArt_ArticulosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xArt_ArticulosUNIDADES: TFIBStringField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      Size = 2
    end
    object xArt_ArticulosVIRTUAL: TIntegerField
      DisplayLabel = 'Virtual'
      FieldName = 'VIRTUAL'
    end
    object xArt_ArticulosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xArt_ArticulosTITULO_CORTO: TFIBStringField
      DisplayLabel = 'Titulo Corto'
      FieldName = 'TITULO_CORTO'
    end
    object xArt_ArticulosCONTROLA_MEDIDAS: TIntegerField
      DisplayLabel = 'Ctrol. Medidas'
      FieldName = 'CONTROLA_MEDIDAS'
    end
    object xArt_ArticulosSERIALIZADO: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO'
    end
    object xArt_ArticulosGARANTIA: TIntegerField
      DisplayLabel = 'Garantia'
      FieldName = 'GARANTIA'
    end
    object xArt_ArticulosPRODUCCION: TIntegerField
      DisplayLabel = 'Prod.'
      FieldName = 'PRODUCCION'
    end
    object xArt_ArticulosDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object xArt_ArticulosDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xArt_ArticulosDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_3'
    end
  end
  object DSxArt_Mov_Stock: TDataSource
    DataSet = xArt_Mov_Stock
    Left = 121
    Top = 257
  end
  object frDSxArt_Mov_Stock: TfrDBDataSet
    DataSource = DSxArt_Mov_Stock
    Left = 222
    Top = 257
  end
  object xArtDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 332
    Top = 24
  end
  object xArtHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 333
    Top = 78
  end
  object DSxArtDesde: TDataSource
    DataSet = xArtDesde
    Left = 408
    Top = 24
  end
  object DSxArtHasta: TDataSource
    DataSet = xArtHasta
    Left = 408
    Top = 80
  end
  object SPRSaldos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_saldo_ini (?EMPRESA, ?EJERCICIO, ?CANAL,' +
        ' '
      '       ?ALMACEN, ?ARTICULO, ?PER_INI)')
    Transaction = TLocal
    AutoTrans = True
    Left = 333
    Top = 291
  end
  object xCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_FAMILIAS_CUENTAS'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'order by familia')
    UniDirectional = False
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_FAMILIAS_CUENTAS GFAM INDEX (PK_CON_CUENTAS' +
        '_GES_FAM),VER_FAMILIAS_CUENTAS FAM INDEX (PK_ART_FAMILIAS)))')
    AfterScroll = xCabeceraAfterScroll
    Left = 32
    Top = 90
    object xCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCabeceraFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xCabeceraTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xCabeceraPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xCabeceraTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xCabeceraCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object xCabeceraCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object xCabeceraVENTA: TIntegerField
      DisplayLabel = 'Venta'
      FieldName = 'VENTA'
    end
    object xCabeceraPTO_VERDE: TFloatField
      DisplayLabel = 'Pto. Verde'
      FieldName = 'PTO_VERDE'
    end
    object xCabeceraMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object xCabeceraTIPO_REDONDEO: TIntegerField
      DisplayLabel = 'Tipo Redondeo'
      FieldName = 'TIPO_REDONDEO'
    end
    object xCabeceraACT_TAR_AUTOM: TIntegerField
      DisplayLabel = 'Act. Tar. Aut.'
      FieldName = 'ACT_TAR_AUTOM'
    end
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT art.empresa,art.ejercicio,art.canal,art.articulo,art.titu' +
        'lo,'
      'tar.tarifa,atc.moneda,tar.unid_minimas,tar.unid_maximas,'
      'tar.precio_venta as pvp,art.familia,arti.p_coste as coste'
      'FROM '
      'con_cuentas_ges_art art  '
      'JOIN art_articulos arti ON'
      '((arti.empresa = art.empresa) and'
      ' (arti.articulo = art.articulo))'
      'JOIN art_tarifas_precios tar '
      'ON((art.empresa=tar.empresa)and(art.articulo=tar.articulo))'
      'JOIN art_tarifas_c atc'
      
        'ON((atc.empresa=tar.empresa)and(atc.tarifa=tar.tarifa)and(atc.ac' +
        'tiva=1))'
      'WHERE '
      '  ((art.empresa=?empresa) and '
      '   (art.ejercicio=?ejercicio)and'
      '   (art.canal=?canal)and'
      '   (art.familia=?familia))'
      'ORDER BY art.articulo,art.familia,tar.unid_minimas')
    UniDirectional = False
    DataSource = DSxCabecera
    Plan.Strings = (
      
        ' PLAN SORT (JOIN (TAR INDEX (PK_ART_TARIFAS_PRECIOS),ATC INDEX (' +
        'PK_ART_TARIFAS_C),ART INDEX (PK_CON_CUENTAS_GES_ART),ARTI INDEX ' +
        '(PK_ART_ARTICULOS)))')
    Left = 30
    Top = 206
    object xDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xDetalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDetalleTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xDetalleUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object xDetalleUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object xDetalleCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object xDetallePVP: TFloatField
      DisplayLabel = 'P.V.P.'
      FieldName = 'PVP'
    end
    object xDetalleFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
  end
  object DSxCabecera: TDataSource
    DataSet = xCabecera
    Left = 121
    Top = 89
  end
  object frDBxDetalle: TfrDBDataSet
    DataSource = DSxDetalle
    Left = 222
    Top = 203
  end
  object frDBxCabecera: TfrDBDataSet
    DataSource = DSxCabecera
    Left = 221
    Top = 90
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 121
    Top = 203
  end
  object QMaxFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ARTICULO) AS MAXIMO FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    Transaction = TLocal
    AutoTrans = True
    Left = 409
    Top = 237
  end
  object xFamilia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 332
    Top = 135
  end
  object DSxFamilia: TDataSource
    DataSet = xFamilia
    Left = 410
    Top = 137
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MONEDA, TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 334
    Top = 187
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 414
    Top = 189
  end
  object QTituloMoneda: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT TITULO FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    Transaction = TLocal
    Plan.Strings = (
      'PLAN (SYS_MONEDAS INDEX (PK_SYS_MONEDAS))')
    AutoTrans = True
    Left = 223
    Top = 312
  end
  object xTipoIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, P_IVA, P_RECARGO FROM SYS_TIPO_IVA   '
      'WHERE PAIS=?PAIS AND TIPO=?TIPO_IVA')
    UniDirectional = False
    DataSource = DSxCabecera
    Left = 122
    Top = 139
    object xTipoIvaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
    object xTipoIvaP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xTipoIvaP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
  end
  object DSxTipoIva: TDataSource
    DataSet = xTipoIva
    Left = 222
    Top = 139
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 332
    Top = 352
  end
  object xPeriodos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_periodos'
      
        'where empresa = ?empresa and ejercicio = ?ejercicio and periodo ' +
        '= ?periodo')
    UniDirectional = False
    Left = 328
    Top = 408
    object xPeriodosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 50
    end
  end
  object DSxPeriodos: TDataSource
    DataSet = xPeriodos
    Left = 416
    Top = 408
  end
  object frxFamilias: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9705409491
    ReportOptions.LastChange = 38691.9705409491
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxFamiliasBeforePrint
    OnGetValue = frxFamiliasGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 119
    Top = 20
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
