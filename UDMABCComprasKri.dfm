object DMABCComprasKri: TDMABCComprasKri
  OldCreateOrder = False
  OnCreate = DMABCVentasCreate
  OnDestroy = DMABCVentasDestroy
  Left = 365
  Top = 149
  Height = 619
  Width = 662
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 136
    Top = 18
  end
  object QDameFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select duracion,apertura from sys_empresas'
      '  where empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 414
  end
  object xProveedorD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_PROVEEDORES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA AND PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    Left = 435
    Top = 10
  end
  object DSxProveedorD: TDataSource
    DataSet = xProveedorD
    Left = 510
    Top = 12
  end
  object xProveedorH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_PROVEEDORES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA AND PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    Left = 436
    Top = 64
  end
  object DSxProveedorH: TDataSource
    DataSet = xProveedorH
    Left = 512
    Top = 66
  end
  object QMaxProveedor: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(PROVEEDOR) AS MAXIMO'
      'FROM VER_PROVEEDORES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 120
    Top = 414
  end
  object xTmp_Abc_Proveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ABC_PROVEEDOR'
      'WHERE'
      '  PROVEEDOR=?PROVEEDOR AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_COMPRAS_PROVEEDOR'
      '  where ((entrada=?entrada) and'
      '              (empresa= ?empresa))'
      'ORDER BY ALMACEN')
    UniDirectional = False
    Left = 56
    Top = 84
  end
  object DSxTmp_Abc_Proveedores: TDataSource
    DataSet = xTmp_Abc_Proveedores
    Left = 185
    Top = 82
  end
  object frDBxTmp_Abc_Proveedores: TfrDBDataSet
    DataSource = DSxTmp_Abc_Proveedores
    Left = 322
    Top = 71
  end
  object xTmp_Abc_Compras_Articulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ABC_ARTICULO_PRO'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_COMPRAS_ARTICULO'
      '   where ((entrada=?entrada) and'
      '              (empresa= ?empresa))'
      'ORDER BY ALMACEN')
    UniDirectional = False
    Left = 58
    Top = 146
    object xTmp_Abc_Compras_ArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTmp_Abc_Compras_ArticulosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xTmp_Abc_Compras_ArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xTmp_Abc_Compras_ArticulosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTmp_Abc_Compras_ArticulosEJERCICIOB: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIOB'
    end
    object xTmp_Abc_Compras_ArticulosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTmp_Abc_Compras_ArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xTmp_Abc_Compras_ArticulosALMACEN1: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN1'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN2: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN2'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN3: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN3'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN4: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN4'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN5: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN5'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN6: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN6'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN7: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN7'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN8: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN8'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES1: TFloatField
      DisplayLabel = 'Uds. 1'
      FieldName = 'UNIDADES1'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES2: TFloatField
      DisplayLabel = 'Uds. 2'
      FieldName = 'UNIDADES2'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES3: TFloatField
      DisplayLabel = 'Uds. 3'
      FieldName = 'UNIDADES3'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES4: TFloatField
      DisplayLabel = 'Uds. 4'
      FieldName = 'UNIDADES4'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES5: TFloatField
      DisplayLabel = 'Uds. 5'
      FieldName = 'UNIDADES5'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES6: TFloatField
      DisplayLabel = 'Uds. 6'
      FieldName = 'UNIDADES6'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES7: TFloatField
      DisplayLabel = 'Uds. 7'
      FieldName = 'UNIDADES7'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES8: TFloatField
      DisplayLabel = 'Uds. 8'
      FieldName = 'UNIDADES8'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xTmp_Abc_Compras_ArticulosCOMPRAS_CANAL: TFloatField
      DisplayLabel = 'Compras Can.'
      FieldName = 'COMPRAS_CANAL'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN1B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN1B'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN2B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN2B'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN3B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN3B'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN4B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN4B'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN5B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN5B'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN6B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN6B'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN7B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN7B'
    end
    object xTmp_Abc_Compras_ArticulosALMACEN8B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN8B'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES1B: TFloatField
      DisplayLabel = 'Uds. 1B'
      FieldName = 'UNIDADES1B'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES2B: TFloatField
      DisplayLabel = 'Uds. 2B'
      FieldName = 'UNIDADES2B'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES3B: TFloatField
      DisplayLabel = 'Uds. 3B'
      FieldName = 'UNIDADES3B'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES4B: TFloatField
      DisplayLabel = 'Uds. 4B'
      FieldName = 'UNIDADES4B'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES5B: TFloatField
      DisplayLabel = 'Uds. 5B'
      FieldName = 'UNIDADES5B'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES6B: TFloatField
      DisplayLabel = 'Uds. 6B'
      FieldName = 'UNIDADES6B'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES7B: TFloatField
      DisplayLabel = 'Uds. 7B'
      FieldName = 'UNIDADES7B'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADES8B: TFloatField
      DisplayLabel = 'Uds. 8B'
      FieldName = 'UNIDADES8B'
    end
    object xTmp_Abc_Compras_ArticulosUNIDADESB: TFloatField
      DisplayLabel = 'Uds. b'
      FieldName = 'UNIDADESB'
    end
    object xTmp_Abc_Compras_ArticulosCOMPRAS_CANALB: TFloatField
      DisplayLabel = 'Compras Can. B'
      FieldName = 'COMPRAS_CANALB'
    end
    object xTmp_Abc_Compras_ArticulosPOR_COMPRAS_CANAL: TFloatField
      DisplayLabel = 'Por Compras Canal'
      FieldName = 'POR_COMPRAS_CANAL'
    end
    object xTmp_Abc_Compras_ArticulosPOR_COMPRAS_CANALB: TFloatField
      DisplayLabel = 'Por Compras Canal B'
      FieldName = 'POR_COMPRAS_CANALB'
    end
  end
  object DSxTmp_Abc_Articulos: TDataSource
    DataSet = xTmp_Abc_Compras_Articulos
    Left = 186
    Top = 134
  end
  object frDBxTmp_Abc_Articulos: TfrDBDataSet
    DataSource = DSxTmp_Abc_Articulos
    Left = 320
    Top = 131
  end
  object xArticuloD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 435
    Top = 118
  end
  object DSxArticuloD: TDataSource
    DataSet = xArticuloD
    Left = 518
    Top = 122
  end
  object DSxArticuloH: TDataSource
    DataSet = xArticuloH
    Left = 513
    Top = 176
  end
  object xArticuloH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 434
    Top = 176
  end
  object xFamiliaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 438
    Top = 292
  end
  object DSxFamiliaH: TDataSource
    DataSet = xFamiliaH
    Left = 514
    Top = 296
  end
  object DSxFamiliaD: TDataSource
    DataSet = xFamiliaD
    Left = 514
    Top = 236
  end
  object xFamiliaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 436
    Top = 234
  end
  object SPAcumulaArt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_abc_compras_Articulos(?empresa,?entrada,?bor' +
        'rado,'
      
        '?comparado,?fecha_ini,?fecha_fin,?articulo_ini,?articulo_fin,?ej' +
        'ercicio,?ejercicioB,'
      '?canal,?Todos_Canales,?almacen0,?Todos_almacenes,?moneda_actual)')
    Transaction = TLocal
    AutoTrans = True
    Left = 126
    Top = 362
  end
  object frChartObject1: TfrChartObject
    Left = 226
    Top = 16
  end
  object SPAcumulaArtFam: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_abc_compras_familias(?empresa,?entrada,?borr' +
        'ado,'
      
        '?Comparado,?Fecha_ini,?Fecha_fin,?Familia_ini,?Familia_fin,?Ejer' +
        'cicio, '
      
        '?EjercicioB,?Canal, ?todos_canales,?Almacen0,?Todos_almacenes,?M' +
        'oneda_actual,'
      '?Nivel,?Con_ventas)')
    Transaction = TLocal
    AutoTrans = True
    Left = 294
    Top = 364
  end
  object xCanales: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select canal from emp_canales '
      
        '  where((empresa=?empresa)and(ejercicio=?ejercicio)and(activo=1)' +
        ') '
      '  order by canal')
    Transaction = TLocal
    Left = 43
    Top = 314
  end
  object xAlmacenes: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select almacen, titulo from art_almacenes'
      '  where (empresa=?empresa)'
      '  order by almacen')
    Transaction = TLocal
    Left = 125
    Top = 314
  end
  object QMinArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ARTICULO) AS MINIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 466
  end
  object QMaxArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ARTICULO) AS MAXIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 108
    Top = 466
  end
  object QMinFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(FAMILIA) AS MINIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 522
  end
  object QMaxFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(FAMILIA) AS MAXIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 112
    Top = 524
  end
  object QMaxAcreedor: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ACREEDOR) AS MAXIMO'
      'FROM VER_ACREEDORES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 204
    Top = 520
  end
  object xAcreedorD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ACREEDORES'
      'WHERE EMPRESA=?EMPRESA AND ACREEDOR=?ACREEDOR')
    UniDirectional = False
    Left = 435
    Top = 362
  end
  object DSxAcreedorD: TDataSource
    DataSet = xAcreedorD
    Left = 510
    Top = 364
  end
  object xAcreedorH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ACREEDORES'
      'WHERE EMPRESA=?EMPRESA AND ACREEDOR=?ACREEDOR')
    UniDirectional = False
    Left = 435
    Top = 418
  end
  object DSxAcreedorH: TDataSource
    DataSet = xAcreedorH
    Left = 510
    Top = 420
  end
  object xTmp_Abc_acreedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ABC_PROVEEDOR'
      'WHERE'
      '  PROVEEDOR=?PROVEEDOR AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_ACREEDOR'
      '  where entrada=?entrada')
    UniDirectional = False
    Left = 56
    Top = 196
  end
  object DSxTmp_Abc_acreedores: TDataSource
    DataSet = xTmp_Abc_acreedores
    Left = 183
    Top = 192
  end
  object frDBxTmp_Abc_acreedores: TfrDBDataSet
    DataSource = DSxTmp_Abc_acreedores
    Left = 321
    Top = 191
  end
  object SPAcumulaAcr: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_compras_abc_Acreedor(?empresa,?ejercicio,?ca' +
        'nal,?almacen,'
      '  ?acreedord,?acreedorh,?fechad,?fechah,?borrar,?alcance,'
      '  ?entrada,?CanalCal)')
    Transaction = TLocal
    AutoTrans = True
    Left = 206
    Top = 362
  end
  object frAbc: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado ABC Compras Art'#237'culo Clibber 2'
    RebuildPrinter = False
    OnGetValue = frAbcGetValue
    OnBeforePrint = frAbcEnterRect
    OnEnterRect = frAbcEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 50
    Top = 14
    ReportForm = {19000000}
  end
  object SPAcumulaPro: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_abc_compras_Proveedor(?Empresa, ?entrada, ?b' +
        'orrado,'
      
        '?Comparado, ?fecha_ini, ?fecha_fin, ?proveedor_ini, ?proveedor_f' +
        'in, ?ejercicio,'
      
        '?ejercicioB, ?canal, ?Todos_canales, ?almacen0, ?todos_almacenes' +
        ', ?moneda_actual)'
      '')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 44
    Top = 366
  end
  object QTitulo_Almacenes: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select titulo from art_almacenes'
      '  where ((empresa=?empresa)and'
      '             (almacen=?Almacen))'
      '  order by almacen')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 202
    Top = 466
  end
  object xTmp_Abc_Familias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ABC_ARTICULO_PRO'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_COMPRAS_FAMILIA'
      '   where ((entrada=?entrada) and'
      '              (empresa= ?empresa))'
      'ORDER BY ALMACEN1')
    UniDirectional = False
    Left = 56
    Top = 254
    object xTmp_Abc_FamiliasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTmp_Abc_FamiliasENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xTmp_Abc_FamiliasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xTmp_Abc_FamiliasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTmp_Abc_FamiliasEJERCICIOB: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIOB'
    end
    object xTmp_Abc_FamiliasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTmp_Abc_FamiliasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xTmp_Abc_FamiliasALMACEN1: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN1'
    end
    object xTmp_Abc_FamiliasALMACEN2: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN2'
    end
    object xTmp_Abc_FamiliasALMACEN3: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN3'
    end
    object xTmp_Abc_FamiliasALMACEN4: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN4'
    end
    object xTmp_Abc_FamiliasALMACEN5: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN5'
    end
    object xTmp_Abc_FamiliasALMACEN6: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN6'
    end
    object xTmp_Abc_FamiliasALMACEN7: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN7'
    end
    object xTmp_Abc_FamiliasALMACEN8: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN8'
    end
    object xTmp_Abc_FamiliasCOMPRAS_CANAL: TFloatField
      DisplayLabel = 'Compras Can.'
      FieldName = 'COMPRAS_CANAL'
    end
    object xTmp_Abc_FamiliasALMACEN1V: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN1V'
    end
    object xTmp_Abc_FamiliasALMACEN2V: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN2V'
    end
    object xTmp_Abc_FamiliasALMACEN3V: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN3V'
    end
    object xTmp_Abc_FamiliasALMACEN4V: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN4V'
    end
    object xTmp_Abc_FamiliasALMACEN5V: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN5V'
    end
    object xTmp_Abc_FamiliasALMACEN6V: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN6V'
    end
    object xTmp_Abc_FamiliasALMACEN7V: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN7V'
    end
    object xTmp_Abc_FamiliasALMACEN8V: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN8V'
    end
    object xTmp_Abc_FamiliasVENTAS_CANAL: TFloatField
      DisplayLabel = 'Ventas Canal'
      FieldName = 'VENTAS_CANAL'
    end
    object xTmp_Abc_FamiliasALMACEN1B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN1B'
    end
    object xTmp_Abc_FamiliasALMACEN2B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN2B'
    end
    object xTmp_Abc_FamiliasALMACEN3B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN3B'
    end
    object xTmp_Abc_FamiliasALMACEN4B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN4B'
    end
    object xTmp_Abc_FamiliasALMACEN5B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN5B'
    end
    object xTmp_Abc_FamiliasALMACEN6B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN6B'
    end
    object xTmp_Abc_FamiliasALMACEN7B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN7B'
    end
    object xTmp_Abc_FamiliasALMACEN8B: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN8B'
    end
    object xTmp_Abc_FamiliasCOMPRAS_CANALB: TFloatField
      DisplayLabel = 'Compras Can. B'
      FieldName = 'COMPRAS_CANALB'
    end
    object xTmp_Abc_FamiliasALMACEN1VB: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN1VB'
    end
    object xTmp_Abc_FamiliasALMACEN2VB: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN2VB'
    end
    object xTmp_Abc_FamiliasALMACEN3VB: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN3VB'
    end
    object xTmp_Abc_FamiliasALMACEN4VB: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN4VB'
    end
    object xTmp_Abc_FamiliasALMACEN5VB: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN5VB'
    end
    object xTmp_Abc_FamiliasALMACEN6VB: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN6VB'
    end
    object xTmp_Abc_FamiliasALMACEN7VB: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN7VB'
    end
    object xTmp_Abc_FamiliasALMACEN8VB: TFloatField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN8VB'
    end
    object xTmp_Abc_FamiliasVENTAS_CANALB: TFloatField
      DisplayLabel = 'Ventas Canal B'
      FieldName = 'VENTAS_CANALB'
    end
    object xTmp_Abc_FamiliasDESVIACION: TFloatField
      DisplayLabel = 'Desviacion'
      FieldName = 'DESVIACION'
    end
    object xTmp_Abc_FamiliasNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object xTmp_Abc_FamiliasDESVIACIONB: TFloatField
      DisplayLabel = 'Desviacion B'
      FieldName = 'DESVIACIONB'
    end
    object xTmp_Abc_FamiliasSTOCK1: TFloatField
      DisplayLabel = 'Stock 1'
      FieldName = 'STOCK1'
    end
    object xTmp_Abc_FamiliasSTOCK2: TFloatField
      DisplayLabel = 'Stock 2'
      FieldName = 'STOCK2'
    end
    object xTmp_Abc_FamiliasSTOCK3: TFloatField
      DisplayLabel = 'Stock 3'
      FieldName = 'STOCK3'
    end
    object xTmp_Abc_FamiliasSTOCK4: TFloatField
      DisplayLabel = 'Stock 4'
      FieldName = 'STOCK4'
    end
    object xTmp_Abc_FamiliasSTOCK5: TFloatField
      DisplayLabel = 'Stock 5'
      FieldName = 'STOCK5'
    end
    object xTmp_Abc_FamiliasSTOCK6: TFloatField
      DisplayLabel = 'Stock 6'
      FieldName = 'STOCK6'
    end
    object xTmp_Abc_FamiliasSTOCK7: TFloatField
      DisplayLabel = 'Stock 7'
      FieldName = 'STOCK7'
    end
    object xTmp_Abc_FamiliasSTOCK8: TFloatField
      DisplayLabel = 'Stock 8'
      FieldName = 'STOCK8'
    end
  end
  object DSxTmp_Abc_Familias: TDataSource
    DataSet = xTmp_Abc_Familias
    Left = 184
    Top = 248
  end
  object frDBxTmp_Abc_Familias: TfrDBDataSet
    DataSource = DSxTmp_Abc_Familias
    Left = 322
    Top = 253
  end
end
