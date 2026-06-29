object DMTipoIRPF: TDMTipoIRPF
  OldCreateOrder = False
  OnCreate = DMTipoIRPFCreate
  Left = 534
  Top = 293
  Height = 183
  Width = 335
  object QMTipoIRPF: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_IRPF'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_IRPF'
      '(BASE,P_IRPF,TIPO,TITULO,PAIS,TIPO_GANADERO,'
      'INCLUIR_ENMODELO)'
      'VALUES'
      '  (?BASE,?P_IRPF,?TIPO,?TITULO,?PAIS,?TIPO_GANADERO,'
      '?INCLUIR_ENMODELO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_IRPF'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IRPF'
      'where pais=?pais')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_IRPF'
      'SET'
      '  BASE=?BASE '
      '  ,P_IRPF=?P_IRPF '
      '  ,TITULO=?TITULO '
      '  ,TIPO_GANADERO=?TIPO_GANADERO'
      '  ,INCLUIR_ENMODELO=?INCLUIR_ENMODELO'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterPost = QMTipoIRPFAfterPost
    BeforePost = QMTipoIRPFBeforePost
    OnNewRecord = QMTipoIRPFNewRecord
    ClavesPrimarias.Strings = (
      'PAIS '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_IRPF'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 72
    object QMTipoIRPFPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMTipoIRPFTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMTipoIRPFTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 15
    end
    object QMTipoIRPFP_IRPF: TFloatField
      DisplayLabel = '% IRPF'
      FieldName = 'P_IRPF'
    end
    object QMTipoIRPFBASE: TIntegerField
      DisplayLabel = 'Base'
      FieldName = 'BASE'
    end
    object QMTipoIRPFTIPO_GANADERO: TIntegerField
      DisplayLabel = 'Tipo Ganadero'
      FieldName = 'TIPO_GANADERO'
      OnChange = QMTipoIRPFTIPO_GANADEROChange
    end
    object QMTipoIRPFINCLUIR_ENMODELO: TIntegerField
      DisplayLabel = 'Incl. en Modelo'
      FieldName = 'INCLUIR_ENMODELO'
    end
  end
  object DSTipoIRPF: TDataSource
    DataSet = QMTipoIRPF
    Left = 112
    Top = 68
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 30
    Top = 18
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 110
    Top = 18
  end
end
