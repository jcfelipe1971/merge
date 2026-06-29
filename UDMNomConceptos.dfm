object DMNomConceptos: TDMNomConceptos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 380
  Top = 291
  Height = 238
  Width = 499
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 304
    Top = 48
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 376
    Top = 48
  end
  object DSQMNomConcep: TDataSource
    DataSet = QMNomConcep
    Left = 160
    Top = 48
  end
  object QMNomConcep: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_NOMINA_CONCEPTOS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_NOMINA_CONCEPTOS'
      
        '  (ID,'#13#10'CONCEPTO,DESCRIPCION,TIPO,SEG_SOCIAL,HORAS,HORAS_FUERZA_' +
        'MAYOR,CLAVE,SUB_CLAVE,POSITIVO,ACTUALIZA_DE_CONVENIO,'#13#10'SIGNO,TIP' +
        'O_IMPORTE,TIPO_CONTABILIZACION,TIPO_CONCEPTO,SIGNO_CONTABILIZACI' +
        'ON)'
      'VALUES'
      
        '  (?ID,'#13#10'?CONCEPTO,?DESCRIPCION,?TIPO,?SEG_SOCIAL,?HORAS,?HORAS_' +
        'FUERZA_MAYOR,?CLAVE,?SUB_CLAVE,?POSITIVO,?ACTUALIZA_DE_CONVENIO,' +
        #13#10'?SIGNO,?TIPO_IMPORTE,?TIPO_CONTABILIZACION,?TIPO_CONCEPTO,?SIG' +
        'NO_CONTABILIZACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_NOMINA_CONCEPTOS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_NOMINA_CONCEPTOS'
      'ORDER BY CONCEPTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_NOMINA_CONCEPTOS'
      'SET'
      '  CONCEPTO=?CONCEPTO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,TIPO=?TIPO '
      '  ,SEG_SOCIAL=?SEG_SOCIAL '
      '  ,HORAS=?HORAS '
      '  ,HORAS_FUERZA_MAYOR=?HORAS_FUERZA_MAYOR '
      '  ,CLAVE=?CLAVE '
      '  ,SUB_CLAVE=?SUB_CLAVE '
      '  ,POSITIVO=?POSITIVO '
      '  ,ACTUALIZA_DE_CONVENIO=?ACTUALIZA_DE_CONVENIO '
      '  ,SIGNO=?SIGNO '
      '  ,TIPO_IMPORTE=?TIPO_IMPORTE '
      '  ,TIPO_CONTABILIZACION=?TIPO_CONTABILIZACION '
      '  ,TIPO_CONCEPTO=?TIPO_CONCEPTO '
      '  ,SIGNO_CONTABILIZACION=?SIGNO_CONTABILIZACION '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMNomConcepBeforePost
    ClavesPrimarias.Strings = (
      'ID')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_NOMINA_CONCEPTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 48
    object QMNomConcepID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNomConcepDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMNomConcepTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 15
    end
    object QMNomConcepSEG_SOCIAL: TIntegerField
      DisplayLabel = 'Seguridad Social'
      FieldName = 'SEG_SOCIAL'
    end
    object QMNomConcepHORAS: TIntegerField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
    object QMNomConcepHORAS_FUERZA_MAYOR: TIntegerField
      DisplayLabel = 'Horas Fuerza Mayor'
      FieldName = 'HORAS_FUERZA_MAYOR'
    end
    object QMNomConcepCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 40
    end
    object QMNomConcepSUB_CLAVE: TIntegerField
      DisplayLabel = 'Sub Clave'
      FieldName = 'SUB_CLAVE'
    end
    object QMNomConcepPOSITIVO: TIntegerField
      DisplayLabel = 'Positivo'
      FieldName = 'POSITIVO'
    end
    object QMNomConcepACTUALIZA_DE_CONVENIO: TIntegerField
      DisplayLabel = 'Actualizacion de Convenio'
      FieldName = 'ACTUALIZA_DE_CONVENIO'
    end
    object QMNomConcepCONCEPTO: TFIBStringField
      DisplayLabel = 'Concepto'
      FieldName = 'CONCEPTO'
      Size = 5
    end
    object QMNomConcepSIGNO: TIntegerField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
    end
    object QMNomConcepTIPO_CONTABILIZACION: TIntegerField
      DisplayLabel = 'Tipo Contabilizacion'
      FieldName = 'TIPO_CONTABILIZACION'
    end
    object QMNomConcepTIPO_IMPORTE: TIntegerField
      DisplayLabel = 'Tipo Importe'
      FieldName = 'TIPO_IMPORTE'
    end
    object QMNomConcepTIPO_CONCEPTO: TIntegerField
      DisplayLabel = 'Tipo Concepto'
      FieldName = 'TIPO_CONCEPTO'
    end
    object QMNomConcepSIGNO_CONTABILIZACION: TIntegerField
      DisplayLabel = 'Signo Contabilizacion'
      FieldName = 'SIGNO_CONTABILIZACION'
    end
  end
end
