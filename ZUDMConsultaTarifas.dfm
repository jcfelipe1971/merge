object ZDMConsultaTarifas: TZDMConsultaTarifas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 503
  Top = 285
  Height = 413
  Width = 415
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
    Top = 16
  end
  object QMPreciosTarifas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_MODELOS_PRECIOS_DET'
      'WHERE'
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
      '  ARTICULO=?ARTICULO AND '
      '  TARIFA=?TARIFA AND '
      '  TIPO_LONA=?TIPO_LONA AND '
      '  MODELO=?MODELO  AND'
      '  COLOR=0')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_MODELOS_PRECIOS_DET'
      'WHERE'
      'MODELO = :MODELO AND'
      'TIPO_LONA = :TIPO_LONA AND'
      'TARIFA = :TARIFA AND'
      'COLOR = :COLOR'
      'ORDER BY LINEA, SALIDA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_MODELOS_PRECIOS_DET'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,P_COSTE=?P_COSTE '
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
      '  ARTICULO=?ARTICULO AND '
      '  TARIFA=?TARIFA AND '
      '  TIPO_LONA=?TIPO_LONA AND '
      '  MODELO=?MODELO AND'
      '  COLOR=0')
    ClavesPrimarias.Strings = (
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
    Left = 40
    Top = 64
    object QMPreciosTarifasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPreciosTarifasMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 5
    end
    object QMPreciosTarifasTIPO_LONA: TFIBStringField
      DisplayLabel = 'Tipo Lona'
      FieldName = 'TIPO_LONA'
      Size = 1
    end
    object QMPreciosTarifasTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMPreciosTarifasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPreciosTarifasP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMPreciosTarifasP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMPreciosTarifasMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object QMPreciosTarifasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPreciosTarifasSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
    object QMPreciosTarifasMULTIPLO: TIntegerField
      DisplayLabel = 'Multiplo'
      FieldName = 'MULTIPLO'
    end
    object QMPreciosTarifasTOTAL_LINEA: TIntegerField
      DisplayLabel = 'Total Linea'
      FieldName = 'TOTAL_LINEA'
    end
    object QMPreciosTarifasTOTAL_SALIDA: TIntegerField
      DisplayLabel = 'Total Salida'
      FieldName = 'TOTAL_SALIDA'
    end
    object QMPreciosTarifasTOTAL_M2_LONA: TFloatField
      DisplayLabel = 'Total M2 Lona'
      FieldName = 'TOTAL_M2_LONA'
    end
    object QMPreciosTarifasID_CAB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB'
    end
    object QMPreciosTarifasP_VENTA_MODIFICADO: TFloatField
      DisplayLabel = 'P. Venta Modif.'
      FieldName = 'P_VENTA_MODIFICADO'
    end
    object QMPreciosTarifasP_COSTE_ARMAZON: TFloatField
      DisplayLabel = 'P. coste Armazon'
      FieldName = 'P_COSTE_ARMAZON'
    end
    object QMPreciosTarifasP_COSTE_LONA: TFloatField
      DisplayLabel = 'P. Coste Lona'
      FieldName = 'P_COSTE_LONA'
    end
    object QMPreciosTarifasP_VENTA_ARMAZON: TFloatField
      DisplayLabel = 'P. Venta Arm.'
      FieldName = 'P_VENTA_ARMAZON'
    end
    object QMPreciosTarifasP_VENTA_LONA: TFloatField
      DisplayLabel = 'P. VentaLona'
      FieldName = 'P_VENTA_LONA'
    end
    object QMPreciosTarifasARMAZON: TFIBStringField
      DisplayLabel = 'Armazon'
      FieldName = 'ARMAZON'
      Size = 15
    end
    object QMPreciosTarifasP_COSTE_FABRICACION: TFloatField
      DisplayLabel = 'P. Coste Fab.'
      FieldName = 'P_COSTE_FABRICACION'
    end
    object QMPreciosTarifasP_VENTA_FABRICACION: TFloatField
      DisplayLabel = 'P. Venta Fab.'
      FieldName = 'P_VENTA_FABRICACION'
    end
    object QMPreciosTarifasLONA: TFIBStringField
      DisplayLabel = 'Lona'
      FieldName = 'LONA'
      Size = 15
    end
    object QMPreciosTarifasBLOQUEO_PVENTA: TIntegerField
      DisplayLabel = 'Bloqueo P. Ventas'
      FieldName = 'BLOQUEO_PVENTA'
    end
    object QMPreciosTarifasmargen_cent: TFloatField
      DisplayLabel = 'Margen Cent.'
      FieldKind = fkCalculated
      FieldName = 'margen_cent'
      Calculated = True
    end
    object QMPreciosTarifasCOLOR2: TIntegerField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
    end
    object QMPreciosTarifasP_VENTA_ARMAZON_MODIFICADO: TFloatField
      DisplayLabel = 'P. Venta Arm. Modif.'
      FieldName = 'P_VENTA_ARMAZON_MODIFICADO'
    end
    object QMPreciosTarifasMARGEN_ARMAZON: TFloatField
      DisplayLabel = 'Margen Arm.'
      FieldName = 'MARGEN_ARMAZON'
    end
    object QMPreciosTarifasmargen_armazon_cent: TFloatField
      DisplayLabel = 'Margen Arm. Cent.'
      FieldKind = fkCalculated
      FieldName = 'margen_armazon_cent'
      Calculated = True
    end
  end
  object DSPreciosDet: TDataSource
    DataSet = QMPreciosTarifas
    Left = 128
    Top = 64
  end
  object xLinea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DISTINCT LINEA'
      'FROM Z_MODELOS_PRECIOS_DET'
      'WHERE'
      'MODELO = :MODELO AND'
      'TIPO_LONA = :TIPO_LONA AND'
      'TARIFA = :TARIFA AND'
      'COLOR = :COLOR'
      'ORDER BY LINEA')
    UniDirectional = False
    Left = 40
    Top = 112
    object xLineaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object xSalida: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DISTINCT SALIDA'
      'FROM Z_MODELOS_PRECIOS_DET'
      'WHERE'
      'MODELO = :MODELO AND'
      'TIPO_LONA = :TIPO_LONA AND'
      'TARIFA = :TARIFA AND'
      'COLOR = :COLOR'
      'ORDER BY SALIDA')
    UniDirectional = False
    Left = 40
    Top = 160
    object xSalidaSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
  end
  object DSxLinea: TDataSource
    DataSet = xLinea
    Left = 128
    Top = 112
  end
  object DSxSalida: TDataSource
    DataSet = xSalida
    Left = 128
    Top = 160
  end
  object xModelo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from z_sys_modelos'
      'where codigo=?codigo')
    UniDirectional = False
    Left = 40
    Top = 16
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxModelo: TDataSource
    DataSet = xModelo
    Left = 128
    Top = 16
  end
  object xOmplir: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_MODELOS_PRECIOS_DET'
      
        'where modelo=?modelo and tipo_lona=?tipo_lona and tarifa=?tarifa' +
        ' and color=?color'
      'and linea=?linea and salida=?salida')
    UniDirectional = False
    Left = 40
    Top = 224
    object xOmplirP_VENTA_MODIFICADO: TFloatField
      FieldName = 'P_VENTA_MODIFICADO'
    end
    object xOmplirP_VENTA_ARMAZON_MODIFICADO: TFloatField
      FieldName = 'P_VENTA_ARMAZON_MODIFICADO'
    end
  end
  object DSxOmplir: TDataSource
    DataSet = xOmplir
    Left = 128
    Top = 224
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 304
    Top = 16
  end
end
