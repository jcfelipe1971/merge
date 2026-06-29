object DMLstArticulosCliente: TDMLstArticulosCliente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 485
  Top = 366
  Height = 708
  Width = 527
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 40
    Top = 24
  end
  object QMArticulosCliente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT OFE.*, TE.NOMBRE_R_SOCIAL, CLI.CLIENTE, TAR.PRECIO_VENTA,' +
        ' ART.P_COSTE'
      'FROM EMP_OFERTA OFE'
      
        'JOIN ART_TARIFAS_PRECIOS TAR ON (TAR.ARTICULO = OFE.COMPUESTO AN' +
        'D TAR.EMPRESA = OFE.EMPRESA)'
      
        'JOIN ART_ARTICULOS ART ON (ART.ARTICULO = OFE.COMPUESTO AND TAR.' +
        'EMPRESA = OFE.EMPRESA)'
      
        'JOIN EMP_CLIENTES CLI ON (OFE.CLIENTE = CLI.CLIENTE AND EMPRESA ' +
        '= CLI.EMPRESA)'
      'JOIN SYS_TERCEROS TE ON (TE.TERCERO = CLI.TERCERO)'
      'WHERE'
      'OFE.EMPRESA = :EMPRESA AND'
      'OFE.CLIENTE >= :D_CLIENTE AND'
      'OFE.CLIENTE <= :H_CLIENTE AND'
      'TAR.TARIFA = :TARIFA'
      'ORDER BY OFE.CLIENTE, OFE.COMPUESTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_OFERTA'
      'SET'
      '  FECHA=?FECHA '
      '  ,PESO_PIEZA=?PESO_PIEZA '
      '  ,PESO_COLADA=?PESO_COLADA '
      '  ,PRECIO_COMPONENTE1=?PRECIO_COMPONENTE1 '
      '  ,UNI_COMPONENTE1=?UNI_COMPONENTE1 '
      '  ,PRECIO_COMPONENTE2=?PRECIO_COMPONENTE2 '
      '  ,UNI_COMPONENTE2=?UNI_COMPONENTE2 '
      '  ,PRECIO_COMPONENTE3=?PRECIO_COMPONENTE3 '
      '  ,UNI_COMPONENTE3=?UNI_COMPONENTE3 '
      '  ,PRECIO_COMPONENTE4=?PRECIO_COMPONENTE4 '
      '  ,UNI_COMPONENTE4=?UNI_COMPONENTE4 '
      '  ,UNI_CAJA=?UNI_CAJA '
      '  ,TIEMPO_CICLO=?TIEMPO_CICLO '
      '  ,UNI_CAVIDADES=?UNI_CAVIDADES '
      '  ,TIEMPO_MANIPUACION=?TIEMPO_MANIPUACION '
      '  ,HORAS_PREP_MOLDE=?HORAS_PREP_MOLDE '
      '  ,PUESTA_MARCHA=?PUESTA_MARCHA '
      '  ,PRECIO_CAJA=?PRECIO_CAJA '
      '  ,ID_EQUIVAL4=?ID_EQUIVAL4 '
      '  ,CLIENTE=?CLIENTE '
      '  ,TIPO_MAQUINA=?TIPO_MAQUINA '
      '  ,MOLDE=?MOLDE '
      '  ,PEDIDO1=?PEDIDO1 '
      '  ,PEDIDO2=?PEDIDO2 '
      '  ,PEDIDO3=?PEDIDO3 '
      '  ,PEDIDO4=?PEDIDO4 '
      '  ,PEDIDO5=?PEDIDO5 '
      '  ,PEDIDO6=?PEDIDO6 '
      '  ,ID_ESCANDALLO=?ID_ESCANDALLO '
      '  ,ID_DETALLES_OFERTAS_V=?ID_DETALLES_OFERTAS_V '
      '  ,ID_EQUIVAL3=?ID_EQUIVAL3 '
      '  ,ID_EQUIVAL2=?ID_EQUIVAL2 '
      '  ,ID_EQUIVAL1=?ID_EQUIVAL1 '
      '  ,USAR_EQUIVAL4=?USAR_EQUIVAL4 '
      '  ,MARGEN_MAQ=?MARGEN_MAQ '
      '  ,MARGEN_MAT_PRIMA=?MARGEN_MAT_PRIMA '
      '  ,TITULO_ART=?TITULO_ART '
      '  ,USAR_EQUIVAL3=?USAR_EQUIVAL3 '
      '  ,USAR_EQUIVAL2=?USAR_EQUIVAL2 '
      '  ,USAR_EQUIVAL1=?USAR_EQUIVAL1 '
      '  ,COMPUESTO=?COMPUESTO '
      '  ,COMPONENTE1=?COMPONENTE1 '
      '  ,COMPONENTE2=?COMPONENTE2 '
      '  ,COMPONENTE3=?COMPONENTE3 '
      '  ,COMPONENTE4=?COMPONENTE4 '
      '  ,TIPO_CAJA=?TIPO_CAJA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIG_OF=?RIG_OF ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_OFERTA'
    UpdateTransaction = TLocal
    Left = 40
    Top = 72
  end
  object DSQMArticulosCliente: TDataSource
    DataSet = QMArticulosCliente
    Left = 160
    Top = 72
  end
  object frArticulosCliente: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frArticulosClienteGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 160
    Top = 24
    ReportForm = {19000000}
  end
  object frDBDSArticulosCliente: TfrDBDataSet
    DataSource = DSQMArticulosCliente
    Left = 296
    Top = 72
  end
end
