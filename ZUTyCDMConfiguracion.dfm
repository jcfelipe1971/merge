object ZTyCDMConfiguracion: TZTyCDMConfiguracion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 608
  Top = 212
  Height = 311
  Width = 249
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 42
    Top = 32
  end
  object DSQMTyCConfig: TDataSource
    DataSet = QMTyCConfig
    Left = 128
    Top = 80
  end
  object QMTyCConfig: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_TYC_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_TYC_CONFIGURACION'
      '  (LISTADO_PED_ESPECIALES,EMPRESA,SERVIR_PEDIDOS)'
      'VALUES'
      '  (?LISTADO_PED_ESPECIALES,?EMPRESA,?SERVIR_PEDIDOS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_TYC_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_TYC_CONFIGURACION'
      'where empresa=?empresa')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_TYC_CONFIGURACION'
      'SET'
      '  LISTADO_PED_ESPECIALES=?LISTADO_PED_ESPECIALES '
      '  ,SERVIR_PEDIDOS=?SERVIR_PEDIDOS '
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    ClavesPrimarias.Strings = (
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_TYC_CONFIGURACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 80
    object QMTyCConfigEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTyCConfigLISTADO_PED_ESPECIALES: TIntegerField
      DisplayLabel = 'Listado Ped. Esp.'
      FieldName = 'LISTADO_PED_ESPECIALES'
    end
    object QMTyCConfigSERVIR_PEDIDOS: TIntegerField
      DisplayLabel = 'Servir Ped.'
      FieldName = 'SERVIR_PEDIDOS'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 128
    Top = 32
  end
end
