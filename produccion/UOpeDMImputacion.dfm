object OpeDMImputacion: TOpeDMImputacion
  OldCreateOrder = False
  OnCreate = OpeDMImputacionCreate
  Left = 235
  Top = 213
  Height = 191
  Width = 325
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 197
    Top = 24
  end
  object QMImputacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_SYS_IMPUTACION'
      'WHERE'
      '  IMPUTACION=?old_IMPUTACION ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_SYS_IMPUTACION'
      '  (IMPUTACION,DESCRIPCION,TIPO_IMPUTACION,H_INDET)'
      'VALUES'
      '  (?IMPUTACION,?DESCRIPCION,?TIPO_IMPUTACION,?H_INDET)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_SYS_IMPUTACION'
      'WHERE'
      '  IMPUTACION=?IMPUTACION ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_SYS_IMPUTACION'
      'ORDER BY IMPUTACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_SYS_IMPUTACION'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,TIPO_IMPUTACION=?TIPO_IMPUTACION '
      '  ,H_INDET=?H_INDET '
      'WHERE'
      '  IMPUTACION=?IMPUTACION ')
    AfterDelete = Graba
    AfterOpen = QMImputacionAfterOpen
    AfterPost = QMImputacionAfterPost
    BeforePost = QMImputacionBeforePost
    ClavesPrimarias.Strings = (
      'IMPUTACION ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_SYS_IMPUTACION'
    UpdateTransaction = TLocal
    Left = 32
    Top = 24
    object QMImputacionIMPUTACION: TFIBStringField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
      OnValidate = Duplicados
      Size = 3
    end
    object QMImputacionDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMImputacionTIPO_IMPUTACION: TFIBStringField
      DisplayLabel = 'Tipo Imputaci'#243'n'
      FieldName = 'TIPO_IMPUTACION'
      OnChange = QMImputacionTIPO_IMPUTACIONChange
      Size = 3
    end
    object QMImputacionH_INDET: TIntegerField
      DisplayLabel = 'Hora Indeterminada'
      FieldName = 'H_INDET'
    end
  end
  object DSQMImputacion: TDataSource
    DataSet = QMImputacion
    Left = 120
    Top = 24
  end
  object xTipoImputacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_SYS_TIPOS_IMPUTACION'
      'WHERE'
      '  TIPO_IMPUTACION=?old_TIPO_IMPUTACION ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_SYS_TIPOS_IMPUTACION'
      '  (TIPO_IMPUTACION,DESCRIPCION,HORAS,HORAS_LAB)'
      'VALUES'
      '  (?TIPO_IMPUTACION,?DESCRIPCION,?HORAS,?HORAS_LAB)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_SYS_TIPOS_IMPUTACION'
      'WHERE'
      '  TIPO_IMPUTACION=?TIPO_IMPUTACION ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_SYS_TIPOS_IMPUTACION'
      'Where tipo_imputacion=?tipo_imputacion')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_SYS_TIPOS_IMPUTACION'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,HORAS=?HORAS '
      '  ,HORAS_LAB=?HORAS_LAB '
      'WHERE'
      '  TIPO_IMPUTACION=?TIPO_IMPUTACION ')
    DataSource = DSQMImputacion
    ClavesPrimarias.Strings = (
      'TIPO_IMPUTACION ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_SYS_TIPOS_IMPUTACION'
    UpdateTransaction = TLocal
    Left = 84
    Top = 88
    object xTipoImputacionTIPO_IMPUTACION: TFIBStringField
      DisplayLabel = 'Tipo Imputacion'
      FieldName = 'TIPO_IMPUTACION'
      Size = 3
    end
    object xTipoImputacionDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object xTipoImputacionHORAS: TIntegerField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
  end
  object DSxTipoImputacion: TDataSource
    DataSet = xTipoImputacion
    Left = 200
    Top = 88
  end
end
