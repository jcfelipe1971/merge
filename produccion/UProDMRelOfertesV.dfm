object ProDMRelOfertesV: TProDMRelOfertesV
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 591
  Top = 299
  Height = 299
  Width = 414
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,COMPUESTO '
      'FROM VER_PRO_ESCANDALLO_EF'
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
  object xInsertarOferta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'insert into pro_escandallo(empresa,tipo,compuesto,unidades,unida' +
        'd,id_detalles_ofertas_v,id_detalles_pedidos_v,cliente)'
      
        'values(:empresa,:tipo_esc,:compuesto,:unidades,:unidad,:id_detal' +
        'les_ofertas_v,:id_detalles_pedidos_v,:cliente)')
    Transaction = TLocal
    AutoTrans = True
    Left = 136
    Top = 72
  end
  object xDuplicarOferta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure pro_duplicar_escandallo '
      '(?empresa, ?tipo_ori,?escandallo_ori,'
      
        ' ?tipo_dest, ?compuesto_dest,  ?id_detalles_ofertas_v, ?id_detal' +
        'les_pedidos_v,?entrada)')
    Transaction = TLocal
    AutoTrans = True
    Left = 136
    Top = 128
  end
  object xBuscarUltimEscandall: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(escandallo), max(id_esc) from pro_escandallo'
      'where empresa=?empresa and tipo=?tipo')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 72
  end
  object xUpdateOferta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update ges_detalles_s_ofc'
      'set id_esc=?id_esc,'
      '      tipo_id_esc=?tipo_defecto'
      'where id_detalles_s=?id_detalles_s')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 152
  end
end
