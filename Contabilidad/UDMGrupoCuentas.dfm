object DMGrupoCuentas: TDMGrupoCuentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 617
  Top = 401
  Height = 241
  Width = 354
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 262
    Top = 20
  end
  object DSQMGrupoCuentas: TDataSource
    DataSet = QMGrupoCuentas
    Left = 157
    Top = 20
  end
  object QMGrupoCuentas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GRUPO_CUENTAS'
      'WHERE '
      'EMPRESA=?old_EMPRESA AND'
      'EJERCICIO=?old_EJERCICIO AND'
      'CANAL=?old_CANAL AND'
      'GRUPO_CUENTAS=?old_GRUPO_CUENTAS AND'
      'PGC=?old_PGC')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GRUPO_CUENTAS'
      
        '  (EMPRESA,EJERCICIO,CANAL,GRUPO_CUENTAS,PGC,CTA_COMPRAS,CTA_DEV' +
        '_COMPRAS,CTA_ABONO_COMPRAS,CTA_VENTAS,CTA_DEV_VENTAS,CTA_ABONO_V' +
        'ENTAS,TITULO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?GRUPO_CUENTAS,?PGC,?CTA_COMPRAS,?' +
        'CTA_DEV_COMPRAS,?CTA_ABONO_COMPRAS,?CTA_VENTAS,?CTA_DEV_VENTAS,?' +
        'CTA_ABONO_VENTAS,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT * '
      'FROM CON_CUENTAS_GRUPO_CUENTAS'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'GRUPO_CUENTAS=?GRUPO_CUENTAS AND'
      'PGC=?PGC')
    SelectSQL.Strings = (
      'SELECT * '
      'FROM CON_CUENTAS_GRUPO_CUENTAS'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'PGC=?PGC'
      'ORDER BY GRUPO_CUENTAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GRUPO_CUENTAS'
      'SET'
      'CTA_COMPRAS=?CTA_COMPRAS'
      ',CTA_DEV_COMPRAS=?CTA_DEV_COMPRAS'
      ',CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS'
      ',CTA_VENTAS=?CTA_VENTAS'
      ',CTA_DEV_VENTAS=?CTA_DEV_VENTAS'
      ',CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS'
      ',TITULO=?TITULO'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'GRUPO_CUENTAS=?GRUPO_CUENTAS AND'
      'PGC=?PGC')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMGrupoCuentasBeforePost
    OnNewRecord = QMGrupoCuentasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'GRUPO_CUENTAS '
      'PGC'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GRUPO_CUENTAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 52
    Top = 20
    object QMGrupoCuentasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMGrupoCuentasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMGrupoCuentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMGrupoCuentasGRUPO_CUENTAS: TIntegerField
      DisplayLabel = 'Gr. Cuentas'
      FieldName = 'GRUPO_CUENTAS'
    end
    object QMGrupoCuentasPGC: TIntegerField
      FieldName = 'PGC'
    end
    object QMGrupoCuentasCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Compras'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object QMGrupoCuentasCTA_DEV_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEV_COMPRAS'
      Size = 15
    end
    object QMGrupoCuentasCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object QMGrupoCuentasCTA_DEV_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEV_VENTAS'
      Size = 15
    end
    object QMGrupoCuentasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMGrupoCuentasCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Compras'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object QMGrupoCuentasCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Ventas'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 262
    Top = 84
  end
end
