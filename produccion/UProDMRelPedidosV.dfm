object ProDMRelPedidosV: TProDMRelPedidosV
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 397
  Top = 299
  Height = 299
  Width = 608
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,COMPUESTO FROM VER_PRO_ESCANDALLO_EF'
      'WHERE EMPRESA=?EMPRESA AND ESCANDALLO=?ESCANDALLO'
      'AND TIPO=?TIPO')
    UniDirectional = False
    Left = 28
    Top = 64
    object xEscandalloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xEscandalloCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
  end
  object DSEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 32
    Top = 120
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 24
    Top = 8
  end
  object xInsertarPedido: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'insert into pro_escandallo(empresa,tipo,compuesto,unidades,unida' +
        'd,cliente)'
      'values(:empresa,:tipo_esc,:compuesto,:unidades,:unidad,:cliente)')
    Transaction = TLocal
    AutoTrans = True
    Left = 136
    Top = 72
  end
  object xDuplicarPedido: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure pro_duplicar_escandallo '
      '(?empresa, ?tipo_ori,?escandallo_ori,'
      ' ?tipo_dest, ?compuesto_dest,  ?id_detalles_ofertas_v, '
      '?id_detalles_pedidos_v, ?entrada)')
    Transaction = TLocal
    AutoTrans = True
    Left = 136
    Top = 128
  end
  object xBuscarUltimEscandall: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(id_esc) from pro_escandallo'
      'where empresa=?empresa and tipo=?tipo')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 28
  end
  object xAsignarEscPedido: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update ges_detalles_s_ped'
      ' set id_esc=:valor_escandallo'
      'where id_detalles_s=:id_detalles_s '
      '     ')
    Transaction = TLocal
    AutoTrans = True
    Left = 132
    Top = 20
  end
  object xIDEscandallo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select id_esc from pro_escandallo'
      'where empresa=?empresa and tipo=?tipo and escandallo=?escandallo')
    Transaction = TLocal
    AutoTrans = True
    Left = 284
    Top = 80
  end
  object xBuscaEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select escandallo,tipo from pro_escandallo'
      'where id_esc=?id_esc')
    UniDirectional = False
    Left = 279
    Top = 130
    object xBuscaEscandalloESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object xBuscaEscandalloTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
  end
  object DSxBuscaEscandallo: TDataSource
    DataSet = xBuscaEscandallo
    Left = 386
    Top = 129
  end
end
