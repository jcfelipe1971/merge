object DMAmortizacion: TDMAmortizacion
  OldCreateOrder = False
  OnCreate = DMAmortizacionCreate
  OnDestroy = DataModuleDestroy
  Left = 745
  Top = 171
  Height = 484
  Width = 505
  object QMInmovilizado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_INMOVILIZADO_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_INMOVILIZADO_CUENTAS'
      
        '  (ID_INMOVILIZADO,'#13#10'EMPRESA,EJERCICIO,CANAL,ARTICULO,TITULO_ART' +
        ',CENTRO_INVENTARIO,TIPO_BIEN,PAIS,PADRE,GRUPO,'#13#10'VALOR_COMPRA_KRI' +
        ',VALOR_COMPRA,VALOR_RESIDUAL,VALOR_INI_EJE,AMORTIZACION_AMUM_EJE' +
        ',VALOR_ACTUAL,VALOR_FIN_EJE,CUENTA_INMOVILIZADO,CUENTA_AMORTIZAC' +
        'ION,'#13#10'CUENTA_GASTOS,INDIRECTO,TIPO_AMORTIZACION,VIDA_UTIL,COEFIC' +
        'IENTE,TASA,FECHA_ADQUISICION,FECHA_INICIO,FECHA_ULT_AMORTIZACION' +
        ',FECHA_FIN_AMORTIZACION,'#13#10'FECHA_BAJA,NOTAS,CANCELADO,PERIODOS_AM' +
        'ORTIZACION,ENTRADA,SEGUNDA_MANO,VALOR_BAJA,MONEDA)'
      'VALUES'
      
        '  (?ID_INMOVILIZADO,'#13#10'?EMPRESA,?EJERCICIO,?CANAL,?ARTICULO,?TITU' +
        'LO_ART,?CENTRO_INVENTARIO,?TIPO_BIEN,?PAIS,?PADRE,?GRUPO,'#13#10'?VALO' +
        'R_COMPRA_KRI,?VALOR_COMPRA,?VALOR_RESIDUAL,?VALOR_INI_EJE,?AMORT' +
        'IZACION_AMUM_EJE,?VALOR_ACTUAL,?VALOR_FIN_EJE,?CUENTA_INMOVILIZA' +
        'DO,?CUENTA_AMORTIZACION,'#13#10'?CUENTA_GASTOS,?INDIRECTO,?TIPO_AMORTI' +
        'ZACION,?VIDA_UTIL,?COEFICIENTE,?TASA,?FECHA_ADQUISICION,?FECHA_I' +
        'NICIO,?FECHA_ULT_AMORTIZACION,?FECHA_FIN_AMORTIZACION,'#13#10'?FECHA_B' +
        'AJA,?NOTAS,?CANCELADO,?PERIODOS_AMORTIZACION,?ENTRADA,?SEGUNDA_M' +
        'ANO,?VALOR_BAJA,?MONEDA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_INMOVILIZADO_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_INMOVILIZADO_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL'
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_INMOVILIZADO_CUENTAS'
      'SET'
      '  ID_INMOVILIZADO=?ID_INMOVILIZADO '
      '  ,TITULO_ART=?TITULO_ART '
      '  ,CENTRO_INVENTARIO=?CENTRO_INVENTARIO '
      '  ,TIPO_BIEN=?TIPO_BIEN '
      '  ,PAIS=?PAIS '
      '  ,PADRE=?PADRE '
      '  ,GRUPO=?GRUPO '
      '  ,VALOR_COMPRA_KRI=?VALOR_COMPRA_KRI '
      '  ,VALOR_COMPRA=?VALOR_COMPRA '
      '  ,VALOR_RESIDUAL=?VALOR_RESIDUAL '
      '  ,VALOR_INI_EJE=?VALOR_INI_EJE '
      '  ,AMORTIZACION_AMUM_EJE=?AMORTIZACION_AMUM_EJE '
      '  ,VALOR_ACTUAL=?VALOR_ACTUAL '
      '  ,VALOR_FIN_EJE=?VALOR_FIN_EJE '
      '  ,CUENTA_INMOVILIZADO=?CUENTA_INMOVILIZADO '
      '  ,CUENTA_AMORTIZACION=?CUENTA_AMORTIZACION '
      '  ,CUENTA_GASTOS=?CUENTA_GASTOS '
      '  ,INDIRECTO=?INDIRECTO '
      '  ,TIPO_AMORTIZACION=?TIPO_AMORTIZACION '
      '  ,VIDA_UTIL=?VIDA_UTIL '
      '  ,COEFICIENTE=?COEFICIENTE '
      '  ,TASA=?TASA '
      '  ,FECHA_ADQUISICION=?FECHA_ADQUISICION '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_ULT_AMORTIZACION=?FECHA_ULT_AMORTIZACION '
      '  ,FECHA_FIN_AMORTIZACION=?FECHA_FIN_AMORTIZACION '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,NOTAS=?NOTAS '
      '  ,CANCELADO=?CANCELADO '
      '  ,PERIODOS_AMORTIZACION=?PERIODOS_AMORTIZACION '
      '  ,ENTRADA=?ENTRADA '
      '  ,SEGUNDA_MANO=?SEGUNDA_MANO '
      '  ,VALOR_BAJA=?VALOR_BAJA '
      '  ,MONEDA=?MONEDA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ARTICULO=?ARTICULO ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_INMOVILIZADO_CUENTAS CUEN INDEX (PK_CON_INMOVILIZ' +
        'ADOS_CUENTAS),'
      'VER_INMOVILIZADO_CUENTAS INM INDEX (PK_CON_INMOVILIZADOS))')
    AfterDelete = QMAmortizacionIIAfterPost
    AfterOpen = QMInmovilizadoAfterOpen
    AfterPost = QMInmovilizadoAfterPost
    AfterScroll = QMInmovilizadoAfterScroll
    BeforeClose = QMInmovilizadoBeforeClose
    BeforeEdit = QMInmovilizadoBeforeEdit
    BeforePost = QMInmovilizadoBeforePost
    OnNewRecord = QMInmovilizadoNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_INMOVILIZADO_CUENTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMInmovilizadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMInmovilizadoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMInmovilizadoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMInmovilizadoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMInmovilizadoTITULO_ART: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ART'
      Size = 60
    end
    object QMInmovilizadoCENTRO_INVENTARIO: TFIBStringField
      DisplayLabel = 'Cent. Inv.'
      FieldName = 'CENTRO_INVENTARIO'
      OnChange = QMInmovilizadoCENTRO_INVENTARIOChange
      Size = 3
    end
    object QMInmovilizadoTIPO_BIEN: TIntegerField
      DisplayLabel = 'Tipo Bien'
      FieldName = 'TIPO_BIEN'
    end
    object QMInmovilizadoPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMInmovilizadoPADRE: TFIBStringField
      DisplayLabel = 'Padre'
      FieldName = 'PADRE'
      Size = 4
    end
    object QMInmovilizadoGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      OnChange = QMInmovilizadoGRUPOChange
      Size = 1
    end
    object QMInmovilizadoVALOR_COMPRA_KRI: TFloatField
      DisplayLabel = 'Val. Compra'
      FieldName = 'VALOR_COMPRA_KRI'
      OnChange = QMInmovilizadoVALOR_COMPRA_KRIChange
    end
    object QMInmovilizadoVALOR_COMPRA: TFloatField
      DisplayLabel = 'Val Compra'
      FieldName = 'VALOR_COMPRA'
    end
    object QMInmovilizadoVALOR_RESIDUAL: TFloatField
      DisplayLabel = 'Val Resud.'
      FieldName = 'VALOR_RESIDUAL'
    end
    object QMInmovilizadoVALOR_INI_EJE: TFloatField
      DisplayLabel = 'Val. Ini. Eje.'
      FieldName = 'VALOR_INI_EJE'
    end
    object QMInmovilizadoAMORTIZACION_AMUM_EJE: TFloatField
      DisplayLabel = 'Amrot. Acum. Eje.'
      FieldName = 'AMORTIZACION_AMUM_EJE'
    end
    object QMInmovilizadoAMORTIZACION_ACUMULADA: TFloatField
      DisplayLabel = 'Amort. Acum.'
      FieldName = 'AMORTIZACION_ACUMULADA'
    end
    object QMInmovilizadoVALOR_ACTUAL: TFloatField
      DisplayLabel = 'Va. Actual'
      FieldName = 'VALOR_ACTUAL'
    end
    object QMInmovilizadoVALOR_FIN_EJE: TFloatField
      DisplayLabel = 'Val. Fin Eje.'
      FieldName = 'VALOR_FIN_EJE'
    end
    object QMInmovilizadoCUENTA_INMOVILIZADO: TFIBStringField
      DisplayLabel = 'Cta. Inmovilizado'
      FieldName = 'CUENTA_INMOVILIZADO'
      Size = 15
    end
    object QMInmovilizadoCUENTA_AMORTIZACION: TFIBStringField
      DisplayLabel = 'Cta. Amortizacion'
      FieldName = 'CUENTA_AMORTIZACION'
      Size = 15
    end
    object QMInmovilizadoCUENTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Gastos'
      FieldName = 'CUENTA_GASTOS'
      Size = 15
    end
    object QMInmovilizadoINDIRECTO: TIntegerField
      DisplayLabel = 'Indirecto'
      FieldName = 'INDIRECTO'
    end
    object QMInmovilizadoTIPO_AMORTIZACION: TFIBStringField
      DisplayLabel = 'Tipo Amort.'
      FieldName = 'TIPO_AMORTIZACION'
      Size = 3
    end
    object QMInmovilizadoCOEFICIENTE: TFloatField
      DisplayLabel = 'Coeficiente'
      FieldName = 'COEFICIENTE'
      OnChange = QMInmovilizadoCOEFICIENTEChange
    end
    object QMInmovilizadoTASA: TFloatField
      DisplayLabel = 'Tasa'
      FieldName = 'TASA'
    end
    object QMInmovilizadoFECHA_ADQUISICION: TDateTimeField
      DisplayLabel = 'Fecha Adq.'
      FieldName = 'FECHA_ADQUISICION'
    end
    object QMInmovilizadoFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fecha Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object QMInmovilizadoFECHA_ULT_AMORTIZACION: TDateTimeField
      DisplayLabel = 'Fec. Ult. Amort.'
      FieldName = 'FECHA_ULT_AMORTIZACION'
    end
    object QMInmovilizadoFECHA_FIN_AMORTIZACION: TDateTimeField
      DisplayLabel = 'Fecha Fin Amort.'
      FieldName = 'FECHA_FIN_AMORTIZACION'
    end
    object QMInmovilizadoFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fecha Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMInmovilizadoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMInmovilizadoCANCELADO: TIntegerField
      DisplayLabel = 'Cancelado'
      FieldName = 'CANCELADO'
    end
    object QMInmovilizadoPERIODOS_AMORTIZACION: TIntegerField
      DisplayLabel = 'Periodos Amort.'
      FieldName = 'PERIODOS_AMORTIZACION'
      OnChange = QMInmovilizadoPERIODOS_AMORTIZACIONChange
    end
    object QMInmovilizadoENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMInmovilizadoSEGUNDA_MANO: TIntegerField
      DisplayLabel = 'Seg. Mano'
      FieldName = 'SEGUNDA_MANO'
      OnChange = QMInmovilizadoSEGUNDA_MANOChange
    end
    object QMInmovilizadoVALOR_BAJA: TFloatField
      DisplayLabel = 'Val. Baja'
      FieldName = 'VALOR_BAJA'
    end
    object QMInmovilizadoVALOR_COMPRA_CANAL: TFloatField
      DisplayLabel = 'Val. Compra'
      FieldKind = fkCalculated
      FieldName = 'VALOR_COMPRA_CANAL'
      OnGetText = QMInmovilizadoVALOR_COMPRA_CANALGetText
      Calculated = True
    end
    object QMInmovilizadoMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      OnChange = QMInmovilizadoMONEDAChange
      Size = 3
    end
    object QMInmovilizadoVIDA_UTIL: TFloatField
      DisplayLabel = 'Vida '#218'til'
      FieldName = 'VIDA_UTIL'
    end
    object QMInmovilizadoID_INMOVILIZADO: TIntegerField
      DisplayLabel = 'Id Inmovilizado'
      FieldName = 'ID_INMOVILIZADO'
    end
  end
  object DSQMInmovilizado: TDataSource
    DataSet = QMInmovilizado
    Left = 176
    Top = 8
  end
  object xGrupos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT GRUPO, TITULO FROM VER_GRUPOS_INMOVILIZADO_padre')
    UniDirectional = False
    Left = 56
    Top = 152
    object xGruposGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 1
    end
    object xGruposTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 200
    end
  end
  object xGruposAmortizacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select porcentaje_max,periodo_max_anyos,titulo,grupo,pais,padre'
      'from ver_grupos_inmovilizado'
      'where padre starting with ?grupo')
    UniDirectional = False
    DataSource = DSxGrupos
    Left = 56
    Top = 296
    object xGruposAmortizacionPORCENTAJE_MAX: TFloatField
      DisplayLabel = 'Porc. Max.'
      FieldName = 'PORCENTAJE_MAX'
    end
    object xGruposAmortizacionPERIODO_MAX_ANYOS: TIntegerField
      DisplayLabel = 'Periodo Max.'
      FieldName = 'PERIODO_MAX_ANYOS'
    end
    object xGruposAmortizacionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 200
    end
    object xGruposAmortizacionGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 1
    end
    object xGruposAmortizacionPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xGruposAmortizacionPADRE: TFIBStringField
      DisplayLabel = 'Padre'
      FieldName = 'PADRE'
      Size = 4
    end
  end
  object DSxGrupos: TDataSource
    DataSet = xGrupos
    Left = 176
    Top = 152
  end
  object DSxGruposAmortizacion: TDataSource
    DataSet = xGruposAmortizacion
    Left = 176
    Top = 296
  end
  object DSQMAmortizaciones: TDataSource
    DataSet = QMAmortizaciones
    Left = 176
    Top = 104
  end
  object SPTraspasa: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_asientos_amortizacion (?empresa, ?ejercicio,' +
        ' ?canal,'
      '?articulo, ?fecha, ?entrada)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 304
    Top = 8
  end
  object SPBorraAsientos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_asientos_amortizacion_borra (?empresa, ?ejer' +
        'cicio, '
      '?canal, ?articulo)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 304
    Top = 152
  end
  object SPBorraUno: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_asientos_amortiza_borra_ult (?empresa, ?ejer' +
        'cicio, '
      '?canal, ?articulo)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 304
    Top = 104
  end
  object QMAmortizaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_INMOVILIZADOS_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_INMOVILIZADOS_DETALLE'
      
        '  (VALOR_ACTUAL,VALOR_AMORTIZADO,FECHA,AMORTIZACION_ACUMULADA,RI' +
        'C,CONTABILIZADO,LINEA,CANAL,EJERCICIO,EMPRESA,ARTICULO)'
      'VALUES'
      
        '  (?VALOR_ACTUAL,?VALOR_AMORTIZADO,?FECHA,?AMORTIZACION_ACUMULAD' +
        'A,?RIC,?CONTABILIZADO,?LINEA,?CANAL,?EJERCICIO,?EMPRESA,?ARTICUL' +
        'O)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_INMOVILIZADOS_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_INMOVILIZADOS_DETALLE'
      'where empresa=?empresa and'
      'canal=?canal and'
      'articulo=?articulo '
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_INMOVILIZADOS_DETALLE'
      'SET'
      '  VALOR_AMORTIZADO=?VALOR_AMORTIZADO '
      ' ,FECHA=?FECHA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMInmovilizado
    Plan.Strings = (
      
        'PLAN SORT ((CON_INMOVILIZADOS_DETALLE INDEX (PK_CON_INMOVILIZADO' +
        'S_DETALLE))) ')
    AfterDelete = QMAmortizacionesAfterDelete
    AfterPost = QMAmortizacionesAfterPost
    BeforePost = QMAmortizacionesBeforePost
    OnNewRecord = QMAmortizacionesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'ARTICULO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_INMOVILIZADOS_DETALLE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 104
    object QMAmortizacionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ReadOnly = True
    end
    object QMAmortizacionesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
      ReadOnly = True
    end
    object QMAmortizacionesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
      ReadOnly = True
    end
    object QMAmortizacionesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      ReadOnly = True
      Size = 15
    end
    object QMAmortizacionesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMAmortizacionesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAmortizacionesVALOR_AMORTIZADO: TFloatField
      DisplayLabel = 'Valor Amortizado'
      FieldName = 'VALOR_AMORTIZADO'
    end
    object QMAmortizacionesVALOR_AMORTIZADO_CANAL: TFloatField
      DisplayLabel = 'Valor Amortizado Can.'
      FieldKind = fkCalculated
      FieldName = 'VALOR_AMORTIZADO_CANAL'
      OnGetText = QMAmortizacionesVALOR_AMORTIZADO_CANALGetText
      Calculated = True
    end
    object QMAmortizacionesAMORTIZACION_ACUMULADA: TFloatField
      DisplayLabel = 'Amort. Acum.'
      FieldName = 'AMORTIZACION_ACUMULADA'
    end
    object QMAmortizacionesVALOR_ACTUAL: TFloatField
      DisplayLabel = 'Valor Act.'
      FieldName = 'VALOR_ACTUAL'
    end
    object QMAmortizacionesCONTABILIZADO: TIntegerField
      DisplayLabel = 'Contabilizado'
      FieldName = 'CONTABILIZADO'
      ReadOnly = True
    end
    object QMAmortizacionesRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
      ReadOnly = True
    end
  end
  object SPTraspasaTodos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_asientos_amortizacion_todos (?empresa, ?ejer' +
        'cicio, '
      '?canal, ?entrada, ?fecha)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 304
    Top = 56
  end
  object SPBorraTodos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_asientos_amort_borra_todo (?empresa, ?ejerci' +
        'cio, '
      '?canal)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 304
    Top = 200
  end
  object xCentroInventario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select centro, titulo from con_centros_inventario where empresa=' +
        '?empresa and'
      'centro=?centro_inventario')
    UniDirectional = False
    DataSource = DSQMInmovilizado
    Left = 56
    Top = 200
    object xCentroInventarioCENTRO: TFIBStringField
      DisplayLabel = 'Centro'
      FieldName = 'CENTRO'
      Size = 3
    end
    object xCentroInventarioTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxCentroInventario: TDataSource
    DataSet = xCentroInventario
    Left = 176
    Top = 200
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 416
    Top = 8
  end
  object xGruposInmovilizado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      ' FROM SYS_GRUPOS_INMOVILIZADO'
      'WHERE PAIS=?PAIS AND PADRE=?PADRE AND GRUPO=?GRUPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMInmovilizado
    Plan.Strings = (
      ' ')
    OnCalcFields = xGruposInmovilizadoCalcFields
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_GRUPOS_INMOVILIZADO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 248
    object xGruposInmovilizadoPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xGruposInmovilizadoPADRE: TFIBStringField
      DisplayLabel = 'Padre'
      FieldName = 'PADRE'
      Size = 4
    end
    object xGruposInmovilizadoGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 1
    end
    object xGruposInmovilizadoGRUPO_TXT: TFIBStringField
      DisplayLabel = 'Grupo TXT'
      FieldName = 'GRUPO_TXT'
      Size = 4
    end
    object xGruposInmovilizadoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 200
    end
    object xGruposInmovilizadoPORCENTAJE_MAX: TFloatField
      DisplayLabel = 'Porc. Max.'
      FieldName = 'PORCENTAJE_MAX'
    end
    object xGruposInmovilizadoPERIODO_MAX_ANYOS: TIntegerField
      DisplayLabel = 'Periodo Max.'
      FieldName = 'PERIODO_MAX_ANYOS'
    end
    object xGruposInmovilizadoES_GRUPO: TIntegerField
      DisplayLabel = 'Es Grupo'
      FieldName = 'ES_GRUPO'
    end
    object xGruposInmovilizadoNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object xGruposInmovilizadoGRUPO_COMPLETO: TFIBStringField
      DisplayLabel = 'Grupo Completo'
      FieldName = 'GRUPO_COMPLETO'
      Size = 15
    end
    object xGruposInmovilizadoporcentaje_maximo: TFloatField
      DisplayLabel = 'Porc. Max.'
      FieldKind = fkCalculated
      FieldName = 'porcentaje_maximo'
      Calculated = True
    end
    object xGruposInmovilizadoperiodo_maximo: TFloatField
      DisplayLabel = 'Periodo Max.'
      FieldKind = fkCalculated
      FieldName = 'periodo_maximo'
      Calculated = True
    end
  end
  object DSxGruposInmovilizado: TDataSource
    DataSet = xGruposInmovilizado
    Left = 176
    Top = 248
  end
  object xTipoAmortizacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_AMORTIZACION'
      'WHERE TIPO=?TIPO_AMORTIZACION')
    UniDirectional = False
    DataSource = DSQMInmovilizado
    Left = 56
    Top = 344
    object xTipoAmortizacionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object DSxtipoAmortizacion: TDataSource
    DataSet = xTipoAmortizacion
    Left = 176
    Top = 344
  end
  object xPeriodosAmortizacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_PERIODOS_AMORTIZACION'
      'WHERE PERIODICIDAD=?PERIODOS_AMORTIZACION')
    UniDirectional = False
    DataSource = DSQMInmovilizado
    Left = 56
    Top = 392
    object xPeriodosAmortizacionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object DSxPeriodosAmortizacion: TDataSource
    DataSet = xPeriodosAmortizacion
    Left = 176
    Top = 392
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 416
    Top = 56
  end
  object QMInmovilizadoCoste: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_INMOV_CUENTAS_COSTES'
      'WHERE'
      '  SUBLINEA=?old_SUBLINEA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  CANAL=?old_CANAL AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_INMOV_CUENTAS_COSTES'
      
        '  (EMPRESA,CANAL,ARTICULO,EJERCICIO,DIGITO_1,DIGITO_2,DIGITO_3,D' +
        'IGITO_4,DIGITO_5,SUBLINEA,PORCENTAJE)'
      'VALUES'
      
        '  (?EMPRESA,?CANAL,?ARTICULO,?EJERCICIO,?DIGITO_1,?DIGITO_2,?DIG' +
        'ITO_3,?DIGITO_4,?DIGITO_5,?SUBLINEA,?PORCENTAJE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_INMOV_CUENTAS_COSTES'
      'WHERE'
      '  SUBLINEA=?SUBLINEA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  ARTICULO=?ARTICULO AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_INMOV_CUENTAS_COSTES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  ARTICULO=?ARTICULO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO'
      'ORDER BY SUBLINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_INMOV_CUENTAS_COSTES'
      'SET'
      '  DIGITO_1=?DIGITO_1 '
      '  ,DIGITO_2=?DIGITO_2 '
      '  ,DIGITO_3=?DIGITO_3 '
      '  ,DIGITO_4=?DIGITO_4 '
      '  ,DIGITO_5=?DIGITO_5 '
      '  ,PORCENTAJE=?PORCENTAJE '
      'WHERE'
      '  SUBLINEA=?SUBLINEA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  ARTICULO=?ARTICULO AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMInmovilizado
    Plan.Strings = (
      
        'PLAN JOIN (VER_INMOVILIZADO_CUENTAS CUEN INDEX (PK_CON_INMOVILIZ' +
        'ADOS_CUENTAS),'
      'VER_INMOVILIZADO_CUENTAS INM INDEX (PK_CON_INMOVILIZADOS))')
    BeforePost = QMInmovilizadoCosteBeforePost
    OnNewRecord = QMInmovilizadoCosteNewRecord
    ClavesPrimarias.Strings = (
      'SUBLINEA '
      'EJERCICIO '
      'ARTICULO '
      'CANAL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_INMOV_CUENTAS_COSTES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMInmovilizadoCosteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMInmovilizadoCosteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMInmovilizadoCosteARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMInmovilizadoCosteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMInmovilizadoCosteDIGITO_1: TFIBStringField
      DisplayLabel = 'D1'
      FieldName = 'DIGITO_1'
      Size = 3
    end
    object QMInmovilizadoCosteDIGITO_2: TFIBStringField
      DisplayLabel = 'D2'
      FieldName = 'DIGITO_2'
      Size = 3
    end
    object QMInmovilizadoCosteDIGITO_3: TFIBStringField
      DisplayLabel = 'D3'
      FieldName = 'DIGITO_3'
      Size = 3
    end
    object QMInmovilizadoCosteDIGITO_4: TFIBStringField
      DisplayLabel = 'D4'
      FieldName = 'DIGITO_4'
      Size = 3
    end
    object QMInmovilizadoCosteDIGITO_5: TFIBStringField
      DisplayLabel = 'D5'
      FieldName = 'DIGITO_5'
      Size = 3
    end
    object QMInmovilizadoCosteSUBLINEA: TIntegerField
      DisplayLabel = 'Sub Lin.'
      FieldName = 'SUBLINEA'
    end
    object QMInmovilizadoCostePORCENTAJE: TFloatField
      DisplayLabel = 'Porcent.'
      FieldName = 'PORCENTAJE'
    end
  end
  object DSQMInmovilizadoCoste: TDataSource
    DataSet = QMInmovilizadoCoste
    Left = 176
    Top = 56
  end
end
