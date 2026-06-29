object DMLstTickets: TDMLstTickets
  OldCreateOrder = False
  OnCreate = DMLstTicketsCreate
  OnDestroy = DMLstTicketsDestroy
  Left = 484
  Top = 163
  Height = 736
  Width = 1089
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 32
    Top = 8
  end
  object frTicket: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frTicketGetValue
    OnBeforePrint = frTicketEnterRect
    OnEnterRect = frTicketEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 208
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQMCabecera
    Left = 208
    Top = 56
  end
  object frDBDetalle: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQMDetalle
    Left = 208
    Top = 104
  end
  object frDBxCli: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCliente
    Left = 208
    Top = 152
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TICKET_CABECERA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIT=?old_RIT ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TICKET_CABECERA'
      
        '  (S_BASES,I_DTO_PP,DTO_PP,I_DTO_CIAL,S_CUOTA_RE,S_CUOTA_IVA,I_D' +
        'TO_LINEAS,BRUTO,NOTAS,FECHA,ENTRADA,CLIENTE,TERCERO,RVT,RIT,SERI' +
        'E,CAJA,SESION,TURNO,CONTROL_STOCK,LINEAS,DTO_CIAL,MODO_IVA,ESTAD' +
        'O,DESCRIPCION,USUARIO,CANAL,EJERCICIO,EMPRESA,FORMA_PAGO,MONEDA,' +
        'ALMACEN,TIPO,A_DEVOLVER)'
      'VALUES'
      
        '  (?S_BASES,?I_DTO_PP,?DTO_PP,?I_DTO_CIAL,?S_CUOTA_RE,?S_CUOTA_I' +
        'VA,?I_DTO_LINEAS,?BRUTO,?NOTAS,?FECHA,?ENTRADA,?CLIENTE,?TERCERO' +
        ',?RVT,?RIT,?SERIE,?CAJA,?SESION,?TURNO,?CONTROL_STOCK,?LINEAS,?D' +
        'TO_CIAL,?MODO_IVA,?ESTADO,?DESCRIPCION,?USUARIO,?CANAL,?EJERCICI' +
        'O,?EMPRESA,?FORMA_PAGO,?MONEDA,?ALMACEN,?TIPO,?A_DEVOLVER)')
    RefreshSQL.Strings = (
      
        'SELECT CAB.*, NIF.NOMBRE AS NOMBRE_FAC_NIF, NIF.NIF AS NIF_FAC_N' +
        'IF'
      'FROM GES_TICKET_CABECERA CAB'
      
        'LEFT JOIN GES_CABECERAS_S_FAC_NIF NIF ON (CAB.EMPRESA = NIF.EMPR' +
        'ESA AND CAB.EJERCICIO = NIF.EJERCICIO AND CAB.CANAL = NIF.CANAL ' +
        'AND CAB.SERIE = NIF.SERIE AND CAB.TIPO = NIF.TIPO AND CAB.RIT = ' +
        'NIF.RIG)'
      'WHERE '
      'CAB.EMPRESA = ?EMPRESA AND'
      'CAB.EJERCICIO = ?EJERCICIO AND'
      'CAB.CANAL = ?CANAL AND'
      'CAB.SERIE = ?SERIE AND'
      'CAB.TIPO = ?TIPO AND'
      'CAB.RIT = ?RIT')
    SelectSQL.Strings = (
      
        'SELECT CAB.*, NIF.NOMBRE AS NOMBRE_FAC_NIF, NIF.NIF AS NIF_FAC_N' +
        'IF, F.SERIE SERIE_FACTURA, F.RIG RIG_FACTURA,'
      '       F.ID_S ID_S_FACTURA, VF.INFO_QR'
      'FROM GES_TICKET_CABECERA CAB'
      
        'LEFT JOIN GES_CABECERAS_S_FAC_NIF NIF ON CAB.EMPRESA = NIF.EMPRE' +
        'SA AND CAB.EJERCICIO = NIF.EJERCICIO AND CAB.CANAL = NIF.CANAL A' +
        'ND CAB.SERIE = NIF.SERIE AND CAB.TIPO = NIF.TIPO AND CAB.RIT = N' +
        'IF.RIG'
      
        'LEFT JOIN GES_CABECERAS_RELACIONES R ON CAB.ID_TICKET = R.O_ID_S' +
        ' AND CAB.TIPO = R.O_TIPO'
      
        'LEFT JOIN GES_CABECERAS_S F ON R.D_ID_S = F.ID_S AND R.D_TIPO = ' +
        'F.TIPO'
      'LEFT JOIN VF_REGISTRO_ALTA VF ON F.ID_S = VF.ID_S'
      'WHERE'
      'CAB.EMPRESA = ?EMPRESA AND'
      'CAB.EJERCICIO = ?EJERCICIO AND'
      'CAB.CANAL = ?CANAL AND'
      'CAB.SERIE = ?SERIE AND'
      'CAB.TIPO = ?TIPO AND'
      'CAB.RIT = ?RIT')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TICKET_CABECERA'
      'SET'
      '  S_BASES=?S_BASES '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,DTO_PP=?DTO_PP '
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,S_CUOTA_RE=?S_CUOTA_RE '
      '  ,S_CUOTA_IVA=?S_CUOTA_IVA '
      '  ,I_DTO_LINEAS=?I_DTO_LINEAS '
      '  ,BRUTO=?BRUTO '
      '  ,NOTAS=?NOTAS '
      '  ,FECHA=?FECHA '
      '  ,ENTRADA=?ENTRADA '
      '  ,CLIENTE=?CLIENTE '
      '  ,TERCERO=?TERCERO '
      '  ,RVT=?RVT '
      '  ,CAJA=?CAJA '
      '  ,SESION=?SESION '
      '  ,TURNO=?TURNO '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,LINEAS=?LINEAS '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,ESTADO=?ESTADO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,USUARIO=?USUARIO '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,MONEDA=?MONEDA '
      '  ,ALMACEN=?ALMACEN '
      '  ,A_DEVOLVER=?A_DEVOLVER '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT ')
    Plan.Strings = (
      
        'PLAN (GES_TICKET_CABECERA INDEX (PK_GES_TICKET_CABECERA))       ' +
        '     '
      ' ')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIT'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TICKET_CABECERA'
    UpdateTransaction = TLocal
    Left = 32
    Top = 56
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 120
    Top = 56
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TICKET_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIT=?old_RIT AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TICKET_DETALLE'
      
        '  (UNIDADES,PRECIO,P_COSTE,BRUTO,I_DTO_PP,I_DTO_CIAL,I_DESCUENTO' +
        ',B_IMPONIBLE,B_DTO_LINEA,C_IVA,NOTAS,UNIDADES_EXT,TOTAL_LINEA,SE' +
        'RIE,RIT,M_MOV_STOCK,ENTRADA,EMPRESA,EJERCICIO,CANAL,LINEA,TITULO' +
        ',DESCUENTO,TIPO_IVA,P_IVA,P_RECARGO,DTO_PP,DTO_CIAL,IVA_INCLUIDO' +
        ',CANAL_DESTINO,TIPO,ALMACEN,ARTICULO,PAIS,USUARIO)'
      'VALUES'
      
        '  (?UNIDADES,?PRECIO,?P_COSTE,?BRUTO,?I_DTO_PP,?I_DTO_CIAL,?I_DE' +
        'SCUENTO,?B_IMPONIBLE,?B_DTO_LINEA,?C_IVA,?NOTAS,?UNIDADES_EXT,?T' +
        'OTAL_LINEA,?SERIE,?RIT,?M_MOV_STOCK,?ENTRADA,?EMPRESA,?EJERCICIO' +
        ',?CANAL,?LINEA,?TITULO,?DESCUENTO,?TIPO_IVA,?P_IVA,?P_RECARGO,?D' +
        'TO_PP,?DTO_CIAL,?IVA_INCLUIDO,?CANAL_DESTINO,?TIPO,?ALMACEN,?ART' +
        'ICULO,?PAIS,?USUARIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TICKET_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_TICKET_DETALLE'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO = ?TIPO AND'
      'RIT = ?RIT'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TICKET_DETALLE'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,PRECIO=?PRECIO '
      '  ,P_COSTE=?P_COSTE '
      '  ,BRUTO=?BRUTO '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,B_DTO_LINEA=?B_DTO_LINEA '
      '  ,C_IVA=?C_IVA '
      '  ,NOTAS=?NOTAS '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,TOTAL_LINEA=?TOTAL_LINEA '
      '  ,M_MOV_STOCK=?M_MOV_STOCK '
      '  ,ENTRADA=?ENTRADA '
      '  ,TITULO=?TITULO '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,P_IVA=?P_IVA '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,DTO_PP=?DTO_PP '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,IVA_INCLUIDO=?IVA_INCLUIDO '
      '  ,CANAL_DESTINO=?CANAL_DESTINO '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,PAIS=?PAIS '
      '  ,USUARIO=?USUARIO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMCabecera
    Plan.Strings = (
      ' ')
    AfterOpen = QMDetalleAfterOpen
    BeforeClose = QMDetalleBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIT '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TICKET_DETALLE'
    UpdateTransaction = TLocal
    Left = 32
    Top = 104
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 120
    Top = 104
  end
  object xCliente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    SelectSQL.Strings = (
      'select ec.empresa,cu.ejercicio, cu.canal,ec.cliente,ec.tercero,'
      
        '       st.nombre_r_social as titulo,st.nombre_comercial,st.nif,e' +
        'c.riesgo_aut,ec.riesgo_act,ec.agente,'
      
        '       ec.tarifa,ec.descuento_pp,cu.forma_pago, cu.modo_iva, ec.' +
        'descuento_cial,'
      
        '       ec.su_proveedor,cu.moneda,cu.tipo_irpf,ec.por_financiacio' +
        'n,ec.transportista,ec.su_referencia,'
      
        '        di.dir_completa,di.dir_localidad as localidad,lo.titulo ' +
        'as titulo_localidad,'
      '        di.dir_telefono01,di.dir_telefono02,di.dir_telefax '
      '  from con_cuentas_ges_cli cu join emp_clientes ec'
      '  on (ec.cliente=cu.cliente and ec.empresa=cu.empresa)'
      '  join sys_terceros st on (ec.tercero=st.tercero)'
      '  join sys_terceros_direcciones di on (st.tercero=di.tercero)'
      '  join sys_localidades lo on (di.dir_localidad=lo.localidad) '
      'where di.direccion=1 and  '
      '  cu.EMPRESA  =?EMPRESA   AND'
      '  cu.EJERCICIO=?EJERCICIO AND'
      '  cu.CANAL    =?CANAL     AND'
      '  cu.CLIENTE  =?CLIENTE'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMCabecera
    Plan.Strings = (
      ' ')
    AfterOpen = xClienteAfterOpen
    BeforeClose = xClienteBeforeClose
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CLIENTES'
    UpdateTransaction = TLocal
    Left = 32
    Top = 152
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 120
    Top = 152
  end
  object xCajas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT'
      '  EMPRESA, EJERCICIO, CANAL, SERIE, CAJA, '
      ' TITULO, ACTIVA'
      'FROM EMP_CAJAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  CAJA=?CAJA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMCabecera
    Plan.Strings = (
      ' ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CAJAS'
    UpdateTransaction = TLocal
    Left = 32
    Top = 200
  end
  object DSxCajas: TDataSource
    DataSet = xCajas
    Left = 120
    Top = 200
  end
  object frDBxCajas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCajas
    Left = 208
    Top = 200
  end
  object xDesgloseIVA: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TICKET_REDONDEOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  TIPO_IVA=?old_TIPO_IVA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TICKET_REDONDEOS'
      
        '  (LIQUIDO,I_RE,I_IVA,I_DTO_PP,DTO_PP,S_BASES_DTO,S_BASES,RIG,SE' +
        'RIE,P_RE,P_IVA,TIPO_IVA,CANAL,EJERCICIO,EMPRESA,MONEDA,PAIS,TIPO' +
        ')'
      'VALUES'
      
        '  (?LIQUIDO,?I_RE,?I_IVA,?I_DTO_PP,?DTO_PP,?S_BASES_DTO,?S_BASES' +
        ',?RIG,?SERIE,?P_RE,?P_IVA,?TIPO_IVA,?CANAL,?EJERCICIO,?EMPRESA,?' +
        'MONEDA,?PAIS,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TICKET_REDONDEOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  TIPO_IVA=?TIPO_IVA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TICKET_REDONDEOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIT'
      'ORDER BY P_IVA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TICKET_REDONDEOS'
      'SET'
      '  LIQUIDO=?LIQUIDO '
      '  ,I_RE=?I_RE '
      '  ,I_IVA=?I_IVA '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,DTO_PP=?DTO_PP '
      '  ,S_BASES_DTO=?S_BASES_DTO '
      '  ,S_BASES=?S_BASES '
      '  ,P_RE=?P_RE '
      '  ,P_IVA=?P_IVA '
      '  ,MONEDA=?MONEDA '
      '  ,PAIS=?PAIS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  TIPO_IVA=?TIPO_IVA ')
    DataSource = DSQMCabecera
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'TIPO_IVA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TICKET_REDONDEOS'
    UpdateTransaction = TLocal
    Left = 32
    Top = 296
  end
  object frDBxDesgloseIVA: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDesgloseIVA
    Left = 208
    Top = 296
  end
  object DSxDesgloseIVA: TDataSource
    DataSet = xDesgloseIVA
    Left = 120
    Top = 296
  end
  object xUsuarios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_USUARIOS'
      'WHERE'
      '  USUARIO=?old_USUARIO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_USUARIOS'
      
        '  (COLOR_MENU_2_ON,COLOR_MENU_1_OFF,COLOR_MENU_2_OFF,COLOR_MENU_' +
        '1_ON,FECHA_TRABAJO,COLOR_NAV_ACTIVO,COLOR_NAV_INACTIVO,MODO_ENTE' +
        'R,MODO_CIERRA_FORM,PERFIL,MEMORIZAR_FECHA,CANAL,ICONOS_SIMPLES,E' +
        'MPRESA,NIVEL,USUARIO,EJERCICIO,ACTIVO,MENU_LEFT,MENU_TOP,CLAVE,N' +
        'OMBRE,LENGUA)'
      'VALUES'
      
        '  (?COLOR_MENU_2_ON,?COLOR_MENU_1_OFF,?COLOR_MENU_2_OFF,?COLOR_M' +
        'ENU_1_ON,?FECHA_TRABAJO,?COLOR_NAV_ACTIVO,?COLOR_NAV_INACTIVO,?M' +
        'ODO_ENTER,?MODO_CIERRA_FORM,?PERFIL,?MEMORIZAR_FECHA,?CANAL,?ICO' +
        'NOS_SIMPLES,?EMPRESA,?NIVEL,?USUARIO,?EJERCICIO,?ACTIVO,?MENU_LE' +
        'FT,?MENU_TOP,?CLAVE,?NOMBRE,?LENGUA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_USUARIOS'
      'WHERE'
      '  USUARIO=?USUARIO ')
    SelectSQL.Strings = (
      'SELECT USUARIO, NOMBRE FROM SYS_USUARIOS'
      'WHERE USUARIO = ?USUARIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_USUARIOS'
      'SET'
      '  COLOR_MENU_2_ON=?COLOR_MENU_2_ON '
      '  ,COLOR_MENU_1_OFF=?COLOR_MENU_1_OFF '
      '  ,COLOR_MENU_2_OFF=?COLOR_MENU_2_OFF '
      '  ,COLOR_MENU_1_ON=?COLOR_MENU_1_ON '
      '  ,FECHA_TRABAJO=?FECHA_TRABAJO '
      '  ,COLOR_NAV_ACTIVO=?COLOR_NAV_ACTIVO '
      '  ,COLOR_NAV_INACTIVO=?COLOR_NAV_INACTIVO '
      '  ,MODO_ENTER=?MODO_ENTER '
      '  ,MODO_CIERRA_FORM=?MODO_CIERRA_FORM '
      '  ,PERFIL=?PERFIL '
      '  ,MEMORIZAR_FECHA=?MEMORIZAR_FECHA '
      '  ,CANAL=?CANAL '
      '  ,ICONOS_SIMPLES=?ICONOS_SIMPLES '
      '  ,EMPRESA=?EMPRESA '
      '  ,NIVEL=?NIVEL '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,ACTIVO=?ACTIVO '
      '  ,MENU_LEFT=?MENU_LEFT '
      '  ,MENU_TOP=?MENU_TOP '
      '  ,CLAVE=?CLAVE '
      '  ,NOMBRE=?NOMBRE '
      '  ,LENGUA=?LENGUA '
      'WHERE'
      '  USUARIO=?USUARIO ')
    DataSource = DSQMCabecera
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'USUARIO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_USUARIOS'
    UpdateTransaction = TLocal
    Left = 32
    Top = 248
  end
  object DSxUsuarios: TDataSource
    DataSet = xUsuarios
    Left = 120
    Top = 248
  end
  object frDBxUsuarios: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxUsuarios
    Left = 208
    Top = 248
  end
  object xFormaPagos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TICKET_FP'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIT=?old_RIT AND '
      '  FORMA_PAGO=?old_FORMA_PAGO ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TICKET_FP'
      
        '  (TOTAL_COBRADO,TOTAL_ENTREGADO,SERIE,RIT,EMPRESA,EJERCICIO,CAN' +
        'AL,TIPO,FORMA_PAGO)'
      'VALUES'
      
        '  (?TOTAL_COBRADO,?TOTAL_ENTREGADO,?SERIE,?RIT,?EMPRESA,?EJERCIC' +
        'IO,?CANAL,?TIPO,?FORMA_PAGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TICKET_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_TICKET_FP'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL'
      'AND SERIE =?SERIE'
      'AND RIT = ?RIT'
      'AND TIPO =?TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TICKET_FP'
      'SET'
      '  TOTAL_COBRADO=?TOTAL_COBRADO '
      '  ,TOTAL_ENTREGADO=?TOTAL_ENTREGADO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    DataSource = DSQMCabecera
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIT '
      'FORMA_PAGO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TICKET_FP'
    UpdateTransaction = TLocal
    Left = 32
    Top = 344
  end
  object frDBxFormaPagos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxFormaPagos
    Left = 208
    Top = 344
  end
  object DSxFormaPagos: TDataSource
    DataSet = xFormaPagos
    Left = 120
    Top = 344
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 603
    ValorGrupo = 86
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 35
    Opciones.Pagina.Ancho = 40
    Opciones.Pagina.Tamanyo = 35
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Ticket Matricial'
    ControlaLongitud = False
    OnEnterFields = HYReportEnterFields
    Left = 392
    Top = 8
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = False
    Left = 392
    Top = 56
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = False
    Left = 392
    Top = 104
  end
  object HYRSCliente: THYReportSource
    DataSet = xCliente
    CloseDataset = False
    Left = 392
    Top = 152
  end
  object HYRSCajas: THYReportSource
    DataSet = xCajas
    CloseDataset = False
    Left = 392
    Top = 200
  end
  object HYRSUsuarios: THYReportSource
    DataSet = xUsuarios
    CloseDataset = False
    Left = 392
    Top = 248
  end
  object HYRSDesgloseIVA: THYReportSource
    DataSet = xDesgloseIVA
    CloseDataset = False
    Left = 392
    Top = 296
  end
  object HYRSFormaPago: THYReportSource
    DataSet = xFormaPagos
    CloseDataset = False
    Left = 392
    Top = 344
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE '
      'EMPRESA = :EMPRESA AND '
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ARTICULO = :ARTICULO')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 32
    Top = 392
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 120
    Top = 392
  end
  object frDBxArticulos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxArticulos
    Left = 208
    Top = 392
  end
  object HYRSxArticulos: THYReportSource
    DataSet = xArticulos
    CloseDataset = False
    Left = 392
    Top = 392
  end
  object xEntregas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_ENTREGAS'
      '  where id_entrega=?ID'
      '  order by cliente,id_entrega')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      ' ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CLIENTES_ENTREGAS'
    UpdateTransaction = TLocal
    Left = 32
    Top = 440
  end
  object DSxEntregas: TDataSource
    DataSet = xEntregas
    Left = 120
    Top = 440
  end
  object frDBxEntregas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxEntregas
    Left = 208
    Top = 440
  end
  object frDBxVales: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxVales
    Left = 208
    Top = 536
  end
  object DSxVales: TDataSource
    DataSet = xVales
    Left = 120
    Top = 536
  end
  object xVales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_VALES'
      '  where id_vale=?id'
      '  order by cliente,id_vale')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      ' ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CLIENTES_VALES'
    UpdateTransaction = TLocal
    Left = 32
    Top = 536
  end
  object xAbonos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CLIENTES_VALES'
      'WHERE'
      '  ID_VALE=?old_ID_VALE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CLIENTES_VALES'
      
        '  (EMPRESA,CLIENTE,SESION,CAJA,TURNO,ID_VALE,REFERENCIA,FECHA_VA' +
        'LE,FECHA_FIN_VALIDEZ,FECHA_CANCELACION,IMPORTE,IMPORTE_CANCELACI' +
        'ON,USUARIO_VALE,USUARIO_CANCELACION,FECHA_DOCUMENTO_EMISION,TIPO' +
        '_DOCUMENTO_DEVOLUCION,ID_DOCUMENTO_DEVOLUCION,FECHA_DOCUMENTO_CA' +
        'NCELACION,TIPO_DOCUMENTO_CANCELACION,TIPO_DOCUMENTO_EMISION,ID_D' +
        'OCUMENTO_EMISION,FECHA_DOCUMENTO_DEVOLUCION,EJERCICIO_RIC,CANAL_' +
        'RIC,RIC,EJERCICIO_RIC_CIERRE,CANAL_RIC_CIERRE,RIC_CIERRE,CLIENTE' +
        '_INICIAL,EJERCICIO,CANAL,SERIE,ID_DOCUMENTO_CANCELACION,ESTADO,N' +
        'OTAS)'
      'VALUES'
      
        '  (?EMPRESA,?CLIENTE,?SESION,?CAJA,?TURNO,?ID_VALE,?REFERENCIA,?' +
        'FECHA_VALE,?FECHA_FIN_VALIDEZ,?FECHA_CANCELACION,?IMPORTE,?IMPOR' +
        'TE_CANCELACION,?USUARIO_VALE,?USUARIO_CANCELACION,?FECHA_DOCUMEN' +
        'TO_EMISION,?TIPO_DOCUMENTO_DEVOLUCION,?ID_DOCUMENTO_DEVOLUCION,?' +
        'FECHA_DOCUMENTO_CANCELACION,?TIPO_DOCUMENTO_CANCELACION,?TIPO_DO' +
        'CUMENTO_EMISION,?ID_DOCUMENTO_EMISION,?FECHA_DOCUMENTO_DEVOLUCIO' +
        'N,?EJERCICIO_RIC,?CANAL_RIC,?RIC,?EJERCICIO_RIC_CIERRE,?CANAL_RI' +
        'C_CIERRE,?RIC_CIERRE,?CLIENTE_INICIAL,?EJERCICIO,?CANAL,?SERIE,?' +
        'ID_DOCUMENTO_CANCELACION,?ESTADO,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CLIENTES_VALES'
      'WHERE'
      '  ID_VALE=?ID_VALE AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CLIENTES_VALES'
      '  where id_documento_devolucion=?id_ticket')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CLIENTES_VALES'
      'SET'
      '  CLIENTE=?CLIENTE '
      '  ,SESION=?SESION '
      '  ,CAJA=?CAJA '
      '  ,TURNO=?TURNO '
      '  ,REFERENCIA=?REFERENCIA '
      '  ,FECHA_VALE=?FECHA_VALE '
      '  ,FECHA_FIN_VALIDEZ=?FECHA_FIN_VALIDEZ '
      '  ,FECHA_CANCELACION=?FECHA_CANCELACION '
      '  ,IMPORTE=?IMPORTE '
      '  ,IMPORTE_CANCELACION=?IMPORTE_CANCELACION '
      '  ,USUARIO_VALE=?USUARIO_VALE '
      '  ,USUARIO_CANCELACION=?USUARIO_CANCELACION '
      '  ,FECHA_DOCUMENTO_EMISION=?FECHA_DOCUMENTO_EMISION '
      '  ,TIPO_DOCUMENTO_DEVOLUCION=?TIPO_DOCUMENTO_DEVOLUCION '
      '  ,ID_DOCUMENTO_DEVOLUCION=?ID_DOCUMENTO_DEVOLUCION '
      '  ,FECHA_DOCUMENTO_CANCELACION=?FECHA_DOCUMENTO_CANCELACION '
      '  ,TIPO_DOCUMENTO_CANCELACION=?TIPO_DOCUMENTO_CANCELACION '
      '  ,TIPO_DOCUMENTO_EMISION=?TIPO_DOCUMENTO_EMISION '
      '  ,ID_DOCUMENTO_EMISION=?ID_DOCUMENTO_EMISION '
      '  ,FECHA_DOCUMENTO_DEVOLUCION=?FECHA_DOCUMENTO_DEVOLUCION '
      '  ,EJERCICIO_RIC=?EJERCICIO_RIC '
      '  ,CANAL_RIC=?CANAL_RIC '
      '  ,RIC=?RIC '
      '  ,EJERCICIO_RIC_CIERRE=?EJERCICIO_RIC_CIERRE '
      '  ,CANAL_RIC_CIERRE=?CANAL_RIC_CIERRE '
      '  ,RIC_CIERRE=?RIC_CIERRE '
      '  ,CLIENTE_INICIAL=?CLIENTE_INICIAL '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,ID_DOCUMENTO_CANCELACION=?ID_DOCUMENTO_CANCELACION '
      '  ,ESTADO=?ESTADO '
      '  ,NOTAS=?NOTAS '
      'WHERE'
      '  ID_VALE=?ID_VALE AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCabecera
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_VALE '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CLIENTES_VALES'
    UpdateTransaction = TLocal
    Left = 32
    Top = 488
  end
  object DSxAbonos: TDataSource
    DataSet = xAbonos
    Left = 120
    Top = 488
  end
  object frDBxAbonos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxAbonos
    Left = 208
    Top = 488
  end
  object DSxReservas: TDataSource
    DataSet = xReservas
    Left = 120
    Top = 584
  end
  object xReservas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CLIENTES_RESERVAS'
      'WHERE'
      '  ID_RESERVA=?old_ID_RESERVA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CLIENTES_RESERVAS'
      
        '  (EMPRESA,CLIENTE,NOMBRE_R_SOCIAL,EJERCICIO,CANAL,SERIE,SESION,' +
        'CAJA,TURNO,ALMACEN,FECHA_RESERVA,ID_RESERVA,REFERENCIA,ARTICULO,' +
        'TITULO_ARTICULO,ID_A,UNIDADES,PRECIO,DESCUENTO,IMPORTE,FECHA_FIN' +
        'AL_RESERVA,NOTAS,IMPORTE_ENTREGADO,ESTADO,TITULO_ESTADO,USUARIO_' +
        'RESERVA,USUARIO_CANCELACION,ID_TICKET)'
      'VALUES'
      
        '  (?EMPRESA,?CLIENTE,?NOMBRE_R_SOCIAL,?EJERCICIO,?CANAL,?SERIE,?' +
        'SESION,?CAJA,?TURNO,?ALMACEN,?FECHA_RESERVA,?ID_RESERVA,?REFEREN' +
        'CIA,?ARTICULO,?TITULO_ARTICULO,?ID_A,?UNIDADES,?PRECIO,?DESCUENT' +
        'O,?IMPORTE,?FECHA_FINAL_RESERVA,?NOTAS,?IMPORTE_ENTREGADO,?ESTAD' +
        'O,?TITULO_ESTADO,?USUARIO_RESERVA,?USUARIO_CANCELACION,?ID_TICKE' +
        'T)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CLIENTES_RESERVAS'
      'WHERE'
      '  ID_RESERVA=?ID_RESERVA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_RESERVAS r'
      'left join ver_clientes_entregas e'
      'on (e.id_reserva=r.id_reserva)'
      'where r.id_reserva=?id'
      '  order by r.cliente,r.id_reserva')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CLIENTES_RESERVAS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,CLIENTE=?CLIENTE '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,SESION=?SESION '
      '  ,CAJA=?CAJA '
      '  ,TURNO=?TURNO '
      '  ,ALMACEN=?ALMACEN '
      '  ,FECHA_RESERVA=?FECHA_RESERVA '
      '  ,REFERENCIA=?REFERENCIA '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,ID_A=?ID_A '
      '  ,UNIDADES=?UNIDADES '
      '  ,PRECIO=?PRECIO '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,IMPORTE=?IMPORTE '
      '  ,FECHA_FINAL_RESERVA=?FECHA_FINAL_RESERVA '
      '  ,NOTAS=?NOTAS '
      '  ,IMPORTE_ENTREGADO=?IMPORTE_ENTREGADO '
      '  ,ESTADO=?ESTADO '
      '  ,TITULO_ESTADO=?TITULO_ESTADO '
      '  ,USUARIO_RESERVA=?USUARIO_RESERVA '
      '  ,USUARIO_CANCELACION=?USUARIO_CANCELACION '
      '  ,ID_TICKET=?ID_TICKET '
      'WHERE'
      '  ID_RESERVA=?ID_RESERVA ')
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_RESERVA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CLIENTES_RESERVAS'
    UpdateTransaction = TLocal
    Left = 32
    Top = 584
  end
  object frDBxReservas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxReservas
    Left = 208
    Top = 584
  end
  object frxTicket: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38832.6717250694
    ReportOptions.LastChange = 38832.6751224306
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure DatosSubdetalle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with DatosSubdetalle1, Engine do'
      '  begin'
      
        '  if ([QMDetalle."DESCUENTO"]>0) then visible:=True else visible' +
        ':=False;'
      '  end'
      'end;'
      ''
      'procedure Hija1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Hija1, Engine do'
      '  begin'
      '  visible:=([xAbonos."ID_DOCUMENTO_DEVOLUCION"]>0);'
      '  end'
      'end;'
      ''
      'procedure Memo31OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo31, Engine do'
      '  begin'
      
        'if ([QMDetalle."DESCUENTO"]>0) then visible:=True else visible:=' +
        'false;'
      '  end'
      'end;'
      ''
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo21, Engine do'
      '  begin'
      
        '  if ([xEnVales."EN_VALES"]<>0) then visible:=true else visible:' +
        '=false;'
      '  end'
      'end;'
      ''
      'procedure Memo22OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo22, Engine do'
      '  begin'
      
        '  if ([xEnEntregas."EN_ENTREGAS"]<>0) then visible:=true else vi' +
        'sible:=false;'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxTicketBeforePrint
    OnGetValue = frTicketGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 296
    Top = 8
    Datasets = <
      item
        DataSet = frxDBDetalle
        DataSetName = 'frxDBDetalle'
      end
      item
        DataSet = frxDBxEntregas
        DataSetName = 'frDBxEntregas'
      end
      item
        DataSet = frxDBxUsuarios
        DataSetName = 'frDBxUsuarios'
      end
      item
        DataSet = frxDBCabecera
        DataSetName = 'frxDBCabecera'
      end
      item
        DataSet = frxDBxAbonos
        DataSetName = 'frxDBxAbonos'
      end
      item
        DataSet = frxDBxArticulos
        DataSetName = 'frxDBxArticulos'
      end
      item
        DataSet = frxDBxCajas
        DataSetName = 'frxDBxCajas'
      end
      item
        DataSet = frxDBxCli
        DataSetName = 'frxDBxCli'
      end
      item
        DataSet = frxDBxDesgloseIVA
        DataSetName = 'frxDBxDesgloseIVA'
      end
      item
        DataSet = frxDBxFormaPagos
        DataSetName = 'frxDBxFormaPagos'
      end
      item
        DataSet = frxDBxVales
        DataSetName = 'frxDBxVales'
      end>
    Variables = <
      item
        Name = ' Cabecera'
        Value = ''
      end
      item
        Name = 'Empresa'
        Value = 'xCli."TITULO"'
      end
      item
        Name = 'CIF'
        Value = ''
      end
      item
        Name = 'FechaYHora'
        Value = 'frxDBCabecera."FECHA"'
      end
      item
        Name = 'Cliente'
        Value = 'frxDBCabecera."CLIENTE"'
      end
      item
        Name = 'NombreCli '
        Value = 'frxDBxCli."TITULO"'
      end
      item
        Name = 'Serie'
        Value = 'frxDBCabecera."SERIE"'
      end
      item
        Name = 'RIT'
        Value = 'frxDBCabecera."RIT"'
      end
      item
        Name = 'Sesion'
        Value = 'frxDBCabecera."SESION"'
      end
      item
        Name = 'Caja '
        Value = 'frxDBCabecera."CAJA"'
      end
      item
        Name = 'Turno'
        Value = 'frxDBCabecera."TURNO"'
      end
      item
        Name = ' Detalle'
        Value = ''
      end
      item
        Name = 'Articulo'
        Value = 'frDBDetalle."ARTICULO"'
      end
      item
        Name = 'Titulo'
        Value = 'frDBDetalle."TITULO"'
      end
      item
        Name = 'Unidades'
        Value = 'frDBDetalle."UNIDADES"'
      end
      item
        Name = 'Precio'
        Value = 'frDBDetalle."PRECIO"'
      end
      item
        Name = 'Total_Linea'
        Value = 'frDBDetalle."B_DTO_LINEA"'
      end
      item
        Name = ' Desglose IVA'
        Value = ''
      end
      item
        Name = 'P_IVA'
        Value = 'frxDBxDesgloseIVA."P_IVA"'
      end
      item
        Name = 'I_IVA'
        Value = 'frxDBxDesgloseIVA."I_IVA"'
      end
      item
        Name = 'BaseIVA'
        Value = 'frxDBxDesgloseIVA."S_BASES_DTO"'
      end
      item
        Name = ' Formas Pago'
        Value = ''
      end
      item
        Name = 'Forma_Pago'
        Value = ''
      end
      item
        Name = 'Total_Cobrado'
        Value = 'frxDBxFormaPagos."TOTAL_COBRADO"'
      end
      item
        Name = 'Total_Entregado'
        Value = 'frxDBxFormaPagos."TOTAL_ENTREGADO"'
      end
      item
        Name = ' Pie'
        Value = ''
      end
      item
        Name = 'Total'
        Value = 'frxDBCabecera."LIQUIDO"'
      end
      item
        Name = 'TotalE'
        Value = ''
      end
      item
        Name = 'A_Devolver'
        Value = 'frxDBCabecera."A_DEVOLVER"'
      end
      item
        Name = 'Usuario'
        Value = 'frDBxUsuarios."NOMBRE"'
      end
      item
        Name = ' Varios'
        Value = ''
      end
      item
        Name = 'MascaraN'
        Value = '0'
      end
      item
        Name = 'MascaraL'
        Value = '0'
      end
      item
        Name = 'MascaraI'
        Value = '0'
      end
      item
        Name = 'MascaraP'
        Value = '0'
      end
      item
        Name = 'MascaraE'
        Value = '0'
      end
      item
        Name = 'L'
        Value = ''
      end>
    Style = <>
  end
  object frxDBCabecera: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSQMCabecera
    Left = 296
    Top = 56
  end
  object frxDBDetalle: TfrxDBDataset
    UserName = 'frxDBDetalle'
    CloseDataSource = False
    DataSource = DSQMDetalle
    Left = 296
    Top = 104
  end
  object frxDBxCli: TfrxDBDataset
    UserName = 'frxDBxCli'
    CloseDataSource = False
    DataSource = DSxCliente
    Left = 296
    Top = 152
  end
  object frxDBxCajas: TfrxDBDataset
    UserName = 'frxDBxCajas'
    CloseDataSource = False
    DataSource = DSxCajas
    Left = 296
    Top = 200
  end
  object frxDBxUsuarios: TfrxDBDataset
    UserName = 'frDBxUsuarios'
    CloseDataSource = False
    DataSource = DSxUsuarios
    Left = 296
    Top = 248
  end
  object frxDBxDesgloseIVA: TfrxDBDataset
    UserName = 'frxDBxDesgloseIVA'
    CloseDataSource = False
    DataSource = DSxDesgloseIVA
    Left = 296
    Top = 296
  end
  object frxDBxFormaPagos: TfrxDBDataset
    UserName = 'frxDBxFormaPagos'
    CloseDataSource = False
    DataSource = DSxFormaPagos
    Left = 296
    Top = 344
  end
  object frxDBxArticulos: TfrxDBDataset
    UserName = 'frxDBxArticulos'
    CloseDataSource = False
    DataSource = DSxArticulos
    Left = 296
    Top = 392
  end
  object frxDBxEntregas: TfrxDBDataset
    UserName = 'frDBxEntregas'
    CloseDataSource = False
    DataSource = DSxEntregas
    Left = 296
    Top = 440
  end
  object frxDBxAbonos: TfrxDBDataset
    UserName = 'frxDBxAbonos'
    CloseDataSource = False
    DataSource = DSxAbonos
    Left = 296
    Top = 488
  end
  object frxDBxVales: TfrxDBDataset
    UserName = 'frxDBxVales'
    CloseDataSource = False
    DataSource = DSxVales
    Left = 296
    Top = 536
  end
  object frxDBxReservas: TfrxDBDataset
    UserName = 'DSxReservas'
    CloseDataSource = False
    DataSource = DSxReservas
    Left = 296
    Top = 584
  end
  object xTicketVales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT ID_VALE FROM EMP_CLIENTES_VALES'
      'WHERE ID_DOCUMENTO_DEVOLUCION=?ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      ' ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CLIENTES_VALES'
    UpdateTransaction = TLocal
    Left = 512
    Top = 56
  end
  object frDBxSeries: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxSeries
    Left = 208
    Top = 632
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 120
    Top = 632
  end
  object frxDBxSeries: TfrxDBDataset
    UserName = 'frxDBxSeries'
    CloseDataSource = False
    FieldAliases.Strings = (
      'SERIE=SERIE'
      'TITULO=TITULO')
    DataSource = DSxSeries
    Left = 296
    Top = 632
  end
  object xSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT SERIE, TITULO FROM SYS_SERIES'
      'WHERE '
      '  SERIE=?SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      ' ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CLIENTES'
    UpdateTransaction = TLocal
    Left = 32
    Top = 632
  end
  object xEnEntregas: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select sum(importe_cancelacion) as en_entregas'
      '  from emp_clientes_entregas'
      '  where id_ticket=?id_ticket')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    Left = 512
    Top = 152
  end
  object xEnVales: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select sum(importe_cancelacion) as en_vales'
      '  from emp_clientes_vales'
      '  where id_documento_cancelacion=?id_ticket')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    Left = 512
    Top = 104
  end
  object xAgente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_AGENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  AGENTE=?old_AGENTE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_AGENTES_CUENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,AGENTE,P_COMISION,TERCERO,NOTAS,CUE' +
        'NTA,CUENTA_PAGO,CUENTA_PGC,TITULO,'#13#10'TIT_LOCALIDAD,CODIGO_POSTAL,' +
        'BAJA,FECHA_BAJA,MOTIVO_BAJA,WEB_LOGIN,WEB_PASS,ENTRADA_WEB,ENVIA' +
        'R_COPIA_OFC,ENVIAR_COPIA_PEC,'#13#10'ENVIAR_COPIA_ALB,ENVIAR_COPIA_FAC' +
        ',FECHA_ALTA,CODIGO_NTV,TITULO_REGION,TITULO_PROVINCIA,TITULO_POB' +
        'LACION,TITULO_CODIGO_POSTAL)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?AGENTE,?P_COMISION,?TERCERO,?NO' +
        'TAS,?CUENTA,?CUENTA_PAGO,?CUENTA_PGC,?TITULO,'#13#10'?TIT_LOCALIDAD,?C' +
        'ODIGO_POSTAL,?BAJA,?FECHA_BAJA,?MOTIVO_BAJA,?WEB_LOGIN,?WEB_PASS' +
        ',?ENTRADA_WEB,?ENVIAR_COPIA_OFC,?ENVIAR_COPIA_PEC,'#13#10'?ENVIAR_COPI' +
        'A_ALB,?ENVIAR_COPIA_FAC,?FECHA_ALTA,?CODIGO_NTV,?TITULO_REGION,?' +
        'TITULO_PROVINCIA,?TITULO_POBLACION,?TITULO_CODIGO_POSTAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_AGENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_AGENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_AGENTES_CUENTAS'
      'SET'
      '  P_COMISION=?P_COMISION '
      '  ,TERCERO=?TERCERO '
      '  ,NOTAS=?NOTAS '
      '  ,CUENTA=?CUENTA '
      '  ,CUENTA_PAGO=?CUENTA_PAGO '
      '  ,CUENTA_PGC=?CUENTA_PGC '
      '  ,TITULO=?TITULO '
      '  ,TIT_LOCALIDAD=?TIT_LOCALIDAD '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,BAJA=?BAJA '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,MOTIVO_BAJA=?MOTIVO_BAJA '
      '  ,WEB_LOGIN=?WEB_LOGIN '
      '  ,WEB_PASS=?WEB_PASS '
      '  ,ENTRADA_WEB=?ENTRADA_WEB '
      '  ,ENVIAR_COPIA_OFC=?ENVIAR_COPIA_OFC '
      '  ,ENVIAR_COPIA_PEC=?ENVIAR_COPIA_PEC '
      '  ,ENVIAR_COPIA_ALB=?ENVIAR_COPIA_ALB '
      '  ,ENVIAR_COPIA_FAC=?ENVIAR_COPIA_FAC '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,CODIGO_NTV=?CODIGO_NTV '
      '  ,TITULO_REGION=?TITULO_REGION '
      '  ,TITULO_PROVINCIA=?TITULO_PROVINCIA '
      '  ,TITULO_POBLACION=?TITULO_POBLACION '
      '  ,TITULO_CODIGO_POSTAL=?TITULO_CODIGO_POSTAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE ')
    DataSource = DSxCliente
    Plan.Strings = (
      
        'PLAN (GES_TICKET_CABECERA INDEX (PK_GES_TICKET_CABECERA))       ' +
        '     '
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'AGENTE ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_AGENTES_CUENTAS'
    UpdateTransaction = TLocal
    Left = 512
    Top = 8
  end
  object DSxAgente: TDataSource
    DataSet = xAgente
    Left = 600
    Top = 8
  end
end
