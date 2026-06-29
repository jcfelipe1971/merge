object DMGenCanales: TDMGenCanales
  OldCreateOrder = False
  OnCreate = DMGenCanalesCreate
  Left = 420
  Top = 206
  Height = 420
  Width = 488
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 416
    Top = 56
  end
  object SPAsignarModoIva: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure c_cuentas_ges_asigna_modo_iva'
      '(?empresa,?ejercicio,?canal,?modo_iva,?tipo)')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 8
  end
  object SPCopiarModoIVA: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure c_cuentas_ges_copia_modo_iva'
      '(?empresa,?ejercicio,?canal_origen,?canal_destino,?tipo)')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 56
  end
  object QMGenCanales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GEN_CANALES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL ')
    InsertSQL.Strings = (
      'INSERT INTO GEN_CANALES'
      
        '  (EMPRESA,'#13#10'CANAL,PAIS,TIPO_IVA,MODO_IVA,MONEDA,ACTIVO,TITULO,P' +
        'ERFIL,COLOR)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?CANAL,?PAIS,?TIPO_IVA,?MODO_IVA,?MONEDA,?ACTIVO,?' +
        'TITULO,?PERFIL,?COLOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GEN_CANALES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL ')
    SelectSQL.Strings = (
      'SELECT * FROM GEN_CANALES'
      'WHERE EMPRESA = ?EMPRESA'
      'ORDER BY CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GEN_CANALES'
      'SET'
      '  PAIS=?PAIS '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,MONEDA=?MONEDA '
      '  ,ACTIVO=?ACTIVO '
      '  ,TITULO=?TITULO '
      '  ,PERFIL=?PERFIL '
      '  ,COLOR=?COLOR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL ')
    AfterDelete = Graba
    AfterOpen = QMGenCanalesAfterOpen
    AfterPost = Graba
    BeforePost = QMGenCanalesBeforePost
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'CANAL')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GEN_CANALES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMGenCanalesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMGenCanalesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMGenCanalesACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMGenCanalesPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      OnChange = QMGenCanalesPAISChange
      Size = 3
    end
    object QMGenCanalesTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
      OnChange = QMGenCanalesTIPO_IVAChange
    end
    object QMGenCanalesMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMGenCanalesMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
      OnChange = QMGenCanalesMODO_IVAChange
    end
    object QMGenCanalesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMGenCanalesPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMGenCanalesCOLOR: TFloatField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
    end
  end
  object DSQMGenCanales: TDataSource
    DataSet = QMGenCanales
    Left = 152
    Top = 8
  end
  object DSxTiposIVA: TDataSource
    DataSet = xTiposIva
    Left = 152
    Top = 56
  end
  object DSxModosIVA: TDataSource
    DataSet = xModosIVA
    Left = 152
    Top = 104
  end
  object SPLimEmpEjeCan: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure lim_emp_eje_can(?empresa,?ejercicio,?canal)')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 104
  end
  object EFIva: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 416
    Top = 104
  end
  object xTiposIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      '  TITULO,'
      '  P_IVA,'
      '  P_RECARGO'
      'FROM SYS_TIPO_IVA'
      'where pais=?pais and '
      '           tipo=?tipo_iva')
    UniDirectional = False
    DataSource = DSQMGenCanales
    Left = 40
    Top = 56
    object xTiposIvaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
    object xTiposIvaP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xTiposIvaP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
  end
  object xModosIVA: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      '  TITULO,'
      '  IVA,'
      '  RECARGO'
      'FROM SYS_MODO_IVA'
      'where modo=?modo_iva')
    UniDirectional = False
    DataSource = DSQMGenCanales
    Left = 40
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 416
    Top = 8
  end
end
