object ZDMColores: TZDMColores
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 424
  Top = 137
  Height = 184
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 130
    Top = 18
  end
  object QMColores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_COLORES'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_COLORES'
      
        '  (DIAS_RETRASO,CODIGO_COMPONENTE,DESCRIPCION,CODIGO,INCREMENTO_' +
        'PVP,COLOR,COLOR_DECIMAL,ACTIVO)'
      'VALUES'
      
        '  (?DIAS_RETRASO,?CODIGO_COMPONENTE,?DESCRIPCION,?CODIGO,?INCREM' +
        'ENTO_PVP,?COLOR,?COLOR_DECIMAL,?ACTIVO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_COLORES'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_COLORES'
      'order by codigo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_COLORES'
      'SET'
      '  DIAS_RETRASO=?DIAS_RETRASO '
      '  ,CODIGO_COMPONENTE=?CODIGO_COMPONENTE '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,INCREMENTO_PVP=?INCREMENTO_PVP '
      '  ,COLOR=?COLOR'
      '  ,COLOR_DECIMAL=?COLOR_DECIMAL'
      '  ,ACTIVO=?ACTIVO'
      'WHERE'
      '  CODIGO=?CODIGO ')
    OnNewRecord = QMColoresNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_COLORES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMColoresCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 2
    end
    object QMColoresDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
    end
    object QMColoresDIAS_RETRASO: TIntegerField
      DisplayLabel = 'D'#237'as de Retraso'
      FieldName = 'DIAS_RETRASO'
    end
    object QMColoresINCREMENTO_PVP: TFloatField
      DisplayLabel = '% Incr. PVP'
      FieldName = 'INCREMENTO_PVP'
    end
    object QMColoresCODIGO_COMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'CODIGO_COMPONENTE'
      Size = 5
    end
    object QMColoresCOLOR: TIntegerField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
    end
    object QMColoresCOLOR_DECIMAL: TFloatField
      DisplayLabel = 'Color Decimal'
      FieldName = 'COLOR_DECIMAL'
    end
    object QMColoresACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSQMColores: TDataSource
    DataSet = QMColores
    Left = 32
    Top = 72
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 130
    Top = 74
  end
end
