object DMProyectos: TDMProyectos
  OldCreateOrder = False
  OnCreate = DMProyectosCreate
  OnDestroy = DataModuleDestroy
  Left = 621
  Top = 261
  Height = 498
  Width = 601
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 280
    Top = 16
  end
  object QMProyectos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_PROYECTOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  PROYECTO=?old_PROYECTO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_PROYECTOS'
      
        '  (EMPRESA,'#13#10'PROYECTO,CANAL_NULL,CLIENTE_NULL,AGENTE_NULL,FECHA_' +
        'INICIO,FECHA_FINAL,TITULO,NOTAS,CERRADO,COMPRAS,'#13#10'VENTAS,OTROS,E' +
        'MPLEADOS,CONTABILIDAD_ANALITICA,PLAN_CONTABLE,SUFIJO_CONTABLE,IN' +
        'DICE_SUFIJO,ACTUALIZA_ESTRUCTURA_ANALITICA,ID_P,'#13#10'CODIGO_INTERNO' +
        ',TERCERO_NULL,KILOMETROS_DESTINO,DIRECCION_TERCERO_NULL,SERIE,CO' +
        'DIGO_POSTAL,TITULO_LOCALIDAD,TITULO_PROVINCIA,TITULO_PAIS,'#13#10'HORA' +
        'RIO_1_DESDE,HORARIO_1_HASTA,HORARIO_2_DESDE,HORARIO_2_HASTA,NIF,' +
        'NOMBRE_R_SOCIAL,NOMBRE_AGENTE,DIRECCION_MANUAL)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?PROYECTO,?CANAL_NULL,?CLIENTE_NULL,?AGENTE_NULL,?' +
        'FECHA_INICIO,?FECHA_FINAL,?TITULO,?NOTAS,?CERRADO,?COMPRAS,'#13#10'?VE' +
        'NTAS,?OTROS,?EMPLEADOS,?CONTABILIDAD_ANALITICA,?PLAN_CONTABLE,?S' +
        'UFIJO_CONTABLE,?INDICE_SUFIJO,?ACTUALIZA_ESTRUCTURA_ANALITICA,?I' +
        'D_P,'#13#10'?CODIGO_INTERNO,?TERCERO_NULL,?KILOMETROS_DESTINO,?DIRECCI' +
        'ON_TERCERO_NULL,?SERIE,?CODIGO_POSTAL,?TITULO_LOCALIDAD,?TITULO_' +
        'PROVINCIA,?TITULO_PAIS,'#13#10'?HORARIO_1_DESDE,?HORARIO_1_HASTA,?HORA' +
        'RIO_2_DESDE,?HORARIO_2_HASTA,?NIF,?NOMBRE_R_SOCIAL,?NOMBRE_AGENT' +
        'E,?DIRECCION_MANUAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_PROYECTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROYECTO=?PROYECTO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_PROYECTOS'
      'WHERE '
      'EMPRESA = ?EMPRESA'
      'ORDER BY PROYECTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_PROYECTOS'
      'SET'
      '  CANAL_NULL=?CANAL_NULL '
      '  ,CLIENTE_NULL=?CLIENTE_NULL '
      '  ,AGENTE_NULL=?AGENTE_NULL '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_FINAL=?FECHA_FINAL '
      '  ,TITULO=?TITULO '
      '  ,NOTAS=?NOTAS '
      '  ,CERRADO=?CERRADO '
      '  ,COMPRAS=?COMPRAS '
      '  ,VENTAS=?VENTAS '
      '  ,OTROS=?OTROS '
      '  ,EMPLEADOS=?EMPLEADOS '
      '  ,CONTABILIDAD_ANALITICA=?CONTABILIDAD_ANALITICA '
      '  ,PLAN_CONTABLE=?PLAN_CONTABLE '
      '  ,SUFIJO_CONTABLE=?SUFIJO_CONTABLE '
      '  ,INDICE_SUFIJO=?INDICE_SUFIJO '
      
        '  ,ACTUALIZA_ESTRUCTURA_ANALITICA=?ACTUALIZA_ESTRUCTURA_ANALITIC' +
        'A '
      '  ,ID_P=?ID_P '
      '  ,CODIGO_INTERNO=?CODIGO_INTERNO '
      '  ,TERCERO_NULL=?TERCERO_NULL '
      '  ,KILOMETROS_DESTINO=?KILOMETROS_DESTINO '
      '  ,DIRECCION_TERCERO_NULL=?DIRECCION_TERCERO_NULL '
      '  ,SERIE=?SERIE '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,TITULO_LOCALIDAD=?TITULO_LOCALIDAD '
      '  ,TITULO_PROVINCIA=?TITULO_PROVINCIA '
      '  ,TITULO_PAIS=?TITULO_PAIS '
      '  ,HORARIO_1_DESDE=?HORARIO_1_DESDE '
      '  ,HORARIO_1_HASTA=?HORARIO_1_HASTA '
      '  ,HORARIO_2_DESDE=?HORARIO_2_DESDE '
      '  ,HORARIO_2_HASTA=?HORARIO_2_HASTA '
      '  ,NIF=?NIF '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,NOMBRE_AGENTE=?NOMBRE_AGENTE '
      '  ,DIRECCION_MANUAL=?DIRECCION_MANUAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROYECTO=?PROYECTO ')
    AfterDelete = Graba
    AfterOpen = QMProyectosAfterOpen
    AfterPost = Graba
    BeforePost = QMProyectosBeforePost
    OnNewRecord = QMProyectosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'PROYECTO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_PROYECTOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMProyectosCANAL_NULL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_NULL'
    end
    object QMProyectosCLIENTE_NULL: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE_NULL'
    end
    object QMProyectosCOMPRAS: TFloatField
      DisplayLabel = 'Compras'
      FieldName = 'COMPRAS'
      ReadOnly = True
    end
    object QMProyectosVENTAS: TFloatField
      DisplayLabel = 'Ventas'
      FieldName = 'VENTAS'
      ReadOnly = True
    end
    object QMProyectosOTROS: TFloatField
      DisplayLabel = 'Otros'
      FieldName = 'OTROS'
      ReadOnly = True
    end
    object QMProyectosBENEFICIOS: TFloatField
      DisplayLabel = 'Beneficios'
      FieldName = 'BENEFICIOS'
      ReadOnly = True
    end
    object QMProyectosPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMProyectosFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object QMProyectosFECHA_FINAL: TDateTimeField
      DisplayLabel = 'Fec. Fin'
      FieldName = 'FECHA_FINAL'
    end
    object QMProyectosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMProyectosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMProyectosCERRADO: TIntegerField
      DisplayLabel = 'Cerrado'
      FieldName = 'CERRADO'
    end
    object QMProyectosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProyectosCONTABILIDAD_ANALITICA: TIntegerField
      DisplayLabel = 'Contb. Analitica'
      FieldName = 'CONTABILIDAD_ANALITICA'
    end
    object QMProyectosPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      OnChange = QMProyectosPLAN_CONTABLEChange
      Size = 10
    end
    object QMProyectosSUFIJO_CONTABLE: TFIBStringField
      DisplayLabel = 'Sufijo Cont.'
      FieldName = 'SUFIJO_CONTABLE'
      Size = 15
    end
    object QMProyectosINDICE_SUFIJO: TIntegerField
      DisplayLabel = 'Ind. Sufijo'
      FieldName = 'INDICE_SUFIJO'
    end
    object QMProyectosACTUALIZA_ESTRUCTURA_ANALITICA: TIntegerField
      DisplayLabel = 'Act. Estruct. Analitica'
      FieldName = 'ACTUALIZA_ESTRUCTURA_ANALITICA'
    end
    object QMProyectosID_P: TIntegerField
      DisplayLabel = 'Id Proyecyo'
      FieldName = 'ID_P'
    end
    object QMProyectosCODIGO_INTERNO: TFIBStringField
      DisplayLabel = 'C'#243'd. Interno'
      FieldName = 'CODIGO_INTERNO'
      Size = 25
    end
    object QMProyectosTERCERO_NULL: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO_NULL'
      OnChange = QMProyectosTERCERO_NULLChange
    end
    object QMProyectosKILOMETROS_DESTINO: TFloatField
      DisplayLabel = 'Km. Destino'
      FieldName = 'KILOMETROS_DESTINO'
    end
    object QMProyectosDIRECCION_TERCERO_NULL: TIntegerField
      DisplayLabel = 'Dir. Tercero'
      FieldName = 'DIRECCION_TERCERO_NULL'
    end
    object QMProyectosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProyectosTITULO_DIRECCION: TFIBStringField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'TITULO_DIRECCION'
      Size = 76
    end
    object QMProyectosCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMProyectosTITULO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TITULO_LOCALIDAD'
      Size = 40
    end
    object QMProyectosTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object QMProyectosTITULO_PAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'TITULO_PAIS'
      Size = 60
    end
    object QMProyectosHORARIO_1_DESDE: TDateTimeField
      DisplayLabel = 'Horario 1 Desde'
      FieldName = 'HORARIO_1_DESDE'
    end
    object QMProyectosHORARIO_1_HASTA: TDateTimeField
      DisplayLabel = 'Horario 1 Hasta'
      FieldName = 'HORARIO_1_HASTA'
    end
    object QMProyectosHORARIO_2_DESDE: TDateTimeField
      DisplayLabel = 'Horario 2 Desde'
      FieldName = 'HORARIO_2_DESDE'
    end
    object QMProyectosHORARIO_2_HASTA: TDateTimeField
      DisplayLabel = 'Horario 2 Hasta'
      FieldName = 'HORARIO_2_HASTA'
    end
    object QMProyectosAGENTE_NULL: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE_NULL'
    end
    object QMProyectosNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMProyectosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre Cliente'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMProyectosNOMBRE_AGENTE: TFIBStringField
      DisplayLabel = 'Nombre Agente'
      FieldName = 'NOMBRE_AGENTE'
      Size = 60
    end
    object QMProyectosDIRECCION_MANUAL: TMemoField
      DisplayLabel = 'Dir. Manual'
      FieldName = 'DIRECCION_MANUAL'
      BlobType = ftMemo
      Size = 8
    end
    object QMProyectosEMPLEADOS: TFloatField
      DisplayLabel = 'Empleados'
      FieldName = 'EMPLEADOS'
    end
  end
  object DSQMProyectos: TDataSource
    DataSet = QMProyectos
    Left = 160
    Top = 16
  end
  object EntornoBusqueda: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 520
    Top = 16
  end
  object QMVentas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRY_VENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  PROYECTO=?old_PROYECTO AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRY_VENTAS'
      
        '  (EMPRESA,'#13#10'PROYECTO,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,UNIDA' +
        'DES,UNI_MAX,IMPORTE,'#13#10'AFEC_TOTAL,ARTICULO,TITULO,ID_DETALLES_S,I' +
        'D_S,FECHA,TIPO_DOC_TRIBUTARIO,FOLIO,NIF,'#13#10'RAZON_SOCIAL)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?PROYECTO,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LIN' +
        'EA,?UNIDADES,?UNI_MAX,?IMPORTE,'#13#10'?AFEC_TOTAL,?ARTICULO,?TITULO,?' +
        'ID_DETALLES_S,?ID_S,?FECHA,?TIPO_DOC_TRIBUTARIO,?FOLIO,?NIF,'#13#10'?R' +
        'AZON_SOCIAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRY_VENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROYECTO=?PROYECTO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PRY_VENTAS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'PROYECTO = ?PROYECTO'
      
        'ORDER BY EMPRESA, CANAL, EJERCICIO DESC, TIPO, SERIE, RIG DESC, ' +
        'LINEA'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRY_VENTAS'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,UNI_MAX=?UNI_MAX '
      '  ,IMPORTE=?IMPORTE '
      '  ,AFEC_TOTAL=?AFEC_TOTAL '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,ID_S=?ID_S '
      '  ,FECHA=?FECHA '
      '  ,TIPO_DOC_TRIBUTARIO=?TIPO_DOC_TRIBUTARIO '
      '  ,FOLIO=?FOLIO '
      '  ,NIF=?NIF '
      '  ,RAZON_SOCIAL=?RAZON_SOCIAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROYECTO=?PROYECTO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMProyectos
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'PROYECTO'
      'EJERCICIO'
      'CANAL'
      'SERIE'
      'TIPO'
      'RIG'
      'LINEA')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PRY_VENTAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object QMVentasUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMVentasUNI_MAX: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNI_MAX'
    end
    object QMVentasIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMVentasTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMVentasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMVentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMVentasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMVentasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMVentasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMVentasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMVentasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMVentasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMVentasAFEC_TOTAL: TIntegerField
      DisplayLabel = 'Afec. Total'
      FieldName = 'AFEC_TOTAL'
    end
    object QMVentasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMVentasPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMVentasID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Detalle'
      FieldName = 'ID_DETALLES_S'
    end
    object QMVentasID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMVentasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMVentasTIPO_DOC_TRIBUTARIO: TFIBStringField
      DisplayLabel = 'Tipo Doc. Tributario'
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object QMVentasFOLIO: TIntegerField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
    end
    object QMVentasNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object QMVentasRAZON_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'RAZON_SOCIAL'
      Size = 60
    end
  end
  object DSQMVentas: TDataSource
    DataSet = QMVentas
    Left = 160
    Top = 112
  end
  object QMCompras: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRY_COMPRAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  PROYECTO=?old_PROYECTO AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRY_COMPRAS'
      
        '  (EMPRESA,'#13#10'PROYECTO,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,UNIDA' +
        'DES,UNI_MAX,IMPORTE,'#13#10'AFEC_TOTAL,ARTICULO,TITULO,ID_DETALLES_E,I' +
        'D_E,FECHA)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?PROYECTO,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LIN' +
        'EA,?UNIDADES,?UNI_MAX,?IMPORTE,'#13#10'?AFEC_TOTAL,?ARTICULO,?TITULO,?' +
        'ID_DETALLES_E,?ID_E,?FECHA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRY_COMPRAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROYECTO=?PROYECTO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PRY_COMPRAS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'PROYECTO=?PROYECTO'
      
        'ORDER BY EMPRESA, CANAL, EJERCICIO DESC, TIPO, SERIE, RIG DESC, ' +
        'LINEA'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRY_COMPRAS'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,UNI_MAX=?UNI_MAX '
      '  ,IMPORTE=?IMPORTE '
      '  ,AFEC_TOTAL=?AFEC_TOTAL '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,ID_DETALLES_E=?ID_DETALLES_E '
      '  ,ID_E=?ID_E '
      '  ,FECHA=?FECHA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROYECTO=?PROYECTO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMProyectos
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'PROYECTO'
      'EJERCICIO'
      'CANAL'
      'SERIE'
      'TIPO'
      'RIG'
      'LINEA')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PRY_COMPRAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMComprasUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMComprasUNI_MAX: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNI_MAX'
    end
    object QMComprasIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMComprasTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMComprasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMComprasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMComprasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMComprasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMComprasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMComprasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMComprasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMComprasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMComprasAFEC_TOTAL: TIntegerField
      DisplayLabel = 'Afec. Total'
      FieldName = 'AFEC_TOTAL'
    end
    object QMComprasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMComprasPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMComprasID_DETALLES_E: TIntegerField
      DisplayLabel = 'ID Detalle'
      FieldName = 'ID_DETALLES_E'
    end
    object QMComprasID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object QMComprasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMComprasRAZON_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'RAZON_SOCIAL'
      Size = 60
    end
  end
  object DSQMCompras: TDataSource
    DataSet = QMCompras
    Left = 160
    Top = 64
  end
  object xVisorVentas: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA')
    UniDirectional = False
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (PK_GES_CABECERAS_S),'
      
        '           VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_' +
        'ID),'
      '           VER_CABECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))'
      '')
    AfterOpen = xVisorVentasAfterOpen
    Opciones = []
    AutoSQLdeVistas = False
    Left = 280
    Top = 112
  end
  object DSxVisorVentas: TDataSource
    DataSet = xVisorVentas
    Left = 400
    Top = 112
  end
  object QInserciones: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'EXECUTE PROCEDURE E_PROYECTOS_ASIGNA (?EMPRESA, ?PROYECTO, ?EJER' +
        'CICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?ID)')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 64
  end
  object xVisorVentasDetalle: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_DETALLE_FACTURA'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY ORDEN')
    UniDirectional = False
    DataSource = DSxVisorVentas
    Plan.Strings = (
      
        'PLAN JOIN (VER_DETALLE_FACTURA DET INDEX (GES_DETALLES_S_CAB_ID)' +
        ','
      
        '             VER_DETALLE_FACTURA FAC INDEX (GES_DETALLES_S_FAC_I' +
        'D)) ')
    Opciones = []
    AutoSQLdeVistas = False
    Left = 280
    Top = 160
  end
  object DSxVisorVentasDetalle: TDataSource
    DataSet = xVisorVentasDetalle
    Left = 400
    Top = 160
  end
  object xVisorCompras: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_PROV')
    UniDirectional = False
    AfterOpen = xVisorComprasAfterOpen
    Opciones = []
    AutoSQLdeVistas = False
    Left = 280
    Top = 208
  end
  object DSVisorCompras: TDataSource
    DataSet = xVisorCompras
    Left = 400
    Top = 208
  end
  object xVisorComprasDetalle: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT ORDEN, ID_DETALLES_E, LINEA, ARTICULO, TITULO, UNIDADES, ' +
        'P_COSTE, DESCUENTO, B_IMPONIBLE'
      'FROM VER_DETALLE_FACTURA_PROV'
      'WHERE'
      'ID_E = :ID_E'
      'UNION'
      
        'SELECT ORDEN, ID_DETALLES_E, LINEA, ARTICULO, TITULO, UNIDADES, ' +
        'P_COSTE, DESCUENTO, B_IMPONIBLE'
      'FROM VER_DETALLE_FACTURA_ACR'
      'WHERE'
      'ID_E = :ID_E'
      'ORDER BY 1')
    UniDirectional = False
    DataSource = DSVisorCompras
    Opciones = []
    AutoSQLdeVistas = False
    Left = 280
    Top = 256
  end
  object DSxVisorComprasDetalle: TDataSource
    DataSet = xVisorComprasDetalle
    Left = 400
    Top = 256
  end
  object DSQMOtros: TDataSource
    DataSet = QMOtros
    Left = 160
    Top = 160
  end
  object QMOtros: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PROYECTOS_OTROS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  PROYECTO=?old_PROYECTO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PROYECTOS_OTROS'
      
        '  (UNIDADES,NOTAS,IMPORTE,FECHA,PROYECTO,LINEA,TITULO,EMPRESA,MO' +
        'NEDA,USUARIO)'
      'VALUES'
      
        '  (?UNIDADES,?NOTAS,?IMPORTE,?FECHA,?PROYECTO,?LINEA,?TITULO,?EM' +
        'PRESA,?MONEDA,?USUARIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PROYECTOS_OTROS'
      'WHERE'
      '  EMPRESA=?OLD_EMPRESA AND '
      '  PROYECTO=?OLD_PROYECTO AND '
      '  LINEA=?OLD_LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PROYECTOS_OTROS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'PROYECTO = ?PROYECTO'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PROYECTOS_OTROS'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,NOTAS=?NOTAS '
      '  ,IMPORTE=?IMPORTE '
      '  ,FECHA=?FECHA '
      '  ,TITULO=?TITULO '
      '  ,MONEDA=?MONEDA '
      '  ,USUARIO=?USUARIO'
      'WHERE'
      '  EMPRESA=?OLD_EMPRESA AND '
      '  PROYECTO=?OLD_PROYECTO AND '
      '  LINEA=?OLD_LINEA ')
    DataSource = DSQMProyectos
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMOtrosBeforePost
    OnNewRecord = QMOtrosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'PROYECTO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PROYECTOS_OTROS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 160
    object QMOtrosUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMOtrosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMOtrosTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMOtrosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMOtrosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMOtrosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMOtrosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMOtrosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMOtrosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMOtrosPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMOtrosUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
  end
  object xPlanContableOrigen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT P.INDICE_SUFIJO, P.SUFIJO_CONTABLE, A.TITULO'
      'FROM ANA_PLAN_CONTABLE A'
      
        'JOIN EMP_PROYECTOS P ON (P.EMPRESA = A.EMPRESA AND P.PROYECTO = ' +
        'A.PROYECTO)'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.PLAN_CONTABLE = :PLAN_CONTABLE')
    UniDirectional = False
    DataSource = DSQMProyectos
    Left = 40
    Top = 304
  end
  object DSxPlanContableOrigen: TDataSource
    DataSet = xPlanContableOrigen
    Left = 160
    Top = 304
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 400
    Top = 16
  end
  object QMOfertas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_OFERTA_C'
      'WHERE'
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_OFERTA_C'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,ALMACEN,MONEDA,FECHA' +
        ',TERCERO,TITULO,'#13#10'DIRECCION,DIR_NOMBRE_2,CODIGO_POSTAL,LOCALIDAD' +
        ',CLIENTE,CONTACTO,SU_REFERENCIA,FORMA_PAGO,BANCO,'#13#10'CAMPANYA,NOTA' +
        'S,ESTADO,BULTOS,LINEAS,BRUTO,I_DTO_LINEAS,S_BASES,M_BRUTO,C_TOTA' +
        'L,'#13#10'AGENTE,S_CUOTA_IVA,S_CUOTA_RE,B_DTO_LINEAS,DTO_PP,DTO_CIAL,I' +
        '_DTO_CIAL,I_DTO_PP,B_COMISION,I_COMISION,'#13#10'POR_FINANCIACION,I_FI' +
        'NANCIACION,ENTRADA,NOMBRE_COMERCIAL,TARIFA,ID_S,IDIOMA,PRESUPUES' +
        'TO,ADJUNTO,'#13#10'TIPO_PORTES,POR_PORTES,I_PORTES,I_PORTES_CANAL,CAMB' +
        'IO_FIJO,VALOR_CAMB_FIJO,PROYECTO,NOTAS_INTERNAS_KRI,TIPO_LINEA_K' +
        'RI,'#13#10'Z_CONTACTO,Z_OBSERVACION,PEDIDO_CLIENTE,RANGO,INDICE,PORTES,' +
        'USUARIO,NOMBRE,FECHA_VALIDEZ,'#13#10'PLAZO_ENTREGA,MODIFICA_DOC,FECHA_' +
        'ENTREGA_PREV,EMPLEADO_RESPONSABLE,EMPLEADO_ATENCION,TRANSPORTIST' +
        'A,INVERSION_SUJETO_PASIVO,AUTORIZADO,DOCUMENTO_MUESTRAS,PREPARAD' +
        'O,EMPAQUETADO_EMPRESA,DIR_RECOGIDA_MANUAL,DIR_ENTREGA_MANUAL,EQU' +
        'IPO_RECOGIDA,EQUIPO_ENTREGA,MATRICULA_RECOGIDA,MATRICULA_ENTREGA' +
        ',FECHA_RECOGIDA_MANUAL,'#13#10'FECHA_ENTREGA_MANUAL,ACEPTADA,USUARIO_C' +
        'REACION,MODO_IVA,ID_FICHA_TECNICA,ORIGEN_DOCUMENTO,RECHAZADA,REC' +
        'HAZADA_MOTIVO,RECHAZADA_FECHA)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ALMACEN,?MONE' +
        'DA,?FECHA,?TERCERO,?TITULO,'#13#10'?DIRECCION,?DIR_NOMBRE_2,?CODIGO_PO' +
        'STAL,?LOCALIDAD,?CLIENTE,?CONTACTO,?SU_REFERENCIA,?FORMA_PAGO,?B' +
        'ANCO,'#13#10'?CAMPANYA,?NOTAS,?ESTADO,?BULTOS,?LINEAS,?BRUTO,?I_DTO_LI' +
        'NEAS,?S_BASES,?M_BRUTO,?C_TOTAL,'#13#10'?AGENTE,?S_CUOTA_IVA,?S_CUOTA_' +
        'RE,?B_DTO_LINEAS,?DTO_PP,?DTO_CIAL,?I_DTO_CIAL,?I_DTO_PP,?B_COMI' +
        'SION,?I_COMISION,'#13#10'?POR_FINANCIACION,?I_FINANCIACION,?ENTRADA,?N' +
        'OMBRE_COMERCIAL,?TARIFA,?ID_S,?IDIOMA,?PRESUPUESTO,?ADJUNTO,'#13#10'?T' +
        'IPO_PORTES,?POR_PORTES,?I_PORTES,?I_PORTES_CANAL,?CAMBIO_FIJO,?V' +
        'ALOR_CAMB_FIJO,?PROYECTO,?NOTAS_INTERNAS_KRI,?TIPO_LINEA_KRI,'#13#10'?' +
        'Z_CONTACTO,?Z_OBSERVACION,?PEDIDO_CLIENTE,?RANGO,?INDICE,?PORTES,' +
        '?USUARIO,?NOMBRE,?FECHA_VALIDEZ,'#13#10'?PLAZO_ENTREGA,?MODIFICA_DOC,?' +
        'FECHA_ENTREGA_PREV,?EMPLEADO_RESPONSABLE,?EMPLEADO_ATENCION,?TRA' +
        'NSPORTISTA,?INVERSION_SUJETO_PASIVO,?AUTORIZADO,?DOCUMENTO_MUEST' +
        'RAS,?PREPARADO,?EMPAQUETADO_EMPRESA,?DIR_RECOGIDA_MANUAL,?DIR_EN' +
        'TREGA_MANUAL,?EQUIPO_RECOGIDA,?EQUIPO_ENTREGA,?MATRICULA_RECOGID' +
        'A,?MATRICULA_ENTREGA,?FECHA_RECOGIDA_MANUAL,'#13#10'?FECHA_ENTREGA_MAN' +
        'UAL,?ACEPTADA,?USUARIO_CREACION,?MODO_IVA,?ID_FICHA_TECNICA,?ORI' +
        'GEN_DOCUMENTO,?RECHAZADA,?RECHAZADA_MOTIVO,?RECHAZADA_FECHA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_OFERTA_C'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT'
      
        ' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, PROYECTO, B_DTO_LI' +
        'NEAS AS TOTAL,'
      ' SU_REFERENCIA, ID_S, TITULO'
      'FROM VER_CABECERAS_OFERTA_C'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'TIPO = '#39'OFC'#39' AND'
      'PROYECTO = ?PROYECTO'
      'ORDER BY EMPRESA, CANAL, EJERCICIO DESC, TIPO, SERIE, RIG DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_OFERTA_C'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,ALMACEN=?ALMACEN '
      '  ,MONEDA=?MONEDA '
      '  ,FECHA=?FECHA '
      '  ,TERCERO=?TERCERO '
      '  ,TITULO=?TITULO '
      '  ,DIRECCION=?DIRECCION '
      '  ,DIR_NOMBRE_2=?DIR_NOMBRE_2 '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,LOCALIDAD=?LOCALIDAD '
      '  ,CLIENTE=?CLIENTE '
      '  ,CONTACTO=?CONTACTO '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,BANCO=?BANCO '
      '  ,CAMPANYA=?CAMPANYA '
      '  ,NOTAS=?NOTAS '
      '  ,ESTADO=?ESTADO '
      '  ,BULTOS=?BULTOS '
      '  ,LINEAS=?LINEAS '
      '  ,BRUTO=?BRUTO '
      '  ,I_DTO_LINEAS=?I_DTO_LINEAS '
      '  ,S_BASES=?S_BASES '
      '  ,M_BRUTO=?M_BRUTO '
      '  ,C_TOTAL=?C_TOTAL '
      '  ,AGENTE=?AGENTE '
      '  ,S_CUOTA_IVA=?S_CUOTA_IVA '
      '  ,S_CUOTA_RE=?S_CUOTA_RE '
      '  ,B_DTO_LINEAS=?B_DTO_LINEAS '
      '  ,DTO_PP=?DTO_PP '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,B_COMISION=?B_COMISION '
      '  ,I_COMISION=?I_COMISION '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,I_FINANCIACION=?I_FINANCIACION '
      '  ,ENTRADA=?ENTRADA '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,TARIFA=?TARIFA '
      '  ,IDIOMA=?IDIOMA '
      '  ,PRESUPUESTO=?PRESUPUESTO '
      '  ,ADJUNTO=?ADJUNTO '
      '  ,TIPO_PORTES=?TIPO_PORTES '
      '  ,POR_PORTES=?POR_PORTES '
      '  ,I_PORTES=?I_PORTES '
      '  ,I_PORTES_CANAL=?I_PORTES_CANAL '
      '  ,CAMBIO_FIJO=?CAMBIO_FIJO '
      '  ,VALOR_CAMB_FIJO=?VALOR_CAMB_FIJO '
      '  ,PROYECTO=?PROYECTO '
      '  ,NOTAS_INTERNAS_KRI=?NOTAS_INTERNAS_KRI '
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,Z_CONTACTO=?Z_CONTACTO '
      '  ,Z_OBSERVACION=?Z_OBSERVACION '
      '  ,PEDIDO_CLIENTE=?PEDIDO_CLIENTE '
      '  ,RANGO=?RANGO '
      '  ,INDICE=?INDICE '
      '  ,PORTES=?PORTES '
      '  ,USUARIO=?USUARIO '
      '  ,NOMBRE=?NOMBRE '
      '  ,FECHA_VALIDEZ=?FECHA_VALIDEZ '
      '  ,PLAZO_ENTREGA=?PLAZO_ENTREGA '
      '  ,MODIFICA_DOC=?MODIFICA_DOC '
      '  ,FECHA_ENTREGA_PREV=?FECHA_ENTREGA_PREV '
      '  ,EMPLEADO_RESPONSABLE=?EMPLEADO_RESPONSABLE '
      '  ,EMPLEADO_ATENCION=?EMPLEADO_ATENCION '
      '  ,TRANSPORTISTA=?TRANSPORTISTA '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,AUTORIZADO=?AUTORIZADO '
      '  ,DOCUMENTO_MUESTRAS=?DOCUMENTO_MUESTRAS '
      '  ,PREPARADO=?PREPARADO '
      '  ,EMPAQUETADO_EMPRESA=?EMPAQUETADO_EMPRESA '
      '  ,DIR_RECOGIDA_MANUAL=?DIR_RECOGIDA_MANUAL '
      '  ,DIR_ENTREGA_MANUAL=?DIR_ENTREGA_MANUAL '
      '  ,EQUIPO_RECOGIDA=?EQUIPO_RECOGIDA '
      '  ,EQUIPO_ENTREGA=?EQUIPO_ENTREGA '
      '  ,MATRICULA_RECOGIDA=?MATRICULA_RECOGIDA '
      '  ,MATRICULA_ENTREGA=?MATRICULA_ENTREGA '
      '  ,FECHA_RECOGIDA_MANUAL=?FECHA_RECOGIDA_MANUAL '
      '  ,FECHA_ENTREGA_MANUAL=?FECHA_ENTREGA_MANUAL '
      '  ,ACEPTADA=?ACEPTADA '
      '  ,USUARIO_CREACION=?USUARIO_CREACION '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,ID_FICHA_TECNICA=?ID_FICHA_TECNICA '
      '  ,ORIGEN_DOCUMENTO=?ORIGEN_DOCUMENTO '
      '  ,RECHAZADA=?RECHAZADA '
      '  ,RECHAZADA_MOTIVO=?RECHAZADA_MOTIVO '
      '  ,RECHAZADA_FECHA=?RECHAZADA_FECHA '
      'WHERE'
      '  ID_S=?ID_S ')
    DataSource = DSQMProyectos
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'ID_S')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_OFERTA_C'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 256
    object QMOfertasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMOfertasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMOfertasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMOfertasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMOfertasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMOfertasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMOfertasPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMOfertasTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMOfertasSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMOfertasID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMOfertasTITULO: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMOfertas: TDataSource
    DataSet = QMOfertas
    Left = 160
    Top = 256
  end
  object QMReparaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.REPARACION, C' +
        '.PROYECTO, C.FECHA_ENTRADA, C.FECHA_SALIDA, D.ARTICULO, D.UNIDAD' +
        'ES, D.PRECIO_VENTA,D.TOTAL, C.IDCABREPARAR'
      'FROM REPAR_DET_REPARACIONES D'
      'JOIN REPAR_CAB_REPARACIONES C ON C.IDCABREPARAR = D.IDCABREPARAR'
      'WHERE'
      'C.IDCABREPARAR = ?IDCABREPARAR')
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.REPARACION, C' +
        '.PROYECTO, C.FECHA_ENTRADA, C.FECHA_SALIDA, '
      
        'D.LINEA, D.ARTICULO, D.TITULO_ART, D.UNIDADES, D.PRECIO_VENTA,D.' +
        'TOTAL, C.IDCABREPARAR, C.TIPO, T.TITULO AS TITULO_TIPO'
      'FROM REPAR_DET_REPARACIONES D'
      'JOIN REPAR_CAB_REPARACIONES C ON C.IDCABREPARAR = D.IDCABREPARAR'
      'JOIN SYS_TIPO_REPARACION T ON C.TIPO = T.TIPO'
      'WHERE'
      'C.EMPRESA = ?EMPRESA AND'
      'C.PROYECTO = ?PROYECTO'
      
        'ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.REPARACION,' +
        ' D.LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMProyectos
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'IDCABREPARAR'#13)
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'REPAR_DET_REPARACIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 352
    object QMReparacionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMReparacionesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMReparacionesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMReparacionesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMReparacionesREPARACION: TIntegerField
      DisplayLabel = 'Reparaci'#243'n'
      FieldName = 'REPARACION'
    end
    object QMReparacionesPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMReparacionesFECHA_ENTRADA: TDateTimeField
      DisplayLabel = 'Fecha Entrada'
      FieldName = 'FECHA_ENTRADA'
    end
    object QMReparacionesFECHA_SALIDA: TDateTimeField
      DisplayLabel = 'Fecha Salida'
      FieldName = 'FECHA_SALIDA'
    end
    object QMReparacionesARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMReparacionesUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMReparacionesPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMReparacionesTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMReparacionesIDCABREPARAR: TIntegerField
      DisplayLabel = 'ID Reparaci'#243'n'
      FieldName = 'IDCABREPARAR'
    end
    object QMReparacionesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMReparacionesTITULO_ART: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object QMReparacionesTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMReparacionesTITULO_TIPO: TFIBStringField
      DisplayLabel = 'Tit. Tipo'
      FieldName = 'TITULO_TIPO'
      Size = 25
    end
  end
  object DSQMReparaciones: TDataSource
    DataSet = QMReparaciones
    Left = 160
    Top = 352
  end
  object QMOrdenes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIES=?old_SERIES AND '
      '  RIG_OF=?old_RIG_OF ')
    RefreshSQL.Strings = (
      
        'select id_orden, empresa, ejercicio, canal, series, rig_of, fech' +
        'a_ord, compuesto'
      'from pro_ord'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF ')
    SelectSQL.Strings = (
      
        'select id_orden, empresa, ejercicio, canal, series, rig_of, fech' +
        'a_ord, compuesto, situacion'
      'from pro_ord'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'PROYECTO = ?PROYECTO'
      'order by empresa, ejercicio, canal, series, rig_of ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMProyectos
    AfterDelete = Graba
    AfterPost = Graba
    OnCalcFields = QMOrdenesCalcFields
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIES '
      'RIG_OF ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 402
    object QMOrdenesID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMOrdenesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMOrdenesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMOrdenesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMOrdenesSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMOrdenesRIG_OF: TIntegerField
      DisplayLabel = 'RIG'
      FieldName = 'RIG_OF'
    end
    object QMOrdenesFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_ORD'
    end
    object QMOrdenesCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QMOrdenesSITUACION: TIntegerField
      DisplayLabel = 'Situaci'#243'n'
      FieldName = 'SITUACION'
    end
    object QMOrdenesTITULO_SITUACION: TStringField
      DisplayLabel = 'Tit. Situaci'#243'n'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'TITULO_SITUACION'
      Calculated = True
    end
  end
  object DSQMOrdenes: TDataSource
    DataSet = QMOrdenes
    Left = 160
    Top = 402
  end
  object DSQMEmpleados: TDataSource
    DataSet = QMEmpleados
    Left = 160
    Top = 208
  end
  object QMEmpleados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PROYECTOS_EMPLEADOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  PROYECTO=?old_PROYECTO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PROYECTOS_EMPLEADOS'
      
        '  (EMPRESA,'#13#10'PROYECTO,LINEA,FECHA,EMPLEADO,TITULO,UNIDADES,IMPOR' +
        'TE,NOTAS,ID_EMPLEADO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?PROYECTO,?LINEA,?FECHA,?EMPLEADO,?TITULO,?UNIDADE' +
        'S,?IMPORTE,?NOTAS,?ID_EMPLEADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PROYECTOS_EMPLEADOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROYECTO=?PROYECTO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PROYECTOS_EMPLEADOS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'PROYECTO = ?PROYECTO'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PROYECTOS_EMPLEADOS'
      'SET'
      '  FECHA=?FECHA '
      '  ,EMPLEADO=?EMPLEADO '
      '  ,TITULO=?TITULO '
      '  ,UNIDADES=?UNIDADES '
      '  ,IMPORTE=?IMPORTE '
      '  ,NOTAS=?NOTAS '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROYECTO=?PROYECTO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMProyectos
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMEmpleadosBeforePost
    OnNewRecord = QMEmpleadosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'PROYECTO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PROYECTOS_EMPLEADOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 208
    object QMEmpleadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEmpleadosPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMEmpleadosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMEmpleadosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMEmpleadosEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
      OnChange = QMEmpleadosEMPLEADOChange
    end
    object QMEmpleadosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMEmpleadosUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMEmpleadosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMEmpleadosNOTAS: TMemoField
      DisplayLabel = 'Notes'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMEmpleadosID_EMPLEADO: TIntegerField
      DisplayLabel = 'Id Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMEmpleadosTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
  end
end
