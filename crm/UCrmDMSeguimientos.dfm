object CRMDMSeguimientos: TCRMDMSeguimientos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 322
  Top = 184
  Height = 169
  Width = 238
  object QMSeguimientos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_SYS_TIPO_SEG'
      'WHERE'
      '  TSEGUIMIENTO=?old_TSEGUIMIENTO ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_SYS_TIPO_SEG'
      '  (DESCRIPCION,TSEGUIMIENTO,ACTUALIZA_FECHA_ULT_VISITA)'
      'VALUES'
      '  (?DESCRIPCION,?TSEGUIMIENTO,?ACTUALIZA_FECHA_ULT_VISITA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_SYS_TIPO_SEG'
      'WHERE'
      '  TSEGUIMIENTO=?TSEGUIMIENTO ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_SYS_TIPO_SEG'
      'ORDER BY TSEGUIMIENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_SYS_TIPO_SEG'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,ACTUALIZA_FECHA_ULT_VISITA=?ACTUALIZA_FECHA_ULT_VISITA '
      'WHERE'
      '  TSEGUIMIENTO=?TSEGUIMIENTO ')
    ClavesPrimarias.Strings = (
      'TSEGUIMIENTO')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_SYS_TIPO_SEG'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMSeguimientosTSEGUIMIENTO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TSEGUIMIENTO'
      Size = 3
    end
    object QMSeguimientosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMSeguimientosACTUALIZA_FECHA_ULT_VISITA: TIntegerField
      DisplayLabel = 'Actualiza Fec. Ult. Visita'
      FieldName = 'ACTUALIZA_FECHA_ULT_VISITA'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 48
    Top = 8
  end
  object DSQMSeguimientos: TDataSource
    DataSet = QMSeguimientos
    Left = 152
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 152
    Top = 8
  end
end
