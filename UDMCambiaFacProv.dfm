object DMCambiaFacProv: TDMCambiaFacProv
  OldCreateOrder = False
  OnCreate = DMCambiaCreate
  Left = 599
  Top = 212
  Height = 171
  Width = 280
  object QMTipoIva: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_E_REDONDEOS'
      'where '
      '           empresa=?empresa and '
      '           ejercicio=?ejercicio and '
      '           canal=?canal and'
      '           serie=?serie and '
      '           tipo=?Tipo and '
      '           rig=?rig')
    RefreshSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_E_REDONDEOS '
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND'
      '  RIG=?old_RIG AND'
      '  TIPO_IVA=?old_TIPO_IVA'
      '  ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_E_REDONDEOS'
      'WHERE ID_E = ?ID_E')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      
        'execute procedure g_factura_prov_cambia_iva (?empresa, ?ejercici' +
        'o, '
      
        '              ?canal,?serie, ?rig, ?tipo_iva, ?i_iva, ?i_re, ?ti' +
        'po,?i_iva_canal,'
      '?i_re_canal,?ID_E)')
    AfterPost = Graba
    OnNewRecord = QMTipoIvaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'TIPO_IVA'#13)
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_E_REDONDEOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 38
    Top = 12
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
    object QMTipoIvaPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMTipoIvaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMTipoIvaS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object QMTipoIvaDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object QMTipoIvaI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. P.P.'
      FieldName = 'I_DTO_PP'
    end
    object QMTipoIvaP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMTipoIvaI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMTipoIvaP_RE: TFloatField
      DisplayLabel = '% RE'
      FieldName = 'P_RE'
    end
    object QMTipoIvaI_RE: TFloatField
      DisplayLabel = 'Imp. RE'
      FieldName = 'I_RE'
    end
    object QMTipoIvaS_BASES_DTO: TFloatField
      DisplayLabel = 'S. Bases Dto.'
      FieldName = 'S_BASES_DTO'
    end
    object QMTipoIvaLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMTipoIvaI_IVA_CANAL: TFloatField
      DisplayLabel = 'Imp. IVA Canal'
      FieldName = 'I_IVA_CANAL'
    end
    object QMTipoIvaI_RE_CANAL: TFloatField
      DisplayLabel = 'Imp. RE Canal'
      FieldName = 'I_RE_CANAL'
    end
  end
  object DSTipoIva: TDataSource
    DataSet = QMTipoIva
    Left = 116
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
    Top = 12
  end
  object QMoneda: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MONEDA FROM GES_CABECERAS_E'
      'WHERE ID_E = ?ID_E')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 64
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
    Top = 66
  end
end
