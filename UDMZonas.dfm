object DMZonas: TDMZonas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 248
  Top = 313
  Height = 209
  Width = 343
  object DSQMZonas: TDataSource
    DataSet = QMZonas
    Left = 112
    Top = 32
  end
  object QMZonas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_ZONAS'
      'WHERE'
      '  ZONA=?old_ZONA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_ZONAS'
      '  (ZONA,TITULO,DEFECTO,CALENDARIO,GENERA_RUTA_ALB_AUTO)'
      'VALUES'
      '  (?ZONA,?TITULO,?DEFECTO,?CALENDARIO,?GENERA_RUTA_ALB_AUTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_ZONAS'
      'WHERE'
      '  ZONA=?ZONA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_ZONAS'
      'ORDER BY DEFECTO DESC, ZONA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_ZONAS'
      'SET'
      '  TITULO=?TITULO'
      '  ,DEFECTO=?DEFECTO '
      '  ,CALENDARIO=?CALENDARIO'
      '  ,GENERA_RUTA_ALB_AUTO=?GENERA_RUTA_ALB_AUTO'
      'WHERE'
      '  ZONA=?ZONA ')
    OnNewRecord = QMZonasNewRecord
    ClavesPrimarias.Strings = (
      'ZONA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_ZONAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 32
    object QMZonasZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 15
    end
    object QMZonasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMZonasDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QMZonasCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object QMZonasGENERA_RUTA_ALB_AUTO: TIntegerField
      DisplayLabel = 'Autogenera Ruta Alb.'
      FieldName = 'GENERA_RUTA_ALB_AUTO'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 192
    Top = 32
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 32
  end
end
