object DMFamilias: TDMFamilias
  OldCreateOrder = False
  OnCreate = DMFamiliasCreate
  Left = 590
  Top = 197
  Height = 651
  Width = 650
  object QMFamilias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_FAMILIAS_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  FAMILIA=?old_FAMILIA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_FAMILIAS_CUENTAS'
      
        '  (PTO_VERDE,MARGEN,ID_FAMILIA,ID_IMAGEN,EMPRESA,EJERCICIO,CANAL' +
        ',TITULO,TIPO_IVA,VENTA,TIPO_REDONDEO,ACT_TAR_AUTOM,WEB,ORDEN,TIP' +
        'O_PRECIO_BASE,DISPONIBILIDAD,FAMILIA,PAIS,CTA_COMPRAS,CTA_VENTAS' +
        ',CTA_DEVOLUCION_COMPRAS,CTA_DEVOLUCION_VENTAS,CTA_ABONO_COMPRAS,' +
        'CTA_ABONO_VENTAS,TITULO_WEB,TIPO_REGISTRO_FITOSANITARIO,SECCION,' +
        'ACTUALIZA_VENTA,PCOSTE_CERO_EN_VENTAS)'
      'VALUES'
      
        '  (?PTO_VERDE,?MARGEN,?ID_FAMILIA,?ID_IMAGEN,?EMPRESA,?EJERCICIO' +
        ',?CANAL,?TITULO,?TIPO_IVA,?VENTA,?TIPO_REDONDEO,?ACT_TAR_AUTOM,?' +
        'WEB,?ORDEN,?TIPO_PRECIO_BASE,?DISPONIBILIDAD,?FAMILIA,?PAIS,?CTA' +
        '_COMPRAS,?CTA_VENTAS,?CTA_DEVOLUCION_COMPRAS,?CTA_DEVOLUCION_VEN' +
        'TAS,?CTA_ABONO_COMPRAS,?CTA_ABONO_VENTAS,?TITULO_WEB,?TIPO_REGIS' +
        'TRO_FITOSANITARIO,?SECCION,?ACTUALIZA_VENTA,?PCOSTE_CERO_EN_VENT' +
        'AS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_FAMILIAS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_FAMILIAS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FAMILIA<>?FAMILIA'
      'ORDER BY FAMILIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_FAMILIAS_CUENTAS'
      'SET'
      '  PTO_VERDE=?PTO_VERDE '
      '  ,MARGEN=?MARGEN '
      '  ,ID_FAMILIA=?ID_FAMILIA '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,TITULO=?TITULO '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,VENTA=?VENTA '
      '  ,TIPO_REDONDEO=?TIPO_REDONDEO '
      '  ,ACT_TAR_AUTOM=?ACT_TAR_AUTOM '
      '  ,WEB=?WEB '
      '  ,ORDEN=?ORDEN '
      '  ,TIPO_PRECIO_BASE=?TIPO_PRECIO_BASE '
      '  ,DISPONIBILIDAD=?DISPONIBILIDAD '
      '  ,PAIS=?PAIS '
      '  ,CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_VENTAS=?CTA_VENTAS '
      '  ,CTA_DEVOLUCION_COMPRAS=?CTA_DEVOLUCION_COMPRAS '
      '  ,CTA_DEVOLUCION_VENTAS=?CTA_DEVOLUCION_VENTAS '
      '  ,CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS '
      '  ,CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS '
      '  ,TITULO_WEB=?TITULO_WEB '
      '  ,TIPO_REGISTRO_FITOSANITARIO=?TIPO_REGISTRO_FITOSANITARIO '
      '  ,SECCION=?SECCION '
      '  ,ACTUALIZA_VENTA=?ACTUALIZA_VENTA '
      '  ,PCOSTE_CERO_EN_VENTAS=?PCOSTE_CERO_EN_VENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FAMILIA=?FAMILIA ')
    AfterOpen = QMFamiliasAfterOpen
    AfterPost = QMFamiliasAfterPost
    AfterScroll = QMFamiliasAfterScroll
    BeforeClose = QMFamiliasBeforeClose
    BeforePost = QMFamiliasBeforePost
    OnCalcFields = QMFamiliasCalcFields
    OnNewRecord = QMFamiliasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'FAMILIA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_FAMILIAS_CUENTAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMFamiliasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFamiliasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMFamiliasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMFamiliasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMFamiliasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMFamiliasPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMFamiliasTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
      OnChange = QMFamiliasTIPO_IVAChange
    end
    object QMFamiliasCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object QMFamiliasCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object QMFamiliasVENTA: TIntegerField
      DisplayLabel = 'Venta'
      FieldName = 'VENTA'
    end
    object QMFamiliasPTO_VERDE: TFloatField
      DisplayLabel = 'Pto. Verde'
      FieldName = 'PTO_VERDE'
    end
    object QMFamiliasACT_TAR_AUTOM: TIntegerField
      DisplayLabel = 'Act. Tar. Aut.'
      FieldName = 'ACT_TAR_AUTOM'
    end
    object QMFamiliasMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object QMFamiliasTIPO_REDONDEO: TIntegerField
      DisplayLabel = 'Tipo Redondeo'
      FieldName = 'TIPO_REDONDEO'
      OnChange = QMFamiliasTIPO_REDONDEOChange
    end
    object QMFamiliasDIAS_MIN: TIntegerField
      DisplayLabel = 'Dias Min.'
      FieldKind = fkCalculated
      FieldName = 'DIAS_MIN'
      Calculated = True
    end
    object QMFamiliasDIAS_MAX: TIntegerField
      DisplayLabel = 'Dias Max.'
      FieldKind = fkCalculated
      FieldName = 'DIAS_MAX'
      Calculated = True
    end
    object QMFamiliasCTA_DEVOLUCION_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object QMFamiliasCTA_DEVOLUCION_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object QMFamiliasCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Compras'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object QMFamiliasCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Ventas'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
    object QMFamiliasTITULO_WEB: TFIBStringField
      DisplayLabel = 'Descripcion Web'
      FieldName = 'TITULO_WEB'
      Size = 15
    end
    object QMFamiliasWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
    object QMFamiliasID_FAMILIA: TIntegerField
      DisplayLabel = 'ID Familia'
      FieldName = 'ID_FAMILIA'
    end
    object QMFamiliasORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMFamiliasTIPO_PRECIO_BASE: TIntegerField
      DisplayLabel = 'T. Precio Base'
      FieldName = 'TIPO_PRECIO_BASE'
    end
    object QMFamiliasTIPO_REGISTRO_FITOSANITARIO: TFIBStringField
      DisplayLabel = 'Tipo Reg. Fitosanitario'
      FieldName = 'TIPO_REGISTRO_FITOSANITARIO'
      Size = 1
    end
    object QMFamiliasDISPONIBILIDAD: TIntegerField
      DisplayLabel = 'Disponibilidad'
      FieldName = 'DISPONIBILIDAD'
      OnChange = QMFamiliasDISPONIBILIDADChange
    end
    object QMFamiliasSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMFamiliasID_IMAGEN: TIntegerField
      DisplayLabel = 'Id Imagen'
      FieldName = 'ID_IMAGEN'
    end
    object QMFamiliasCANTIDAD_ARTICULOS: TIntegerField
      DisplayLabel = 'Cant. Articulos'
      FieldKind = fkCalculated
      FieldName = 'CANTIDAD_ARTICULOS'
      Calculated = True
    end
    object QMFamiliasACTUALIZA_VENTA: TIntegerField
      DisplayLabel = 'Act. Venta'
      FieldName = 'ACTUALIZA_VENTA'
    end
    object QMFamiliasPCOSTE_CERO_EN_VENTAS: TIntegerField
      DisplayLabel = 'P. Coste cero en Ventas'
      FieldName = 'PCOSTE_CERO_EN_VENTAS'
    end
  end
  object DSQMFamilias: TDataSource
    DataSet = QMFamilias
    Left = 160
    Top = 16
  end
  object xTipoIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, P_IVA, P_RECARGO FROM SYS_TIPO_IVA   '
      'WHERE PAIS=?PAIS AND TIPO=?TIPO_IVA')
    UniDirectional = False
    DataSource = DSQMFamilias
    Left = 40
    Top = 64
    object xTipoIvaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
    object xTipoIvaP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xTipoIvaP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
  end
  object DSxTipoIva: TDataSource
    DataSet = xTipoIva
    Left = 160
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 288
    Top = 16
  end
  object QMSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_FAM_EECS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  FAMILIA=?old_FAMILIA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_FAM_EECS'
      
        '  (SERIE,CANAL,EJERCICIO,EMPRESA,CTA_VENTAS,CTA_COMPRAS,FAMILIA,' +
        'CTA_DEVOLUCION_COMPRAS,CTA_DEVOLUCION_VENTAS,CTA_ABONO_COMPRAS,C' +
        'TA_ABONO_VENTAS)'
      'VALUES'
      
        '  (?SERIE,?CANAL,?EJERCICIO,?EMPRESA,?CTA_VENTAS,?CTA_COMPRAS,?F' +
        'AMILIA,?CTA_DEVOLUCION_COMPRAS,?CTA_DEVOLUCION_VENTAS,?CTA_ABONO' +
        '_COMPRAS,?CTA_ABONO_VENTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FAM_EECS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_FAM_EECS'
      'WHERE   EMPRESA    =  ?EMPRESA AND'
      '        EJERCICIO  =  ?EJERCICIO AND'
      '        CANAL      =  ?CANAL     AND'
      '        FAMILIA    =  ?FAMILIA'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_FAM_EECS'
      'SET'
      '  CTA_VENTAS=?CTA_VENTAS '
      '  ,CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_DEVOLUCION_COMPRAS=?CTA_DEVOLUCION_COMPRAS '
      '  ,CTA_DEVOLUCION_VENTAS=?CTA_DEVOLUCION_VENTAS '
      '  ,CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS '
      '  ,CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  FAMILIA=?FAMILIA ')
    AutoCalcFields = False
    DataSource = DSQMFamilias
    AfterDelete = Graba
    AfterOpen = QMSeriesAfterOpen
    AfterPost = Graba
    OnNewRecord = QMSeriesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'FAMILIA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_FAM_EECS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 160
    object QMSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSeriesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMSeriesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      OnChange = QMSeriesSERIEChange
      Size = 10
    end
    object QMSeriesFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMSeriesCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object QMSeriesCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object QMSeriesCTA_DEVOLUCION_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object QMSeriesCTA_DEVOLUCION_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object QMSeriesCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Compras'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object QMSeriesCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Ventas'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
  end
  object DSQMSeries: TDataSource
    AutoEdit = False
    DataSet = QMSeries
    Left = 160
    Top = 160
  end
  object xTiposRedondeo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_REDONDEOS'
      'WHERE TIPO_REDONDEO = ?TIPO_REDONDEO'
      '')
    UniDirectional = False
    DataSource = DSQMFamilias
    Plan.Strings = (
      'PLAN (SYS_TIPO_REDONDEOS INDEX (PK_SYS_TIPO_REDONDEOS))')
    Left = 40
    Top = 112
  end
  object DSxTiposRedondeos: TDataSource
    DataSet = xTiposRedondeo
    Left = 160
    Top = 112
  end
  object QCtasCompraVenta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure dame_cuentas_compra_venta (?EMPRESA,?EJERCICIO' +
        ',?CANAL)')
    Transaction = TLocal
    AutoTrans = True
    Left = 288
    Top = 64
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_SERIES'
      'WHERE EMPRESA = ?EMPRESA AND'
      '  EJERCICIO = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  SERIE = ?SERIE'
      ''
      ' ')
    UniDirectional = True
    DataSource = DSQMSeries
    Left = 40
    Top = 208
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 160
    Top = 208
  end
  object DSQMProyectos: TDataSource
    AutoEdit = False
    DataSet = QMProyectos
    Left = 160
    Top = 400
  end
  object QMProyectos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_FAM_PROY'
      'WHERE'
      '  FAMILIA=?old_FAMILIA AND '
      '  PROYECTO=?old_PROYECTO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_FAM_PROY'
      
        '  (PROYECTO,EMPRESA,EJERCICIO,CANAL,FAMILIA,CTA_COMPRAS,CTA_VENT' +
        'AS,CTA_DEVOLUCION_COMPRAS,CTA_DEVOLUCION_VENTAS,CTA_ABONO_COMPRA' +
        'S,CTA_ABONO_VENTAS)'
      'VALUES'
      
        '  (?PROYECTO,?EMPRESA,?EJERCICIO,?CANAL,?FAMILIA,?CTA_COMPRAS,?C' +
        'TA_VENTAS,?CTA_DEVOLUCION_COMPRAS,?CTA_DEVOLUCION_VENTAS,?CTA_AB' +
        'ONO_COMPRAS,?CTA_ABONO_VENTAS)'
      '')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FAM_PROY'
      'WHERE'
      '  FAMILIA=?FAMILIA AND '
      '  PROYECTO=?PROYECTO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CON_CUENTAS_GES_FAM_PROY'
      'WHERE'
      '  empresa = ?empresa  and'
      '  ejercicio  = ?ejercicio and'
      '  canal      = ?canal      and'
      '  familia     = ?familia  '
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_FAM_PROY'
      'SET'
      '  CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_VENTAS=?CTA_VENTAS '
      '  ,CTA_DEVOLUCION_COMPRAS=?CTA_DEVOLUCION_COMPRAS '
      '  ,CTA_DEVOLUCION_VENTAS=?CTA_DEVOLUCION_VENTAS '
      '  ,CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS '
      '  ,CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS '
      'WHERE'
      '  FAMILIA=?FAMILIA AND '
      '  PROYECTO=?PROYECTO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AutoCalcFields = False
    DataSource = DSQMFamilias
    AfterDelete = Graba
    AfterOpen = QMProyectosAfterOpen
    AfterPost = Graba
    OnNewRecord = QMProyectosNewRecord
    ClavesPrimarias.Strings = (
      'FAMILIA '
      'PROYECTO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_FAM_PROY'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 400
    object QMProyectosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProyectosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProyectosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProyectosPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      OnChange = QMProyectosPROYECTOChange
    end
    object QMProyectosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMProyectosCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object QMProyectosCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object QMProyectosCTA_DEVOLUCION_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object QMProyectosCTA_DEVOLUCION_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object QMProyectosCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Compras'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object QMProyectosCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Ventas'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
  end
  object DSQMProyectosSeries: TDataSource
    AutoEdit = False
    DataSet = QMProyectosSeries
    Left = 160
    Top = 256
  end
  object QMProyectosSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_ART_PROY_EECS'
      'WHERE'
      '  FAMILIA=?old_FAMILIA AND '
      '  SERIE=?old_SERIE AND '
      '  PROYECTO=?old_PROYECTO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA '
      '')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_FAM_PROY_EECS'
      
        '  (PROYECTO,SERIE,EMPRESA,EJERCICIO,CANAL,FAMILIA,CTA_COMPRAS,CT' +
        'A_VENTAS,CTA_DEVOLUCION_COMPRAS,CTA_DEVOLUCION_VENTAS,CTA_ABONO_' +
        'COMPRAS,CTA_ABONO_VENTAS)'
      'VALUES'
      
        '  (?PROYECTO,?SERIE,?EMPRESA,?EJERCICIO,?CANAL,?FAMILIA,?CTA_COM' +
        'PRAS,?CTA_VENTAS,?CTA_DEVOLUCION_COMPRAS,?CTA_DEVOLUCION_VENTAS,' +
        '?CTA_ABONO_COMPRAS,?CTA_ABONO_VENTAS)'
      '')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FAM_PROY_EECS'
      'WHERE'
      '  FAMILIA=?FAMILIA AND '
      '  SERIE=?SERIE AND '
      '  PROYECTO=?PROYECTO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_FAM_PROY_EECS'
      'WHERE'
      '  empresa = ?empresa  and'
      '  ejercicio  = ?ejercicio and'
      '  canal      = ?canal      and'
      '  familia     = ?familia ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_FAM_PROY_EECS'
      'SET'
      '  CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_VENTAS=?CTA_VENTAS '
      '  ,CTA_DEVOLUCION_COMPRAS=?CTA_DEVOLUCION_COMPRAS '
      '  ,CTA_DEVOLUCION_VENTAS=?CTA_DEVOLUCION_VENTAS '
      '  ,CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS '
      '  ,CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS '
      'WHERE'
      '  FAMILIA=?FAMILIA AND '
      '  SERIE=?SERIE AND '
      '  PROYECTO=?PROYECTO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AutoCalcFields = False
    DataSource = DSQMFamilias
    AfterDelete = Graba
    AfterOpen = QMProyectosSeriesAfterOpen
    AfterPost = Graba
    OnNewRecord = QMProyectosSeriesNewRecord
    ClavesPrimarias.Strings = (
      'FAMILIA '
      'SERIE '
      'PROYECTO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_FAM_PROY_EECS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 256
    object QMProyectosSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProyectosSeriesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProyectosSeriesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProyectosSeriesPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      OnChange = QMProyectosSeriesPROYECTOChange
    end
    object QMProyectosSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProyectosSeriesFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMProyectosSeriesCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object QMProyectosSeriesCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object QMProyectosSeriesCTA_DEVOLUCION_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object QMProyectosSeriesCTA_DEVOLUCION_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object QMProyectosSeriesCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Compras'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object QMProyectosSeriesCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Ventas'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM EMP_PROYECTOS'
      'WHERE '
      '  EMPRESA  = ?EMPRESA AND'
      '  PROYECTO= ?PROYECTO'
      ' ')
    UniDirectional = True
    DataSource = DSQMProyectos
    Left = 40
    Top = 448
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 160
    Top = 448
  end
  object xProyectosSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM EMP_PROYECTOS'
      'WHERE '
      '  EMPRESA  = ?EMPRESA AND'
      '  PROYECTO= ?PROYECTO'
      ' ')
    UniDirectional = True
    DataSource = DSQMProyectosSeries
    Left = 40
    Top = 304
  end
  object DSxProyectosSeries: TDataSource
    DataSet = xProyectosSeries
    Left = 160
    Top = 304
  end
  object DSxSeries_PROYSER: TDataSource
    DataSet = xSeries_PROYSER
    Left = 160
    Top = 352
  end
  object xSeries_PROYSER: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_SERIES'
      'WHERE EMPRESA = ?EMPRESA AND'
      '  EJERCICIO = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  SERIE = ?SERIE')
    UniDirectional = True
    DataSource = DSQMProyectosSeries
    Left = 40
    Top = 352
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 408
    Top = 16
  end
  object QMSubfamilias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_SUBFAMILIAS'
      'WHERE'
      '  ID_SUBFAMILIA=?old_ID_SUBFAMILIA')
    InsertSQL.Strings = (
      'INSERT INTO ART_SUBFAMILIAS'
      
        '  (ID_SUBFAMILIA,EMPRESA,SUBFAMILIA,TITULO,ULT_MODIFICACION,ORDE' +
        'N,ID_FAMILIA,WEB)'
      'VALUES'
      
        '  (?ID_SUBFAMILIA,?EMPRESA,?SUBFAMILIA,?TITULO,?ULT_MODIFICACION' +
        ',?ORDEN,?ID_FAMILIA,?WEB)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_SUBFAMILIAS'
      'WHERE'
      '  ID_SUBFAMILIA=?ID_SUBFAMILIA')
    SelectSQL.Strings = (
      'SELECT * FROM ART_SUBFAMILIAS'
      'WHERE'
      'ID_FAMILIA = ?ID_FAMILIA'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_SUBFAMILIAS'
      'SET'
      '  SUBFAMILIA=?SUBFAMILIA '
      '  ,TITULO=?TITULO '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,ORDEN=?ORDEN '
      '  ,ID_FAMILIA=?ID_FAMILIA'
      '  ,WEB=?WEB'
      'WHERE'
      '  ID_SUBFAMILIA=?ID_SUBFAMILIA')
    DataSource = DSQMFamilias
    AfterPost = QMSubfamiliasAfterPost
    BeforeEdit = QMSubfamiliasBeforeEdit
    BeforePost = QMSubfamiliasBeforePost
    OnNewRecord = QMSubfamiliasNewRecord
    ClavesPrimarias.Strings = (
      'ID_SUBFAMILIA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_SUBFAMILIAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 496
    object QMSubfamiliasID_SUBFAMILIA: TIntegerField
      DisplayLabel = 'ID Subfamilia'
      FieldName = 'ID_SUBFAMILIA'
    end
    object QMSubfamiliasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSubfamiliasSUBFAMILIA: TFIBStringField
      DisplayLabel = 'Subfamilia'
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
    object QMSubfamiliasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMSubfamiliasULT_MODIFICACION: TDateTimeField
      DisplayLabel = 'Ult. Mod.'
      FieldName = 'ULT_MODIFICACION'
    end
    object QMSubfamiliasORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMSubfamiliasID_FAMILIA: TIntegerField
      DisplayLabel = 'ID Familia'
      FieldName = 'ID_FAMILIA'
    end
    object QMSubfamiliasWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
  end
  object DSQMSubfamilias: TDataSource
    DataSet = QMSubfamilias
    Left = 160
    Top = 496
  end
  object xDisponibilidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_ART_DISPONIBILIDAD'
      'WHERE DISPONIBILIDAD=?DISPONIBILIDAD')
    UniDirectional = False
    DataSource = DSQMFamilias
    Left = 40
    Top = 544
  end
  object DSxDisponibilidad: TDataSource
    DataSet = xDisponibilidad
    Left = 160
    Top = 544
  end
  object QMConfECPrestashop: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM SYS_CONF_PRESTASHOP'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE   ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_CONF_PRESTASHOP'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMFamilias
    AfterScroll = QMConfECPrestashopAfterScroll
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 288
    Top = 160
    object QMConfECPrestashopID: TIntegerField
      DisplayLabel = 'Id Conf.'
      FieldName = 'ID'
    end
    object QMConfECPrestashopTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 35
    end
    object QMConfECPrestashopWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 200
    end
    object QMConfECPrestashopEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfECPrestashopCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConfECPrestashopSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMConfECPrestashopACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConfECPrestashopPREFIJO_ART: TFIBStringField
      DisplayLabel = 'Prefico Art.'
      FieldName = 'PREFIJO_ART'
      Size = 15
    end
    object QMConfECPrestashopALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMConfECPrestashopAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMConfECPrestashopSOLO_CLIENTE_CON_PEDIDO: TIntegerField
      DisplayLabel = 'Solo Clientes Con Ped.'
      FieldName = 'SOLO_CLIENTE_CON_PEDIDO'
    end
    object QMConfECPrestashopUTILIZA_MODULO_PAYPAL: TIntegerField
      DisplayLabel = 'Utiliza Mod. Paypal'
      FieldName = 'UTILIZA_MODULO_PAYPAL'
    end
    object QMConfECPrestashopART_SIN_CONTROL_STOCK: TIntegerField
      DisplayLabel = 'Art. Sin Stock'
      FieldName = 'ART_SIN_CONTROL_STOCK'
    end
    object QMConfECPrestashopUTILIZA_REF_PRESTAHOP: TIntegerField
      DisplayLabel = 'Utiliza Ref. PS'
      FieldName = 'UTILIZA_REF_PRESTAHOP'
    end
    object QMConfECPrestashopVERSION_PRESTASHOP: TFIBStringField
      DisplayLabel = 'Version PS'
      FieldName = 'VERSION_PRESTASHOP'
      Size = 15
    end
    object QMConfECPrestashopID_TIENDA_ARTICULOS: TIntegerField
      DisplayLabel = 'Id Tienda Art.'
      FieldName = 'ID_TIENDA_ARTICULOS'
    end
    object QMConfECPrestashopWS_URL: TFIBStringField
      DisplayLabel = 'WS URL'
      FieldName = 'WS_URL'
      Size = 256
    end
    object QMConfECPrestashopWS_KEY: TFIBStringField
      DisplayLabel = 'WS Key'
      FieldName = 'WS_KEY'
      Size = 256
    end
    object QMConfECPrestashopWS_VERSION: TFIBStringField
      DisplayLabel = 'WS Version'
      FieldName = 'WS_VERSION'
      Size = 15
    end
    object QMConfECPrestashopWS_DEBUG: TIntegerField
      DisplayLabel = 'WS Debug'
      FieldName = 'WS_DEBUG'
    end
    object QMConfECPrestashopWS_LANGUAGE: TIntegerField
      DisplayLabel = 'WS Language'
      FieldName = 'WS_LANGUAGE'
    end
    object QMConfECPrestashopWS_ORDER_STATE: TIntegerField
      DisplayLabel = 'WS Order State'
      FieldName = 'WS_ORDER_STATE'
    end
  end
  object DSQMConfECPrestashop: TDataSource
    DataSet = QMConfECPrestashop
    Left = 384
    Top = 160
  end
  object DSQMFamiliaECPrestashop: TDataSource
    DataSet = QMFamiliaECPrestashop
    Left = 384
    Top = 208
  end
  object QMFamiliaECPrestashop: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_PRESTASHOP_FAMILIA'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_FAMILIA=?old_ID_FAMILIA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_PRESTASHOP_FAMILIA'
      '  (ULT_SINCRONIZACION,ID_CONFIGURACION,ID_FAMILIA,ID_CATEGORY)'
      'VALUES'
      
        '  (?ULT_SINCRONIZACION,?ID_CONFIGURACION,?ID_FAMILIA,?ID_CATEGOR' +
        'Y)')
    RefreshSQL.Strings = (
      'SELECT'
      
        '  E.*, F.FAMILIA, F.TITULO TITULO_FAMILIA, S.SUBFAMILIA, S.TITUL' +
        'O TITULO_SUBFAMILIA'
      'FROM SYS_CONF_PRESTASHOP_FAMILIA E'
      'JOIN ART_FAMILIAS F ON E.ID_FAMILIA = F.ID_FAMILIA'
      
        'LEFT JOIN ART_SUBFAMILIAS S ON E.ID_SUBFAMILIA  = S.ID_SUBFAMILI' +
        'A'
      'WHERE'
      '  E.ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  E.ID_FAMILIA=?ID_FAMILIA AND'
      '  E.ID_SUBFAMILIA=?ID_SUBFAMILIA ')
    SelectSQL.Strings = (
      'SELECT'
      
        '  E.*, F.FAMILIA, F.TITULO TITULO_FAMILIA, S.SUBFAMILIA, S.TITUL' +
        'O TITULO_SUBFAMILIA'
      'FROM SYS_CONF_PRESTASHOP_FAMILIA E'
      'JOIN ART_FAMILIAS F ON E.ID_FAMILIA = F.ID_FAMILIA'
      
        'LEFT JOIN ART_SUBFAMILIAS S ON E.ID_SUBFAMILIA  = S.ID_SUBFAMILI' +
        'A'
      'WHERE'
      '  E.ID_CONFIGURACION=?ID_CONFIGURACION AND'
      '  E.ID_FAMILIA = ?ID_FAMILIA'
      'ORDER BY E.ID_SUBFAMILIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_PRESTASHOP_FAMILIA'
      'SET'
      '  ULT_SINCRONIZACION=?ULT_SINCRONIZACION '
      '  ,ID_CATEGORY=?ID_CATEGORY '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_FAMILIA=?ID_FAMILIA ')
    DataSource = DSQMFamilias
    BeforeOpen = QMFamiliaECPrestashopBeforeOpen
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_FAMILIA '
      'ID_SUBFAMILIA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_PRESTASHOP_FAMILIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 288
    Top = 208
    object QMFamiliaECPrestashopID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Conf.'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMFamiliaECPrestashopID_FAMILIA: TIntegerField
      DisplayLabel = 'Id Familia'
      FieldName = 'ID_FAMILIA'
    end
    object QMFamiliaECPrestashopID_CATEGORY: TIntegerField
      DisplayLabel = 'Id Category'
      FieldName = 'ID_CATEGORY'
    end
    object QMFamiliaECPrestashopULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sinc.'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object QMFamiliaECPrestashopID_SUBFAMILIA: TIntegerField
      DisplayLabel = 'Id Subfamilia'
      FieldName = 'ID_SUBFAMILIA'
    end
    object QMFamiliaECPrestashopTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMFamiliaECPrestashopTITULO_SUBFAMILIA: TFIBStringField
      DisplayLabel = 'Titulo Subfamilia'
      FieldName = 'TITULO_SUBFAMILIA'
      Size = 40
    end
    object QMFamiliaECPrestashopFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMFamiliaECPrestashopSUBFAMILIA: TFIBStringField
      DisplayLabel = 'Subfamilia'
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
  end
end
