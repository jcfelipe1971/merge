object DMDGIIConfEnvio: TDMDGIIConfEnvio
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 895
  Top = 196
  Height = 415
  Width = 518
  object DSQMDgiiConfiguracion: TDataSource
    DataSet = QMDgiiConfiguracion
    Left = 153
    Top = 24
  end
  object QMDgiiConfiguracion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DGII_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO DGII_CONFIGURACION'
      '  (EMPRESA,'#13#10'TOKEN,URL_BASE,ID_COMPANY)'
      'VALUES'
      '  (?EMPRESA,'#13#10'?TOKEN,?URL_BASE,?ID_COMPANY)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DGII_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DGII_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE DGII_CONFIGURACION'
      'SET'
      '  TOKEN=?TOKEN '
      '  ,URL_BASE=?URL_BASE '
      '  ,ID_COMPANY=?ID_COMPANY '
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMDgiiConfiguracionNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'DGII_CONFIGURACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMDgiiConfiguracionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDgiiConfiguracionTOKEN: TFIBStringField
      DisplayLabel = 'Token'
      FieldName = 'TOKEN'
      Size = 3000
    end
    object QMDgiiConfiguracionURL_BASE: TFIBStringField
      DisplayLabel = 'URL Base'
      FieldName = 'URL_BASE'
      Size = 256
    end
    object QMDgiiConfiguracionID_COMPANY: TFIBStringField
      DisplayLabel = 'ID Company'
      FieldName = 'ID_COMPANY'
      Size = 40
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 368
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 448
    Top = 24
  end
end
