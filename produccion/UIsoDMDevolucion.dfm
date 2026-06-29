object IsoDMDevolucion: TIsoDMDevolucion
  OldCreateOrder = False
  OnCreate = DMIsoDevolucionCreate
  Left = 402
  Top = 192
  Height = 474
  Width = 504
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 32
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_DEVOLUCION_C'
      'WHERE'
      '  RIC=?old_RIC AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_DEVOLUCION_C'
      
        '  (TIPO,EMPRESA,RIC,RIC_INC,FECHA,CODPROV,MOTIVO,REPONER,ABONAR,' +
        'CARGO_REP,OTROS,OBSERVACIONES,VB_CALIDAD,VB_COMPRA_VENTA,VB_PROV' +
        'EEDOR,N_PEDIDO,ESTADO,EJERCICIO,URGENTE,DETECCIONE,DETECCIONC,TE' +
        'RCERO)'
      'VALUES'
      
        '  (?TIPO,?EMPRESA,?RIC,?RIC_INC,?FECHA,?CODPROV,?MOTIVO,?REPONER' +
        ',?ABONAR,?CARGO_REP,?OTROS,?OBSERVACIONES,?VB_CALIDAD,?VB_COMPRA' +
        '_VENTA,?VB_PROVEEDOR,?N_PEDIDO,?ESTADO,?EJERCICIO,?URGENTE,?DETE' +
        'CCIONE,?DETECCIONC,?TERCERO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_DEVOLUCION_C'
      'WHERE'
      '  RIC=?RIC AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_DEVOLUCION_C'
      'WHERE'
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA'
      'order by ric')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_DEVOLUCION_C'
      'SET'
      '  TIPO=?TIPO '
      '  ,RIC_INC=?RIC_INC '
      '  ,FECHA=?FECHA '
      '  ,CODPROV=?CODPROV '
      '  ,MOTIVO=?MOTIVO '
      '  ,REPONER=?REPONER '
      '  ,ABONAR=?ABONAR '
      '  ,CARGO_REP=?CARGO_REP '
      '  ,OTROS=?OTROS '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,VB_CALIDAD=?VB_CALIDAD '
      '  ,VB_COMPRA_VENTA=?VB_COMPRA_VENTA '
      '  ,VB_PROVEEDOR=?VB_PROVEEDOR '
      '  ,N_PEDIDO=?N_PEDIDO '
      '  ,ESTADO=?ESTADO '
      '  ,URGENTE=?URGENTE '
      '  ,DETECCIONE=?DETECCIONE '
      '  ,DETECCIONC=?DETECCIONC'
      '  ,TERCERO=?TERCERO'
      'WHERE'
      '  RIC=?RIC AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = Graba
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'RIC '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_DEVOLUCION_C'
    UpdateTransaction = TLocal
    Left = 40
    Top = 48
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraRIC: TIntegerField
      DisplayLabel = 'N'#186' Dev.'
      FieldName = 'RIC'
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraCODPROV: TIntegerField
      DisplayLabel = 'Cod. Prov.'
      FieldName = 'CODPROV'
      OnChange = QMCabeceraCODPROVChange
    end
    object QMCabeceraDescProv: TStringField
      DisplayLabel = 'Descrip. Prov.'
      FieldKind = fkCalculated
      FieldName = 'DescProv'
      OnGetText = QMCabeceraDescProvGetText
      Size = 40
      Calculated = True
    end
    object QMCabeceraMOTIVO: TFIBStringField
      DisplayLabel = 'Motivo'
      FieldName = 'MOTIVO'
      Size = 100
    end
    object QMCabeceraREPONER: TIntegerField
      DisplayLabel = 'Reponer'
      FieldName = 'REPONER'
    end
    object QMCabeceraABONAR: TIntegerField
      DisplayLabel = 'Abonar'
      FieldName = 'ABONAR'
    end
    object QMCabeceraCARGO_REP: TIntegerField
      DisplayLabel = 'Cargo Reparaci'#243'n'
      FieldName = 'CARGO_REP'
    end
    object QMCabeceraOTROS: TIntegerField
      DisplayLabel = 'Otros'
      FieldName = 'OTROS'
    end
    object QMCabeceraOBSERVACIONES: TBlobField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object QMCabeceraVB_CALIDAD: TIntegerField
      DisplayLabel = 'Vb Calidad'
      FieldName = 'VB_CALIDAD'
    end
    object QMCabeceraVB_COMPRA_VENTA: TIntegerField
      DisplayLabel = 'VB Compras/Ventas'
      FieldName = 'VB_COMPRA_VENTA'
    end
    object QMCabeceraVB_PROVEEDOR: TIntegerField
      DisplayLabel = 'VB Proveedor'
      FieldName = 'VB_PROVEEDOR'
    end
    object QMCabeceraN_PEDIDO: TFIBStringField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'N_PEDIDO'
      Size = 25
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraURGENTE: TIntegerField
      DisplayLabel = 'Urgente'
      FieldName = 'URGENTE'
    end
    object QMCabeceraDETECCIONE: TIntegerField
      DisplayLabel = 'DeteccionE'
      FieldName = 'DETECCIONE'
    end
    object QMCabeceraDETECCIONC: TIntegerField
      DisplayLabel = 'DeteccionC'
      FieldName = 'DETECCIONC'
    end
    object QMCabeceraCONTADOR: TFIBStringField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMCabeceraTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabeceraRIC_INC: TIntegerField
      DisplayLabel = 'RIC Inc.'
      FieldName = 'RIC_INC'
      OnChange = QMCabeceraRIC_INCChange
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 120
    Top = 32
  end
  object xProveedor: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROVEEDORES_EMPRESA'
      'where empresa=?empresa and proveedor=?codprov')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMCabecera
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PROVEEDORES_EMPRESA'
    UpdateTransaction = TLocal
    Left = 120
    Top = 96
    object xProveedorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProveedorPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xProveedorTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xProveedorTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxProveedor: TDataSource
    DataSet = xProveedor
    Left = 200
    Top = 96
  end
  object xCodProCli: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TERCEROS'
      'WHERE'
      '  TERCERO=?old_TERCERO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TERCEROS'
      
        '  (NOTAS,FECHA_ALTA,TERCERO,TIPO_RAZON,BANCOS,DIRECCIONES,WEB,EM' +
        'AIL,CONTACTOS,NIF,NOMBRE_R_SOCIAL,NOMBRE_COMERCIAL,TELEFAX,TELEF' +
        'ONO02,TELEFONO01)'
      'VALUES'
      
        '  (?NOTAS,?FECHA_ALTA,?TERCERO,?TIPO_RAZON,?BANCOS,?DIRECCIONES,' +
        '?WEB,?EMAIL,?CONTACTOS,?NIF,?NOMBRE_R_SOCIAL,?NOMBRE_COMERCIAL,?' +
        'TELEFAX,?TELEFONO02,?TELEFONO01)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TERCEROS'
      'WHERE'
      '  TERCERO=?TERCERO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS'
      'where tercero=?deteccion '
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TERCEROS'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,TIPO_RAZON=?TIPO_RAZON '
      '  ,BANCOS=?BANCOS '
      '  ,DIRECCIONES=?DIRECCIONES '
      '  ,WEB=?WEB '
      '  ,EMAIL=?EMAIL '
      '  ,CONTACTOS=?CONTACTOS '
      '  ,NIF=?NIF '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,TELEFAX=?TELEFAX '
      '  ,TELEFONO02=?TELEFONO02 '
      '  ,TELEFONO01=?TELEFONO01 '
      'WHERE'
      '  TERCERO=?TERCERO ')
    DataSource = DSQMCabecera
    ClavesPrimarias.Strings = (
      'TERCERO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TERCEROS'
    UpdateTransaction = TLocal
    Left = 121
    Top = 160
    object xCodProCliTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xCodProCliNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxCodPro: TDataSource
    DataSet = xCodProCli
    Left = 201
    Top = 154
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_DEVOLUCION_D'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIC=?old_RIC AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_DEVOLUCION_D'
      '  (EJERCICIO,EMPRESA,RIC,LINEA,ARTICULO,C_PEDIDA,C_RECHAZADA)'
      'VALUES'
      
        '  (?EJERCICIO,?EMPRESA,?RIC,?LINEA,?ARTICULO,?C_PEDIDA,?C_RECHAZ' +
        'ADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_DEVOLUCION_D'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIC=?RIC AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_DEVOLUCION_D'
      'where empresa=?empresa  and  ejercicio=?ejercicio and ric=?ric')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_DEVOLUCION_D'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,C_PEDIDA=?C_PEDIDA '
      '  ,C_RECHAZADA=?C_RECHAZADA '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIC=?RIC AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCabecera
    AfterDelete = Graba2
    AfterOpen = QMDetalleAfterOpen
    AfterPost = Graba2
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIC '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_DEVOLUCION_D'
    UpdateTransaction = TLocal
    Left = 40
    Top = 232
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMDetalleARTICULOChange
      Size = 15
    end
    object QMDetalleDescArticulo: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = QMDetalleDescArticuloGetText
      Size = 40
      Calculated = True
    end
    object QMDetalleC_PEDIDA: TIntegerField
      DisplayLabel = 'Cantidad Pedida'
      FieldName = 'C_PEDIDA'
    end
    object QMDetalleC_RECHAZADA: TIntegerField
      DisplayLabel = 'Cantidad Rechazada'
      FieldName = 'C_RECHAZADA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 224
  end
  object xDescArticulo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS'
      
        '  (P_COSTE,NOTAS,CONTROLA_MEDIDAS,ENTRADA,UNIDADES,VIRTUAL,EMPRE' +
        'SA,TITULO,ABIERTO,CONTROL_STOCK,TITULO_CORTO,ARTICULO,FAMILIA)'
      'VALUES'
      
        '  (?P_COSTE,?NOTAS,?CONTROLA_MEDIDAS,?ENTRADA,?UNIDADES,?VIRTUAL' +
        ',?EMPRESA,?TITULO,?ABIERTO,?CONTROL_STOCK,?TITULO_CORTO,?ARTICUL' +
        'O,?FAMILIA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS'
      'SET'
      '  P_COSTE=?P_COSTE '
      '  ,NOTAS=?NOTAS '
      '  ,CONTROLA_MEDIDAS=?CONTROLA_MEDIDAS '
      '  ,ENTRADA=?ENTRADA '
      '  ,UNIDADES=?UNIDADES '
      '  ,VIRTUAL=?VIRTUAL '
      '  ,TITULO=?TITULO '
      '  ,ABIERTO=?ABIERTO '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,TITULO_CORTO=?TITULO_CORTO '
      '  ,FAMILIA=?FAMILIA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    DataSource = DSQMDetalle
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS'
    UpdateTransaction = TLocal
    Left = 336
    Top = 104
    object xDescArticuloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDescArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xDescArticuloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxDescArticulo: TDataSource
    DataSet = xDescArticulo
    Left = 416
    Top = 104
  end
  object xCantidadArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_INC_ARTICULO'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIC=?old_RIC AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_INC_ARTICULO'
      '  (EMPRESA,RIC,LINEA,ARTICULO,CANTIDAD)'
      'VALUES'
      '  (?EMPRESA,?RIC,?LINEA,?ARTICULO,?CANTIDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_INC_ARTICULO'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIC=?RIC AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_INC_ARTICULO'
      
        'where empresa=?empresa  and contador=?contador and articulo=?art' +
        'iculo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_INC_ARTICULO'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,CANTIDAD=?CANTIDAD '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIC=?RIC AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMDetalle
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIC '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_INC_ARTICULO'
    UpdateTransaction = TLocal
    Left = 336
    Top = 176
    object xCantidadArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCantidadArtRIC: TIntegerField
      FieldName = 'RIC'
    end
    object xCantidadArtLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xCantidadArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCantidadArtCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object DSxCantidadArt: TDataSource
    DataSet = xCantidadArt
    Left = 424
    Top = 176
  end
  object frIsoDevolucion: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Devoluci'#243'n Material'
    RebuildPrinter = False
    OnGetValue = frIsoDevolucionGetValue
    OnBeforePrint = frIsoDevolucionEnterRect
    OnEnterRect = frIsoDevolucionEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 360
    Top = 40
    ReportForm = {19000000}
  end
  object SPLineaSegDet: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea) linea from iso_devolucion_d'
      'where (ric=?ric)')
    Transaction = TLocal
    AutoTrans = True
    Left = 38
    Top = 286
  end
  object xTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select tercero from emp_proveedores'
      'where empresa=?empresa and proveedor=?codprov')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 240
    Top = 334
    object xTerceroTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSxTercero: TDataSource
    DataSet = xTercero
    Left = 328
    Top = 334
  end
  object xDescTipo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select contador from iso_no_conformidad'
      'where empresa=?empresa and ric=?ric_inc')
    UniDirectional = False
    Left = 348
    Top = 258
    object xDescTipoCONTADOR: TFIBStringField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
  end
  object xDSDescTipo: TDataSource
    DataSet = xDescTipo
    Left = 432
    Top = 258
  end
end
