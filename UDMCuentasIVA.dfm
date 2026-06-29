object DMCuentasIVA: TDMCuentasIVA
  OldCreateOrder = False
  OnCreate = DMCuentasIVACreate
  Left = 665
  Top = 164
  Height = 380
  Width = 501
  object DSQMCuentaIVA: TDataSource
    DataSet = QMCuentaIVA
    Left = 184
    Top = 8
  end
  object DSxTipoIva: TDataSource
    DataSet = xTipoIva
    Left = 184
    Top = 56
  end
  object QMCuentaIVA: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_IVA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PAIS=?old_PAIS AND '
      '  TIPO_IVA=?old_TIPO_IVA AND '
      '  MODO_IVA=?old_MODO_IVA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_IVA'
      
        '  (MODO_IVA,TIPO_IVA,CANAL,EJERCICIO,EMPRESA,CTA_ABONO_REC,CTA_A' +
        'BONO_IVA,CTA_CARGO_REC,CTA_CARGO_IVA,PAIS,CTA_CARGO_IVA_RECC,CTA' +
        '_ABONO_IVA_RECC,CTA_CARGO_IVA_ISP,CTA_ABONO_IVA_ISP)'
      'VALUES'
      
        '  (?MODO_IVA,?TIPO_IVA,?CANAL,?EJERCICIO,?EMPRESA,?CTA_ABONO_REC' +
        ',?CTA_ABONO_IVA,?CTA_CARGO_REC,?CTA_CARGO_IVA,?PAIS,?CTA_CARGO_I' +
        'VA_RECC,?CTA_ABONO_IVA_RECC,?CTA_CARGO_IVA_ISP,?CTA_ABONO_IVA_IS' +
        'P)'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_IVA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PAIS=?PAIS AND '
      '  TIPO_IVA=?TIPO_IVA AND '
      '  MODO_IVA=?MODO_IVA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_IVA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND '
      '  PAIS=?PAIS'
      'ORDER BY TIPO_IVA, MODO_IVA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_IVA'
      'SET'
      '  CTA_ABONO_REC=?CTA_ABONO_REC '
      '  ,CTA_ABONO_IVA=?CTA_ABONO_IVA '
      '  ,CTA_CARGO_REC=?CTA_CARGO_REC '
      '  ,CTA_CARGO_IVA=?CTA_CARGO_IVA '
      '  ,CTA_CARGO_IVA_RECC=?CTA_CARGO_IVA_RECC'
      '  ,CTA_ABONO_IVA_RECC=?CTA_ABONO_IVA_RECC'
      '  ,CTA_CARGO_IVA_ISP=?CTA_CARGO_IVA_ISP '
      '  ,CTA_ABONO_IVA_ISP=?CTA_ABONO_IVA_ISP '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PAIS=?PAIS AND '
      '  TIPO_IVA=?TIPO_IVA AND '
      '  MODO_IVA=?MODO_IVA ')
    AfterOpen = QMCuentaIVAAfterOpen
    BeforeClose = QMCuentaIVABeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PAIS '
      'TIPO_IVA '
      'MODO_IVA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_IVA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMCuentaIVAEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCuentaIVAEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCuentaIVACANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCuentaIVAPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMCuentaIVATIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
      OnChange = QMCuentaIVATIPO_IVAChange
    end
    object QMCuentaIVAMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
      OnChange = QMCuentaIVAMODO_IVAChange
    end
    object QMCuentaIVACTA_CARGO_IVA: TFIBStringField
      DisplayLabel = 'Cta. Cargo IVA'
      FieldName = 'CTA_CARGO_IVA'
      OnChange = QMCuentaIVACTA_CARGO_IVAChange
      Size = 15
    end
    object QMCuentaIVACTA_CARGO_REC: TFIBStringField
      DisplayLabel = 'Cta. Cargo Rec.'
      FieldName = 'CTA_CARGO_REC'
      Size = 15
    end
    object QMCuentaIVACTA_ABONO_IVA: TFIBStringField
      DisplayLabel = 'Cta. Abono IVA'
      FieldName = 'CTA_ABONO_IVA'
      OnChange = QMCuentaIVACTA_ABONO_IVAChange
      Size = 15
    end
    object QMCuentaIVACTA_ABONO_REC: TFIBStringField
      DisplayLabel = 'Cta. Abono Rec.'
      FieldName = 'CTA_ABONO_REC'
      Size = 15
    end
    object QMCuentaIVAP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldKind = fkCalculated
      FieldName = 'P_IVA'
      OnGetText = QMCuentaIVAP_IVAGetText
      Calculated = True
    end
    object QMCuentaIVAP_REC: TFloatField
      DisplayLabel = '% Rec.'
      FieldKind = fkCalculated
      FieldName = 'P_REC'
      OnGetText = QMCuentaIVAP_RECGetText
      Calculated = True
    end
    object QMCuentaIVACTA_CARGO_IVA_RECC: TFIBStringField
      DisplayLabel = 'Cta. Cargo IVA RECC'
      FieldName = 'CTA_CARGO_IVA_RECC'
      Size = 15
    end
    object QMCuentaIVACTA_ABONO_IVA_RECC: TFIBStringField
      DisplayLabel = 'Cta. Abono IVA RECC'
      FieldName = 'CTA_ABONO_IVA_RECC'
      Size = 15
    end
    object QMCuentaIVACTA_CARGO_IVA_ISP: TFIBStringField
      DisplayLabel = 'Cta. Cargo IVA I.S.P.'
      FieldName = 'CTA_CARGO_IVA_ISP'
      Size = 15
    end
    object QMCuentaIVACTA_ABONO_IVA_ISP: TFIBStringField
      DisplayLabel = 'Cta. Abono IVA I.S.P.'
      FieldName = 'CTA_ABONO_IVA_ISP'
      Size = 15
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 304
    Top = 8
  end
  object DSxModoIva: TDataSource
    DataSet = xModoIva
    Left = 184
    Top = 104
  end
  object xTipoIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *  FROM SYS_TIPO_IVA'
      'WHERE PAIS=?PAIS AND TIPO=?TIPO_IVA')
    UniDirectional = False
    DataSource = DSQMCuentaIVA
    Left = 56
    Top = 56
    object xTipoIvaTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xTipoIvaPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xTipoIvaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
    object xTipoIvaP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xTipoIvaP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object xTipoIvaACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xTipoIvaDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object xModoIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_MODO_IVA'
      'WHERE MODO=?MODO_IVA')
    UniDirectional = False
    DataSource = DSQMCuentaIVA
    Left = 56
    Top = 104
    object xModoIvaMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object xModoIvaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xModoIvaIVA: TIntegerField
      DisplayLabel = '% IVA'
      FieldName = 'IVA'
    end
    object xModoIvaRECARGO: TIntegerField
      DisplayLabel = '% Rec.'
      FieldName = 'RECARGO'
    end
    object xModoIvaDEDUCIBLE: TIntegerField
      DisplayLabel = 'Deducible'
      FieldName = 'DEDUCIBLE'
    end
    object xModoIvaTIPO_TRANSACCION: TIntegerField
      DisplayLabel = 'Tipo Transac.'
      FieldName = 'TIPO_TRANSACCION'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 304
    Top = 56
  end
end
