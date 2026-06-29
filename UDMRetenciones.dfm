object DMRetenciones: TDMRetenciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 933
  Top = 299
  Height = 213
  Width = 298
  object QMRetenciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_DETALLE_RET'
      'WHERE'
      '  ID_CARTERA_DETALLE=?old_ID_CARTERA_DETALLE ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_DETALLE_RET'
      
        '  (IMPORTE_RETENCION,ID_CARTERA_DETALLE,IMPORTE_ISR,TIPO_RETENCI' +
        'ON)'
      'VALUES'
      
        '  (?IMPORTE_RETENCION,?ID_CARTERA_DETALLE,?IMPORTE_ISR,?TIPO_RET' +
        'ENCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_DETALLE_RET'
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_DETALLE_RET'
      'WHERE '
      'ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE'
      'ORDER BY ID_CARTERA_DETALLE'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_DETALLE_RET'
      'SET'
      '  IMPORTE_RETENCION=?IMPORTE_RETENCION '
      '  ,IMPORTE_ISR=?IMPORTE_ISR '
      '  ,TIPO_RETENCION=?TIPO_RETENCION '
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    OnNewRecord = QMRetencionesNewRecord
    ClavesPrimarias.Strings = (
      'ID_CARTERA_DETALLE ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_DETALLE_RET'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMRetencionesID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMRetencionesIMPORTE_RETENCION: TFloatField
      DisplayLabel = 'Imp. Retencion'
      FieldName = 'IMPORTE_RETENCION'
    end
    object QMRetencionesIMPORTE_ISR: TFloatField
      DisplayLabel = 'Imp. ISR'
      FieldName = 'IMPORTE_ISR'
    end
    object QMRetencionesTIPO_RETENCION: TIntegerField
      DisplayLabel = 'Tipo Ret.'
      FieldName = 'TIPO_RETENCION'
    end
    object QMRetencionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRetencionesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMRetencionesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMRetencionesRIC: TIntegerField
      FieldName = 'RIC'
    end
    object QMRetencionesCUENTA_ITBIS: TFIBStringField
      DisplayLabel = 'Cuenta ITBIS'
      FieldName = 'CUENTA_ITBIS'
      Size = 15
    end
    object QMRetencionesCUENTA_ISR: TFIBStringField
      DisplayLabel = 'Cuenta ISR'
      FieldName = 'CUENTA_ISR'
      Size = 15
    end
    object QMRetencionesBASE: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'BASE'
    end
    object QMRetencionesLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMRetencionesRESTO: TFloatField
      DisplayLabel = 'Resto'
      FieldName = 'RESTO'
    end
  end
  object DSQMRetenciones: TDataSource
    DataSet = QMRetenciones
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
    Top = 56
  end
end
