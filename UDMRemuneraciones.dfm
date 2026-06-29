object DMRemuneraciones: TDMRemuneraciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 575
  Top = 262
  Height = 475
  Width = 633
  object DSQMNomRemu: TDataSource
    DataSet = QMNomRemu
    Left = 192
    Top = 16
  end
  object QMNomRemu: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_NOMINAS_REMUNERACION'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_NOMINAS_REMUNERACION'
      
        '  (ID,EMPRESA,EJERCICIO,CANAL,PERIODO,CODIGO,ORDEN_IMPRESION,EXP' +
        'ORTAR)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?EJERCICIO,?CANAL,?PERIODO,?CODIGO,?ORDEN_IMPRES' +
        'ION,?EXPORTAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_NOMINAS_REMUNERACION'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_NOMINAS_REMUNERACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_NOMINAS_REMUNERACION'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,PERIODO=?PERIODO '
      '  ,CODIGO=?CODIGO '
      '  ,ORDEN_IMPRESION=?ORDEN_IMPRESION '
      '  ,EXPORTAR=?EXPORTAR '
      'WHERE'
      '  ID=?ID ')
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_NOMINAS_REMUNERACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 16
    object QMNomRemuID: TIntegerField
      FieldName = 'ID'
    end
    object QMNomRemuEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMNomRemuEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMNomRemuCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMNomRemuPERIODO: TFIBStringField
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMNomRemuCODIGO: TFIBStringField
      FieldName = 'CODIGO'
      Size = 15
    end
    object QMNomRemuORDEN_IMPRESION: TIntegerField
      FieldName = 'ORDEN_IMPRESION'
    end
    object QMNomRemuEXPORTAR: TIntegerField
      FieldName = 'EXPORTAR'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 344
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
    Left = 464
    Top = 16
  end
end
