object ZDMTarifasModelos: TZDMTarifasModelos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 651
  Top = 157
  Height = 260
  Width = 388
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 272
    Top = 16
  end
  object QMPreciosCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_MODELOS_PRECIOS_CAB'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND'
      '  TARIFA=?old_TARIFA AND '
      '  TIPO_LONA=?old_TIPO_LONA AND '
      '  MODELO=?old_MODELO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_MODELOS_PRECIOS_CAB'
      
        '  (EMPRESA,MODELO,TIPO_LONA,TARIFA,FECHA_CREACION,ID_CAB,DESCRIP' +
        'CIO,TARIFA_DEFECTO,TIPO_ESCANDALLO)'
      'VALUES'
      
        '  (?EMPRESA,?MODELO,?TIPO_LONA,?TARIFA,?FECHA_CREACION,?ID_CAB,?' +
        'DESCRIPCIO,?TARIFA_DEFECTO,?TIPO_ESCANDALLO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_MODELOS_PRECIOS_CAB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  TARIFA=?TARIFA AND '
      '  TIPO_LONA=?TIPO_LONA AND '
      '  MODELO=?MODELO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_MODELOS_PRECIOS_CAB'
      'WHERE '
      'EMPRESA=?EMPRESA'
      'ORDER BY MODELO, TIPO_LONA, TARIFA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_MODELOS_PRECIOS_CAB'
      'SET'
      '  ID_CAB=?ID_CAB '
      '  ,DESCRIPCIO=?DESCRIPCIO'
      '  ,TARIFA_DEFECTO=?TARIFA_DEFECTO'
      '  ,TIPO_ESCANDALLO=?TIPO_ESCANDALLO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  TARIFA=?TARIFA AND '
      '  TIPO_LONA=?TIPO_LONA AND '
      '  MODELO=?MODELO ')
    AfterOpen = QMPreciosCabAfterOpen
    BeforeClose = QMPreciosCabBeforeClose
    OnNewRecord = QMPreciosCabNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'TARIFA '
      'TIPO_LONA '
      'MODELO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_MODELOS_PRECIOS_CAB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object QMPreciosCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPreciosCabMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 5
    end
    object QMPreciosCabTIPO_LONA: TFIBStringField
      DisplayLabel = 'Tipo Lona'
      FieldName = 'TIPO_LONA'
      Size = 1
    end
    object QMPreciosCabTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMPreciosCabDESCRIPCIO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCIO'
      Size = 100
    end
    object QMPreciosCabFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREACION'
    end
    object QMPreciosCabID_CAB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB'
    end
    object QMPreciosCabTARIFA_DEFECTO: TIntegerField
      DisplayLabel = 'Tar. Defecto'
      FieldName = 'TARIFA_DEFECTO'
    end
    object QMPreciosCabTIPO_ESCANDALLO: TIntegerField
      DisplayLabel = 'Tipo Escandallo'
      FieldName = 'TIPO_ESCANDALLO'
    end
  end
  object DSPreciosCab: TDataSource
    DataSet = QMPreciosCab
    Left = 160
    Top = 16
  end
  object QMPreciosDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_MODELOS_PRECIOS_DET'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND'
      '  ARTICULO=?old_ARTICULO AND '
      '  TARIFA=?old_TARIFA AND '
      '  TIPO_LONA=?old_TIPO_LONA AND '
      '  MODELO=?old_MODELO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_MODELOS_PRECIOS_DET'
      
        '  (EMPRESA,MODELO,TIPO_LONA,TARIFA,ARTICULO,P_COSTE,P_VENTA,MARG' +
        'EN,LINEA,SALIDA,MULTIPLO,TOTAL_LINEA,TOTAL_SALIDA,TOTAL_M2_LONA,' +
        'ID_CAB,P_VENTA_MODIFICADO,BLOQUEO_PVENTA,P_VENTA_ARMAZON_MODIFIC' +
        'ADO)'
      'VALUES'
      
        '  (?EMPRESA,?MODELO,?TIPO_LONA,?TARIFA,?ARTICULO,?P_COSTE,?P_VEN' +
        'TA,?MARGEN,?LINEA,?SALIDA,?MULTIPLO,?TOTAL_LINEA,?TOTAL_SALIDA,?' +
        'TOTAL_M2_LONA,?ID_CAB,?P_VENTA_MODIFICADO,?BLOQUEO_PVENTA,?P_VEN' +
        'TA_ARMAZON_MODIFICADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_MODELOS_PRECIOS_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  ARTICULO=?ARTICULO AND '
      '  TARIFA=?TARIFA AND '
      '  TIPO_LONA=?TIPO_LONA AND '
      '  MODELO=?MODELO  AND'
      '  COLOR=0')
    SelectSQL.Strings = (
      'SELECT * FROM Z_MODELOS_PRECIOS_DET'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'MODELO=?MODELO AND '
      'TIPO_LONA=?TIPO_LONA AND '
      'TARIFA=?TARIFA AND'
      'COLOR=0'
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_MODELOS_PRECIOS_DET'
      'SET'
      '  P_COSTE=?P_COSTE '
      '  ,P_VENTA=?P_VENTA '
      '  ,MARGEN=?MARGEN '
      '  ,LINEA=?LINEA '
      '  ,SALIDA=?SALIDA '
      '  ,MULTIPLO=?MULTIPLO '
      '  ,TOTAL_LINEA=?TOTAL_LINEA '
      '  ,TOTAL_SALIDA=?TOTAL_SALIDA '
      '  ,TOTAL_M2_LONA=?TOTAL_M2_LONA '
      '  ,ID_CAB=?ID_CAB '
      '  ,P_VENTA_MODIFICADO=?P_VENTA_MODIFICADO '
      '  ,BLOQUEO_PVENTA=?BLOQUEO_PVENTA'
      '  ,P_VENTA_ARMAZON_MODIFICADO=?P_VENTA_ARMAZON_MODIFICADO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  ARTICULO=?ARTICULO AND '
      '  TARIFA=?TARIFA AND '
      '  TIPO_LONA=?TIPO_LONA AND '
      '  MODELO=?MODELO AND'
      '  COLOR=0')
    DataSource = DSPreciosCab
    OnCalcFields = QMPreciosDetCalcFields
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'TARIFA '
      'TIPO_LONA '
      'MODELO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_MODELOS_PRECIOS_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 64
    object QMPreciosDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPreciosDetMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 5
    end
    object QMPreciosDetTIPO_LONA: TFIBStringField
      DisplayLabel = 'Tipo Lona'
      FieldName = 'TIPO_LONA'
      Size = 1
    end
    object QMPreciosDetTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMPreciosDetARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPreciosDetP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMPreciosDetP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMPreciosDetMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object QMPreciosDetLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPreciosDetSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
    object QMPreciosDetMULTIPLO: TIntegerField
      DisplayLabel = 'Multiplo'
      FieldName = 'MULTIPLO'
    end
    object QMPreciosDetTOTAL_LINEA: TIntegerField
      DisplayLabel = 'Total Linea'
      FieldName = 'TOTAL_LINEA'
    end
    object QMPreciosDetTOTAL_SALIDA: TIntegerField
      DisplayLabel = 'Total Salida'
      FieldName = 'TOTAL_SALIDA'
    end
    object QMPreciosDetTOTAL_M2_LONA: TFloatField
      DisplayLabel = 'Total M2 Lona'
      FieldName = 'TOTAL_M2_LONA'
    end
    object QMPreciosDetID_CAB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB'
    end
    object QMPreciosDetP_VENTA_MODIFICADO: TFloatField
      DisplayLabel = 'P. Venta Modif.'
      FieldName = 'P_VENTA_MODIFICADO'
    end
    object QMPreciosDetP_COSTE_ARMAZON: TFloatField
      DisplayLabel = 'P. coste Armazon'
      FieldName = 'P_COSTE_ARMAZON'
    end
    object QMPreciosDetP_VENTA_ARMAZON: TFloatField
      DisplayLabel = 'P. Venta Arm.'
      FieldName = 'P_VENTA_ARMAZON'
    end
    object QMPreciosDetP_COSTE_LONA: TFloatField
      DisplayLabel = 'P. Coste Lona'
      FieldName = 'P_COSTE_LONA'
    end
    object QMPreciosDetP_VENTA_LONA: TFloatField
      DisplayLabel = 'P. VentaLona'
      FieldName = 'P_VENTA_LONA'
    end
    object QMPreciosDetARMAZON: TFIBStringField
      DisplayLabel = 'Armazon'
      FieldName = 'ARMAZON'
      Size = 15
    end
    object QMPreciosDetP_COSTE_FABRICACION: TFloatField
      DisplayLabel = 'P. Coste Fab.'
      FieldName = 'P_COSTE_FABRICACION'
    end
    object QMPreciosDetP_VENTA_FABRICACION: TFloatField
      DisplayLabel = 'P. Venta Fab.'
      FieldName = 'P_VENTA_FABRICACION'
    end
    object QMPreciosDetLONA: TFIBStringField
      DisplayLabel = 'Lona'
      FieldName = 'LONA'
      Size = 15
    end
    object QMPreciosDetBLOQUEO_PVENTA: TIntegerField
      DisplayLabel = 'Bloqueo P. Ventas'
      FieldName = 'BLOQUEO_PVENTA'
    end
    object QMPreciosDetmargen_cent: TFloatField
      DisplayLabel = 'Margen Cent.'
      FieldKind = fkCalculated
      FieldName = 'margen_cent'
      Calculated = True
    end
    object QMPreciosDetCOLOR2: TIntegerField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
    end
    object QMPreciosDetP_VENTA_ARMAZON_MODIFICADO: TFloatField
      DisplayLabel = 'P. Venta Arm. Modif.'
      FieldName = 'P_VENTA_ARMAZON_MODIFICADO'
    end
    object QMPreciosDetMARGEN_ARMAZON: TFloatField
      DisplayLabel = 'Margen Arm.'
      FieldName = 'MARGEN_ARMAZON'
    end
    object QMPreciosDetmargen_armazon_cent: TFloatField
      DisplayLabel = 'Margen Arm. Cent.'
      FieldKind = fkCalculated
      FieldName = 'margen_armazon_cent'
      Calculated = True
    end
  end
  object DSPreciosDet: TDataSource
    DataSet = QMPreciosDet
    Left = 160
    Top = 64
  end
  object QMPreciosDetColor: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_MODELOS_PRECIOS_DET'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND'
      '  ARTICULO=?old_ARTICULO AND '
      '  TARIFA=?old_TARIFA AND '
      '  TIPO_LONA=?old_TIPO_LONA AND '
      '  MODELO=?old_MODELO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_MODELOS_PRECIOS_DET'
      
        '  (EMPRESA,MODELO,TIPO_LONA,TARIFA,ARTICULO,P_COSTE,P_VENTA,MARG' +
        'EN,LINEA,SALIDA,MULTIPLO,TOTAL_LINEA,TOTAL_SALIDA,TOTAL_M2_LONA,' +
        'ID_CAB,P_VENTA_MODIFICADO,BLOQUEO_PVENTA,P_VENTA_ARMAZON_MODIFIC' +
        'ADO)'
      'VALUES'
      
        '  (?EMPRESA,?MODELO,?TIPO_LONA,?TARIFA,?ARTICULO,?P_COSTE,?P_VEN' +
        'TA,?MARGEN,?LINEA,?SALIDA,?MULTIPLO,?TOTAL_LINEA,?TOTAL_SALIDA,?' +
        'TOTAL_M2_LONA,?ID_CAB,?P_VENTA_MODIFICADO,?BLOQUEO_PVENTA,?P_VEN' +
        'TA_ARMAZON_MODIFICADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_MODELOS_PRECIOS_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  ARTICULO=?ARTICULO AND '
      '  TARIFA=?TARIFA AND '
      '  TIPO_LONA=?TIPO_LONA AND '
      '  MODELO=?MODELO AND'
      '  COLOR=1')
    SelectSQL.Strings = (
      'SELECT * FROM Z_MODELOS_PRECIOS_DET'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'MODELO=?MODELO AND'
      'TIPO_LONA=?TIPO_LONA AND'
      'TARIFA=?TARIFA AND'
      'COLOR=1'
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_MODELOS_PRECIOS_DET'
      'SET'
      '  P_COSTE=?P_COSTE '
      '  ,P_VENTA=?P_VENTA '
      '  ,MARGEN=?MARGEN '
      '  ,LINEA=?LINEA '
      '  ,SALIDA=?SALIDA '
      '  ,MULTIPLO=?MULTIPLO '
      '  ,TOTAL_LINEA=?TOTAL_LINEA '
      '  ,TOTAL_SALIDA=?TOTAL_SALIDA '
      '  ,TOTAL_M2_LONA=?TOTAL_M2_LONA '
      '  ,ID_CAB=?ID_CAB '
      '  ,P_VENTA_MODIFICADO=?P_VENTA_MODIFICADO '
      '  ,BLOQUEO_PVENTA=?BLOQUEO_PVENTA'
      '  ,P_VENTA_ARMAZON_MODIFICADO=?P_VENTA_ARMAZON_MODIFICADO'
      ''
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  ARTICULO=?ARTICULO AND '
      '  TARIFA=?TARIFA AND '
      '  TIPO_LONA=?TIPO_LONA AND '
      '  MODELO=?MODELO AND'
      '  COLOR=1')
    DataSource = DSPreciosCab
    OnCalcFields = QMPreciosDetColorCalcFields
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'TARIFA '
      'TIPO_LONA '
      'MODELO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_MODELOS_PRECIOS_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 112
    object QMPreciosDetColorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPreciosDetColorMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 5
    end
    object QMPreciosDetColorTIPO_LONA: TFIBStringField
      DisplayLabel = 'Tipo Lona'
      FieldName = 'TIPO_LONA'
      Size = 1
    end
    object QMPreciosDetColorTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMPreciosDetColorARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPreciosDetColorP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMPreciosDetColorP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMPreciosDetColorMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object QMPreciosDetColorLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPreciosDetColorSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
    object QMPreciosDetColorMULTIPLO: TIntegerField
      DisplayLabel = 'Multiplo'
      FieldName = 'MULTIPLO'
    end
    object QMPreciosDetColorTOTAL_LINEA: TIntegerField
      DisplayLabel = 'Total Linea'
      FieldName = 'TOTAL_LINEA'
    end
    object QMPreciosDetColorTOTAL_SALIDA: TIntegerField
      DisplayLabel = 'Total Salida'
      FieldName = 'TOTAL_SALIDA'
    end
    object QMPreciosDetColorTOTAL_M2_LONA: TFloatField
      DisplayLabel = 'Total M2 Lona'
      FieldName = 'TOTAL_M2_LONA'
    end
    object QMPreciosDetColorID_CAB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB'
    end
    object QMPreciosDetColorP_VENTA_MODIFICADO: TFloatField
      DisplayLabel = 'P. Venta Modif.'
      FieldName = 'P_VENTA_MODIFICADO'
    end
    object QMPreciosDetColorP_COSTE_ARMAZON: TFloatField
      DisplayLabel = 'P. coste Armazon'
      FieldName = 'P_COSTE_ARMAZON'
    end
    object QMPreciosDetColorP_COSTE_LONA: TFloatField
      DisplayLabel = 'P. Coste Lona'
      FieldName = 'P_COSTE_LONA'
    end
    object QMPreciosDetColorP_VENTA_ARMAZON: TFloatField
      DisplayLabel = 'P. Venta Arm.'
      FieldName = 'P_VENTA_ARMAZON'
    end
    object QMPreciosDetColorP_VENTA_LONA: TFloatField
      DisplayLabel = 'P. VentaLona'
      FieldName = 'P_VENTA_LONA'
    end
    object QMPreciosDetColorARMAZON: TFIBStringField
      DisplayLabel = 'Armazon'
      FieldName = 'ARMAZON'
      Size = 15
    end
    object QMPreciosDetColorP_COSTE_FABRICACION: TFloatField
      DisplayLabel = 'P. Coste Fab.'
      FieldName = 'P_COSTE_FABRICACION'
    end
    object QMPreciosDetColorP_VENTA_FABRICACION: TFloatField
      DisplayLabel = 'P. Venta Fab.'
      FieldName = 'P_VENTA_FABRICACION'
    end
    object QMPreciosDetColorLONA: TFIBStringField
      DisplayLabel = 'Lona'
      FieldName = 'LONA'
      Size = 15
    end
    object QMPreciosDetColorBLOQUEO_PVENTA: TIntegerField
      DisplayLabel = 'Bloqueo P. Ventas'
      FieldName = 'BLOQUEO_PVENTA'
    end
    object QMPreciosDetColorCOLOR: TIntegerField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
    end
    object QMPreciosDetColormargen_cent: TFloatField
      DisplayLabel = 'Margen Cent.'
      FieldKind = fkCalculated
      FieldName = 'margen_cent'
      Calculated = True
    end
    object QMPreciosDetColorP_VENTA_ARMAZON_MODIFICADO: TFloatField
      DisplayLabel = 'P. Venta Arm. Modif.'
      FieldName = 'P_VENTA_ARMAZON_MODIFICADO'
    end
    object QMPreciosDetColorMARGEN_ARMAZON: TFloatField
      DisplayLabel = 'Margen Arm.'
      FieldName = 'MARGEN_ARMAZON'
    end
    object QMPreciosDetColormargen_armazon_cent: TFloatField
      DisplayLabel = 'Margen Arm. Cent.'
      FieldKind = fkCalculated
      FieldName = 'margen_armazon_cent'
      Calculated = True
    end
  end
  object DSPreciosDetColor: TDataSource
    DataSet = QMPreciosDetColor
    Left = 160
    Top = 112
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
    Top = 64
  end
end
