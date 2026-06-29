object DMGamaPrecioReposicion: TDMGamaPrecioReposicion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 195
  Top = 107
  Height = 150
  Width = 540
  object xGamas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 256
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_GAMAS'
      'WHERE'
      '  GAMA=?old_GAMA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_GAMAS'
      '  (GAMA,'#13#10'TITULO,DESCUENTO,INCREMENTO)'
      'VALUES'
      '  (?GAMA,'#13#10'?TITULO,?DESCUENTO,?INCREMENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_GAMAS'
      'WHERE'
      '  GAMA=?GAMA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_GAMAS'
      'ORDER BY GAMA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_GAMAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,INCREMENTO=?INCREMENTO '
      'WHERE'
      '  GAMA=?GAMA ')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    ClavesPrimarias.Strings = (
      'GAMA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_GAMAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object xGamasGAMA: TFIBStringField
      DisplayLabel = 'Gama'
      FieldName = 'GAMA'
      Size = 5
    end
    object xGamasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object xGamasDESCUENTO: TFloatField
      DisplayLabel = 'Porc. Descuento'
      FieldName = 'DESCUENTO'
    end
    object xGamasINCREMENTO: TFloatField
      DisplayLabel = 'Incremento'
      FieldName = 'INCREMENTO'
    end
  end
  object DSxGamas: TDataSource
    DataSet = xGamas
    Left = 144
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 288
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
    Left = 368
    Top = 16
  end
end
