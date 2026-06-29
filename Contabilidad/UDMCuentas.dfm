object DMCuentas: TDMCuentas
  OldCreateOrder = False
  OnCreate = DMCuentasCreate
  OnDestroy = DataModuleDestroy
  Left = 579
  Top = 189
  Height = 486
  Width = 643
  object DSxCuentas: TDataSource
    DataSet = xCuentas
    Left = 160
    Top = 24
  end
  object DSQMCuentas: TDataSource
    DataSet = QMCuentas
    Left = 160
    Top = 72
  end
  object QMCuentas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  CUENTA=?old_CUENTA AND '
      '  PGC=?old_PGC ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,CUENTA,TITULO,SUPERIOR,NIVEL,TIPO,G' +
        'ESTION,TIPO_TERCERO,REG_CIERRE,'#13#10'CENTRO_COSTE,RESTRICCION,ULT_MO' +
        'DIFICACION,PGC,BLOQUEADA,PRESUPUESTAR,CUADRO_DE_MANDOS,CONCEPTO_' +
        'CUENTA,TIPO_CUENTA)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?CUENTA,?TITULO,?SUPERIOR,?NIVEL' +
        ',?TIPO,?GESTION,?TIPO_TERCERO,?REG_CIERRE,'#13#10'?CENTRO_COSTE,?RESTR' +
        'ICCION,?ULT_MODIFICACION,?PGC,?BLOQUEADA,?PRESUPUESTAR,?CUADRO_D' +
        'E_MANDOS,?CONCEPTO_CUENTA,?TIPO_CUENTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  CUENTA=?CUENTA AND '
      '  PGC=?PGC ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'PGC=?PGC'
      'ORDER BY CUENTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,SUPERIOR=?SUPERIOR '
      '  ,NIVEL=?NIVEL '
      '  ,TIPO=?TIPO '
      '  ,GESTION=?GESTION '
      '  ,TIPO_TERCERO=?TIPO_TERCERO '
      '  ,REG_CIERRE=?REG_CIERRE '
      '  ,CENTRO_COSTE=?CENTRO_COSTE '
      '  ,RESTRICCION=?RESTRICCION '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,BLOQUEADA=?BLOQUEADA '
      '  ,PRESUPUESTAR=?PRESUPUESTAR '
      '  ,CUADRO_DE_MANDOS=?CUADRO_DE_MANDOS '
      '  ,CONCEPTO_CUENTA=?CONCEPTO_CUENTA '
      '  ,TIPO_CUENTA=?TIPO_CUENTA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  CUENTA=?CUENTA AND '
      '  PGC=?PGC ')
    AfterOpen = QMCuentasAfterOpen
    BeforePost = QMCuentasBeforePost
    OnNewRecord = QMCuentasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'CANAL'
      'CUENTA'
      'PGC')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 72
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
    object QMCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMCuentasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 150
      FieldName = 'TITULO'
      Size = 150
    end
    object QMCuentasSUPERIOR: TFIBStringField
      DisplayLabel = 'Sup.'
      FieldName = 'SUPERIOR'
      Size = 15
    end
    object QMCuentasNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QMCuentasTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMCuentasGESTION: TIntegerField
      DisplayLabel = 'Gestion'
      FieldName = 'GESTION'
    end
    object QMCuentasTIPO_TERCERO: TIntegerField
      DisplayLabel = 'Tipo Terc.'
      FieldName = 'TIPO_TERCERO'
    end
    object QMCuentasREG_CIERRE: TIntegerField
      DisplayLabel = 'Reg. Cierre'
      FieldName = 'REG_CIERRE'
    end
    object QMCuentasCENTRO_COSTE: TIntegerField
      DisplayLabel = 'C. Coste'
      FieldName = 'CENTRO_COSTE'
    end
    object QMCuentasRESTRICCION: TIntegerField
      DisplayLabel = 'Restriccion'
      FieldName = 'RESTRICCION'
    end
    object QMCuentasPGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
    object QMCuentasBLOQUEADA: TIntegerField
      DisplayLabel = 'Bloqueada'
      FieldName = 'BLOQUEADA'
    end
    object QMCuentasPRESUPUESTAR: TIntegerField
      DisplayLabel = 'Presupuestar'
      FieldName = 'PRESUPUESTAR'
    end
    object QMCuentasCUADRO_DE_MANDOS: TIntegerField
      DisplayLabel = 'Cuadro de Mandos'
      FieldName = 'CUADRO_DE_MANDOS'
    end
    object QMCuentasCONCEPTO_CUENTA: TFIBStringField
      DisplayLabel = 'Concepto'
      FieldName = 'CONCEPTO_CUENTA'
      Size = 40
    end
    object QMCuentasTIPO_CUENTA: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_CUENTA'
      Size = 40
    end
  end
  object DSxNiveles: TDataSource
    DataSet = xNiveles
    Left = 160
    Top = 120
  end
  object DSxPropagaBajas: TDataSource
    DataSet = xPropagaBajas
    Left = 160
    Top = 216
  end
  object DSxPropagaAltas: TDataSource
    DataSet = xPropagaAltas
    Left = 160
    Top = 168
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 432
    Top = 24
  end
  object DSxPropagaAltasUno: TDataSource
    DataSet = xPropagaAltasUno
    Left = 160
    Top = 264
  end
  object xCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select cuenta,titulo from '
      'busca_cuenta(?empresa,?ejercicio,?canal,?nivel,?filtro)')
    UniDirectional = False
    Left = 40
    Top = 24
    object xCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xCuentasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 150
      FieldName = 'TITULO'
      Size = 150
    end
  end
  object xNiveles: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select  nivel,titulo,superior from c_cuentas_explora(?empresa,?e' +
        'jercicio,?canal,?cuenta)')
    UniDirectional = False
    DataSource = DSQMCuentas
    Left = 40
    Top = 120
  end
  object xPropagaAltas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from c_cuentas_alta_propaga(?empresa,?ejercicio,?canal)')
    UniDirectional = False
    DataSource = DSQMCuentas
    Left = 40
    Top = 168
  end
  object xPropagaBajas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from c_cuentas_baja_propaga(?empresa,?ejercicio)')
    UniDirectional = False
    Left = 40
    Top = 216
  end
  object xPropagaAltasUno: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from c_cuentas_alta_propaga_uno'
      '(?empresa,?ejercicio,?canal,?d_canal)')
    UniDirectional = False
    Left = 40
    Top = 264
  end
  object xCC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ANA_CUENTAS_PLANTILLAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  CUENTA=?CUENTA'
      'ORDER BY PLANTILLA,LINEA,CENTRO_COSTE')
    UniDirectional = False
    DataSource = DSQMCuentas
    Left = 40
    Top = 312
    object xCCEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCCEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCCCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCCPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'Plan Contable'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object xCCCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xCCPLANTILLA: TIntegerField
      DisplayLabel = 'Plantilla'
      FieldName = 'PLANTILLA'
    end
    object xCCPL_TITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'PL_TITULO'
      Size = 60
    end
    object xCCLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xCCCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'C. Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object xCCCC_TITULO: TFIBStringField
      DisplayLabel = 'Titulo C.C.'
      DisplayWidth = 150
      FieldName = 'CC_TITULO'
      Size = 150
    end
    object xCCPORCENTAJE: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORCENTAJE'
    end
    object xCCID_P: TIntegerField
      DisplayLabel = 'ID P.'
      FieldName = 'ID_P'
    end
    object xCCID_PL: TIntegerField
      DisplayLabel = 'ID Pl.'
      FieldName = 'ID_PL'
    end
    object xCCID_CC: TIntegerField
      DisplayLabel = 'ID C.C.'
      FieldName = 'ID_CC'
    end
  end
  object DSCC: TDataSource
    DataSet = xCC
    Left = 160
    Top = 312
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 432
    Top = 72
  end
end
