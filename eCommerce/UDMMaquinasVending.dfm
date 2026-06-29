object DMMaquinasVending: TDMMaquinasVending
  OldCreateOrder = False
  OnCreate = DMMaquinasVendingCreate
  Left = 417
  Top = 358
  Height = 176
  Width = 282
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 64
    Top = 8
  end
  object QMMaquinas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  MAQUINA=?old_MAQUINA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_MAQUINAS_VENDING'
      
        '  (ID_MAQUINA,MAQUINA,ID_CLIENTE,CLIENTE,EMPRESA,TITULO,ACTIVO,P' +
        'ARAMETRO_CLIENTE,PARAMETRO_MAQUINA,PARAMETRO_UBICACION,PARAMETRO' +
        '_DOMINIO)'
      'VALUES'
      
        '  (?ID_MAQUINA,?MAQUINA,?ID_CLIENTE,?CLIENTE,?EMPRESA,?TITULO,?A' +
        'CTIVO,?PARAMETRO_CLIENTE,?PARAMETRO_MAQUINA,?PARAMETRO_UBICACION' +
        ',?PARAMETRO_DOMINIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      '  ID_MAQUINA=?ID_MAQUINA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      '  EMPRESA=?EMPRESA'
      'ORDER BY MAQUINA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_MAQUINAS_VENDING'
      'SET'
      '  ID_MAQUINA=?ID_MAQUINA '
      '  ,ID_CLIENTE=?ID_CLIENTE '
      '  ,CLIENTE=?CLIENTE '
      '  ,TITULO=?TITULO '
      '  ,ACTIVO=?ACTIVO '
      '  ,PARAMETRO_CLIENTE=?PARAMETRO_CLIENTE '
      '  ,PARAMETRO_MAQUINA=?PARAMETRO_MAQUINA '
      '  ,PARAMETRO_UBICACION=?PARAMETRO_UBICACION'
      '  ,PARAMETRO_DOMINIO=?PARAMETRO_DOMINIO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MAQUINA=?MAQUINA ')
    BeforePost = QMMaquinasBeforePost
    OnNewRecord = QMMaquinasNewRecord
    ClavesPrimarias.Strings = (
      'ID_MAQUINA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_MAQUINAS_VENDING'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 56
    object QMMaquinasID_MAQUINA: TIntegerField
      DisplayLabel = 'Id Maq.'
      FieldName = 'ID_MAQUINA'
    end
    object QMMaquinasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMaquinasMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object QMMaquinasTITULO: TFIBStringField
      DisplayLabel = 'titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMMaquinasID_CLIENTE: TIntegerField
      DisplayLabel = 'Id Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object QMMaquinasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMMaquinasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMMaquinasPARAMETRO_CLIENTE: TFIBStringField
      DisplayLabel = 'Param. Cliente'
      FieldName = 'PARAMETRO_CLIENTE'
    end
    object QMMaquinasPARAMETRO_MAQUINA: TFIBStringField
      DisplayLabel = 'Param. Maquina'
      FieldName = 'PARAMETRO_MAQUINA'
    end
    object QMMaquinasPARAMETRO_UBICACION: TFIBStringField
      DisplayLabel = 'Param. Ubicacion'
      FieldName = 'PARAMETRO_UBICACION'
    end
    object QMMaquinasPARAMETRO_DOMINIO: TFIBStringField
      DisplayLabel = 'Param. Dominio'
      FieldName = 'PARAMETRO_DOMINIO'
      Size = 60
    end
  end
  object DSQMMaquinas: TDataSource
    DataSet = QMMaquinas
    Left = 168
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 168
    Top = 8
  end
end
