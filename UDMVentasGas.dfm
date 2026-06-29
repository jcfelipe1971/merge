object DMVentasGas: TDMVentasGas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 639
  Top = 118
  Height = 537
  Width = 786
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 608
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 688
    Top = 16
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 168
    Top = 112
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select * from ges_gas_cab_venta'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and serie=?serie and rig=?rig')
    SelectSQL.Strings = (
      'select * from ges_gas_cab_venta'
      'where '
      'empresa=?empresa and '
      'ejercicio=?ejercicio and '
      'canal=?canal'
      'and serie=?serie and '
      'rig=?rig')
    UniDirectional = False
    DataSource = DSQMVentasGas
    Left = 72
    Top = 112
    object xInfoActualizadaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xInfoActualizadaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xInfoActualizadaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xInfoActualizadaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xInfoActualizadaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xInfoActualizadaID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object xInfoActualizadaFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object xInfoActualizadaFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xInfoActualizadaACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xInfoActualizadaTURNO: TFIBStringField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
      Size = 3
    end
    object xInfoActualizadaDIF_TANQUES_DISPENSADORES: TFloatField
      DisplayLabel = 'Dif. Tanques Disp.'
      FieldName = 'DIF_TANQUES_DISPENSADORES'
    end
    object xInfoActualizadaDIF_COB_TANQUE: TFloatField
      DisplayLabel = 'Dif. Cobr. Tanque'
      FieldName = 'DIF_COB_TANQUE'
    end
    object xInfoActualizadaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xInfoActualizadaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xInfoActualizadaID_VENTA_O: TIntegerField
      DisplayLabel = 'ID Venta Ori.'
      FieldName = 'ID_VENTA_O'
    end
    object xInfoActualizadaID_VENTA_D: TIntegerField
      DisplayLabel = 'ID Venta Dest.'
      FieldName = 'ID_VENTA_D'
    end
    object xInfoActualizadaTOT_INI_TANQUE: TFloatField
      DisplayLabel = 'Tot Ini. Tanque'
      FieldName = 'TOT_INI_TANQUE'
    end
    object xInfoActualizadaTOT_FIN_TANQUE: TFloatField
      DisplayLabel = 'Tot Fin Tanque'
      FieldName = 'TOT_FIN_TANQUE'
    end
    object xInfoActualizadaTOT_INI_DISP: TFloatField
      DisplayLabel = 'Tot Ini. Disp.'
      FieldName = 'TOT_INI_DISP'
    end
    object xInfoActualizadaTOT_FIN_DISP: TFloatField
      DisplayLabel = 'Tot Fin Disp.'
      FieldName = 'TOT_FIN_DISP'
    end
    object xInfoActualizadaTOTAL_COBRADO: TFloatField
      DisplayLabel = 'Total Cobrado'
      FieldName = 'TOTAL_COBRADO'
    end
    object xInfoActualizadaTOT_DIF_TANQUE: TFloatField
      DisplayLabel = 'Total Dif. Tanque'
      FieldName = 'TOT_DIF_TANQUE'
    end
    object xInfoActualizadaTOT_DIF_DISP: TFloatField
      DisplayLabel = 'Total Dif. Disp.'
      FieldName = 'TOT_DIF_DISP'
    end
    object xInfoActualizadaIMPORTE_DIF_TANQUE: TFloatField
      DisplayLabel = 'Imp. Dif. Tanque'
      FieldName = 'IMPORTE_DIF_TANQUE'
    end
    object xInfoActualizadaIMPORTE_DIF_DISP: TFloatField
      DisplayLabel = 'Imp. Dif. Disp.'
      FieldName = 'IMPORTE_DIF_DISP'
    end
    object xInfoActualizadaENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xInfoActualizadaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xInfoActualizadaPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xInfoActualizadaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xInfoActualizadaDIF_IMPORTE_TANQ_DISP: TFloatField
      DisplayLabel = 'Dif. Importe'
      FieldName = 'DIF_IMPORTE_TANQ_DISP'
    end
    object xInfoActualizadaTOTAL_SOBRANTE: TFloatField
      DisplayLabel = 'Total Sobrante'
      FieldName = 'TOTAL_SOBRANTE'
    end
    object xInfoActualizadaTOTAL_FALTANTE: TFloatField
      DisplayLabel = 'Total Faltante'
      FieldName = 'TOTAL_FALTANTE'
    end
    object xInfoActualizadaTOT_DESCARGA_TANQ: TFloatField
      DisplayLabel = 'Tot. Descarga Tanque'
      FieldName = 'TOT_DESCARGA_TANQ'
    end
    object xInfoActualizadaTOT_DESCARGA_DISP: TFloatField
      DisplayLabel = 'Tot. Descarga Disp.'
      FieldName = 'TOT_DESCARGA_DISP'
    end
    object xInfoActualizadaCONTABILIZADO: TIntegerField
      DisplayLabel = 'Contabilizado'
      FieldName = 'CONTABILIZADO'
    end
    object xInfoActualizadaRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 136
    Top = 16
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CANALES_SERIES'
      'where '
      'empresa=?empresa and '
      'ejercicio=?ejercicio and '
      'canal=?canal and '
      'serie=?serie')
    UniDirectional = False
    Left = 40
    Top = 16
  end
  object QMVentasGas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_CAB_VENTA'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_CAB_VENTA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_VENTA,FECHA_INICIO,FECHA' +
        '_CIERRE,ESTADO,TURNO,NOTAS,ACTIVO,ENTRADA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_VENTA,?FECHA_INICI' +
        'O,?FECHA_CIERRE,?ESTADO,?TURNO,?NOTAS,?ACTIVO,?ENTRADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_CAB_VENTA'
      'WHERE'
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND'
      '  ID_VENTA=?ID_VENTA '
      'order by id_venta')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_CAB_VENTA'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      'SERIE=?SERIE '
      'order by id_venta, fecha_inicio')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_CAB_VENTA'
      'SET'
      '  ID_VENTA=?ID_VENTA '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_CIERRE=?FECHA_CIERRE '
      '  ,ESTADO=?ESTADO '
      '  ,TURNO=?TURNO '
      '  ,NOTAS=?NOTAS '
      '  ,ACTIVO=?ACTIVO'
      '  ,ENTRADA=?ENTRADA'
      '  ,RIC=?RIC'
      'WHERE'
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMVentasGasAfterOpen
    AfterPost = QMVentasGasAfterPost
    BeforeClose = QMVentasGasBeforeClose
    BeforeDelete = QMVentasGasBeforeDelete
    BeforeEdit = QMVentasGasBeforeEdit
    BeforePost = QMVentasGasBeforePost
    OnNewRecord = QMVentasGasNewRecord
    ClavesPrimarias.Strings = (
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'ID_VENTA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_CAB_VENTA'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMVentasGasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMVentasGasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMVentasGasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMVentasGasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMVentasGasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMVentasGasID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object QMVentasGasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMVentasGasFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Inicio'
      FieldName = 'FECHA_INICIO'
      OnChange = QMVentasGasFECHA_INICIOChange
    end
    object QMVentasGasFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMVentasGasTURNO: TFIBStringField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
      Size = 3
    end
    object QMVentasGasDIF_TANQUES_DISPENSADORES: TFloatField
      DisplayLabel = 'Dif. Tanques Disp.'
      FieldName = 'DIF_TANQUES_DISPENSADORES'
    end
    object QMVentasGasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMVentasGasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMVentasGasDescEstado: TStringField
      DisplayLabel = 'Estado'
      FieldKind = fkCalculated
      FieldName = 'DescEstado'
      OnGetText = QMVentasGasDescEstadoGetText
      Calculated = True
    end
    object QMVentasGasID_VENTA_O: TIntegerField
      DisplayLabel = 'ID Venta Ori.'
      FieldName = 'ID_VENTA_O'
    end
    object QMVentasGasID_VENTA_D: TIntegerField
      DisplayLabel = 'ID Venta Dest.'
      FieldName = 'ID_VENTA_D'
    end
    object QMVentasGasTOT_INI_TANQUE: TFloatField
      DisplayLabel = 'Tot Ini. Tanque'
      FieldName = 'TOT_INI_TANQUE'
    end
    object QMVentasGasTOT_FIN_TANQUE: TFloatField
      DisplayLabel = 'Tot Fin Tanque'
      FieldName = 'TOT_FIN_TANQUE'
    end
    object QMVentasGasTOT_INI_DISP: TFloatField
      DisplayLabel = 'Tot Ini. Disp.'
      FieldName = 'TOT_INI_DISP'
    end
    object QMVentasGasTOT_FIN_DISP: TFloatField
      DisplayLabel = 'Tot Fin Disp.'
      FieldName = 'TOT_FIN_DISP'
    end
    object QMVentasGasTOTAL_COBRADO: TFloatField
      DisplayLabel = 'Total Cobrado'
      FieldName = 'TOTAL_COBRADO'
    end
    object QMVentasGasTOT_DIF_TANQUE: TFloatField
      DisplayLabel = 'Total Dif. Tanque'
      FieldName = 'TOT_DIF_TANQUE'
    end
    object QMVentasGasTOT_DIF_DISP: TFloatField
      DisplayLabel = 'Total Dif. Disp.'
      FieldName = 'TOT_DIF_DISP'
    end
    object QMVentasGasIMPORTE_DIF_TANQUE: TFloatField
      DisplayLabel = 'Imp. Dif. Tanque'
      FieldName = 'IMPORTE_DIF_TANQUE'
    end
    object QMVentasGasIMPORTE_DIF_DISP: TFloatField
      DisplayLabel = 'Imp. Dif. Disp.'
      FieldName = 'IMPORTE_DIF_DISP'
    end
    object QMVentasGasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMVentasGasDIF_COB_TANQUE: TFloatField
      DisplayLabel = 'Dif. Cobr. Tanque'
      FieldName = 'DIF_COB_TANQUE'
    end
    object QMVentasGasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMVentasGasPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMVentasGasORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMVentasGasDIF_IMPORTE_TANQ_DISP: TFloatField
      DisplayLabel = 'Dif. Importe'
      FieldName = 'DIF_IMPORTE_TANQ_DISP'
    end
    object QMVentasGasTOTAL_SOBRANTE: TFloatField
      DisplayLabel = 'Total Sobrante'
      FieldName = 'TOTAL_SOBRANTE'
    end
    object QMVentasGasTOTAL_FALTANTE: TFloatField
      DisplayLabel = 'Total Faltante'
      FieldName = 'TOTAL_FALTANTE'
    end
    object QMVentasGasTOT_DESCARGA_TANQ: TFloatField
      DisplayLabel = 'Tot. Descarga Tanque'
      FieldName = 'TOT_DESCARGA_TANQ'
    end
    object QMVentasGasTOT_DESCARGA_DISP: TFloatField
      DisplayLabel = 'Tot. Descarga Disp.'
      FieldName = 'TOT_DESCARGA_DISP'
    end
    object QMVentasGasRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMVentasGasCONTABILIZADO: TIntegerField
      DisplayLabel = 'Contabilizado'
      FieldName = 'CONTABILIZADO'
    end
    object QMVentasGasCOSTE: TFloatField
      DisplayLabel = 'Costo'
      FieldName = 'COSTE'
    end
  end
  object DSQMVentasGas: TDataSource
    DataSet = QMVentasGas
    Left = 144
    Top = 64
  end
  object QMTanque: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_TANQUE'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_TANQUE'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_VENTA,LINEA,COD_TANQUE,P' +
        'OR_INICIAL,POR_FINAL,CAP_INICIAL,CAP_FINAL,UNID_SALIDA,PRECIO,IM' +
        'PORTE_TOTAL,RIG_MOV)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_VENTA,?LINEA,?COD_' +
        'TANQUE,?POR_INICIAL,?POR_FINAL,?CAP_INICIAL,?CAP_FINAL,?UNID_SAL' +
        'IDA,?PRECIO,?IMPORTE_TOTAL,?RIG_MOV)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_TANQUE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_TANQUE'
      'Where '
      'Empresa=?Empresa and'
      'Ejercicio=?Ejercicio and'
      'Canal=?Canal  and'
      'Serie=?Serie and'
      'Rig=?Rig'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_TANQUE'
      'SET'
      '  ID_VENTA=?ID_VENTA '
      '  ,COD_TANQUE=?COD_TANQUE '
      '  ,POR_INICIAL=?POR_INICIAL '
      '  ,POR_FINAL=?POR_FINAL '
      '  ,CAP_INICIAL=?CAP_INICIAL '
      '  ,CAP_FINAL=?CAP_FINAL '
      '  ,UNID_SALIDA=?UNID_SALIDA '
      '  ,PRECIO=?PRECIO '
      '  ,IMPORTE_TOTAL=?IMPORTE_TOTAL '
      '  ,RIG_MOV=?RIG_MOV'
      '  ,UNID_DESCARGA_TANQ=?UNID_DESCARGA_TANQ'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMVentasGas
    AfterDelete = Graba
    AfterEdit = QMTanqueAfterEdit
    AfterPost = QMTanqueAfterPost
    BeforeDelete = QMTanqueBeforeDelete
    BeforeEdit = QMTanqueBeforeEdit
    BeforeInsert = QMTanqueBeforeInsert
    OnNewRecord = QMTanqueNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_TANQUE'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 208
    object QMTanqueEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTanqueRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMTanqueID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object QMTanqueLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMTanqueCOD_TANQUE: TIntegerField
      DisplayLabel = 'Cod. Tanque'
      FieldName = 'COD_TANQUE'
      OnValidate = QMTanqueCOD_TANQUEValidate
    end
    object QMTanquePOR_INICIAL: TFloatField
      DisplayLabel = '% Inicial'
      FieldName = 'POR_INICIAL'
      OnValidate = QMTanqueCOD_TANQUEValidate
    end
    object QMTanquePOR_FINAL: TFloatField
      DisplayLabel = '% Final'
      FieldName = 'POR_FINAL'
      OnValidate = QMTanqueCOD_TANQUEValidate
    end
    object QMTanqueCAP_INICIAL: TFloatField
      DisplayLabel = 'Cap. Inicial'
      FieldName = 'CAP_INICIAL'
    end
    object QMTanqueCAP_FINAL: TFloatField
      DisplayLabel = 'Cap. Final'
      FieldName = 'CAP_FINAL'
    end
    object QMTanqueUNID_SALIDA: TFloatField
      DisplayLabel = 'Unid. Salida'
      FieldName = 'UNID_SALIDA'
    end
    object QMTanquePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMTanqueDescTanque: TStringField
      DisplayLabel = 'Desc. Tanque'
      FieldKind = fkCalculated
      FieldName = 'DescTanque'
      OnGetText = QMTanqueDescTanqueGetText
      Calculated = True
    end
    object QMTanqueCAPACIDAD: TIntegerField
      DisplayLabel = 'Capacidad'
      FieldKind = fkCalculated
      FieldName = 'CAPACIDAD'
      OnGetText = QMTanqueCapacidadGetText
      Calculated = True
    end
    object QMTanqueIMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Imp. Total'
      FieldName = 'IMPORTE_TOTAL'
    end
    object QMTanqueSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMTanqueEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTanqueCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTanqueRIG_MOV: TIntegerField
      DisplayLabel = 'Stock'
      FieldName = 'RIG_MOV'
    end
    object QMTanqueUNID_DESCARGA_TANQ: TFloatField
      DisplayLabel = 'Uds. Descarga Tanq.'
      FieldName = 'UNID_DESCARGA_TANQ'
    end
  end
  object DSQMTanque: TDataSource
    DataSet = QMTanque
    Left = 144
    Top = 208
  end
  object QMEmpleado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_EMPLEADO'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_EMPLEADO'
      '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_VENTA,LINEA,EMPLEADO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_VENTA,?LINEA,?EMPL' +
        'EADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_EMPLEADO'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_EMPLEADO'
      'where '
      'Empresa=?Empresa and'
      'Ejercicio=?Ejercicio and'
      'Canal=?Canal  and'
      'Serie=?Serie and'
      'Rig=?Rig'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_EMPLEADO'
      'SET'
      '  ID_VENTA=?ID_VENTA '
      '  ,EMPLEADO=?EMPLEADO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMVentasGas
    AfterDelete = Graba
    AfterOpen = QMEmpleadoAfterOpen
    BeforeClose = QMEmpleadoBeforeClose
    BeforeDelete = QMEmpleadoBeforeDelete
    BeforeEdit = QMEmpleadoBeforeEdit
    BeforeInsert = QMEmpleadoBeforeInsert
    OnNewRecord = QMEmpleadoNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_EMPLEADO'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 304
    Top = 16
    object QMEmpleadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEmpleadoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEmpleadoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEmpleadoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMEmpleadoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMEmpleadoID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object QMEmpleadoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMEmpleadoEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMEmpleadoDescEmpleado: TStringField
      DisplayLabel = 'Descripcion'
      FieldKind = fkCalculated
      FieldName = 'DescEmpleado'
      OnGetText = QMEmpleadoDescEmpleadoGetText
      Calculated = True
    end
    object QMEmpleadoIMPORTE_DISPENSADOR: TFloatField
      DisplayLabel = 'Importe Dispensadores'
      FieldName = 'IMPORTE_DISPENSADOR'
    end
    object QMEmpleadoIMPORTE_PAGADO: TFloatField
      DisplayLabel = 'Importe Pagado'
      FieldName = 'IMPORTE_PAGADO'
    end
    object QMEmpleadoIMPORTE_DIFERENCIA: TFloatField
      DisplayLabel = 'Diferencia'
      FieldName = 'IMPORTE_DIFERENCIA'
    end
    object QMEmpleadoUNIDADES_DISPENSADAS: TFloatField
      DisplayLabel = 'Uds. Dispensadas'
      FieldName = 'UNIDADES_DISPENSADAS'
    end
  end
  object DSQMEmpleado: TDataSource
    DataSet = QMEmpleado
    Left = 408
    Top = 16
  end
  object QMDispensador: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_DISPENSADOR'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_DISPENSADOR'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_VENTA,LINEA_EMPLEADO,LIN' +
        'EA,COD_DISPENSADOR,LECTURA_INICIAL,LECTURA_FINAL,UNID_DISPENSADA' +
        'S,EMPLEADO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_VENTA,?LINEA_EMPLE' +
        'ADO,?LINEA,?COD_DISPENSADOR,?LECTURA_INICIAL,?LECTURA_FINAL,?UNI' +
        'D_DISPENSADAS,?EMPLEADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_DISPENSADOR'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_DISPENSADOR'
      'where '
      'id_venta=?id_venta and'
      'linea_empleado=?linea'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_DISPENSADOR'
      'SET'
      '  ID_VENTA=?ID_VENTA '
      '  ,LINEA_EMPLEADO=?LINEA_EMPLEADO '
      '  ,COD_DISPENSADOR=?COD_DISPENSADOR '
      '  ,LECTURA_INICIAL=?LECTURA_INICIAL '
      '  ,LECTURA_FINAL=?LECTURA_FINAL '
      '  ,UNID_DISPENSADAS=?UNID_DISPENSADAS'
      '  ,EMPLEADO=?EMPLEADO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMEmpleado
    AfterDelete = QMDispensadorAfterDelete
    AfterEdit = QMDispensadorAfterEdit
    AfterPost = QMDispensadorAfterPost
    BeforeDelete = QMDispensadorBeforeDelete
    BeforeEdit = QMDispensadorBeforeEdit
    BeforeInsert = QMDispensadorBeforeInsert
    OnNewRecord = QMDispensadorNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_DISPENSADOR'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 64
    object QMDispensadorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDispensadorEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDispensadorCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDispensadorSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDispensadorRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDispensadorID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object QMDispensadorLINEA_EMPLEADO: TIntegerField
      DisplayLabel = 'Linea Empleado'
      FieldName = 'LINEA_EMPLEADO'
    end
    object QMDispensadorLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDispensadorCOD_DISPENSADOR: TIntegerField
      DisplayLabel = 'Cod. Disp.'
      FieldName = 'COD_DISPENSADOR'
    end
    object QMDispensadorLECTURA_INICIAL: TFloatField
      DisplayLabel = 'Lectura Ini.'
      FieldName = 'LECTURA_INICIAL'
    end
    object QMDispensadorLECTURA_FINAL: TFloatField
      DisplayLabel = 'Lectura Fin.'
      FieldName = 'LECTURA_FINAL'
    end
    object QMDispensadorUNID_DISPENSADAS: TFloatField
      DisplayLabel = 'Uds. Dispensadas'
      FieldName = 'UNID_DISPENSADAS'
    end
    object QMDispensadorDescDispensador: TStringField
      DisplayLabel = 'Desc. Dispensador'
      FieldKind = fkCalculated
      FieldName = 'DescDispensador'
      OnGetText = QMDispensadorDescDispensadorGetText
      Calculated = True
    end
    object QMDispensadorPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDispensadorIMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Importe Total'
      FieldName = 'IMPORTE_TOTAL'
    end
    object QMDispensadorEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMDispensadorUNID_DESCARGADAS: TFloatField
      DisplayLabel = 'Uds. Descargadas'
      FieldName = 'UNID_DESCARGADAS'
    end
  end
  object DSQMDispensador: TDataSource
    DataSet = QMDispensador
    Left = 432
    Top = 64
  end
  object QMFPago: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_FPAGO'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_FPAGO'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_VENTA,LINEA_EMPLEADO,LIN' +
        'EA,FORMA_PAGO,IMPORTE,EMPLEADO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_VENTA,?LINEA_EMPLE' +
        'ADO,?LINEA,?FORMA_PAGO,?IMPORTE,?EMPLEADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_FPAGO'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_FPAGO'
      'Where '
      'id_venta=?id_venta and'
      'linea_empleado=?linea'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_FPAGO'
      'SET'
      '  SERIE=?SERIE '
      '  ,ID_VENTA=?ID_VENTA '
      '  ,LINEA_EMPLEADO=?LINEA_EMPLEADO '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,IMPORTE=?IMPORTE '
      '  ,EMPLEADO=?EMPLEADO'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMEmpleado
    AfterDelete = QMFPagoAfterDelete
    AfterPost = QMFPagoAfterPost
    BeforeDelete = QMFPagoBeforeDelete
    BeforeEdit = QMFPagoBeforeEdit
    BeforeInsert = QMFPagoBeforeInsert
    OnNewRecord = QMFPagoNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_FPAGO'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 160
    object QMFPagoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFPagoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMFPagoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMFPagoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMFPagoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMFPagoID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object QMFPagoLINEA_EMPLEADO: TIntegerField
      DisplayLabel = 'Linea Empleado'
      FieldName = 'LINEA_EMPLEADO'
    end
    object QMFPagoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMFPagoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMFPagoIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMFPagoDescFPago: TStringField
      DisplayLabel = 'Desc. F. Pago'
      FieldKind = fkCalculated
      FieldName = 'DescFPago'
      OnGetText = QMFPagoDescFPagoGetText
      Calculated = True
    end
    object QMFPagoEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
  end
  object DSQMFPago: TDataSource
    DataSet = QMFPago
    Left = 432
    Top = 160
  end
  object QMMonedas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_MONEDAS'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_MONEDAS'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_VENTA,LINEA_EMPLEADO,LIN' +
        'EA,COD_MONEDA,CANTIDAD,TOTAL)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_VENTA,?LINEA_EMPLE' +
        'ADO,?LINEA,?COD_MONEDA,?CANTIDAD,?TOTAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_MONEDAS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_MONEDAS'
      'where '
      'id_venta=?id_venta and'
      'linea_empleado=?linea'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_MONEDAS'
      'SET'
      '  ID_VENTA=?ID_VENTA '
      '  ,LINEA_EMPLEADO=?LINEA_EMPLEADO '
      '  ,COD_MONEDA=?COD_MONEDA '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,TOTAL=?TOTAL '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMEmpleado
    AfterDelete = QMMonedasAfterDelete
    AfterPost = QMMonedasAfterPost
    BeforeDelete = QMMonedasBeforeDelete
    BeforeEdit = QMMonedasBeforeEdit
    BeforeInsert = QMMonedasBeforeInsert
    OnNewRecord = QMMonedasNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_MONEDAS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 208
    object QMMonedasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMonedasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMMonedasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMMonedasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMMonedasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMMonedasID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object QMMonedasLINEA_EMPLEADO: TIntegerField
      DisplayLabel = 'Linea Empleado'
      FieldName = 'LINEA_EMPLEADO'
    end
    object QMMonedasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMMonedasCOD_MONEDA: TIntegerField
      DisplayLabel = 'Cod. Moneda'
      FieldName = 'COD_MONEDA'
    end
    object QMMonedasCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMMonedasTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      OnGetText = QMMonedasTOTALGetText
    end
    object QMMonedasDescMoneda: TStringField
      DisplayLabel = 'Desc. Moneda'
      FieldKind = fkCalculated
      FieldName = 'DescMoneda'
      OnGetText = QMMonedasDescMonedaGetText
      Calculated = True
    end
    object QMMonedasVALOR: TIntegerField
      DisplayLabel = 'Valor'
      FieldKind = fkCalculated
      FieldName = 'VALOR'
      OnGetText = QMMonedasValorGetText
      Calculated = True
    end
  end
  object DSQMMonedas: TDataSource
    DataSet = QMMonedas
    Left = 432
    Top = 208
  end
  object DSxTanque: TDataSource
    DataSet = xTanque
    Left = 168
    Top = 256
  end
  object xTanque: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, CAPACIDAD FROM SYS_GAS_TANQUE'
      'where '
      'empresa=?empresa and '
      'cod_tanque=?cod_tanque')
    UniDirectional = False
    Left = 68
    Top = 256
    object xTanqueTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xTanqueCAPACIDAD: TFloatField
      DisplayLabel = 'Capacidad'
      FieldName = 'CAPACIDAD'
    end
  end
  object DSxEstados: TDataSource
    DataSet = xEstados
    Left = 168
    Top = 160
  end
  object xEstados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_GAS_ESTADOS'
      'WHERE '
      'ESTADO=?ESTADO')
    UniDirectional = False
    DataSource = DSQMVentasGas
    Left = 72
    Top = 160
    object xEstadosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xEstadosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object DSxDispensador: TDataSource
    DataSet = xDispensador
    Left = 456
    Top = 112
  end
  object xDispensador: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_GAS_DISPENSADOR'
      'where '
      'cod_dispensador=?cod_dispensador')
    UniDirectional = False
    Left = 360
    Top = 112
    object xDispensadorTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTipoMoneda: TDataSource
    DataSet = xTipoMoneda
    Left = 456
    Top = 256
  end
  object xTipoMoneda: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DESCRIPCION, VALOR FROM sys_tipo_monedas'
      'where '
      'cod_moneda=?cod_moneda'
      ''
      '')
    UniDirectional = False
    Left = 360
    Top = 256
    object xTipoMonedaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 15
    end
    object xTipoMonedaVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
  end
end
