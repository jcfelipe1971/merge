object DMIEPNR: TDMIEPNR
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 457
  Top = 212
  Height = 329
  Width = 504
  object QMAsientos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_MODELO_592'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  ASIENTO=?old_ASIENTO ')
    InsertSQL.Strings = (
      'INSERT INTO CON_MODELO_592'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,ASIENTO,PERIODO,DESCRIPCION,CONCEPT' +
        'O,CLAVE_PRODUCTO,FECHA,JUSTIFICANTE,KILOGRAMOS,'#13#10'KILOGRAMOS_NO_R' +
        'ECICLADOS,REGIMEN_FISCAL,PROVEEDOR_DESTINATARIO,PROVEEDOR_DESTIN' +
        'ATARIO_DOC,OBSERVACIONES,PROVEEDOR_DESTINATARIO_TDOC)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?ASIENTO,?PERIODO,?DESCRIPCION,?' +
        'CONCEPTO,?CLAVE_PRODUCTO,?FECHA,?JUSTIFICANTE,?KILOGRAMOS,'#13#10'?KIL' +
        'OGRAMOS_NO_RECICLADOS,?REGIMEN_FISCAL,?PROVEEDOR_DESTINATARIO,?P' +
        'ROVEEDOR_DESTINATARIO_DOC,?OBSERVACIONES,?PROVEEDOR_DESTINATARIO' +
        '_TDOC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_MODELO_592'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ASIENTO=?ASIENTO ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_MODELO_592'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND'
      '  PERIODO=?PERIODO'
      'ORDER BY ASIENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_MODELO_592'
      'SET'
      '  PERIODO=?PERIODO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,CONCEPTO=?CONCEPTO '
      '  ,CLAVE_PRODUCTO=?CLAVE_PRODUCTO '
      '  ,FECHA=?FECHA '
      '  ,JUSTIFICANTE=?JUSTIFICANTE '
      '  ,KILOGRAMOS=?KILOGRAMOS '
      '  ,KILOGRAMOS_NO_RECICLADOS=?KILOGRAMOS_NO_RECICLADOS '
      '  ,REGIMEN_FISCAL=?REGIMEN_FISCAL '
      '  ,PROVEEDOR_DESTINATARIO=?PROVEEDOR_DESTINATARIO '
      '  ,PROVEEDOR_DESTINATARIO_DOC=?PROVEEDOR_DESTINATARIO_DOC '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,PROVEEDOR_DESTINATARIO_TDOC=?PROVEEDOR_DESTINATARIO_TDOC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ASIENTO=?ASIENTO ')
    DataSource = DSxPeriodos
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'ASIENTO ')
    AccionesInhibidas = [Insertar]
    Opciones = [OrdenarPorPk]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_MODELO_592'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 112
    object QMAsientosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAsientosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAsientosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAsientosPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMAsientosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
    end
    object QMAsientosASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMAsientosCLAVE_PRODUCTO: TFIBStringField
      DisplayLabel = 'Clave Prod.'
      FieldName = 'CLAVE_PRODUCTO'
      Size = 1
    end
    object QMAsientosCONCEPTO: TFIBStringField
      DisplayLabel = 'Concepto'
      FieldName = 'CONCEPTO'
      Size = 1
    end
    object QMAsientosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAsientosJUSTIFICANTE: TFIBStringField
      DisplayLabel = 'Justificante'
      FieldName = 'JUSTIFICANTE'
      Size = 40
    end
    object QMAsientosKILOGRAMOS: TFloatField
      DisplayLabel = 'Kilogramos'
      FieldName = 'KILOGRAMOS'
    end
    object QMAsientosKILOGRAMOS_NO_RECICLADOS: TFloatField
      DisplayLabel = 'Kg. No Recicl.'
      FieldName = 'KILOGRAMOS_NO_RECICLADOS'
    end
    object QMAsientosREGIMEN_FISCAL: TFIBStringField
      DisplayLabel = 'Reg. Fiscal'
      FieldName = 'REGIMEN_FISCAL'
      Size = 1
    end
    object QMAsientosPROVEEDOR_DESTINATARIO: TFIBStringField
      DisplayLabel = 'Proveedor/Destinatario'
      FieldName = 'PROVEEDOR_DESTINATARIO'
      Size = 60
    end
    object QMAsientosPROVEEDOR_DESTINATARIO_DOC: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'PROVEEDOR_DESTINATARIO_DOC'
    end
    object QMAsientosPROVEEDOR_DESTINATARIO_TDOC: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'PROVEEDOR_DESTINATARIO_TDOC'
      Size = 1
    end
    object QMAsientosOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 256
    end
  end
  object DSQMAsientos: TDataSource
    DataSet = QMAsientos
    Left = 120
    Top = 112
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 208
    Top = 24
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_ALBARAN_IEPNR'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_ALBARAN_IEPNR'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ID_DETALLES_E,' +
        'ID_E,PERIODO,ASIENTO,'#13#10'CONCEPTO,CLAVE_PRODUCTO,KILOGRAMOS,KILOGR' +
        'AMOS_NO_RECICLADOS,REGIMEN_FISCAL,PROVEEDOR,PROVEEDOR_DESTINATAR' +
        'IO,PROVEEDOR_DESTINATARIO_DOC,PROVEEDOR_DESTINATARIO_TDOC,ARTICU' +
        'LO,'#13#10'UNIDADES,TITULO,FECHA,ART_CLAVE_PRODUCTO,ART_KILOGRAMOS,ART' +
        '_KILOGRAMOS_NO_RECICLADOS)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ID_DET' +
        'ALLES_E,?ID_E,?PERIODO,?ASIENTO,'#13#10'?CONCEPTO,?CLAVE_PRODUCTO,?KIL' +
        'OGRAMOS,?KILOGRAMOS_NO_RECICLADOS,?REGIMEN_FISCAL,?PROVEEDOR,?PR' +
        'OVEEDOR_DESTINATARIO,?PROVEEDOR_DESTINATARIO_DOC,?PROVEEDOR_DEST' +
        'INATARIO_TDOC,?ARTICULO,'#13#10'?UNIDADES,?TITULO,?FECHA,?ART_CLAVE_PR' +
        'ODUCTO,?ART_KILOGRAMOS,?ART_KILOGRAMOS_NO_RECICLADOS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_ALBARAN_IEPNR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_ALBARAN_IEPNR'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'PERIODO=?PERIODO'
      'ORDER BY SERIE,RIG,LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_ALBARAN_IEPNR'
      'SET'
      '  ID_DETALLES_E=?ID_DETALLES_E '
      '  ,ID_E=?ID_E '
      '  ,PERIODO=?PERIODO '
      '  ,ASIENTO=?ASIENTO '
      '  ,CONCEPTO=?CONCEPTO '
      '  ,CLAVE_PRODUCTO=?CLAVE_PRODUCTO '
      '  ,KILOGRAMOS=?KILOGRAMOS '
      '  ,KILOGRAMOS_NO_RECICLADOS=?KILOGRAMOS_NO_RECICLADOS '
      '  ,REGIMEN_FISCAL=?REGIMEN_FISCAL '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,PROVEEDOR_DESTINATARIO=?PROVEEDOR_DESTINATARIO '
      '  ,PROVEEDOR_DESTINATARIO_DOC=?PROVEEDOR_DESTINATARIO_DOC '
      '  ,PROVEEDOR_DESTINATARIO_TDOC=?PROVEEDOR_DESTINATARIO_TDOC '
      '  ,ARTICULO=?ARTICULO '
      '  ,UNIDADES=?UNIDADES '
      '  ,TITULO=?TITULO '
      '  ,FECHA=?FECHA '
      '  ,ART_CLAVE_PRODUCTO=?ART_CLAVE_PRODUCTO '
      '  ,ART_KILOGRAMOS=?ART_KILOGRAMOS '
      '  ,ART_KILOGRAMOS_NO_RECICLADOS=?ART_KILOGRAMOS_NO_RECICLADOS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    DataSource = DSxPeriodos
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_ALBARAN_IEPNR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 160
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Alb.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_DETALLES_E'
    end
    object QMDetalleID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object QMDetallePERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMDetalleASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMDetalleCONCEPTO: TFIBStringField
      DisplayLabel = 'Concepto'
      FieldName = 'CONCEPTO'
      Size = 1
    end
    object QMDetalleCLAVE_PRODUCTO: TFIBStringField
      DisplayLabel = 'Clave Prod.'
      FieldName = 'CLAVE_PRODUCTO'
      OnChange = QMDetalleCLAVE_PRODUCTOChange
      Size = 1
    end
    object QMDetalleKILOGRAMOS: TFloatField
      DisplayLabel = 'Kg.'
      FieldName = 'KILOGRAMOS'
    end
    object QMDetalleKILOGRAMOS_NO_RECICLADOS: TFloatField
      DisplayLabel = 'Kg. no Recicl.'
      FieldName = 'KILOGRAMOS_NO_RECICLADOS'
    end
    object QMDetalleREGIMEN_FISCAL: TFIBStringField
      DisplayLabel = 'Reg. Fiscal'
      FieldName = 'REGIMEN_FISCAL'
      Size = 1
    end
    object QMDetallePROVEEDOR_DESTINATARIO: TFIBStringField
      DisplayLabel = 'Proveedor/Dest.'
      FieldName = 'PROVEEDOR_DESTINATARIO'
      Size = 60
    end
    object QMDetallePROVEEDOR_DESTINATARIO_DOC: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'PROVEEDOR_DESTINATARIO_DOC'
    end
    object QMDetallePROVEEDOR_DESTINATARIO_TDOC: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'PROVEEDOR_DESTINATARIO_TDOC'
      Size = 1
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDetallePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMDetalleART_CLAVE_PRODUCTO: TFIBStringField
      DisplayLabel = 'Art. Clave Prod.'
      FieldName = 'ART_CLAVE_PRODUCTO'
      Size = 1
    end
    object QMDetalleART_KILOGRAMOS: TFloatField
      DisplayLabel = 'Art. Kg.'
      FieldName = 'ART_KILOGRAMOS'
    end
    object QMDetalleART_KILOGRAMOS_NO_RECICLADOS: TFloatField
      DisplayLabel = 'Art. Kg. no Recicl.'
      FieldName = 'ART_KILOGRAMOS_NO_RECICLADOS'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 120
    Top = 160
  end
  object xPeriodos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PERIODOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  PERIODO=?old_PERIODO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PERIODOS'
      '  (EMPRESA,'#13#10'EJERCICIO,PERIODO,TITULO,DESDE,HASTA)'
      'VALUES'
      '  (?EMPRESA,'#13#10'?EJERCICIO,?PERIODO,?TITULO,?DESDE,?HASTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PERIODOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  PERIODO=?PERIODO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PERIODOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'PERIODO BETWEEN '#39'01'#39' AND '#39'16'#39
      'ORDER BY PERIODO ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PERIODOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  PERIODO=?PERIODO ')
    AfterOpen = xPeriodosAfterOpen
    BeforeClose = xPeriodosBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'PERIODO ')
    AccionesInhibidas = [Borrar, Insertar, Modificar]
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PERIODOS'
    UpdateTransaction = TLocal
    Left = 32
    Top = 16
    object xPeriodosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPeriodosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPeriodosPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xPeriodosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
    object xPeriodosDESDE: TDateTimeField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object xPeriodosHASTA: TDateTimeField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
  end
  object DSxPeriodos: TDataSource
    DataSet = xPeriodos
    Left = 120
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 24
  end
  object QMDeclaracion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT CAST(:CIP AS VARCHAR(13)) CIP, CAST(:EPIGRAFE AS VARCHAR(' +
        '3)) EPIGRAFE,'
      '       --'
      
        '       SUM(KILOGRAMOS) CANTIDAD, SUM(KILOGRAMOS_NO_RECICLADOS) B' +
        'ASE_IMPONIBLE,'
      
        '       CAST(:TIPO_IMPOSITIVO AS DOUBLE PRECISION) TIPO_IMPOSITIV' +
        'O,'
      
        '       SUM(KILOGRAMOS) * CAST(:TIPO_IMPOSITIVO AS DOUBLE PRECISI' +
        'ON) AS CUOTA_INTEGRA, --'
      '       CAST(:DEDUCCION AS DOUBLE PRECISION) DEDUCCION, --'
      '       CAST(:COMPENSACION AS DOUBLE PRECISION) COMPENSACION,'
      '       --'
      
        '       (SUM(KILOGRAMOS) * CAST(:TIPO_IMPOSITIVO AS DOUBLE PRECIS' +
        'ION) - CAST(:DEDUCCION AS DOUBLE PRECISION) - CAST(:COMPENSACION' +
        ' AS DOUBLE PRECISION)) CUOTA_INTEGRA_TOTAL'
      'FROM CON_MODELO_592'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PERIODO = :PERIODO')
    SelectSQL.Strings = (
      
        'SELECT CAST(:CIP AS VARCHAR(13)) CIP, CAST(:EPIGRAFE AS VARCHAR(' +
        '3)) EPIGRAFE,'
      '       --'
      
        '       SUM(KILOGRAMOS) CANTIDAD, SUM(KILOGRAMOS_NO_RECICLADOS) B' +
        'ASE_IMPONIBLE,'
      
        '       CAST(:TIPO_IMPOSITIVO AS DOUBLE PRECISION) TIPO_IMPOSITIV' +
        'O,'
      
        '       SUM(KILOGRAMOS_NO_RECICLADOS) * CAST(:TIPO_IMPOSITIVO AS ' +
        'DOUBLE PRECISION) AS CUOTA_INTEGRA, --'
      '       CAST(:DEDUCCION AS DOUBLE PRECISION) DEDUCCION, --'
      '       CAST(:COMPENSACION AS DOUBLE PRECISION) COMPENSACION,'
      '       --'
      
        '       (SUM(KILOGRAMOS_NO_RECICLADOS) * CAST(:TIPO_IMPOSITIVO AS' +
        ' DOUBLE PRECISION) - CAST(:DEDUCCION AS DOUBLE PRECISION) - CAST' +
        '(:COMPENSACION AS DOUBLE PRECISION)) CUOTA_INTEGRA_TOTAL'
      'FROM CON_MODELO_592'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PERIODO = :PERIODO')
    UniDirectional = False
    DataSource = DSxPeriodos
    Left = 32
    Top = 64
    object QMDeclaracionCIP: TFIBStringField
      DisplayLabel = 'C.I.P.'
      FieldName = 'CIP'
      Size = 13
    end
    object QMDeclaracionEPIGRAFE: TFIBStringField
      DisplayLabel = 'Epigrafe'
      FieldName = 'EPIGRAFE'
      Size = 3
    end
    object QMDeclaracionCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDeclaracionBASE_IMPONIBLE: TFloatField
      DisplayLabel = 'Base Imp.'
      FieldName = 'BASE_IMPONIBLE'
    end
    object QMDeclaracionTIPO_IMPOSITIVO: TFloatField
      DisplayLabel = 'Tipo Imp.'
      FieldName = 'TIPO_IMPOSITIVO'
    end
    object QMDeclaracionCUOTA_INTEGRA: TFloatField
      DisplayLabel = 'Cupota Integra'
      FieldName = 'CUOTA_INTEGRA'
    end
    object QMDeclaracionDEDUCCION: TFloatField
      DisplayLabel = 'Deduccion'
      FieldName = 'DEDUCCION'
    end
    object QMDeclaracionCOMPENSACION: TFloatField
      DisplayLabel = 'Compsensacion'
      FieldName = 'COMPENSACION'
    end
    object QMDeclaracionCUOTA_INTEGRA_TOTAL: TFloatField
      DisplayLabel = 'Cuota Integra'
      FieldName = 'CUOTA_INTEGRA_TOTAL'
    end
  end
  object DSQMDeclaracion: TDataSource
    DataSet = QMDeclaracion
    Left = 120
    Top = 64
  end
end
