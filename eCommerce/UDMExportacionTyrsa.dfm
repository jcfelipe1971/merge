object DMExportacionTyrsa: TDMExportacionTyrsa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 406
  Top = 184
  Height = 150
  Width = 215
  object xTablasExportar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TABLAS_EXPORTAR'
      'WHERE'
      '  NOMBRE=?old_NOMBRE ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TABLAS_EXPORTAR'
      '  (NOMBRE,MARCADO)'
      'VALUES'
      '  (?NOMBRE,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TABLAS_EXPORTAR'
      'WHERE'
      '  NOMBRE=?NOMBRE ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TABLAS_EXPORTAR'
      'ORDER BY NOMBRE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TABLAS_EXPORTAR'
      'SET'
      '  MARCADO=?MARCADO '
      'WHERE'
      '  NOMBRE=?NOMBRE ')
    ClavesPrimarias.Strings = (
      'NOMBRE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TABLAS_EXPORTAR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object xTablasExportarNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
    object xTablasExportarMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
  end
  object DSxTablasExportar: TDataSource
    DataSet = xTablasExportar
    Left = 136
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
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
    Left = 136
    Top = 16
  end
end
