object DMCentrosCoste: TDMCentrosCoste
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 341
  Top = 253
  Height = 302
  Width = 496
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 304
    Top = 24
  end
  object DSQMCentrosCoste: TDataSource
    DataSet = QMCentrosCoste
    Left = 151
    Top = 24
  end
  object QMCentrosCoste: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ANA_CENTROS_COSTE'
      'WHERE'
      '  CENTRO_COSTE_PADRE=?old_CENTRO_COSTE_PADRE AND '
      '  CENTRO_COSTE=?old_CENTRO_COSTE AND '
      '  PLAN_CONTABLE=?old_PLAN_CONTABLE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ANA_CENTROS_COSTE'
      
        '  (EMPRESA,EJERCICIO,CANAL,PLAN_CONTABLE,CENTRO_COSTE,TITULO,NIV' +
        'EL,DISTRIBUCION_POSTERIOR,CENTRO_COSTE_PADRE,ID_P,ID_CC,ID_CC_PA' +
        'DRE)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PLAN_CONTABLE,?CENTRO_COSTE,?TITU' +
        'LO,?NIVEL,?DISTRIBUCION_POSTERIOR,?CENTRO_COSTE_PADRE,?ID_P,?ID_' +
        'CC,?ID_CC_PADRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANA_CENTROS_COSTE'
      'WHERE'
      '  CENTRO_COSTE_PADRE=?CENTRO_COSTE_PADRE AND '
      '  CENTRO_COSTE=?old_CENTRO_COSTE AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ANA_CENTROS_COSTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND'
      ' CENTRO_COSTE_PADRE=?CENTRO_COSTE_PADRE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ANA_CENTROS_COSTE'
      'SET'
      '  TITULO=?TITULO '
      '  ,DISTRIBUCION_POSTERIOR=?DISTRIBUCION_POSTERIOR '
      'WHERE'
      '  CENTRO_COSTE_PADRE=?CENTRO_COSTE_PADRE AND '
      '  CENTRO_COSTE=?old_CENTRO_COSTE AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMCentrosCosteNewRecord
    ClavesPrimarias.Strings = (
      'CENTRO_COSTE_PADRE '
      'CENTRO_COSTE '
      'PLAN_CONTABLE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ANA_CENTROS_COSTE'
    UpdateTransaction = TLocal
    Left = 42
    Top = 23
    object QMCentrosCosteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCentrosCosteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCentrosCosteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCentrosCostePLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'PGC'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object QMCentrosCosteCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'C. Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object QMCentrosCosteTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCentrosCosteNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMCentrosCosteDISTRIBUCION_POSTERIOR: TIntegerField
      DisplayLabel = 'Distrib. Posterior'
      FieldName = 'DISTRIBUCION_POSTERIOR'
    end
    object QMCentrosCosteCENTRO_COSTE_PADRE: TFIBStringField
      DisplayLabel = 'C. Coste Padre'
      FieldName = 'CENTRO_COSTE_PADRE'
      Size = 10
    end
    object QMCentrosCosteID_P: TIntegerField
      DisplayLabel = 'ID P.'
      FieldName = 'ID_P'
    end
    object QMCentrosCosteID_CC: TIntegerField
      DisplayLabel = 'ID C.C.'
      FieldName = 'ID_CC'
    end
    object QMCentrosCosteID_CC_PADRE: TIntegerField
      DisplayLabel = 'ID C.C. Padre'
      FieldName = 'ID_CC_PADRE'
    end
  end
  object xPlanes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select plan_contable,titulo from ana_plan_contable'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal')
    UniDirectional = False
    Left = 376
    Top = 80
  end
  object xPlan: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select plan_contable,titulo,id_p from ana_plan_contable'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'plan_contable=?plan_contable')
    UniDirectional = False
    Left = 432
    Top = 80
    object xPlanPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object xPlanID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object xPlanTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xHijos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select centro_coste,titulo,id_cc from ana_centros_coste'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and '
      
        'plan_contable=?plan_contable and centro_coste_padre=?centro_cost' +
        'e_padre'
      'order by centro_coste')
    UniDirectional = False
    Left = 432
    Top = 144
  end
  object xCCActivo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select titulo,centro_coste,centro_coste_padre, id_cc,id_cc_padre' +
        ',nivel,distribucion_posterior '
      'from ana_centros_coste'
      'where id_cc=?id_cc')
    UniDirectional = False
    Left = 376
    Top = 144
    object xCCActivoCENTRO_COSTE_PADRE: TFIBStringField
      DisplayLabel = 'C. Coste Padre'
      FieldName = 'CENTRO_COSTE_PADRE'
      Size = 10
    end
    object xCCActivoID_CC_PADRE: TIntegerField
      DisplayLabel = 'ID C.C. Padre'
      FieldName = 'ID_CC_PADRE'
    end
    object xCCActivoCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'C. Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object xCCActivoID_CC: TIntegerField
      DisplayLabel = 'ID C.C.'
      FieldName = 'ID_CC'
    end
    object xCCActivoTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xCCActivoNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object xCCActivoDISTRIBUCION_POSTERIOR: TIntegerField
      DisplayLabel = 'Distrib. Posterior'
      FieldName = 'DISTRIBUCION_POSTERIOR'
    end
  end
  object QDameID_CC: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select id_cc from ana_centros_coste'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'plan_contable=?plan_contable and centro_coste=?centro_coste and'
      'centro_coste_padre=?centro_coste_padre')
    Transaction = TLocal
    AutoTrans = True
    Left = 304
    Top = 80
  end
  object QMPresupuestos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ANA_PRESUPUESTO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PLAN_CONTABLE=?old_PLAN_CONTABLE AND '
      '  CENTRO_COSTE=?old_CENTRO_COSTE AND '
      '  PERIODO=?old_PERIODO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ANA_PRESUPUESTO'
      
        '  (EMPRESA,EJERCICIO,CANAL,PLAN_CONTABLE,CENTRO_COSTE,PERIODO,TI' +
        'TULO,SALDO,PRESUPUESTO,DESVIACION,CONTROL,TIPO_CONTROL,ID_P,ID_C' +
        'C)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PLAN_CONTABLE,?CENTRO_COSTE,?PERI' +
        'ODO,?TITULO,?SALDO,?PRESUPUESTO,?DESVIACION,?CONTROL,?TIPO_CONTR' +
        'OL,?ID_P,?ID_CC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ANA_PRESUPUESTO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CENTRO_COSTE=?CENTRO_COSTE AND '
      '  PERIODO=?PERIODO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ANA_PRESUPUESTO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CENTRO_COSTE=?CENTRO_COSTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ANA_PRESUPUESTO'
      'SET'
      '  PRESUPUESTO=?PRESUPUESTO '
      '  ,DESVIACION=?DESVIACION '
      '  ,CONTROL=?CONTROL '
      '  ,TIPO_CONTROL=?TIPO_CONTROL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CENTRO_COSTE=?CENTRO_COSTE AND '
      '  PERIODO=?PERIODO ')
    AfterDelete = GrabaPresupuestos
    AfterPost = GrabaPresupuestos
    OnNewRecord = QMPresupuestosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PLAN_CONTABLE '
      'CENTRO_COSTE '
      'PERIODO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ANA_PRESUPUESTO'
    UpdateTransaction = TLocal
    Left = 42
    Top = 95
    object QMPresupuestosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPresupuestosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPresupuestosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPresupuestosPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'PCG'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object QMPresupuestosCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'C. Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object QMPresupuestosPERIODO: TFIBStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMPresupuestosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 50
    end
    object QMPresupuestosSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object QMPresupuestosPRESUPUESTO: TFloatField
      DisplayLabel = 'Presupuesto'
      FieldName = 'PRESUPUESTO'
    end
    object QMPresupuestosDESVIACION: TFloatField
      DisplayLabel = 'Desviaci'#243'n'
      FieldName = 'DESVIACION'
    end
    object QMPresupuestosCONTROL: TFloatField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
    end
    object QMPresupuestosTIPO_CONTROL: TIntegerField
      DisplayLabel = 'Tipo Control'
      FieldName = 'TIPO_CONTROL'
    end
    object QMPresupuestosID_P: TIntegerField
      DisplayLabel = 'ID P.'
      FieldName = 'ID_P'
    end
    object QMPresupuestosID_CC: TIntegerField
      DisplayLabel = 'ID C.C.'
      FieldName = 'ID_CC'
    end
  end
  object DSQMPresupuestos: TDataSource
    DataSet = QMPresupuestos
    Left = 151
    Top = 96
  end
  object QMPlantillas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ANA_CC_PLANTILLAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PLAN_CONTABLE=?old_PLAN_CONTABLE AND '
      '  CENTRO_COSTE=?old_CENTRO_COSTE AND '
      '  INICIO=?old_INICIO AND '
      '  FIN=?old_FIN ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ANA_CC_PLANTILLAS'
      
        '  (EMPRESA,EJERCICIO,CANAL,PLAN_CONTABLE,CENTRO_COSTE,INICIO,FIN' +
        ',PLANTILLA,TITULO,ID_P,ID_CC,ID_PL,ID_CC_DIST)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PLAN_CONTABLE,?CENTRO_COSTE,?INIC' +
        'IO,?FIN,?PLANTILLA,?TITULO,?ID_P,?ID_CC,?ID_PL,?ID_CC_DIST)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ANA_CC_PLANTILLAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CENTRO_COSTE=?CENTRO_COSTE AND '
      '  INICIO=?old_INICIO AND '
      '  FIN=?old_FIN ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ANA_CC_PLANTILLAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CENTRO_COSTE=?CENTRO_COSTE'
      'ORDER BY INICIO,FIN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ANA_CC_PLANTILLAS'
      'SET'
      '  PLANTILLA=?PLANTILLA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CENTRO_COSTE=?CENTRO_COSTE AND '
      '  INICIO=?old_INICIO AND '
      '  FIN=?old_FIN ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMPlantillasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PLAN_CONTABLE '
      'CENTRO_COSTE '
      'INICIO '
      'FIN ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ANA_CC_PLANTILLAS'
    UpdateTransaction = TLocal
    Left = 42
    Top = 160
    object QMPlantillasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPlantillasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPlantillasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPlantillasPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'PGC'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object QMPlantillasCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'C. Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object QMPlantillasINICIO: TDateTimeField
      DisplayLabel = 'Inicio'
      FieldName = 'INICIO'
    end
    object QMPlantillasFIN: TDateTimeField
      DisplayLabel = 'Fin'
      FieldName = 'FIN'
    end
    object QMPlantillasPLANTILLA: TIntegerField
      DisplayLabel = 'Plantilla'
      FieldName = 'PLANTILLA'
      OnChange = QMPlantillasPLANTILLAChange
    end
    object QMPlantillasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPlantillasID_P: TIntegerField
      DisplayLabel = 'ID P.'
      FieldName = 'ID_P'
    end
    object QMPlantillasID_CC: TIntegerField
      DisplayLabel = 'ID C.C.'
      FieldName = 'ID_CC'
    end
    object QMPlantillasID_PL: TIntegerField
      DisplayLabel = 'ID Pl.'
      FieldName = 'ID_PL'
    end
    object QMPlantillasID_CC_DIST: TIntegerField
      DisplayLabel = 'ID C.C. Dist.'
      FieldName = 'ID_CC_DIST'
    end
    object QMPlantillasAPLICADA: TIntegerField
      DisplayLabel = 'Aplicada'
      FieldName = 'APLICADA'
    end
  end
  object DSQMPlantillas: TDataSource
    DataSet = QMPlantillas
    Left = 151
    Top = 160
  end
  object xPlantilla: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ana_plantillas_cc'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'plan_contable=?plan_contable and plantilla=?plantilla')
    UniDirectional = False
    DataSource = DSQMPlantillas
    Left = 377
    Top = 203
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xCuentas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ANA_CUENTAS_PLANTILLAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PLAN_CONTABLE=?old_PLAN_CONTABLE AND '
      '  CUENTA=?old_CUENTA AND '
      '  PLANTILLA=?old_PLANTILLA AND '
      '  CENTRO_COSTE=?old_CENTRO_COSTE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ANA_CUENTAS_PLANTILLAS'
      
        '  (EMPRESA,EJERCICIO,CANAL,PLAN_CONTABLE,CUENTA,PLANTILLA,PL_TIT' +
        'ULO,LINEA,CENTRO_COSTE,CC_TITULO,PORCENTAJE,ID_P,ID_PL,ID_CC)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PLAN_CONTABLE,?CUENTA,?PLANTILLA,' +
        '?PL_TITULO,?LINEA,?CENTRO_COSTE,?CC_TITULO,?PORCENTAJE,?ID_P,?ID' +
        '_PL,?ID_CC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ANA_CUENTAS_PLANTILLAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CUENTA=?CUENTA AND '
      '  PLANTILLA=?PLANTILLA AND '
      '  CENTRO_COSTE=?CENTRO_COSTE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ANA_CUENTAS_PLANTILLAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CENTRO_COSTE=?CENTRO_COSTE'
      'order by cuenta,plantilla,linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ANA_CUENTAS_PLANTILLAS'
      'SET'
      '  PL_TITULO=?PL_TITULO '
      '  ,LINEA=?LINEA '
      '  ,CC_TITULO=?CC_TITULO '
      '  ,PORCENTAJE=?PORCENTAJE '
      '  ,ID_P=?ID_P '
      '  ,ID_PL=?ID_PL '
      '  ,ID_CC=?ID_CC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CUENTA=?CUENTA AND '
      '  PLANTILLA=?PLANTILLA AND '
      '  CENTRO_COSTE=?CENTRO_COSTE ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMPlantillasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PLAN_CONTABLE '
      'CUENTA '
      'PLANTILLA '
      'CENTRO_COSTE ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ver_ana_cuentas_plantillas'
    UpdateTransaction = TLocal
    Left = 46
    Top = 216
    object xCuentasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCuentasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCuentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCuentasPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'PGC'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object xCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xCuentasPLANTILLA: TIntegerField
      DisplayLabel = 'Plantilla'
      FieldName = 'PLANTILLA'
    end
    object xCuentasPL_TITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'PL_TITULO'
      Size = 60
    end
    object xCuentasLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object xCuentasCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'C. Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object xCuentasCC_TITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo C.C.'
      FieldName = 'CC_TITULO'
      Size = 60
    end
    object xCuentasPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
    object xCuentasID_P: TIntegerField
      DisplayLabel = 'ID P.'
      FieldName = 'ID_P'
    end
    object xCuentasID_PL: TIntegerField
      DisplayLabel = 'ID Pl.'
      FieldName = 'ID_PL'
    end
    object xCuentasID_CC: TIntegerField
      DisplayLabel = 'ID C.C.'
      FieldName = 'ID_CC'
    end
  end
  object DSxCuentas: TDataSource
    DataSet = xCuentas
    Left = 155
    Top = 216
  end
end
