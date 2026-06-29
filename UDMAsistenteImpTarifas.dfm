object DMAsistenteImpTarifas: TDMAsistenteImpTarifas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 252
  Top = 160
  Height = 321
  Width = 404
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 248
    Top = 8
  end
  object XLApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 320
    Top = 56
  end
  object QMTarifasImp: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_IMPORTAR_TARIFAS'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_IMPORTAR_TARIFAS'
      '  (ENTRADA,ARTICULO,MARGEN,PRECIO,IMPORTAR,LINEA,P_COSTE)'
      'VALUES'
      '  (?ENTRADA,?ARTICULO,?MARGEN,?PRECIO,?IMPORTAR,?LINEA,?P_COSTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_IMPORTAR_TARIFAS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_IMPORTAR_TARIFAS'
      'WHERE ENTRADA=?ENTRADA'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_IMPORTAR_TARIFAS'
      'SET'
      '  IMPORTAR=?IMPORTAR '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA ')
    AfterPost = QMTarifasImpAfterPost
    OnNewRecord = QMTarifasImpNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_IMPORTAR_TARIFAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMTarifasImpENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMTarifasImpLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMTarifasImpEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTarifasImpARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMTarifasImpTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMTarifasImpMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object QMTarifasImpPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMTarifasImpIMPORTAR: TIntegerField
      DisplayLabel = 'Importar'
      FieldName = 'IMPORTAR'
    end
    object QMTarifasImpFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMTarifasImpTITULO_FAM: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_FAM'
      Size = 40
    end
    object QMTarifasImpTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMTarifasImpP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMTarifasImpTITULO_CORTO: TFIBStringField
      DisplayLabel = 'Titulo Corto'
      FieldName = 'TITULO_CORTO'
    end
    object QMTarifasImpNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSQMTarifasImp: TDataSource
    DataSet = QMTarifasImp
    Left = 136
    Top = 8
  end
  object QActualizaPrecio: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 200
  end
  object xRecorre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from tmp_importar_tarifas'
      'where entrada=?entrada and importar=1')
    UniDirectional = False
    Left = 40
    Top = 56
    object xRecorreENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xRecorreLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xRecorreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecorreARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xRecorreTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xRecorreMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object xRecorrePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xRecorreIMPORTAR: TIntegerField
      DisplayLabel = 'Importar'
      FieldName = 'IMPORTAR'
    end
    object xRecorreP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xRecorreP_COMPRA: TFloatField
      DisplayLabel = 'P. Compra'
      FieldName = 'P_COMPRA'
    end
    object xRecorreDTO_COMPRA: TFloatField
      DisplayLabel = 'Dto. Compra'
      FieldName = 'DTO_COMPRA'
    end
    object xRecorreUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Minimas'
      FieldName = 'UNID_MINIMAS'
    end
    object xRecorreUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Maximas'
      FieldName = 'UNID_MAXIMAS'
    end
  end
  object xFamilias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_FAMILIAS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'FAMILIA = :FAMILIA')
    UniDirectional = False
    Left = 40
    Top = 104
    object xFamiliasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFamiliasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFamiliasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFamiliasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xFamiliasPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xFamiliasTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xFamiliasCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object xFamiliasCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object xFamiliasCTA_DEVOLUCION_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object xFamiliasCTA_DEVOLUCION_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object xFamiliasCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Compras'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object xFamiliasCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Ventas'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
    object xFamiliasVENTA: TIntegerField
      DisplayLabel = 'Venta'
      FieldName = 'VENTA'
    end
    object xFamiliasPTO_VERDE: TFloatField
      DisplayLabel = 'Pto. Verde'
      FieldName = 'PTO_VERDE'
    end
    object xFamiliasMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object xFamiliasTIPO_REDONDEO: TIntegerField
      DisplayLabel = 'Tipo Redondeo'
      FieldName = 'TIPO_REDONDEO'
    end
    object xFamiliasACT_TAR_AUTOM: TIntegerField
      DisplayLabel = 'Act. Tar. Aut.'
      FieldName = 'ACT_TAR_AUTOM'
    end
  end
  object QCtasCompraVenta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure dame_cuentas_compra_venta (?EMPRESA,?EJERCICIO' +
        ',?CANAL)')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 152
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 320
    Top = 8
  end
end
