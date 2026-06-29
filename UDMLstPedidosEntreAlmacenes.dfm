object DMLstPedidosEntreAlmacenes: TDMLstPedidosEntreAlmacenes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 299
  Top = 152
  Height = 456
  Width = 538
  object frPedidos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frPedidosGetValue
    OnBeforePrint = frPedidosBeforePrint
    OnEnterRect = frPedidosBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 312
    Top = 16
    ReportForm = {19000000}
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
    Left = 48
    Top = 16
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_PEA'
      'WHERE ID = ?ID')
    UniDirectional = False
    Left = 48
    Top = 64
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 176
    Top = 64
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEA_LST'
      'WHERE ID_CAB = ?ID'
      'order by linea')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 48
    Top = 112
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 176
    Top = 112
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 440
    Top = 64
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1990
    ValorGrupo = 39
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 130
    Opciones.Pagina.Tamanyo = 69
    Opciones.Pagina.SaltoPagina = True
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Pedido de Clientes (Doble Cabecera-4C)'
    ControlaLongitud = True
    Left = 440
    Top = 16
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 440
    Top = 112
  end
  object frDBdetalle: TfrDBDataSet
    DataSet = QMDetalle
    Left = 312
    Top = 112
  end
  object frDBCabecera: TfrDBDataSet
    DataSet = QMCabecera
    Left = 312
    Top = 64
  end
  object QMCabeceraPendientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_PEA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'ESTADO=0'
      'ORDER BY EJERCICIO, RIG')
    UniDirectional = False
    Left = 48
    Top = 168
  end
  object DSCabeceraPendientes: TDataSource
    DataSet = QMCabeceraPendientes
    Left = 176
    Top = 168
  end
  object QMDetallePendientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEA_LST'
      'WHERE'
      'ID_CAB = ?ID AND'
      'UNIDADES_PED > UNIDADES_ENV'
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSCabeceraPendientes
    Left = 48
    Top = 216
  end
  object DSDetallePendientes: TDataSource
    DataSet = QMDetallePendientes
    Left = 176
    Top = 216
  end
  object HYRSCabeceraPendientes: THYReportSource
    DataSet = QMCabeceraPendientes
    CloseDataset = True
    Left = 440
    Top = 168
  end
  object HYRSDetallePendientes: THYReportSource
    DataSet = QMDetallePendientes
    CloseDataset = True
    Left = 440
    Top = 216
  end
  object frDBDetallePendientes: TfrDBDataSet
    DataSet = QMDetallePendientes
    Left = 312
    Top = 216
  end
  object frDBCabeceraPendientes: TfrDBDataSet
    DataSet = QMCabeceraPendientes
    Left = 312
    Top = 168
  end
  object xAlmacenOrigen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select a.empresa,a.almacen,a.titulo,a.tercero,t.nombre_r_social,' +
        'd.dir_completa_n,l.titulo as localidad,'
      
        '       l.codigo_postal,p.titulo as provincia,d.dir_telefono01, d' +
        '.dir_telefono02,d.dir_telefax from art_almacenes a '
      'join sys_terceros t'
      'on a.tercero=t.tercero'
      'left join sys_terceros_direcciones d'
      'on t.tercero=d.tercero and a.direccion=d.direccion'
      'join sys_localidades l'
      'on d.dir_localidad=l.localidad '
      'join sys_provincias p '
      'on l.pais=p.pais and l.provincia=p.provincia'
      'where'
      'a.empresa=?empresa and'
      'a.almacen=?almacen_ori')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 48
    Top = 272
  end
  object DSxAlmacenOrigen: TDataSource
    DataSet = xAlmacenOrigen
    Left = 176
    Top = 272
  end
  object xAlmacenDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select a.empresa,a.almacen,a.titulo,a.tercero,t.nombre_r_social,' +
        'd.dir_completa_n,l.titulo as localidad,'
      
        '       l.codigo_postal,p.titulo as provincia,d.dir_telefono01, d' +
        '.dir_telefono02,d.dir_telefax from art_almacenes a '
      'join sys_terceros t'
      'on a.tercero=t.tercero'
      'left join sys_terceros_direcciones d'
      'on t.tercero=d.tercero and a.direccion=d.direccion'
      'join sys_localidades l'
      'on d.dir_localidad=l.localidad '
      'join sys_provincias p '
      'on l.pais=p.pais and l.provincia=p.provincia'
      'where'
      'a.empresa=?empresa and'
      'a.almacen=?almacen_dst')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 48
    Top = 320
  end
  object DSxAlmacenDestino: TDataSource
    DataSet = xAlmacenDestino
    Left = 176
    Top = 320
  end
  object HYRxAlmacenOrigen: THYReportSource
    DataSet = xAlmacenOrigen
    CloseDataset = True
    Left = 440
    Top = 264
  end
  object HYRxAlmacenDestino: THYReportSource
    DataSet = xAlmacenDestino
    CloseDataset = True
    Left = 440
    Top = 320
  end
  object frDBxAlmacenDestino: TfrDBDataSet
    DataSet = xAlmacenDestino
    Left = 312
    Top = 320
  end
  object frDBxAlmacenOrigen: TfrDBDataSet
    DataSet = xAlmacenOrigen
    Left = 312
    Top = 272
  end
  object frxPedidos: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9723134954
    ReportOptions.LastChange = 38691.9723134954
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxPedidosBeforePrint
    OnGetValue = frPedidosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 176
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
