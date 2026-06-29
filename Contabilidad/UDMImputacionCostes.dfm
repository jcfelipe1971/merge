object DMImputacionCostes: TDMImputacionCostes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 670
  Top = 204
  Height = 398
  Width = 516
  object QMImputaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ANA_TMP_IMPUTACIONES_DET'
      'WHERE'
      '  CENTRO_COSTE=?old_CENTRO_COSTE AND '
      '  LINEA=?old_LINEA AND '
      '  RIC=?old_RIC AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO ANA_TMP_IMPUTACIONES_DET'
      
        '  (ENTRADA,EMPRESA,EJERCICIO,CANAL,RIC,LINEA,CENTRO_COSTE,TITULO' +
        ',PORC,IMPORTE,DIST_POSTERIOR)'
      'VALUES'
      
        '  (?ENTRADA,?EMPRESA,?EJERCICIO,?CANAL,?RIC,?LINEA,?CENTRO_COSTE' +
        ',?TITULO,?PORC,?IMPORTE,?DIST_POSTERIOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANA_TMP_IMPUTACIONES_DET'
      'WHERE'
      '  CENTRO_COSTE=?old_CENTRO_COSTE AND '
      '  LINEA=?LINEA AND '
      '  RIC=?RIC AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM ANA_TMP_IMPUTACIONES_DET'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIC=?RIC AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ANA_TMP_IMPUTACIONES_DET'
      'SET'
      '   PORC=?PORC '
      '  ,IMPORTE=?IMPORTE '
      '  ,DIST_POSTERIOR=?DIST_POSTERIOR '
      'WHERE'
      '  CENTRO_COSTE=?old_CENTRO_COSTE AND '
      '  LINEA=?LINEA AND '
      '  RIC=?RIC AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    DataSource = DSQMApuntes
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMImputacionesNewRecord
    ClavesPrimarias.Strings = (
      'CENTRO_COSTE '
      'LINEA '
      'RIC '
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ANA_TMP_IMPUTACIONES_DET'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 42
    Top = 167
    object QMImputacionesENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMImputacionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMImputacionesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMImputacionesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMImputacionesRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMImputacionesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMImputacionesCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      OnChange = QMImputacionesCENTRO_COSTEChange
      Size = 10
    end
    object QMImputacionesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMImputacionesPORC: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORC'
    end
    object QMImputacionesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMImputacionesDIST_POSTERIOR: TIntegerField
      DisplayLabel = 'Distr. Posterior'
      FieldName = 'DIST_POSTERIOR'
    end
    object QMImputacionesCALCULANDO: TIntegerField
      DisplayLabel = 'Calculando'
      FieldName = 'CALCULANDO'
    end
  end
  object DSQMImputaciones: TDataSource
    DataSet = QMImputaciones
    Left = 148
    Top = 168
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 304
    Top = 24
  end
  object xPlan: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select plan_contable,titulo,id_p,proyecto from ana_plan_contable'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'plan_contable=?plan_contable')
    UniDirectional = False
    Left = 305
    Top = 136
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
    object xPlanPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
  end
  object DSQMApuntes: TDataSource
    DataSet = QMApuntes
    Left = 146
    Top = 104
  end
  object xPlanes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select plan_contable,titulo,proyecto from ana_plan_contable'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal')
    UniDirectional = False
    Left = 306
    Top = 80
  end
  object xCentroCoste: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo,distribucion_posterior from ana_centros_coste'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'plan_contable=?plan_contable and centro_coste=?centro_coste')
    UniDirectional = False
    DataSource = DSQMApuntes
    Left = 393
    Top = 80
    object xCentroCosteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xCentroCosteDISTRIBUCION_POSTERIOR: TIntegerField
      DisplayLabel = 'Distr. Posterior'
      FieldName = 'DISTRIBUCION_POSTERIOR'
    end
  end
  object xAsiento: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select c.empresa,c.ejercicio,c.canal,c.ric,c.tipo,i.imputacion  '
      'from con_cuentas_asientos c'
      'join ana_con_cuentas_asientos_imp i'
      
        'on (c.empresa=i.empresa and c.ejercicio=i.ejercicio and c.canal=' +
        'i.canal and c.ric=i.ric)'
      
        'where c.empresa=?empresa and c.ejercicio=?ejercicio and c.canal=' +
        '?canal and c.ric=?ric and i.plan_contable=?plan_contable')
    UniDirectional = False
    Left = 44
    Top = 27
    object xAsientoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAsientoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAsientoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAsientoRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xAsientoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAsientoIMPUTACION: TIntegerField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
    end
  end
  object DSxAsiento: TDataSource
    DataSet = xAsiento
    Left = 143
    Top = 29
  end
  object QPrimerAsiento: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select first(1) ric from con_cuentas_asientos c'
      'join ana_con_cuentas_asientos_imp i'
      
        'on (c.empresa=i.empresa and c.ejercicio=i.ejercicio and c.canal=' +
        'i.canal and c.ric=i.ric)'
      
        'where c.empresa=?empresa and c.ejercicio=?ejercicio and c.canal=' +
        '?canal and i.imputacion=1 and i.plan_contable=?plan_contable')
    Transaction = TLocal
    AutoTrans = True
    Left = 304
    Top = 192
  end
  object SPLlenarTablas: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure n_imputaciones_llenar_tmp(?empresa,?ejercicio,' +
        '?canal,?ric,?entrada,?plan_contable)')
    Transaction = TLocal
    AutoTrans = True
    Left = 392
    Top = 192
  end
  object xPlantilla: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo,id_pl from ana_plantillas_cc'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'plan_contable=?plan_contable and plantilla=?plantilla')
    UniDirectional = False
    Left = 41
    Top = 232
    object xPlantillaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPlantillaID_PL: TIntegerField
      DisplayLabel = 'ID Pl.'
      FieldName = 'ID_PL'
    end
  end
  object DSxPlantilla: TDataSource
    DataSet = xPlantilla
    Left = 148
    Top = 232
  end
  object QMApuntes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ANA_TMP_IMPUTACIONES'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIC=?old_RIC AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO ANA_TMP_IMPUTACIONES'
      
        '  (ENTRADA,EMPRESA,EJERCICIO,CANAL,RIC,LINEA,DEBE,HABER,CUENTA,T' +
        'EXTO,DOC_NUMERO,DOC_SERIE,DOC_FECHA,IMPUTACION,ID_PL)'
      'VALUES'
      
        '  (?ENTRADA,?EMPRESA,?EJERCICIO,?CANAL,?RIC,?LINEA,?DEBE,?HABER,' +
        '?CUENTA,?TEXTO,?DOC_NUMERO,?DOC_SERIE,?DOC_FECHA,?IMPUTACION,?ID' +
        '_PL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANA_TMP_IMPUTACIONES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIC=?RIC AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM ANA_TMP_IMPUTACIONES'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ANA_TMP_IMPUTACIONES'
      'SET'
      '  DEBE=?DEBE '
      '  ,HABER=?HABER '
      '  ,CUENTA=?CUENTA '
      '  ,TEXTO=?TEXTO '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,DOC_FECHA=?DOC_FECHA '
      '  ,IMPUTACION=?IMPUTACION '
      '  ,ID_PL=?ID_PL '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIC=?RIC AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    AfterDelete = Graba
    AfterPost = Graba
    AfterScroll = QMApuntesAfterScroll
    OnNewRecord = QMImputacionesNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIC '
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ANA_TMP_IMPUTACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 42
    Top = 103
    object QMApuntesENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMApuntesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMApuntesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMApuntesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMApuntesRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMApuntesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMApuntesDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object QMApuntesHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object QMApuntesCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMApuntesTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object QMApuntesDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object QMApuntesDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMApuntesDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMApuntesIMPUTACION: TIntegerField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
    end
    object QMApuntesID_PL: TIntegerField
      DisplayLabel = 'ID Pl.'
      FieldName = 'ID_PL'
    end
    object QMApuntesPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMApuntesTITULO_PROYECTO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_PROYECTO'
      Size = 60
    end
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select first(1) ric from con_cuentas_asientos c'
      'join ana_con_cuentas_asientos_imp i'
      
        'on (c.empresa=i.empresa and c.ejercicio=i.ejercicio and c.canal=' +
        'i.canal and c.ric=i.ric)'
      
        'where c.empresa=?empresa and c.ejercicio=?ejercicio and c.canal=' +
        '?canal and i.imputacion=1 and i.plan_contable=?plan_contable')
    Transaction = TLocal
    AutoTrans = True
    Left = 390
    Top = 20
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 249
    Top = 24
  end
end
