object DMLstComisiones: TDMLstComisiones
  OldCreateOrder = False
  OnCreate = DMLstComisionesCreate
  OnDestroy = DMLstComisionesDestroy
  Left = 670
  Top = 152
  Height = 711
  Width = 712
  object DSComisiones: TDataSource
    DataSet = QMComisiones
    Left = 152
    Top = 488
  end
  object frLstComisiones: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frLstComisionesGetValue
    OnBeforePrint = frLstComisionesEnterRect
    OnEnterRect = frLstComisionesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 8
    ReportForm = {19000000}
  end
  object frDBAgentes: TfrDBDataSet
    DataSource = DSAgentes
    Left = 272
    Top = 440
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUENTAS'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :CLIENTE')
    UniDirectional = False
    DataSource = DSComisiones
    Left = 40
    Top = 536
  end
  object QMAgentes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_AGENTES '
      'WHERE'
      'EMPRESA = ?EMPRESA AND '
      'AGENTE >= ?DESDE AND'
      'AGENTE <= ?HASTA '
      'ORDER BY AGENTE')
    UniDirectional = False
    Left = 40
    Top = 440
  end
  object DSClientes: TDataSource
    DataSet = xClientes
    Left = 152
    Top = 536
  end
  object DSAgentes: TDataSource
    DataSet = QMAgentes
    Left = 152
    Top = 440
  end
  object frDBComisiones: TfrDBDataSet
    DataSet = QMComisiones
    Left = 272
    Top = 488
  end
  object frDSQMAgentes: TfrDBDataSet
    DataSource = DSQMAgentes
    Left = 272
    Top = 56
  end
  object QMAgentesCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_AGENTES_CUENTAS'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'AGENTE >= ?MINIMO AND'
      'AGENTE <= ?MAXIMO'
      'ORDER BY AGENTE')
    UniDirectional = False
    AfterOpen = QMAgentesCuentasAfterOpen
    BeforeClose = QMAgentesCuentasBeforeClose
    Left = 40
    Top = 56
  end
  object DSQMAgentes: TDataSource
    DataSet = QMAgentesCuentas
    Left = 152
    Top = 56
  end
  object QMTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE '
      'TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 40
    Top = 104
  end
  object DSQMTerceros: TDataSource
    DataSet = QMTerceros
    Left = 152
    Top = 104
  end
  object frDSQMTerceros: TfrDBDataSet
    DataSource = DSQMTerceros
    Left = 272
    Top = 104
  end
  object frDSQMJustifica: TfrDBDataSet
    DataSource = DSQMJustifica
    Left = 272
    Top = 152
  end
  object DSQMJustifica: TDataSource
    DataSet = QMJustifica
    Left = 152
    Top = 152
  end
  object QMJustifica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO(?TERCERO)')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 40
    Top = 152
  end
  object QMFormasdePago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_FP'
      '  WHERE EMPRESA=?EMPRESA AND'
      '                 EJERCICIO=?EJERCICIO AND'
      '                 CANAL=?CANAL AND'
      '                 FORMA_PAGO = ?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 40
    Top = 248
  end
  object DSFormasdePago: TDataSource
    DataSet = QMFormasdePago
    Left = 152
    Top = 248
  end
  object frDSQMFormasdePago: TfrDBDataSet
    DataSource = DSFormasdePago
    Left = 272
    Top = 248
  end
  object frDSQMIvaModos: TfrDBDataSet
    DataSource = DSIvaModos
    Left = 272
    Top = 296
  end
  object DSIvaModos: TDataSource
    DataSet = QMIvaModos
    Left = 152
    Top = 296
  end
  object QMIvaModos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MODO_IVA'
      'WHERE'
      '  MODO=?MODO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MODO_IVA'
      '  WHERE MODO = ?MODO_IVA')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 40
    Top = 296
  end
  object QMIRPF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_IRPF'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IRPF'
      '  WHERE TIPO = ?TIPO_IRPF')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 40
    Top = 344
  end
  object DSIRPF: TDataSource
    DataSet = QMIRPF
    Left = 152
    Top = 344
  end
  object frDSQMIRPF: TfrDBDataSet
    DataSource = DSIRPF
    Left = 272
    Top = 344
  end
  object frDSQMTipoTerceros: TfrDBDataSet
    DataSource = DSTipoTerceros
    Left = 272
    Top = 392
  end
  object DSTipoTerceros: TDataSource
    DataSet = QMTipoTercero
    Left = 152
    Top = 392
  end
  object QMTipoTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPOS_TERCERO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPOS_TERCERO')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 40
    Top = 392
  end
  object QMTipodeProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_ACREEDOR'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_ACREEDOR')
    UniDirectional = False
    DataSource = DSQMAgentes
    Left = 40
    Top = 200
  end
  object DSQMlstTipodeProv: TDataSource
    DataSet = QMTipodeProv
    Left = 152
    Top = 200
  end
  object frQMDSQMlstTipodeProv: TfrDBDataSet
    DataSource = DSQMlstTipodeProv
    Left = 272
    Top = 200
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 272
    Top = 8
  end
  object QMComisiones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPOS_TERCERO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'TIPO = '#39'FAC'#39' AND'
      'AGENTE = :AGENTE AND'
      'FECHA >= :F_INI AND'
      'FECHA <= :F_FIN'
      'ORDER BY FECHA, SERIE, RIG')
    UniDirectional = False
    DataSource = DSAgentes
    AfterOpen = QMComisionesAfterOpen
    BeforeClose = QMComisionesBeforeClose
    Left = 40
    Top = 488
  end
  object frxLstComisiones: TfrxHYReport
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
    OnBeforePrint = frxLstComisionesBeforePrint
    OnGetValue = frxLstComisionesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 152
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object QMDetallesFactura: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM VER_DETALLE_FACTURA'
      'WHERE'
      'ID_DETALLES_S = :ID_DETALLES_S')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_DETALLE_FACTURA'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY ORDEN')
    UniDirectional = False
    DataSource = DSComisiones
    Left = 40
    Top = 584
  end
  object DSDetallesFactura: TDataSource
    DataSet = QMDetallesFactura
    Left = 152
    Top = 584
  end
  object frDBDetallesFactura: TfrDBDataSet
    DataSet = QMDetallesFactura
    Left = 272
    Top = 584
  end
  object QMCalculoComisiones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT C.ID_S, C.EJERCICIO_FAC, C.SERIE_FAC, C.RIG_FAC, SUM(C.B_' +
        'IMPONIBLE) B_IMPONIBLE, SUM(C.LIQUIDO) LIQUIDO,'
      
        '       AVG(C.P_COMISION_AGENTE) P_COMISION_AGENTE, AVG(C.P_COMIS' +
        'ION_ESCALADO) P_COMISION_ESCALADO,'
      
        '       (SUM(C.COMISION) * 100 / SUM(C.B_IMPONIBLE)) AS P_COMISIO' +
        'N, C.ZONA, AVG(C.P_COMISION_ZONA) P_COMISION_ZONA,'
      '       SUM(C.COMISION) COMISION, C.BLOQUEADO, C.PAGADO, C.FECHA,'
      '       (SELECT CLIENTE'
      '        FROM GES_CABECERAS_S '
      '        WHERE'
      '        ID_S = C.ID_S) CLIENTE,'
      '       (SELECT T.NOMBRE_R_SOCIAL'
      '        FROM GES_CABECERAS_S F'
      '        JOIN SYS_TERCEROS T ON F.TERCERO = T.TERCERO'
      '        WHERE'
      '        F.ID_S = C.ID_S) TITULO_CLI'
      'FROM EMP_AGENTES_COMISIONES C'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.AGENTE = :AGENTE AND'
      'C.ID_S = :ID_S'
      
        'GROUP BY C.EJERCICIO_FAC, C.SERIE_FAC, C.RIG_FAC, C.ID_S, C.ZONA' +
        ', C.PAGADO, C.BLOQUEADO, C.FECHA')
    SelectSQL.Strings = (
      
        'SELECT C.ID_S, C.EJERCICIO_FAC, C.SERIE_FAC, C.RIG_FAC, SUM(C.B_' +
        'IMPONIBLE) B_IMPONIBLE, SUM(C.LIQUIDO) LIQUIDO,'
      
        '       AVG(C.P_COMISION_AGENTE) P_COMISION_AGENTE, AVG(C.P_COMIS' +
        'ION_ESCALADO) P_COMISION_ESCALADO,'
      '       CASE'
      '         WHEN SUM(C.B_IMPONIBLE) = 0 THEN'
      '             0'
      '         ELSE (SUM(C.COMISION) * 100 / SUM(C.B_IMPONIBLE))'
      '       END AS P_COMISION,'
      
        '       C.ZONA, AVG(C.P_COMISION_ZONA) P_COMISION_ZONA, SUM(C.COM' +
        'ISION) COMISION, C.BLOQUEADO, C.PAGADO, C.FECHA,'
      '       (SELECT CLIENTE'
      '        FROM GES_CABECERAS_S'
      '        WHERE'
      '        ID_S = C.ID_S) CLIENTE,'
      '       (SELECT T.NOMBRE_R_SOCIAL'
      '        FROM GES_CABECERAS_S F'
      '        JOIN SYS_TERCEROS T ON F.TERCERO = T.TERCERO'
      '        WHERE'
      '        F.ID_S = C.ID_S) TITULO_CLI'
      'FROM EMP_AGENTES_COMISIONES C'
      'WHERE'
      'C.ID_S = :ID_S'
      
        'GROUP BY C.EJERCICIO_FAC, C.SERIE_FAC, C.RIG_FAC, C.ID_S, C.ZONA' +
        ', C.BLOQUEADO, C.PAGADO, C.FECHA')
    UniDirectional = False
    DataSource = DSComisiones
    Left = 40
    Top = 632
  end
  object DSCalculoComisiones: TDataSource
    DataSet = QMCalculoComisiones
    Left = 152
    Top = 632
  end
  object frDBCalculoComisiones: TfrDBDataSet
    DataSet = QMCalculoComisiones
    Left = 272
    Top = 632
  end
end
