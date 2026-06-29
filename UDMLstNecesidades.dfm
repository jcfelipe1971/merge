object DMLstNecesidades: TDMLstNecesidades
  OldCreateOrder = False
  OnCreate = DataModule1Create
  OnDestroy = DMLstNecesidadesDestroy
  Left = 410
  Top = 184
  Height = 657
  Width = 536
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 92
    Top = 10
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      
        'SELECT ART.TITULO_LARGO AS TITULO,ART.TITULO_CORTO,ART.NOTAS,UNI' +
        '.SIGNO'
      '  FROM ART_ARTICULOS ART'
      '  LEFT JOIN SYS_UNIDADES_ARTICULOS UNI'
      '  ON(ART.UNIDADES=UNI.TIPO)'
      'WHERE ART.EMPRESA = ?EMPRESA AND ART.ARTICULO =?HIJO')
    UniDirectional = False
    DataSource = DSxNecesidades
    BeforeOpen = xArticulosBeforeOpen
    Left = 172
    Top = 246
    object xArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xArticulosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 3
    end
    object xArticulosTITULO_CORTO: TFIBStringField
      DisplayLabel = 'Titulo Corto'
      FieldName = 'TITULO_CORTO'
    end
    object xArticulosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object frNecesidades: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frNecesidadesGetValue
    OnBeforePrint = frNecesidadesEnterRect
    OnEnterRect = frNecesidadesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 12
    ReportForm = {19000000}
  end
  object frDBNecesidades: TfrDBDataSet
    DataSource = DSxNecesidades
    Left = 216
    Top = 76
  end
  object DSxNecesidades: TDataSource
    DataSet = xNecesidades
    Left = 120
    Top = 76
  end
  object xOrdenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ORDENES_PRODUCCION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NORDEN=?NORDEN ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ORDENES_PRODUCCION'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND SERIE = ?SERIE AND NORDEN=?ORDEN')
    UniDirectional = False
    AfterOpen = xOrdenesAfterOpen
    AfterScroll = xOrdenesAfterScroll
    Left = 26
    Top = 246
  end
  object DSxArt: TDataSource
    DataSet = xArt
    Left = 104
    Top = 194
  end
  object xNecesidades: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM A_ART_NECESIDADES(?EMPRESA,'
      '?EJERCICIO,?CANAL,?SERIE,?ORDEN,?PADRE,?NIVEL,?UNIDADES,'
      '?EXPLOSION)')
    UniDirectional = False
    Left = 24
    Top = 72
    object xNecesidadesHIJO: TFIBStringField
      DisplayLabel = 'Hijo'
      FieldName = 'HIJO'
      Size = 25
    end
    object xNecesidadesCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xNecesidadesNIVEL_HIJO: TIntegerField
      DisplayLabel = 'Nivel Hijo'
      FieldName = 'NIVEL_HIJO'
    end
  end
  object xArt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ARTICULO,TITULO_LARGO AS TITULO FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 24
    Top = 194
    object xArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArtTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object xNotas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT TITULO_CORTO,NOTAS'
      '  FROM ART_ARTICULOS '
      'WHERE EMPRESA = ?EMPRESA AND ARTICULO =?ARTICULO')
    UniDirectional = False
    Left = 24
    Top = 128
    object xNotasTITULO_CORTO: TFIBStringField
      DisplayLabel = 'Titulo Corto'
      FieldName = 'TITULO_CORTO'
    end
    object xNotasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSxNotas: TDataSource
    DataSet = xNotas
    Left = 88
    Top = 132
  end
  object frDBxNotas: TfrDBDataSet
    DataSource = DSxNotas
    Left = 158
    Top = 132
  end
  object SPPrecio: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure A_ART_ESC_PRODUCCION_COSTE  (?Empresa,?Articul' +
        'o,-1)')
    Transaction = TLocal
    AutoTrans = True
    Left = 174
    Top = 198
  end
  object xEscandalloDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM A_ART_NECESIDADES_ESC(?EMPRESA,'
      '?EJERCICIO,?CANAL,?PADRE,?NIVEL,?UNIDADES,?EXPLOSION) sp '
      'join art_articulos art'
      'on art.empresa=?EMPRESA1 and'
      '   art.articulo=sp.hijo'
      'ORDER BY sp.LINEA')
    UniDirectional = False
    Left = 34
    Top = 354
    object xEscandalloDetHIJO: TFIBStringField
      DisplayLabel = 'Hijo'
      FieldName = 'HIJO'
      Size = 25
    end
    object xEscandalloDetTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xEscandalloDetCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xEscandalloDetNIVEL_HIJO: TIntegerField
      DisplayLabel = 'Nivel Hijo'
      FieldName = 'NIVEL_HIJO'
    end
    object xEscandalloDetP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xEscandalloDetCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object xEscandalloDetCOSTE_TOTAL: TFloatField
      DisplayLabel = 'Coste Total'
      FieldName = 'COSTE_TOTAL'
    end
    object xEscandalloDetALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object xEscandalloDetALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object xEscandalloDetALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object xEscandalloDetALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object xEscandalloDetALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object xEscandalloDetFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xEscandalloDetNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSxEscandalloDet: TDataSource
    DataSet = xEscandalloDet
    Left = 122
    Top = 354
  end
  object frDBxEscandalloDet: TfrDBDataSet
    DataSource = DSxEscandalloDet
    Left = 218
    Top = 354
  end
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM art_articulos_esc_produccion e'
      '  left join art_articulos a'
      '  on(e.empresa=a.empresa and e.articulo=a.articulo)'
      
        '  where e.empresa=?empresa and ((e.articulo=?articulo and e.nume' +
        'ro=?numero and ?todos=0)or(?todos=1))')
    UniDirectional = False
    AfterScroll = xEscandalloAfterScroll
    Left = 38
    Top = 306
    object xEscandalloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEscandalloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xEscandalloNUMERO: TIntegerField
      DisplayLabel = 'Nro.'
      FieldName = 'NUMERO'
    end
    object xEscandalloUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xEscandalloFECHA_DESDE: TDateTimeField
      DisplayLabel = 'Fec. Desde'
      FieldName = 'FECHA_DESDE'
    end
    object xEscandalloFECHA_HASTA: TDateTimeField
      DisplayLabel = 'Fec. Hasta'
      FieldName = 'FECHA_HASTA'
    end
    object xEscandalloACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xEscandalloCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object xEscandalloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xEscandalloP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xEscandalloFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xEscandalloALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object xEscandalloALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object xEscandalloALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object xEscandalloALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object xEscandalloALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
  end
  object xListOrdenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM art_ordenes_produccion p'
      '  left join art_articulos a'
      '  on (p.empresa=a.empresa and p.articulo=a.articulo)'
      
        '  where (p.empresa=?empresa and p.ejercicio=?ejercicio and p.can' +
        'al=?canal and'
      
        '( ((?orden=1)and(p.norden>=?ordenD)and(p.norden<=?ordenh))or(?or' +
        'den=0) ) and'
      
        '( ((?fecha=1)and(p.fecha_orden>=?fechaD)and(p.fecha_orden<?fecha' +
        'h))or(?fecha=0) ) and'
      
        '( ((?almacen=1)and(p.almacen>=?almacenD)and(p.almacen<=?almacenh' +
        '))or(?almacen=0) ) and'
      
        '( ((?articulo=1)and(p.articulo>=?articuloD)and(p.articulo<=?arti' +
        'culoh))or(?articulo=0) ) and'
      
        '( ((?escandallo=1)and(p.escandallo>=?escandalloD)and(p.escandall' +
        'o<=?escandalloh))or(?escandallo=0) ) and'
      
        '( ((?pedido=1)and(p.pedido>=?pedidoD)and(p.pedido<=?pedidoh))or(' +
        '?pedido=0) ) '
      ')')
    UniDirectional = False
    AfterOpen = xListOrdenesAfterOpen
    AfterScroll = xListOrdenesAfterScroll
    Left = 36
    Top = 470
    object xListOrdenesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xListOrdenesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xListOrdenesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xListOrdenesNORDEN: TIntegerField
      DisplayLabel = 'Nro. Orden'
      FieldName = 'NORDEN'
    end
    object xListOrdenesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xListOrdenesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xListOrdenesPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object xListOrdenesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xListOrdenesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xListOrdenesUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xListOrdenesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xListOrdenesESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object xListOrdenesPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object xListOrdenesP_MERMA: TFloatField
      DisplayLabel = '% Merma'
      FieldName = 'P_MERMA'
    end
    object xListOrdenesCANT_ORDENADA: TFloatField
      DisplayLabel = 'Cant. Ordenada'
      FieldName = 'CANT_ORDENADA'
    end
    object xListOrdenesCANT_ESPERADA: TFloatField
      DisplayLabel = 'Cant. Esperada'
      FieldName = 'CANT_ESPERADA'
    end
    object xListOrdenesCANT_FINAL: TFloatField
      DisplayLabel = 'Cant. Final'
      FieldName = 'CANT_FINAL'
    end
    object xListOrdenesFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Ent.'
      FieldName = 'FECHA_ENTREGA'
    end
    object xListOrdenesFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object xListOrdenesFECHA_INICIO_PROD: TDateTimeField
      DisplayLabel = 'Fec. Ini. Prod.'
      FieldName = 'FECHA_INICIO_PROD'
    end
    object xListOrdenesMATERIAL: TIntegerField
      DisplayLabel = 'Material'
      FieldName = 'MATERIAL'
    end
    object xListOrdenesFECHA_ORDEN: TDateTimeField
      DisplayLabel = 'Fec. Orden'
      FieldName = 'FECHA_ORDEN'
    end
    object xListOrdenesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xListOrdenesTERCERO_OPERARIO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO_OPERARIO'
    end
    object xListOrdenesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSxListOrdenes: TDataSource
    DataSet = xListOrdenes
    Left = 124
    Top = 468
  end
  object frDBxListOrdenes: TfrDBDataSet
    DataSource = DSxListOrdenes
    Left = 220
    Top = 468
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure A_ART_ESC_PRODUCCION_COSTE  (?Empresa,?Articul' +
        'o,-1)')
    Transaction = TLocal
    AutoTrans = True
    Left = 248
    Top = 246
  end
  object xEscandalloOrd: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM A_ART_NECESIDADES_ORD_ESC(?EMPRESA,'
      
        '?EJERCICIO,?SERIE,?CANAL,?ORDEN,?PADRE,?NIVEL,?UNIDADES,?EXPLOSI' +
        'ON)')
    UniDirectional = False
    AfterScroll = xEscandalloOrdAfterScroll
    Left = 36
    Top = 522
  end
  object DSxEscandalloOrd: TDataSource
    DataSet = xEscandalloOrd
    Left = 124
    Top = 522
  end
  object frDBxEscandalloOrd: TfrDBDataSet
    DataSource = DSxEscandalloOrd
    Left = 220
    Top = 522
  end
  object DSxEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 110
    Top = 304
  end
  object frDBxEscandallo: TfrDBDataSet
    DataSource = DSxEscandallo
    Left = 206
    Top = 304
  end
  object xPedido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ORDENES_PRODUCCION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NORDEN=?NORDEN ')
    SelectSQL.Strings = (
      'SELECT titulo FROM ver_cabeceras_pedido'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND serie=?serie and tipo='#39'PEC'#39' and rig=?pedido')
    UniDirectional = False
    Left = 366
    Top = 246
    object xPedidoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xoperario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ORDENES_PRODUCCION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NORDEN=?NORDEN ')
    SelectSQL.Strings = (
      'SELECT * from sys_terceros'
      '  where tercero=?tercero_operario')
    UniDirectional = False
    DataSource = DSxOrd
    Left = 370
    Top = 304
  end
  object DSxOrd: TDataSource
    DataSet = xOrdenes
    Left = 98
    Top = 244
  end
  object xListOperario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ORDENES_PRODUCCION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NORDEN=?NORDEN ')
    SelectSQL.Strings = (
      'SELECT * from sys_terceros'
      '  where tercero=?tercero_operario')
    UniDirectional = False
    DataSource = DSxListOrdenes
    Left = 368
    Top = 360
    object xListOperarioTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xListOperarioNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xListOperarioNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xListOperarioTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Razon'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object xListOperarioNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xListOperarioFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object xListOperarioNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xListOperarioTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xListOperarioTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xListOperarioTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object xListOperarioEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xListOperarioWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
  end
  object xProcesos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM art_ordenes_prod_procesos a'
      '  left join emp_procesos_produccion p'
      '  on (a.empresa=p.empresa and a.proceso=p.proceso)'
      
        '  where a.empresa=?empresa and a.ejercicio=?ejercicio and a.cana' +
        'l=?canal and'
      '             a.norden=?norden'
      '  order by a.orden')
    UniDirectional = False
    DataSource = DSxOrd
    AfterOpen = xProcesosAfterOpen
    Left = 32
    Top = 412
  end
  object DSxProcesos: TDataSource
    DataSet = xProcesos
    Left = 120
    Top = 412
  end
  object frDBxProcesos: TfrDBDataSet
    DataSource = DSxProcesos
    Left = 216
    Top = 412
  end
  object xOperarioProceso: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ORDENES_PRODUCCION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NORDEN=?NORDEN ')
    SelectSQL.Strings = (
      'SELECT * from sys_terceros'
      '  where tercero=?operario')
    UniDirectional = False
    DataSource = DSxProcesos
    Left = 374
    Top = 420
  end
  object xArticuloKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT FAMILIA,TITULO_CORTO,ALFA_1,ALFA_2,ALFA_3,ALFA_4,ALFA_5,N' +
        'OTAS FROM ART_ARTICULOS'
      'WHERE '
      ' EMPRESA = ?EMPRESA AND '
      ' ARTICULO = ?ARTICULO')
    UniDirectional = True
    Left = 288
    Top = 72
  end
  object DSxArticuloKri: TDataSource
    DataSet = xArticuloKri
    Left = 368
    Top = 72
  end
  object frDBOrdenProdKri: TfrDBDataSet
    DataSource = DSxOrd
    Left = 292
    Top = 196
  end
end
