object ZDMBambalinas: TZDMBambalinas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 268
  Width = 284
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 216
    Top = 16
  end
  object QMBambalinas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_BAMBALINAS'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_BAMBALINAS'
      '  (CODIGO,DESCRIPCION,IMAGEN)'
      'VALUES'
      '  (?CODIGO,?DESCRIPCION,?IMAGEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_BAMBALINAS'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_BAMBALINAS'
      'order by codigo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_BAMBALINAS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,IMAGEN=?IMAGEN '
      'WHERE'
      '  CODIGO=?CODIGO ')
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_BAMBALINAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMBambalinasCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMBambalinasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMBambalinasIMAGEN: TIntegerField
      DisplayLabel = 'N'#250'm. Imagen'
      FieldName = 'IMAGEN'
    end
  end
  object DSQMBambalinas: TDataSource
    DataSet = QMBambalinas
    Left = 120
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 216
    Top = 72
  end
end
