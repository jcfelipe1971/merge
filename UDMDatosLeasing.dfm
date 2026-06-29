object DMDatosLeasing: TDMDatosLeasing
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 747
  Top = 201
  Height = 361
  Width = 393
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 288
    Top = 8
  end
  object QMDatosLeasing: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'SELECT * FROM SYS_EMPRESAS'
      'WHERE EMPRESA = 1')
    InsertSQL.Strings = (
      'SELECT * FROM SYS_EMPRESAS'
      'WHERE EMPRESA = 1')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_E_FCR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT '
      'EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG'
      ',CTA_IVA_DIFERIDO,CTA_GASTOS_INTERESES,CTA_ABONO_GASTOS,'
      'GASTOS_LEASING,IVA_DIFERIDO'
      'FROM GES_CABECERAS_E_FCR'
      'WHERE EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO = ?TIPO AND'
      'RIG = ?RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_E_FCR'
      'SET'
      '  CTA_IVA_DIFERIDO=?CTA_IVA_DIFERIDO '
      '  ,CTA_GASTOS_INTERESES=?CTA_GASTOS_INTERESES '
      '  ,CTA_ABONO_GASTOS=?CTA_ABONO_GASTOS '
      '  ,GASTOS_LEASING=?GASTOS_LEASING '
      '  ,IVA_DIFERIDO = ?IVA_DIFERIDO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    Plan.Strings = (
      'PLAN (GES_CABECERAS_E_FCR INDEX (PK_GES_CABECERAS_E_FCR))')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_E_FCR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMDatosLeasingCTA_IVA_DIFERIDO: TFIBStringField
      DisplayLabel = 'Cta. IVA Dif.'
      FieldName = 'CTA_IVA_DIFERIDO'
      Size = 15
    end
    object QMDatosLeasingCTA_GASTOS_INTERESES: TFIBStringField
      DisplayLabel = 'Cta. Gastos Intereses'
      FieldName = 'CTA_GASTOS_INTERESES'
      Size = 15
    end
    object QMDatosLeasingCTA_ABONO_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Abono Gastos'
      FieldName = 'CTA_ABONO_GASTOS'
      Size = 15
    end
    object QMDatosLeasingGASTOS_LEASING: TFloatField
      DisplayLabel = 'Gastos Leasing'
      FieldName = 'GASTOS_LEASING'
    end
    object QMDatosLeasingEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDatosLeasingEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDatosLeasingCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDatosLeasingSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDatosLeasingTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDatosLeasingRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDatosLeasingIVA_DIFERIDO: TIntegerField
      DisplayLabel = 'IVA Diferido'
      FieldName = 'IVA_DIFERIDO'
    end
  end
  object DSQMDatosLeasing: TDataSource
    DataSet = QMDatosLeasing
    Left = 160
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 288
    Top = 56
  end
end
