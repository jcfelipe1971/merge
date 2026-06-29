object DMModoIVA: TDMModoIVA
  OldCreateOrder = False
  OnCreate = DMModoIVACreate
  Left = 555
  Top = 370
  Height = 253
  Width = 338
  object QMModoIva: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_MODO_IVA'
      'WHERE'
      '  MODO=?old_MODO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_MODO_IVA'
      '  (IVA,RECARGO,MODO,TITULO,DEDUCIBLE,TIPO_TRANSACCION)'
      'VALUES'
      '  (?IVA,?RECARGO,?MODO,?TITULO,?DEDUCIBLE,?TIPO_TRANSACCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MODO_IVA'
      'WHERE'
      '  MODO=?old_MODO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MODO_IVA'
      ' ORDER BY MODO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_MODO_IVA'
      'SET'
      '  IVA=?IVA '
      '  ,RECARGO=?RECARGO '
      '  ,TITULO=?TITULO '
      '  ,DEDUCIBLE=?DEDUCIBLE '
      '  ,TIPO_TRANSACCION=?TIPO_TRANSACCION '
      'WHERE'
      '  MODO=?old_MODO ')
    AfterDelete = Graba
    AfterOpen = QMModoIvaAfterOpen
    AfterPost = QMModoIvaAfterPost
    BeforePost = QMModoIvaBeforePost
    OnNewRecord = QMModoIvaNewRecord
    ClavesPrimarias.Strings = (
      'MODO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_MODO_IVA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 66
    object QMModoIvaMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object QMModoIvaIVA: TIntegerField
      DisplayLabel = '% IVA'
      FieldName = 'IVA'
    end
    object QMModoIvaRECARGO: TIntegerField
      DisplayLabel = '% Rec.'
      FieldName = 'RECARGO'
    end
    object QMModoIvaDEDUCIBLE: TIntegerField
      DisplayLabel = 'Deduc.'
      FieldName = 'DEDUCIBLE'
    end
    object QMModoIvaTIPO_TRANSACCION: TIntegerField
      DisplayLabel = 'Tipo Transac.'
      FieldName = 'TIPO_TRANSACCION'
    end
    object QMModoIvaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMModoIva: TDataSource
    DataSet = QMModoIva
    Left = 110
    Top = 66
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 30
    Top = 12
  end
  object SPAltaCuentasIva: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_cuentas_iva_alta (?empresa,?ejercicio,?canal' +
        ')')
    Transaction = TLocal
    AutoTrans = True
    Left = 228
    Top = 68
  end
  object DSxTransaccion: TDataSource
    DataSet = xTransaccion
    Left = 124
    Top = 120
  end
  object xTransaccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPOS_TRANSACCION'
      ' WHERE TIPO=?TIPO_TRANSACCION')
    UniDirectional = False
    DataSource = DSQMModoIva
    Left = 38
    Top = 120
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 102
    Top = 12
  end
end
