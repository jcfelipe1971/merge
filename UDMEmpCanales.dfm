object DMEmpCanales: TDMEmpCanales
  OldCreateOrder = False
  OnCreate = DMEmpCanalesCreate
  Left = 627
  Top = 246
  Height = 354
  Width = 341
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 16
  end
  object QMEmpCanales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CANALES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CANALES'
      'WHERE EMPRESA = ?EMPRESA'
      'ORDER BY EJERCICIO, CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CANALES'
      'SET'
      '  ATO_APERTURA=?ATO_APERTURA '
      '  ,ATO_CIERRE=?ATO_CIERRE '
      '  ,ACTIVO=?ACTIVO '
      '  ,APERTURA=?APERTURA '
      '  ,CIERRE=?CIERRE '
      '  ,LIMITE=?LIMITE '
      '  ,NIVELES=?NIVELES '
      '  ,ACTIVACION=?ACTIVACION '
      '  ,PAIS=?PAIS '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,MONEDA=?MONEDA '
      '  ,ATO_REGULARIZACION=?ATO_REGULARIZACION '
      '  ,PERFIL=?PERFIL '
      '  ,LIQUIDAR_IVA_MODELO_300=?LIQUIDAR_IVA_MODELO_300 '
      '  ,CIERRE_PERIODO=?CIERRE_PERIODO '
      '  ,PGC=?PGC '
      '  ,ULTIMO_PERIODO_REPERCUTIDO=?ULTIMO_PERIODO_REPERCUTIDO '
      '  ,ULTIMO_REGISTRO_REPERCUTIDO=?ULTIMO_REGISTRO_REPERCUTIDO '
      '  ,ULTIMO_PERIODO_SOPORTADO=?ULTIMO_PERIODO_SOPORTADO '
      '  ,ULTIMO_REGISTRO_SOPORTADO=?ULTIMO_REGISTRO_SOPORTADO '
      '  ,CIERRE_FACTURACION_VENTAS=?CIERRE_FACTURACION_VENTAS '
      '  ,CIERRE_FACTURACION_COMPRAS=?CIERRE_FACTURACION_COMPRAS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL ')
    AfterOpen = QMEmpCanalesAfterOpen
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'CANAL')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CANALES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMEmpCanalesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEmpCanalesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEmpCanalesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEmpCanalesATO_APERTURA: TIntegerField
      DisplayLabel = 'Ato. Apertura'
      FieldName = 'ATO_APERTURA'
    end
    object QMEmpCanalesATO_CIERRE: TIntegerField
      DisplayLabel = 'Ato. Cierre'
      FieldName = 'ATO_CIERRE'
    end
    object QMEmpCanalesACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMEmpCanalesAPERTURA: TDateTimeField
      DisplayLabel = 'Fec. Apertura'
      FieldName = 'APERTURA'
    end
    object QMEmpCanalesCIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'CIERRE'
    end
    object QMEmpCanalesLIMITE: TDateTimeField
      DisplayLabel = 'Fec. Limite'
      FieldName = 'LIMITE'
    end
    object QMEmpCanalesNIVELES: TIntegerField
      DisplayLabel = 'Niveles'
      FieldName = 'NIVELES'
    end
    object QMEmpCanalesACTIVACION: TDateTimeField
      DisplayLabel = 'Activacion'
      FieldName = 'ACTIVACION'
    end
    object QMEmpCanalesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMEmpCanalesTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
      OnChange = QMEmpCanalesTIPO_IVAChange
    end
    object QMEmpCanalesMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMEmpCanalesMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMEmpCanalesATO_REGULARIZACION: TIntegerField
      DisplayLabel = 'Ato. Regularizacion'
      FieldName = 'ATO_REGULARIZACION'
    end
    object QMEmpCanalesPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMEmpCanalesLIQUIDAR_IVA_MODELO_300: TIntegerField
      DisplayLabel = 'Liquidar IVA Moneda'
      FieldName = 'LIQUIDAR_IVA_MODELO_300'
    end
    object QMEmpCanalesCIERRE_PERIODO: TDateTimeField
      DisplayLabel = 'Cierre Periodo'
      FieldName = 'CIERRE_PERIODO'
      OnChange = QMEmpCanalesCIERRE_PERIODOChange
    end
    object QMEmpCanalesPGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
      OnChange = QMEmpCanalesPGCChange
    end
    object QMEmpCanalesULTIMO_REGISTRO_REPERCUTIDO: TIntegerField
      DisplayLabel = #218'lt. Reg. Repercutido'
      FieldName = 'ULTIMO_REGISTRO_REPERCUTIDO'
    end
    object QMEmpCanalesULTIMO_REGISTRO_SOPORTADO: TIntegerField
      DisplayLabel = #218'lt. Reg. Soportado'
      FieldName = 'ULTIMO_REGISTRO_SOPORTADO'
    end
    object QMEmpCanalesULTIMO_PERIODO_REPERCUTIDO: TFIBStringField
      DisplayLabel = #218'lt. Periodo Repercutido'
      FieldName = 'ULTIMO_PERIODO_REPERCUTIDO'
      Size = 2
    end
    object QMEmpCanalesULTIMO_PERIODO_SOPORTADO: TFIBStringField
      DisplayLabel = #218'lt. Periodo Soportado'
      FieldName = 'ULTIMO_PERIODO_SOPORTADO'
      Size = 2
    end
    object QMEmpCanalesCIERRE_FACTURACION_VENTAS: TDateTimeField
      DisplayLabel = 'Cierre Facturacion Ventas'
      FieldName = 'CIERRE_FACTURACION_VENTAS'
    end
    object QMEmpCanalesCIERRE_FACTURACION_COMPRAS: TDateTimeField
      DisplayLabel = 'Cierre Facturacion Compras'
      FieldName = 'CIERRE_FACTURACION_COMPRAS'
    end
  end
  object DSQMEmpCanales: TDataSource
    DataSet = QMEmpCanales
    Left = 144
    Top = 64
  end
  object xTipoIVA: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_IVA'
      'WHERE PAIS =?PAIS'
      'AND TIPO = ?TIPO_IVA')
    UniDirectional = False
    DataSource = DSQMEmpCanales
    Left = 40
    Top = 112
  end
  object DSxTipoIVA: TDataSource
    DataSet = xTipoIVA
    Left = 144
    Top = 112
  end
  object xPGC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_planes_contables'
      'where pais=?pais and pgc=?pgc')
    UniDirectional = False
    DataSource = DSQMEmpCanales
    Left = 40
    Top = 160
    object xPGCTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxPGC: TDataSource
    DataSet = xPGC
    Left = 144
    Top = 160
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 144
    Top = 16
  end
end
