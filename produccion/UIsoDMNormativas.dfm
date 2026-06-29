object IsoDMNormativas: TIsoDMNormativas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 430
  Top = 248
  Height = 309
  Width = 436
  object QMIsoNormativas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_NORMATIVAS'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_NORMATIVAS'
      '  (CODIGO,LEY,FECHA_VIGOR,DESCRIPCION)'
      'VALUES'
      '  (?CODIGO,?LEY,?FECHA_VIGOR,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_NORMATIVAS'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_NORMATIVAS'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_NORMATIVAS'
      'SET'
      '  LEY=?LEY '
      '  ,FECHA_VIGOR=?FECHA_VIGOR '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  CODIGO=?CODIGO ')
    AfterDelete = Graba
    AfterPost = QMIsoNormativasAfterPost
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_NORMATIVAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 16
    object QMIsoNormativasCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMIsoNormativasLEY: TFIBStringField
      DisplayLabel = 'Ley'
      FieldName = 'LEY'
      Size = 60
    end
    object QMIsoNormativasFECHA_VIGOR: TDateTimeField
      DisplayLabel = 'Fecha Vigor'
      FieldName = 'FECHA_VIGOR'
    end
    object QMIsoNormativasDESCRIPCION: TBlobField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 8
    end
  end
  object DSQMIsoNormativas: TDataSource
    DataSet = QMIsoNormativas
    Left = 160
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 228
    Top = 18
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 244
    Top = 96
  end
end
