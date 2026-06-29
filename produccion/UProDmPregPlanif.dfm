object ProDMPregPlanif: TProDMPregPlanif
  OldCreateOrder = False
  Left = 620
  Top = 293
  Height = 360
  Width = 352
  object xDArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from art_articulos'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 40
    Top = 64
    object xDArticuloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 112
    Top = 16
  end
  object DSxDArticulo: TDataSource
    DataSet = xDArticulo
    Left = 104
    Top = 64
  end
  object xHArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from art_articulos'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 40
    Top = 112
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxHArticulo: TDataSource
    DataSet = xHArticulo
    Left = 104
    Top = 112
  end
  object xDCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_clientes'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and cliente=?cliente')
    UniDirectional = False
    Left = 40
    Top = 160
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxDCliente: TDataSource
    DataSet = xDCliente
    Left = 104
    Top = 160
  end
  object xHCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_clientes'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and cliente=?cliente')
    UniDirectional = False
    Left = 176
    Top = 80
    object FIBStringField3: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxHCliente: TDataSource
    DataSet = xHCliente
    Left = 256
    Top = 80
  end
  object QMinArt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ARTICULO) AS MINIMO FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 24
    Top = 215
  end
  object QMaxArt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ARTICULO) AS MAXIMO FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 88
    Top = 215
  end
  object QMaxOrd: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(RIG_OF) AS MAXIMO FROM PRO_ORD'
      'WHERE EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIES=?SERIE')
    Transaction = TLocal
    AutoTrans = True
    Left = 160
    Top = 207
  end
  object QMinOrd: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(RIG_OF) AS MINIMO FROM PRO_ORD'
      'WHERE EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIES=?SERIE')
    Transaction = TLocal
    AutoTrans = True
    Left = 224
    Top = 207
  end
  object QMinCliente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(CLIENTE) AS MINIMO FROM EMP_CLIENTES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 248
    Top = 151
  end
  object QMaxCliente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(cliente) AS MAXIMO FROM EMP_CLIENTES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 184
    Top = 151
  end
  object SP_Pro_Planifica: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure pro_planifica(?EMPRESA,?CALENDARIO,?PLANIFICAC' +
        'ION,'
      '    ?ORIGEN,'
      '    ?DORDEN,'
      '    ?HORDEN,'
      '    ?DARTICULO,'
      '    ?HARTICULO,'
      '    ?DCLIENTE,'
      '    ?HCLIENTE,'
      '    ?DFECHA,'
      '    ?HFECHA'
      ')')
    Transaction = TLocal
    AutoTrans = True
    Left = 208
    Top = 15
  end
  object xCalendario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from ope_calendario_c'
      'where empresa=?empresa and calendario=?calendario')
    UniDirectional = False
    Left = 112
    Top = 272
    object xCalendarioDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object DSxCalendario: TDataSource
    DataSet = xCalendario
    Left = 176
    Top = 272
  end
end
