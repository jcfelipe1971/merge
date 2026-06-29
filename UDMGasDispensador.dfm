object DMGasDispensador: TDMGasDispensador
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 465
  Top = 208
  Height = 309
  Width = 436
  object QMGasDispensador: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_GAS_DISPENSADOR'
      'WHERE'
      '  COD_DISPENSADOR=?old_COD_DISPENSADOR ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_GAS_DISPENSADOR'
      '  (COD_DISPENSADOR,TITULO,ESTADO,NOTAS,SERIE,LECTURA_FINAL)'
      'VALUES'
      
        '  (?COD_DISPENSADOR,?TITULO,?ESTADO,?NOTAS,?DISTRIBUCION,?LECTUR' +
        'A_FINAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_GAS_DISPENSADOR'
      'WHERE'
      '  COD_DISPENSADOR=?COD_DISPENSADOR ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_GAS_DISPENSADOR'
      ' ORDER BY COD_DISPENSADOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_GAS_DISPENSADOR'
      'SET'
      '  TITULO=?TITULO '
      '  ,ESTADO=?ESTADO '
      '  ,NOTAS=?NOTAS'
      '  ,SERIE=?SERIE'
      '  ,DISTRIBUCION=?DISTRIBUCION '
      '  ,LECTURA_FINAL=?LECTURA_FINAL'
      'WHERE'
      '  COD_DISPENSADOR=?COD_DISPENSADOR ')
    AfterDelete = Graba
    AfterPost = QMGasDispensadorAfterPost
    ClavesPrimarias.Strings = (
      'COD_DISPENSADOR ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_GAS_DISPENSADOR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 52
    Top = 16
    object QMGasDispensadorCOD_DISPENSADOR: TIntegerField
      DisplayLabel = 'Cod. Dispensador'
      FieldName = 'COD_DISPENSADOR'
    end
    object QMGasDispensadorTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMGasDispensadorESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMGasDispensadorNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMGasDispensadorSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMGasDispensadorDISTRIBUCION: TIntegerField
      DisplayLabel = 'Distribucion'
      FieldName = 'DISTRIBUCION'
    end
    object QMGasDispensadorLECTURA_FINAL: TFloatField
      DisplayLabel = 'Lectura Real'
      FieldName = 'LECTURA_FINAL'
    end
    object QMGasDispensadorID_VENTA_LECTURA: TIntegerField
      DisplayLabel = 'ID Lectura'
      FieldName = 'ID_VENTA_LECTURA'
    end
  end
  object DSQMGasDispensador: TDataSource
    DataSet = QMGasDispensador
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
    Left = 252
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
