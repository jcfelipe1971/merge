object DMPrecioReposicion: TDMPrecioReposicion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 304
  Top = 204
  Height = 237
  Width = 501
  object xPrecioReposicion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 256
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRECIO_REPOSICION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRECIO_REPOSICION'
      
        '  (EMPRESA,'#13#10'ARTICULO,TITULO_ARTICULO,FAMILIA,TITULO_FAMILIA,ID_' +
        'A,PRECIO_BASE_REPOSICION,PRECIO_REPOSICION,GAMA,TITULO_GAMA,DESC' +
        'UENTO,'#13#10'INCREMENTO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?ARTICULO,?TITULO_ARTICULO,?FAMILIA,?TITULO_FAMILI' +
        'A,?ID_A,?PRECIO_BASE_REPOSICION,?PRECIO_REPOSICION,?GAMA,?TITULO' +
        '_GAMA,?DESCUENTO,'#13#10'?INCREMENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRECIO_REPOSICION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRECIO_REPOSICION'
      'WHERE'
      '  EMPRESA=?EMPRESA '
      '  AND FAMILIA <> :FAMILIA_SYS'
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRECIO_REPOSICION'
      'SET'
      '  TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,FAMILIA=?FAMILIA '
      '  ,TITULO_FAMILIA=?TITULO_FAMILIA '
      '  ,ID_A=?ID_A '
      '  ,PRECIO_BASE_REPOSICION=?PRECIO_BASE_REPOSICION '
      '  ,PRECIO_REPOSICION=?PRECIO_REPOSICION '
      '  ,GAMA=?GAMA '
      '  ,TITULO_GAMA=?TITULO_GAMA '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,INCREMENTO=?INCREMENTO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PRECIO_REPOSICION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object xPrecioReposicionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ReadOnly = True
    end
    object xPrecioReposicionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      ReadOnly = True
      Size = 15
    end
    object xPrecioReposicionTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo Art.'
      FieldName = 'TITULO_ARTICULO'
      ReadOnly = True
      Size = 256
    end
    object xPrecioReposicionFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      ReadOnly = True
      Size = 5
    end
    object xPrecioReposicionTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Titulo Fam.'
      FieldName = 'TITULO_FAMILIA'
      ReadOnly = True
      Size = 40
    end
    object xPrecioReposicionID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
      ReadOnly = True
    end
    object xPrecioReposicionPRECIO_BASE_REPOSICION: TFloatField
      DisplayLabel = 'Precio Base'
      FieldName = 'PRECIO_BASE_REPOSICION'
    end
    object xPrecioReposicionPRECIO_REPOSICION: TFloatField
      DisplayLabel = 'Precio Reposicion'
      FieldName = 'PRECIO_REPOSICION'
      ReadOnly = True
    end
    object xPrecioReposicionGAMA: TFIBStringField
      DisplayLabel = 'Gama'
      FieldName = 'GAMA'
      Size = 5
    end
    object xPrecioReposicionTITULO_GAMA: TFIBStringField
      DisplayLabel = 'Titulo Gama'
      FieldName = 'TITULO_GAMA'
      ReadOnly = True
      Size = 40
    end
    object xPrecioReposicionDESCUENTO: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'DESCUENTO'
      ReadOnly = True
    end
    object xPrecioReposicionINCREMENTO: TFloatField
      DisplayLabel = 'Incremento'
      FieldName = 'INCREMENTO'
      ReadOnly = True
    end
  end
  object DSxPrecioReposicion: TDataSource
    DataSet = xPrecioReposicion
    Left = 144
    Top = 16
  end
  object TLocal: THYTransaction
    Active = True
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
