object DMCampanyas: TDMCampanyas
  OldCreateOrder = False
  OnCreate = DMCampanyasCreate
  Left = 554
  Top = 447
  Height = 176
  Width = 244
  object QMCampanyas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CAMPANYAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CAMPANYA=?old_CAMPANYA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CAMPANYAS'
      
        '  (INICIO,FINAL,VALOR,CAMPANYA,VALOR_SI,TITULO,ACTIVA,EMPRESA,EJ' +
        'ERCICIO)'
      'VALUES'
      
        '  (?INICIO,?FINAL,?VALOR,?CAMPANYA,?VALOR_SI,?TITULO,?ACTIVA,?EM' +
        'PRESA,?EJERCICIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CAMPANYAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CAMPANYA=?old_CAMPANYA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CAMPANYAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO'
      'ORDER BY CAMPANYA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CAMPANYAS'
      'SET'
      '  INICIO=?INICIO '
      '  ,FINAL=?FINAL '
      '  ,VALOR=?VALOR '
      '  ,VALOR_SI=?VALOR_SI '
      '  ,TITULO=?TITULO '
      '  ,ACTIVA=?ACTIVA '
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CAMPANYA=?old_CAMPANYA ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMCampanyasBeforePost
    OnNewRecord = QMCampanyasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CAMPANYA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CAMPANYAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 26
    Top = 24
    object QMCampanyasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCampanyasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCampanyasCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object QMCampanyasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMCampanyasINICIO: TDateTimeField
      DisplayLabel = 'Inicio'
      FieldName = 'INICIO'
    end
    object QMCampanyasFINAL: TDateTimeField
      DisplayLabel = 'Final'
      FieldName = 'FINAL'
    end
    object QMCampanyasACTIVA: TIntegerField
      DisplayLabel = 'Act.'
      FieldName = 'ACTIVA'
    end
    object QMCampanyasVALOR: TDateTimeField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      EditMask = '!00/00/0000;1;_'
    end
    object QMCampanyasVALOR_SI: TIntegerField
      DisplayLabel = 'Utiliza Fec. Valor'
      FieldName = 'VALOR_SI'
    end
  end
  object DSQMCampanyas: TDataSource
    DataSet = QMCampanyas
    Left = 108
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 182
    Top = 26
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
    Top = 84
  end
end
