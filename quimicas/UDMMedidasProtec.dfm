object DMMedidasProtec: TDMMedidasProtec
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 631
  Top = 218
  Height = 150
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 146
    Top = 18
  end
  object DSQMMedidasProtec: TDataSource
    DataSet = QMMedidasProtec
    Left = 49
    Top = 69
  end
  object QMMedidasProtec: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_QUI_MEDIDAS_PROTECCION'
      'WHERE'
      '  COD_MEDIDAS_PROTECCION=?old_COD_MEDIDAS_PROTECCION ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_QUI_MEDIDAS_PROTECCION'
      '  (COD_MEDIDAS_PROTECCION,DESCRIPCION_CORTA,TEXTO)'
      'VALUES'
      '  (?COD_MEDIDAS_PROTECCION,?DESCRIPCION_CORTA,?TEXTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_QUI_MEDIDAS_PROTECCION'
      'WHERE'
      '  COD_MEDIDAS_PROTECCION=?COD_MEDIDAS_PROTECCION ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_QUI_MEDIDAS_PROTECCION'
      'order by cod_medidas_proteccion')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_QUI_MEDIDAS_PROTECCION'
      'SET'
      '  DESCRIPCION_CORTA=?DESCRIPCION_CORTA,'
      '  TEXTO=?TEXTO '
      'WHERE'
      '  COD_MEDIDAS_PROTECCION=?COD_MEDIDAS_PROTECCION ')
    BeforePost = QMMedidasProtecBeforePost
    ClavesPrimarias.Strings = (
      'COD_MEDIDAS_PROTECCION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_QUI_MEDIDAS_PROTECCION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 50
    Top = 16
    object QMMedidasProtecCOD_MEDIDAS_PROTECCION: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_MEDIDAS_PROTECCION'
    end
    object QMMedidasProtecDESCRIPCION_CORTA: TFIBStringField
      DisplayLabel = 'Desc. Corta'
      FieldName = 'DESCRIPCION_CORTA'
      Size = 100
    end
    object QMMedidasProtecTEXTO: TBlobField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 8
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
    Left = 148
    Top = 72
  end
end
