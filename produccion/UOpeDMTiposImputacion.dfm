object OpeDMTiposImputacion: TOpeDMTiposImputacion
  OldCreateOrder = False
  OnCreate = OpeDMTiposImputacionCreate
  Left = 490
  Top = 226
  Height = 150
  Width = 314
  object QMTipoImputa: TFIBTableSet
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
      'ORDER BY TIPO_IMPUTACION')
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
    AfterDelete = Graba
    AfterPost = QMTipoImputaAfterPost
    BeforePost = QMTipoImputaBeforePost
    ClavesPrimarias.Strings = (
      'TIPO_IMPUTACION ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_SYS_TIPOS_IMPUTACION'
    UpdateTransaction = TLocal
    Left = 32
    Top = 24
    object QMTipoImputaTIPO_IMPUTACION: TFIBStringField
      DisplayLabel = 'Tipo Imputacion'
      FieldName = 'TIPO_IMPUTACION'
      OnChange = Duplicados
      Size = 3
    end
    object QMTipoImputaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMTipoImputaHORAS: TIntegerField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
  end
  object DSQMTipoImputa: TDataSource
    DataSet = QMTipoImputa
    Left = 112
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 181
    Top = 24
  end
end
