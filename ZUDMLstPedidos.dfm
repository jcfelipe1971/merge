object ZDMLstPedidos: TZDMLstPedidos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 445
  Top = 113
  Height = 780
  Width = 815
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 56
    Top = 8
  end
  object frPedidoEsp: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frPedidoEspGetValue
    OnBeforePrint = frPedidoEspEnterRect
    OnEnterRect = frPedidoEspEnterRect
    OnPrintReport = frPedidoEspPrintReport
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 408
    Top = 8
    ReportForm = {19000000}
  end
  object frDBDSPedidoEspCab: TfrDBDataSet
    DataSource = DSxLstPedidoEspCab
    Left = 296
    Top = 200
  end
  object xLstPedidoEspCab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAB.EMPRESA, CAB.RIG AS NUM_PEDIDO, CAB.SU_REFERENCIA, PE' +
        'D.Z_COD_BARRAS_PED AS COD_BARRAS_PED, CAB.FECHA,'
      
        '       PED.FECHA_ENTREGA_PREV AS FECHA_PREV_ENVIO, CAB.CLIENTE, ' +
        'TER.NOMBRE_R_SOCIAL AS NOMBRE_CLIENTE,'
      
        '       CLI.TRANSPORTISTA, TERACR.NOMBRE_R_SOCIAL AS NOMBRE_TRANS' +
        'PORTISTA'
      'FROM GES_CABECERAS_S CAB'
      'JOIN GES_CABECERAS_S_PED PED ON (PED.ID_S = CAB.ID_S)'
      'JOIN SYS_TERCEROS TER ON (TER.TERCERO = CAB.TERCERO)'
      
        'JOIN EMP_CLIENTES CLI ON (CLI.EMPRESA = CAB.EMPRESA AND CLI.CLIE' +
        'NTE = CAB.CLIENTE)'
      
        'JOIN EMP_ACREEDORES ACR ON (ACR.EMPRESA = CLI.EMPRESA AND ACR.AC' +
        'REEDOR = CLI.TRANSPORTISTA)'
      'JOIN SYS_TERCEROS TERACR ON (TERACR.TERCERO = ACR.TERCERO)'
      'WHERE'
      'CAB.ID_S = :ID_S ')
    UniDirectional = False
    Left = 56
    Top = 200
  end
  object DSxLstPedidoEspCab: TDataSource
    DataSet = xLstPedidoEspCab
    Left = 176
    Top = 200
  end
  object frPedidoEspDet: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frPedidoEspGetValue
    OnBeforePrint = frPedidoEspEnterRect
    OnEnterRect = frPedidoEspEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 488
    Top = 8
    ReportForm = {19000000}
  end
  object frDBDSCabecera: TfrDBDataSet
    DataSource = DSxLstCabecera
    Left = 296
    Top = 152
  end
  object xLstCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_PEDIDO'
      'WHERE'
      'ID_S = :ID_S')
    UniDirectional = False
    Left = 56
    Top = 152
  end
  object DSxLstCabecera: TDataSource
    DataSet = xLstCabecera
    Left = 176
    Top = 152
  end
  object frDBDSDetalle: TfrDBDataSet
    DataSource = DSxLstDetalle
    Left = 296
    Top = 104
  end
  object xLstDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEDIDO'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY ORDEN')
    UniDirectional = False
    Left = 56
    Top = 104
  end
  object DSxLstDetalle: TDataSource
    DataSet = xLstDetalle
    Left = 176
    Top = 104
  end
  object frDBDSDetallado: TfrDBDataSet
    DataSource = DSxLstDetallado
    Left = 296
    Top = 56
  end
  object xLstDetallado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_LST_PEDIDO_DETALLADO (:ID_DETALLES_S)')
    UniDirectional = False
    DataSource = DSxLstDetalle
    Left = 56
    Top = 56
  end
  object DSxLstDetallado: TDataSource
    DataSet = xLstDetallado
    Left = 176
    Top = 56
  end
  object frDBDSPedidoEsp: TfrDBDataSet
    DataSource = DSxLstPedidoEsp
    Left = 296
    Top = 248
  end
  object xLstPedidoEsp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_LST_PEDIDO_ESPECIAL (:ID_S)'
      ' ')
    UniDirectional = False
    Left = 56
    Top = 248
  end
  object DSxLstPedidoEsp: TDataSource
    DataSet = xLstPedidoEsp
    Left = 176
    Top = 248
  end
  object QMOrden: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_MATERIALES_ORDEN_TYC'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'TIPOFASE = '#39'ARM'#39
      'ORDER BY LINEA_FASE, ID_ORDEN, ORDEN')
    UniDirectional = False
    Left = 56
    Top = 488
  end
  object DSxQMOrden: TDataSource
    DataSet = QMOrden
    Left = 176
    Top = 488
  end
  object frDBOrdenes: TfrDBDataSet
    DataSource = DSxQMOrden
    Left = 296
    Top = 488
  end
  object DSxLstPedidoEsp2: TDataSource
    DataSet = xLstPedidoesp2
    Left = 176
    Top = 440
  end
  object xLstPedidoesp2: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_LST_PEDIDO_ESPECIAL2 (:ID_S)')
    UniDirectional = False
    Left = 56
    Top = 440
  end
  object frDBDSPedidoEsp2: TfrDBDataSet
    DataSource = DSxLstPedidoEsp2
    Left = 296
    Top = 440
  end
  object xLstPedidoEspNavL: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_LST_PEDIDO_ESPECIAL_NAV (:ID_S)'
      'WHERE'
      'TIPO_ARTICULO_TYC = '#39'L'#39)
    UniDirectional = False
    Left = 56
    Top = 296
  end
  object DSxLstPedidoEspNavL: TDataSource
    DataSet = xLstPedidoEspNavL
    Left = 176
    Top = 296
  end
  object frDBDPedidoEspNAvL: TfrDBDataSet
    DataSource = DSxLstPedidoEspNavL
    Left = 296
    Top = 296
  end
  object DSxLstPedidoEspNavT: TDataSource
    DataSet = xLstPedidoEspNavT
    Left = 176
    Top = 344
  end
  object xLstPedidoEspNavT: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_LST_PEDIDO_ESPECIAL_NAV (:ID_S)'
      'WHERE'
      '((TIPO_ARTICULO_TYC = '#39'T'#39') OR (TIPO_ARTICULO_TYC = '#39'A'#39'))')
    UniDirectional = False
    Left = 56
    Top = 344
  end
  object DSxLstPedidoEspNavC: TDataSource
    DataSet = xLstPedidoEspNavC
    Left = 176
    Top = 392
  end
  object xLstPedidoEspNavC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_LST_PEDIDO_ESPECIAL_NAV (:ID_S)'
      'WHERE'
      'TIPO_ARTICULO_TYC = '#39'C'#39)
    UniDirectional = False
    Left = 56
    Top = 392
  end
  object frDBDPedidoEspNAvT: TfrDBDataSet
    DataSource = DSxLstPedidoEspNavT
    Left = 296
    Top = 344
  end
  object frDBDPedidoEspNAvC: TfrDBDataSet
    DataSource = DSxLstPedidoEspNavC
    Left = 296
    Top = 392
  end
  object xLstDetalleEti: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_LST_ETIQUETAS(:ID_S)')
    UniDirectional = False
    Left = 56
    Top = 536
  end
  object DSxLstDetalleEti: TDataSource
    DataSet = xLstDetalleEti
    Left = 176
    Top = 536
  end
  object frDBDetalleEti: TfrDBDataSet
    DataSource = DSxLstDetalleEti
    Left = 296
    Top = 536
  end
  object xTextoBultos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'EXECUTE PROCEDURE Z_CREA_TEXTO_BULTOS(:EMPRESA, :EJERCICIO, :CAN' +
        'AL, :SERIE, :TIPO, :ID_S)'
      ' ')
    UniDirectional = False
    DataSource = DSxLstCabecera
    Left = 56
    Top = 584
  end
  object DSxTextoBultos: TDataSource
    DataSet = xTextoBultos
    Left = 176
    Top = 584
  end
  object frDBCabBultos: TfrDBDataSet
    DataSource = DSxTextoBultos
    Left = 296
    Top = 584
  end
end
