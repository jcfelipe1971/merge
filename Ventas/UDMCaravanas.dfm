object DMCaravanas: TDMCaravanas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 507
  Top = 163
  Height = 280
  Width = 372
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 200
    Top = 8
  end
  object xCaravana: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM HOB_CARAVANAS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO HOB_CARAVANAS'
      
        '  (ID,PEDIDO,CLIENTE,FECHA_ENVIO_PED,FECHA_RECEPCION,MODELO,ANO,' +
        'PEDIDO_HOBBY,ORDEN_CONF,FECHA_PREV_ENTREGA,FECHA_ENTREGA,BASTIDO' +
        'R,ACCESORIOS,FACTURA,IMPORTE,PLAN_PAGO)'
      'VALUES'
      
        '  (?ID,?PEDIDO,?CLIENTE,?FECHA_ENVIO_PED,?FECHA_RECEPCION,?MODEL' +
        'O,?ANO,?PEDIDO_HOBBY,?ORDEN_CONF,?FECHA_PREV_ENTREGA,?FECHA_ENTR' +
        'EGA,?BASTIDOR,?ACCESORIOS,?FACTURA,?IMPORTE,?PLAN_PAGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM HOB_CARAVANAS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM HOB_CARAVANAS'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE HOB_CARAVANAS'
      'SET'
      '  PEDIDO=?PEDIDO '
      '  ,CLIENTE=?CLIENTE '
      '  ,FECHA_ENVIO_PED=?FECHA_ENVIO_PED '
      '  ,FECHA_RECEPCION=?FECHA_RECEPCION '
      '  ,MODELO=?MODELO '
      '  ,ANO=?ANO '
      '  ,PEDIDO_HOBBY=?PEDIDO_HOBBY '
      '  ,ORDEN_CONF=?ORDEN_CONF '
      '  ,FECHA_PREV_ENTREGA=?FECHA_PREV_ENTREGA '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,BASTIDOR=?BASTIDOR '
      '  ,ACCESORIOS=?ACCESORIOS '
      '  ,FACTURA=?FACTURA '
      '  ,IMPORTE=?IMPORTE '
      '  ,PLAN_PAGO=?PLAN_PAGO '
      'WHERE'
      '  ID=?ID ')
    OnNewRecord = xCaravanaNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'HOB_CARAVANAS'
    UpdateTransaction = TLocal
    Left = 32
    Top = 8
    object xCaravanaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xCaravanaPEDIDO: TFIBStringField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
      Size = 15
    end
    object xCaravanaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCaravanaFECHA_ENVIO_PED: TDateTimeField
      DisplayLabel = 'Fecha Envio Pedido'
      FieldName = 'FECHA_ENVIO_PED'
    end
    object xCaravanaFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fecha Recepcion'
      FieldName = 'FECHA_RECEPCION'
    end
    object xCaravanaMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 15
    end
    object xCaravanaANO: TIntegerField
      DisplayLabel = 'A'#241'o'
      FieldName = 'ANO'
    end
    object xCaravanaPEDIDO_HOBBY: TFIBStringField
      DisplayLabel = 'Pedido Hobby'
      FieldName = 'PEDIDO_HOBBY'
      Size = 15
    end
    object xCaravanaORDEN_CONF: TFIBStringField
      DisplayLabel = 'Confirmacion'
      FieldName = 'ORDEN_CONF'
      Size = 15
    end
    object xCaravanaFECHA_PREV_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Prevista de Entrega'
      FieldName = 'FECHA_PREV_ENTREGA'
    end
    object xCaravanaFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object xCaravanaBASTIDOR: TFIBStringField
      DisplayLabel = 'Bastidor'
      DisplayWidth = 20
      FieldName = 'BASTIDOR'
    end
    object xCaravanaACCESORIOS: TBlobField
      DisplayLabel = 'Accesorios'
      FieldName = 'ACCESORIOS'
      Size = 8
    end
    object xCaravanaFACTURA: TFIBStringField
      DisplayLabel = 'Factura'
      FieldName = 'FACTURA'
      Size = 15
    end
    object xCaravanaIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xCaravanaPLAN_PAGO: TFIBStringField
      DisplayLabel = 'Plan'
      FieldName = 'PLAN_PAGO'
      Size = 1
    end
  end
  object DSxCaravana: TDataSource
    DataSet = xCaravana
    Left = 104
    Top = 8
  end
  object HYReportMail: THYReportMail
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    ValorCodigo = 1802
    ValorGrupo = 40
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 66
    Opciones.Pagina.SaltoPagina = True
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Listado de Pedido Proveedores E-Mail'
    ControlaLongitud = True
    Left = 28
    Top = 54
  end
  object xLstCaravana: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM HOB_CARAVANAS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO HOB_CARAVANAS'
      
        '  (ID,PEDIDO,CLIENTE,FECHA_ENVIO_PED,FECHA_RECEPCION,MODELO,ANO,' +
        'PEDIDO_HOBBY,ORDEN_CONF,FECHA_PREV_ENTREGA,FECHA_ENTREGA,BASTIDO' +
        'R,ACCESORIOS,FACTURA,IMPORTE,PLAN_PAGO)'
      'VALUES'
      
        '  (?ID,?PEDIDO,?CLIENTE,?FECHA_ENVIO_PED,?FECHA_RECEPCION,?MODEL' +
        'O,?ANO,?PEDIDO_HOBBY,?ORDEN_CONF,?FECHA_PREV_ENTREGA,?FECHA_ENTR' +
        'EGA,?BASTIDOR,?ACCESORIOS,?FACTURA,?IMPORTE,?PLAN_PAGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM HOB_CARAVANAS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM HOB_CARAVANAS'
      'WHERE ID=?ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE HOB_CARAVANAS'
      'SET'
      '  PEDIDO=?PEDIDO '
      '  ,CLIENTE=?CLIENTE '
      '  ,FECHA_ENVIO_PED=?FECHA_ENVIO_PED '
      '  ,FECHA_RECEPCION=?FECHA_RECEPCION '
      '  ,MODELO=?MODELO '
      '  ,ANO=?ANO '
      '  ,PEDIDO_HOBBY=?PEDIDO_HOBBY '
      '  ,ORDEN_CONF=?ORDEN_CONF '
      '  ,FECHA_PREV_ENTREGA=?FECHA_PREV_ENTREGA '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,BASTIDOR=?BASTIDOR '
      '  ,ACCESORIOS=?ACCESORIOS '
      '  ,FACTURA=?FACTURA '
      '  ,IMPORTE=?IMPORTE '
      '  ,PLAN_PAGO=?PLAN_PAGO '
      'WHERE'
      '  ID=?ID ')
    AfterOpen = xLstCaravanaAfterOpen
    OnNewRecord = xCaravanaNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'HOB_CARAVANAS'
    UpdateTransaction = TLocal
    Left = 104
    Top = 56
  end
  object xLstCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=1 AND'
      'CLIENTE=?CLIENTE')
    UniDirectional = False
    AfterOpen = xLstClienteAfterOpen
    Left = 104
    Top = 104
  end
  object xLstTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE'
      'TERCERO=?TERCERO')
    UniDirectional = False
    Left = 104
    Top = 152
  end
  object xLstArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=1 AND'
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 104
    Top = 200
  end
  object HYRMxLstCaravana: THYReportMailSource
    DataSet = xLstCaravana
    CloseDataset = True
    Left = 200
    Top = 56
  end
  object HYRMxLstCliente: THYReportMailSource
    DataSet = xLstCliente
    CloseDataset = True
    Left = 200
    Top = 104
  end
  object HYRMxLstTercero: THYReportMailSource
    DataSet = xLstTercero
    CloseDataset = True
    Left = 200
    Top = 152
  end
  object HYRMxLstArticulo: THYReportMailSource
    DataSet = xLstArticulo
    CloseDataset = True
    Left = 200
    Top = 200
  end
  object frDBxLstCaravana: TfrDBDataSet
    DataSet = xLstCaravana
    Left = 296
    Top = 56
  end
  object frDBxLstCliente: TfrDBDataSet
    DataSet = xLstCliente
    Left = 296
    Top = 104
  end
  object frDBxLstTercero: TfrDBDataSet
    DataSet = xLstTercero
    Left = 296
    Top = 152
  end
  object frDBxLstArticulo: TfrDBDataSet
    DataSet = xLstArticulo
    Left = 296
    Top = 200
  end
  object frCaravana: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Fax Confirmacion Caravanas'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 24
    Top = 104
    ReportForm = {19000000}
  end
end
