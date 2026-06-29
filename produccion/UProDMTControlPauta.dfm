object ProDMTControlPauta: TProDMTControlPauta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 529
  Top = 243
  Height = 201
  Width = 275
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 216
    Top = 32
  end
  object QMProTControlpauta: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_TIPOCONTROL_PAUTA'
      'WHERE'
      '  TIPOCONTROL=?old_TIPOCONTROL ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_TIPOCONTROL_PAUTA'
      '  (TIPOCONTROL,DESCRIPCION)'
      'VALUES'
      '  (?TIPOCONTROL,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_TIPOCONTROL_PAUTA'
      'WHERE'
      '  TIPOCONTROL=?TIPOCONTROL ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_TIPOCONTROL_PAUTA'
      'order by tipocontrol')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_TIPOCONTROL_PAUTA'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPOCONTROL=?TIPOCONTROL ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMProTControlpautaBeforePost
    ClavesPrimarias.Strings = (
      'TIPOCONTROL ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_TIPOCONTROL_PAUTA'
    UpdateTransaction = TLocal
    Left = 40
    Top = 32
    object QMProTControlpautaTIPOCONTROL: TIntegerField
      DisplayLabel = 'Tipo Control'
      FieldName = 'TIPOCONTROL'
    end
    object QMProTControlpautaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSTControlpauta: TDataSource
    DataSet = QMProTControlpauta
    Left = 136
    Top = 32
  end
end
