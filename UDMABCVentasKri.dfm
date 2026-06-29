object DMABCVentasKri: TDMABCVentasKri
  OldCreateOrder = False
  OnCreate = DMABCVentasCreate
  OnDestroy = DMABCVentasDestroy
  Left = 315
  Top = 139
  Height = 609
  Width = 696
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 110
    Top = 19
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
    Left = 32
    Top = 266
  end
  object xAlmacenes: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select almacen, titulo from art_almacenes'
      '  where (empresa=?empresa)'
      '  order by almacen')
    Transaction = TLocal
    Left = 98
    Top = 266
  end
  object xAgente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGENTES'
      'WHERE EMPRESA=?EMPRESA AND AGENTE=?AGENTE')
    UniDirectional = False
    Left = 392
    Top = 24
  end
  object DSxAgente: TDataSource
    DataSet = xAgente
    Left = 464
    Top = 24
  end
  object SPAcumula: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_abc_ventas_agente(?EMPRESA, ?ENTRADA, ?BORRA' +
        'DO,'
      ' ?COMPARADO, ?FECHA_INI, ?FECHA_FIN, ?AGENTE_INI, ?AGENTE_FIN,'
      ' ?EJERCICIO, ?EJERCICIOB, ?CANAL, ?TODOS_CANALES, ?ALMACEN, '
      ' ?TODOS_ALMACENES, ?MONEDA_ACTUAL)')
    Transaction = TLocal
    AutoTrans = True
    Left = 32
    Top = 318
  end
  object xTmp_Abc_Agentes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    UniDirectional = False
    Left = 38
    Top = 80
  end
  object DSxTmp_Abc_Agentes: TDataSource
    DataSet = xTmp_Abc_Agentes
    Left = 148
    Top = 78
  end
  object QDameFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select duracion,apertura from sys_empresas'
      '  where empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 168
    Top = 375
  end
  object frAbc: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'ABC Art'#237'culo Venta Uds. Secundarias'
    RebuildPrinter = False
    OnGetValue = frAbcGetValue
    OnBeforePrint = frAbcEnterRect
    OnEnterRect = frAbcEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 38
    Top = 22
    ReportForm = {19000000}
  end
  object frDBxTmp_Abc_Agentes: TfrDBDataSet
    DataSource = DSxTmp_Abc_Agentes
    Left = 268
    Top = 80
  end
  object xAgenteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGENTES'
      'WHERE EMPRESA=?EMPRESA AND AGENTE=?AGENTE')
    UniDirectional = False
    Left = 536
    Top = 26
  end
  object DSxAgenteH: TDataSource
    DataSet = xAgenteH
    Left = 598
    Top = 27
  end
  object QMaxAgente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(AGENTE) AS MAXIMO FROM VER_AGENTES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 100
    Top = 375
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CLIENTES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 392
    Top = 76
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 464
    Top = 78
  end
  object xClienteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CLIENTES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 534
    Top = 82
  end
  object DSxClienteH: TDataSource
    DataSet = xClienteH
    Left = 600
    Top = 84
  end
  object QMaxCliente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(CLIENTE) AS MAXIMO FROM EMP_CLIENTES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 30
    Top = 375
  end
  object xAgrupacionCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_CLIENTE'
      'WHERE EMPRESA=?EMPRESA AND AGRUPACION=?AGRUPACION')
    UniDirectional = False
    Left = 390
    Top = 250
  end
  object DSxAgrupacionCli: TDataSource
    DataSet = xAgrupacionCli
    Left = 471
    Top = 249
  end
  object QMinAgrupacion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(AGRUPACION) AS MINIMO'
      'FROM VER_AGRUPACIONES_CLIENTE'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 302
    Top = 375
  end
  object SPAcumulaCli: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_ventas_abc_Cliente(?empresa,?ejercicio,?cana' +
        'l,?serie,'
      
        '  ?cliented,?clienteh,?agrupacion,?fechad,?fechah,?borrar,?modo,' +
        '?alcance,'
      '  ?entrada,?CanalCal)')
    Transaction = TLocal
    AutoTrans = True
    Left = 100
    Top = 318
  end
  object xTmp_Abc_Clientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    UniDirectional = False
    AfterOpen = xTmp_Abc_ClientesAfterOpen
    Left = 38
    Top = 138
  end
  object DSxTmp_Abc_Clientes: TDataSource
    DataSet = xTmp_Abc_Clientes
    Left = 152
    Top = 138
  end
  object frDBxTmp_Abc_Clientes: TfrDBDataSet
    DataSource = DSxTmp_Abc_Clientes
    Left = 268
    Top = 138
  end
  object xTmp_Abc_Articulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ABC_ARTICULO'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_VENTAS_ARTICULO '
      'where empresa=?empresa and'
      'entrada=?Entrada')
    UniDirectional = False
    Left = 39
    Top = 192
  end
  object DSxTmp_Abc_Articulos: TDataSource
    DataSet = xTmp_Abc_Articulos
    Left = 152
    Top = 196
  end
  object frDBxTmp_Abc_Articulos: TfrDBDataSet
    DataSource = DSxTmp_Abc_Articulos
    Left = 270
    Top = 196
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
    Left = 392
    Top = 136
  end
  object DSxArticuloD: TDataSource
    DataSet = xArticuloD
    Left = 464
    Top = 138
  end
  object DSxArticuloH: TDataSource
    DataSet = xArticuloH
    Left = 600
    Top = 138
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
    Left = 535
    Top = 138
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
    Left = 537
    Top = 193
  end
  object DSxFamiliaH: TDataSource
    DataSet = xFamiliaH
    Left = 601
    Top = 196
  end
  object DSxFamiliaD: TDataSource
    DataSet = xFamiliaD
    Left = 464
    Top = 193
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
    Left = 390
    Top = 191
  end
  object SPAcumulaArt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_ventas_abc_Articulo(?empresa,?ejercicio,?can' +
        'al,?serie,'
      '  ?articuloD,?articuloH,?fechad,?fechah,?borrar,?alcance,'
      '  ?entrada,?CanalCal)')
    Transaction = TLocal
    AutoTrans = True
    Left = 170
    Top = 318
  end
  object frChartObject1: TfrChartObject
    Left = 186
    Top = 21
  end
  object SPAcumulaArtFam: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_ventas_abc_art_fam(?empresa,?ejercicio,?cana' +
        'l,?serie,'
      '  ?familiaD,?familiaH,?fechad,?fechah,?borrar,?alcance,'
      '  ?entrada,?CanalCal)')
    Transaction = TLocal
    AutoTrans = True
    Left = 253
    Top = 318
  end
  object QMinArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ARTICULO) AS MINIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 30
    Top = 428
  end
  object QMaxArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ARTICULO) AS MAXIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 98
    Top = 428
  end
  object QMinFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(FAMILIA) AS MINIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 166
    Top = 428
  end
  object QMaxFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(FAMILIA) AS MAXIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 246
    Top = 428
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
    Left = 396
    Top = 388
  end
  object xAgrupacionCliH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_CLIENTE'
      'WHERE EMPRESA=?EMPRESA AND AGRUPACION=?AGRUPACION')
    UniDirectional = False
    Left = 546
    Top = 250
  end
  object DSxAgrupacionCliH: TDataSource
    DataSet = xAgrupacionCliH
    Left = 625
    Top = 249
  end
  object QMaxAgrupacion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(AGRUPACION) AS MAXIMO'
      'FROM VER_AGRUPACIONES_CLIENTE'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 332
    Top = 433
  end
  object xAgrupaciones: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_CLIENTE'
      'WHERE EMPRESA=?EMPRESA AND AGRUPACION=?AGRUPACION'
      '')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    Left = 170
    Top = 266
  end
  object QTitulo_Agente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT TITULO FROM VER_AGENTES'
      'WHERE EMPRESA=?EMPRESA AND AGENTE=?AGENTE')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 512
    Top = 316
  end
  object xTipos_volumenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM TMP_CLIENTES_VOLUMENES'
      'ORDER BY AGRUPACION')
    UniDirectional = False
    Left = 512
    Top = 372
  end
  object QTitulo_fam: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    Left = 612
    Top = 314
  end
  object QTipo_cli: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT DISTINCT(TIPO_CLIENTE) FROM EMP_CLIENTES'
      'WHERE EMPRESA=?EMPRESA ')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    Left = 614
    Top = 376
  end
  object QRutas: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT distinct(RUTA)  FROM EMP_CLIENTES'
      'WHERE EMPRESA=?EMPRESA ')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    Left = 514
    Top = 428
  end
  object QtituloCli: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT TITULO FROM VER_CLIENTES'
      'WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 616
    Top = 428
  end
  object SPAcumulaArtAlm: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_ventas_abc_art_fam(?empresa,?ejercicio,?cana' +
        'l,?serie,'
      '  ?familiaD,?familiaH,?fechad,?fechah,?borrar,?alcance,'
      '  ?entrada,?CanalCal)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 346
    Top = 318
  end
  object XFamiliaD2: TFIBDataSetRO
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
    Left = 30
    Top = 495
  end
  object DSXFamiliaD2: TDataSource
    DataSet = XFamiliaD2
    Left = 104
    Top = 497
  end
  object xFamiliaH2: TFIBDataSetRO
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
    Left = 177
    Top = 497
  end
  object DSxFamiliaH2: TDataSource
    DataSet = xFamiliaH2
    Left = 241
    Top = 500
  end
  object xTmp_Abc_Clientes_Fam: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    UniDirectional = False
    DataSource = DSxTmp_Abc_Clientes
    Left = 62
    Top = 154
  end
  object DSxTmp_Abc_Clientes_Fam: TDataSource
    DataSet = xTmp_Abc_Clientes_Fam
    Left = 184
    Top = 154
  end
  object frDBxTmp_Abc_Clientes_Fam: TfrDBDataSet
    DataSource = DSxTmp_Abc_Clientes_Fam
    Left = 292
    Top = 154
  end
end
