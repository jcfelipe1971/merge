object DMPrevisionCuentas: TDMPrevisionCuentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 697
  Top = 242
  Height = 271
  Width = 301
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 248
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
    Left = 248
    Top = 80
  end
  object QMPrevisionCuentas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM VER_CON_CUENTAS_PREVISION'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CUENTA = :CUENTA AND'
      'CUENTA_PGC = :CUENTA_PGC'
      '')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CON_CUENTAS_PREVISION'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL'
      'ORDER BY CUENTA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CON_CUENTAS_PREVISION'
      'SET PREVISION_01 = :PREVISION_01,'
      '    PREVISION_02 = :PREVISION_02,'
      '    PREVISION_03 = :PREVISION_03,'
      '    PREVISION_04 = :PREVISION_04,'
      '    PREVISION_05 = :PREVISION_05,'
      '    PREVISION_06 = :PREVISION_06,'
      '    PREVISION_07 = :PREVISION_07,'
      '    PREVISION_08 = :PREVISION_08,'
      '    PREVISION_09 = :PREVISION_09,'
      '    PREVISION_10 = :PREVISION_10,'
      '    PREVISION_11 = :PREVISION_11,'
      '    PREVISION_12 = :PREVISION_12'
      'WHERE EMPRESA = :EMPRESA AND'
      '      EJERCICIO = :EJERCICIO AND'
      '      CANAL = :CANAL AND'
      '      CUENTA = :CUENTA AND'
      '      CUENTA_PGC = :CUENTA_PGC')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CON_CUENTAS_PREVISION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 40
    object QMPrevisionCuentasEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMPrevisionCuentasEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMPrevisionCuentasCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMPrevisionCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMPrevisionCuentasCUENTA_PGC: TIntegerField
      DisplayLabel = 'PGC'
      FieldName = 'CUENTA_PGC'
    end
    object QMPrevisionCuentasTITULO_CUENTA: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_CUENTA'
      Size = 150
    end
    object QMPrevisionCuentasPREVISION_01: TFloatField
      DisplayLabel = 'Previsi'#243'n 01'
      FieldName = 'PREVISION_01'
    end
    object QMPrevisionCuentasSALDO_01: TFloatField
      DisplayLabel = 'Saldo 01'
      FieldName = 'SALDO_01'
    end
    object QMPrevisionCuentasDIFERENCIA_01: TFloatField
      DisplayLabel = 'Diferencia 01'
      FieldName = 'DIFERENCIA_01'
    end
    object QMPrevisionCuentasPREVISION_02: TFloatField
      DisplayLabel = 'Previsi'#243'n 02'
      FieldName = 'PREVISION_02'
    end
    object QMPrevisionCuentasSALDO_02: TFloatField
      DisplayLabel = 'Saldo 02'
      FieldName = 'SALDO_02'
    end
    object QMPrevisionCuentasDIFERENCIA_02: TFloatField
      DisplayLabel = 'Diferencia 02'
      FieldName = 'DIFERENCIA_02'
    end
    object QMPrevisionCuentasPREVISION_03: TFloatField
      DisplayLabel = 'Previsi'#243'n 03'
      FieldName = 'PREVISION_03'
    end
    object QMPrevisionCuentasSALDO_03: TFloatField
      DisplayLabel = 'Saldo 03'
      FieldName = 'SALDO_03'
    end
    object QMPrevisionCuentasDIFERENCIA_03: TFloatField
      DisplayLabel = 'Diferencia 03'
      FieldName = 'DIFERENCIA_03'
    end
    object QMPrevisionCuentasPREVISION_04: TFloatField
      DisplayLabel = 'Previsi'#243'n 04'
      FieldName = 'PREVISION_04'
    end
    object QMPrevisionCuentasSALDO_04: TFloatField
      DisplayLabel = 'Saldo 04'
      FieldName = 'SALDO_04'
    end
    object QMPrevisionCuentasDIFERENCIA_04: TFloatField
      DisplayLabel = 'Diferencia 04'
      FieldName = 'DIFERENCIA_04'
    end
    object QMPrevisionCuentasPREVISION_05: TFloatField
      DisplayLabel = 'Previsi'#243'n 05'
      FieldName = 'PREVISION_05'
    end
    object QMPrevisionCuentasSALDO_05: TFloatField
      DisplayLabel = 'Saldo 05'
      FieldName = 'SALDO_05'
    end
    object QMPrevisionCuentasDIFERENCIA_05: TFloatField
      DisplayLabel = 'Diferencia 05'
      FieldName = 'DIFERENCIA_05'
    end
    object QMPrevisionCuentasPREVISION_06: TFloatField
      DisplayLabel = 'Previsi'#243'n 06'
      FieldName = 'PREVISION_06'
    end
    object QMPrevisionCuentasSALDO_06: TFloatField
      DisplayLabel = 'Saldo 06'
      FieldName = 'SALDO_06'
    end
    object QMPrevisionCuentasDIFERENCIA_06: TFloatField
      DisplayLabel = 'Diferencia 06'
      FieldName = 'DIFERENCIA_06'
    end
    object QMPrevisionCuentasPREVISION_07: TFloatField
      DisplayLabel = 'Previsi'#243'n 07'
      FieldName = 'PREVISION_07'
    end
    object QMPrevisionCuentasSALDO_07: TFloatField
      DisplayLabel = 'Saldo 07'
      FieldName = 'SALDO_07'
    end
    object QMPrevisionCuentasDIFERENCIA_07: TFloatField
      DisplayLabel = 'Diferencia 07'
      FieldName = 'DIFERENCIA_07'
    end
    object QMPrevisionCuentasPREVISION_08: TFloatField
      DisplayLabel = 'Previsi'#243'n 08'
      FieldName = 'PREVISION_08'
    end
    object QMPrevisionCuentasSALDO_08: TFloatField
      DisplayLabel = 'Saldo 08'
      FieldName = 'SALDO_08'
    end
    object QMPrevisionCuentasDIFERENCIA_08: TFloatField
      DisplayLabel = 'Diferencia 08'
      FieldName = 'DIFERENCIA_08'
    end
    object QMPrevisionCuentasPREVISION_09: TFloatField
      DisplayLabel = 'Previsi'#243'n 09'
      FieldName = 'PREVISION_09'
    end
    object QMPrevisionCuentasSALDO_09: TFloatField
      DisplayLabel = 'Saldo 09'
      FieldName = 'SALDO_09'
    end
    object QMPrevisionCuentasDIFERENCIA_09: TFloatField
      DisplayLabel = 'Diferencia 09'
      FieldName = 'DIFERENCIA_09'
    end
    object QMPrevisionCuentasPREVISION_10: TFloatField
      DisplayLabel = 'Previsi'#243'n 10'
      FieldName = 'PREVISION_10'
    end
    object QMPrevisionCuentasSALDO_10: TFloatField
      DisplayLabel = 'Saldo 10'
      FieldName = 'SALDO_10'
    end
    object QMPrevisionCuentasDIFERENCIA_10: TFloatField
      DisplayLabel = 'Diferencia 10'
      FieldName = 'DIFERENCIA_10'
    end
    object QMPrevisionCuentasPREVISION_11: TFloatField
      DisplayLabel = 'Previsi'#243'n 11'
      FieldName = 'PREVISION_11'
    end
    object QMPrevisionCuentasSALDO_11: TFloatField
      DisplayLabel = 'Saldo 11'
      FieldName = 'SALDO_11'
    end
    object QMPrevisionCuentasDIFERENCIA_11: TFloatField
      DisplayLabel = 'Diferencia 11'
      FieldName = 'DIFERENCIA_11'
    end
    object QMPrevisionCuentasPREVISION_12: TFloatField
      DisplayLabel = 'Previsi'#243'n 12'
      FieldName = 'PREVISION_12'
    end
    object QMPrevisionCuentasSALDO_12: TFloatField
      DisplayLabel = 'Saldo 12'
      FieldName = 'SALDO_12'
    end
    object QMPrevisionCuentasDIFERENCIA_12: TFloatField
      DisplayLabel = 'Diferencia 12'
      FieldName = 'DIFERENCIA_12'
    end
    object QMPrevisionCuentasPREVISION_20: TFloatField
      DisplayLabel = 'Previsi'#243'n 20'
      FieldName = 'PREVISION_20'
    end
    object QMPrevisionCuentasSALDO_20: TFloatField
      DisplayLabel = 'Saldo 20'
      FieldName = 'SALDO_20'
    end
    object QMPrevisionCuentasDIFERENCIA_20: TFloatField
      DisplayLabel = 'Diferencia 20'
      FieldName = 'DIFERENCIA_20'
    end
  end
  object DSQMPrevisionCuentas: TDataSource
    DataSet = QMPrevisionCuentas
    Left = 152
    Top = 40
  end
end
