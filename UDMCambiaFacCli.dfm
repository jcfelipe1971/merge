object DMCambiaFacCli: TDMCambiaFacCli
  OldCreateOrder = False
  OnCreate = DMCambiaCreate
  Left = 933
  Top = 299
  Height = 213
  Width = 298
  object QMTipoIva: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'SELECT'
      '  EMPRESA'
      'FROM GES_CABECERAS_S_REDONDEOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  TIPO_IVA=?TIPO_IVA ')
    InsertSQL.Strings = (
      'SELECT'
      '  EMPRESA'
      'FROM GES_CABECERAS_S_REDONDEOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  TIPO_IVA=?TIPO_IVA ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_REDONDEOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  TIPO_IVA=?TIPO_IVA ')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, TIPO_IVA, TI' +
        'PO_IMPUESTO_ADICIONAL, I_IVA, I_RE,'
      
        '       I_IMPUESTO_ADICIONAL, I_IVA_CANAL, I_RE_CANAL, I_IMPUESTO' +
        '_ADICIONAL_CANAL, MONEDA, ID_S'
      'FROM GES_CABECERAS_S_REDONDEOS'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY TIPO_IVA, TIPO_IMPUESTO_ADICIONAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      
        'EXECUTE PROCEDURE G_FACTURA_CLI_CAMBIA_IVA(:ID_S, :TIPO_IVA, :TI' +
        'PO_IMPUESTO_ADICIONAL, :I_IVA, :I_RE,'
      
        '    :I_IMPUESTO_ADICIONAL, :I_IVA_CANAL, :I_RE_CANAL, :I_IMPUEST' +
        'O_ADICIONAL_CANAL)')
    AfterPost = Graba
    OnNewRecord = QMTipoIvaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'TIPO_IVA ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_REDONDEOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMTipoIvaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTipoIvaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTipoIvaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTipoIvaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMTipoIvaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMTipoIvaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMTipoIvaTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMTipoIvaI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMTipoIvaI_RE: TFloatField
      DisplayLabel = 'Imp. RE'
      FieldName = 'I_RE'
    end
    object QMTipoIvaI_IVA_CANAL: TFloatField
      DisplayLabel = 'Imp. IVA Canal'
      FieldName = 'I_IVA_CANAL'
    end
    object QMTipoIvaI_RE_CANAL: TFloatField
      DisplayLabel = 'Imp. RE Canal'
      FieldName = 'I_RE_CANAL'
    end
    object QMTipoIvaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMTipoIvaTIPO_IMPUESTO_ADICIONAL: TIntegerField
      DisplayLabel = 'Tipo Imp. Adicional'
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
    end
    object QMTipoIvaI_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = 'Imp. Adic.'
      FieldName = 'I_IMPUESTO_ADICIONAL'
    end
    object QMTipoIvaI_IMPUESTO_ADICIONAL_CANAL: TFloatField
      DisplayLabel = 'Imp. Adic. Canal'
      FieldName = 'I_IMPUESTO_ADICIONAL_CANAL'
    end
  end
  object DSQMTipoIva: TDataSource
    DataSet = QMTipoIva
    Left = 128
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 208
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 208
    Top = 59
  end
end
