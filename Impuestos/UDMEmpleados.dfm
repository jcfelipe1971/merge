object DMEmpleados: TDMEmpleados
  OldCreateOrder = False
  OnCreate = DMEmpleadosCreate
  Left = 441
  Top = 305
  Height = 172
  Width = 337
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
    Top = 8
  end
  object QMEmpleados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_TRABAJADORES'
      'WHERE'
      '  INGRESO=?old_INGRESO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_TRABAJADORES'
      
        '  (EMPRESA,EJERCICIO,CANAL,TERCERO,IMPORTE,RETENCION,FECHA,INGRE' +
        'SO,IMPORTE_ESPECIE,RETENCION_ESPECIE,DIETAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TERCERO,?IMPORTE,?RETENCION,?FECH' +
        'A,?INGRESO,?IMPORTE_ESPECIE,?RETENCION_ESPECIE,?DIETAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_TRABAJADORES'
      'WHERE'
      '  INGRESO=?INGRESO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_TRABAJADORES'
      
        '  where empresa=?empresa and ejercicio=?ejercicio and canal=?can' +
        'al '
      ' ORDER BY EMPRESA,EJERCICIO,CANAL,INGRESO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_TRABAJADORES'
      'SET'
      '  TERCERO=?TERCERO '
      '  ,IMPORTE=?IMPORTE '
      '  ,RETENCION=?RETENCION '
      '  ,FECHA=?FECHA '
      '  ,INGRESO=?INGRESO'
      '  ,IMPORTE_ESPECIE=?IMPORTE_ESPECIE'
      '  ,RETENCION_ESPECIE=?RETENCION_ESPECIE'
      '  ,DIETAS=?DIETAS'
      'WHERE'
      '  INGRESO=?INGRESO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMEmpleadosNewRecord
    ClavesPrimarias.Strings = (
      'INGRESO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_TRABAJADORES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMEmpleadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEmpleadosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEmpleadosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEmpleadosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMEmpleadosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMEmpleadosRETENCION: TFloatField
      DisplayLabel = 'Retenci'#243'n'
      FieldName = 'RETENCION'
    end
    object QMEmpleadosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMEmpleadosINGRESO: TIntegerField
      DisplayLabel = 'Ingreso'
      FieldName = 'INGRESO'
    end
    object QMEmpleadosIMPORTE_ESPECIE: TFloatField
      DisplayLabel = 'Importe Especie'
      FieldName = 'IMPORTE_ESPECIE'
    end
    object QMEmpleadosRETENCION_ESPECIE: TFloatField
      DisplayLabel = 'Retenci'#243'n Especie'
      FieldName = 'RETENCION_ESPECIE'
    end
    object QMEmpleadosDIETAS: TFloatField
      DisplayLabel = 'Dietas'
      FieldName = 'DIETAS'
    end
  end
  object DSQMEmpleados: TDataSource
    DataSet = QMEmpleados
    Left = 128
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
    Left = 248
    Top = 56
  end
end
