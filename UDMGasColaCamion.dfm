object DMGasColaCamion: TDMGasColaCamion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 430
  Top = 248
  Height = 309
  Width = 436
  object QMGasColaCamion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_GAS_COLA_CAMION'
      'WHERE'
      '  COD_CAMION=?old_COD_CAMION ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_GAS_COLA_CAMION'
      '  (COD_CAMION,TITULO,ESTADO,CAPACIDAD,NOTAS)'
      'VALUES'
      '  (?COD_CAMION,?TITULO,?ESTADO,?CAPACIDAD,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_GAS_COLA_CAMION'
      'WHERE'
      '  COD_CAMION=?COD_CAMION ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_GAS_COLA_CAMION'
      ' ORDER BY COD_CAMION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_GAS_COLA_CAMION'
      'SET'
      '  TITULO=?TITULO '
      '  ,ESTADO=?ESTADO '
      '  ,CAPACIDAD=?CAPACIDAD '
      '  ,NOTAS=?NOTAS '
      'WHERE'
      '  COD_CAMION=?COD_CAMION ')
    AfterDelete = Graba
    AfterPost = QMGasColaCamionAfterPost
    ClavesPrimarias.Strings = (
      'COD_CAMION ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_GAS_COLA_CAMION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 16
    object QMGasColaCamionCOD_CAMION: TIntegerField
      DisplayLabel = 'Cod. Camion'
      FieldName = 'COD_CAMION'
    end
    object QMGasColaCamionTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMGasColaCamionESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMGasColaCamionCAPACIDAD: TFloatField
      DisplayLabel = 'Capacidad'
      FieldName = 'CAPACIDAD'
    end
    object QMGasColaCamionNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSQMGasColaCamion: TDataSource
    DataSet = QMGasColaCamion
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
    Left = 260
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
    Left = 340
    Top = 16
  end
end
