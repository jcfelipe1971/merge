object DMPlantillasImputacion: TDMPlantillasImputacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 226
  Top = 201
  Height = 310
  Width = 474
  object QMCentrosCoste: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ANA_PLANTILLA_CC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PLAN_CONTABLE=?old_PLAN_CONTABLE AND '
      '  PLANTILLA=?old_PLANTILLA AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ANA_PLANTILLA_CC'
      
        '  (EMPRESA,EJERCICIO,CANAL,PLAN_CONTABLE,PLANTILLA,LINEA,CENTRO_' +
        'COSTE,TITULO,PORCENTAJE,REDONDEO,ID_P,ID_PL,ID_CC)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PLAN_CONTABLE,?PLANTILLA,?LINEA,?' +
        'CENTRO_COSTE,?TITULO,?PORCENTAJE,?REDONDEO,?ID_P,?ID_PL,?ID_CC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ANA_PLANTILLA_CC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  PLANTILLA=?PLANTILLA AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ANA_PLANTILLA_CC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  PLANTILLA=?PLANTILLA'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ANA_PLANTILLA_CC'
      'SET'
      '  CENTRO_COSTE=?CENTRO_COSTE '
      '  ,PORCENTAJE=?PORCENTAJE '
      '  ,REDONDEO=?REDONDEO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  PLANTILLA=?PLANTILLA AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMPlantillas
    AfterDelete = GrabaCentrosCoste
    AfterPost = GrabaCentrosCoste
    BeforeInsert = QMCentrosCosteBeforeInsert
    OnNewRecord = QMCentrosCosteNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PLAN_CONTABLE '
      'PLANTILLA '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ANA_PLANTILLA_CC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 42
    Top = 95
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
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object QMCentrosCostePLANTILLA: TIntegerField
      DisplayLabel = 'Plantilla'
      FieldName = 'PLANTILLA'
    end
    object QMCentrosCosteLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCentrosCosteCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      OnChange = QMCentrosCosteCENTRO_COSTEChange
      Size = 10
    end
    object QMCentrosCosteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCentrosCostePORCENTAJE: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORCENTAJE'
    end
    object QMCentrosCosteREDONDEO: TIntegerField
      DisplayLabel = 'Redondeo'
      FieldName = 'REDONDEO'
    end
    object QMCentrosCosteID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object QMCentrosCosteID_PL: TIntegerField
      DisplayLabel = 'ID Pl.'
      FieldName = 'ID_PL'
    end
    object QMCentrosCosteID_CC: TIntegerField
      DisplayLabel = 'ID C. C.'
      FieldName = 'ID_CC'
    end
  end
  object DSQMCentrosCoste: TDataSource
    DataSet = QMCentrosCoste
    Left = 151
    Top = 96
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 304
    Top = 24
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
  end
  object QMPlantillas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ANA_PLANTILLAS_CC'
      'WHERE'
      '  PLANTILLA=?old_PLANTILLA AND '
      '  PLAN_CONTABLE=?old_PLAN_CONTABLE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ANA_PLANTILLAS_CC'
      
        '  (EMPRESA,EJERCICIO,CANAL,PLAN_CONTABLE,PLANTILLA,TITULO,COMPLE' +
        'TA,ID_P,ID_PL)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PLAN_CONTABLE,?PLANTILLA,?TITULO,' +
        '?COMPLETA,?ID_P,?ID_PL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANA_PLANTILLAS_CC'
      'WHERE'
      '  PLANTILLA=?old_PLANTILLA AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ANA_PLANTILLAS_CC'
      'WHERE'
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA '
      'ORDER BY PLANTILLA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ANA_PLANTILLAS_CC'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  PLANTILLA=?old_PLANTILLA AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMPlantillasNewRecord
    ClavesPrimarias.Strings = (
      'PLANTILLA '
      'PLAN_CONTABLE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ANA_PLANTILLAS_CC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 42
    Top = 23
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
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object QMPlantillasPLANTILLA: TIntegerField
      DisplayLabel = 'Plantilla'
      FieldName = 'PLANTILLA'
    end
    object QMPlantillasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPlantillasCOMPLETA: TIntegerField
      DisplayLabel = 'Completa'
      FieldName = 'COMPLETA'
    end
    object QMPlantillasID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object QMPlantillasID_PL: TIntegerField
      DisplayLabel = 'ID Pl.'
      FieldName = 'ID_PL'
    end
  end
  object DSQMPlantillas: TDataSource
    DataSet = QMPlantillas
    Left = 151
    Top = 24
  end
  object QMCuentas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ANA_PLANTILLA_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PLAN_CONTABLE=?old_PLAN_CONTABLE AND '
      '  PLANTILLA=?old_PLANTILLA AND '
      '  CUENTA=?old_CUENTA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ANA_PLANTILLA_CUENTAS'
      
        '  (EMPRESA,EJERCICIO,CANAL,PLAN_CONTABLE,PLANTILLA,CUENTA,TITULO' +
        ',TIPO,GESTION,ID_P,ID_PL,PGC)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?PLAN_CONTABLE,?PLANTILLA,?CUENTA,' +
        '?TITULO,?TIPO,?GESTION,?ID_P,?ID_PL,?PGC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ANA_PLANTILLA_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  PLANTILLA=?PLANTILLA AND '
      '  CUENTA=?old_CUENTA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ANA_PLANTILLA_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  PLANTILLA=?PLANTILLA'
      'ORDER BY NIVEL,CUENTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ANA_PLANTILLA_CUENTAS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  PLANTILLA=?PLANTILLA AND '
      '  CUENTA=?old_CUENTA AND'
      '  PGC=?old_PGC ')
    DataSource = DSQMPlantillas
    AfterDelete = Graba
    AfterPost = Graba
    BeforeInsert = QMCuentasBeforeInsert
    BeforePost = QMCuentasBeforePost
    OnNewRecord = QMCuentasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PLAN_CONTABLE '
      'PLANTILLA '
      'CUENTA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ANA_PLANTILLA_CUENTAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 42
    Top = 159
    object QMCuentasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCuentasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCuentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCuentasPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object QMCuentasPLANTILLA: TIntegerField
      DisplayLabel = 'Plantilla'
      FieldName = 'PLANTILLA'
    end
    object QMCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      OnChange = QMCuentasCUENTAChange
      Size = 15
    end
    object QMCuentasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCuentasTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMCuentasGESTION: TIntegerField
      DisplayLabel = 'Gestion'
      FieldName = 'GESTION'
    end
    object QMCuentasID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object QMCuentasID_PL: TIntegerField
      DisplayLabel = 'ID Pl.'
      FieldName = 'ID_PL'
    end
    object QMCuentasNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMCuentasPGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
  end
  object DSQMCuentas: TDataSource
    DataSet = QMCuentas
    Left = 151
    Top = 160
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
    Left = 306
    Top = 80
  end
  object xCentrosCoste: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ana_centros_coste'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'plan_contable=?plan_contable and centro_coste=?centro_coste')
    UniDirectional = False
    DataSource = DSQMPlantillas
    Left = 393
    Top = 75
    object xCentrosCosteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xCuenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from con_cuentas'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'cuenta=?cuenta')
    UniDirectional = False
    DataSource = DSQMPlantillas
    Left = 393
    Top = 139
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 368
    Top = 16
  end
end
