object ZDMLstTiempoMarc: TZDMLstTiempoMarc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 570
  Top = 275
  Height = 321
  Width = 234
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 128
    Top = 88
  end
  object DSQMListado: TDataSource
    DataSet = QMListado
    Left = 128
    Top = 20
  end
  object QMListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from z_lst_tiempo_marc(?empresa,?ejercicio,?serie,?cana' +
        'l,'
      
        '                                ?fecha_desde ,?fecha_hasta ,?cli' +
        'ente_desde,?cliente_hasta,'
      '                                ?transporte )'
      '')
    UniDirectional = False
    Left = 32
    Top = 16
    object QMListadoR_CLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'R_CLIENTE'
    end
    object QMListadoR_DESC_CLIENTE: TFIBStringField
      DisplayLabel = 'Desc.'
      FieldName = 'R_DESC_CLIENTE'
      Size = 60
    end
    object QMListadoR_SU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Ref.Cli.'
      FieldName = 'R_SU_REFERENCIA'
      Size = 40
    end
    object QMListadoR_FECHA_CORTE: TDateTimeField
      DisplayLabel = 'F. Corte'
      FieldName = 'R_FECHA_CORTE'
    end
    object QMListadoR_FECHA_UNION: TDateTimeField
      DisplayLabel = 'F. Uni'#243'n'
      FieldName = 'R_FECHA_UNION'
    end
    object QMListadoR_FECHA_MACARRON: TDateTimeField
      DisplayLabel = 'F. Macarr'#243'n'
      FieldName = 'R_FECHA_MACARRON'
    end
    object QMListadoR_FECHA_MONTAJE: TDateTimeField
      DisplayLabel = 'F. Montaje'
      FieldName = 'R_FECHA_MONTAJE'
    end
    object QMListadoR_FECHA_TERMINADO: TDateTimeField
      DisplayLabel = 'F. Terminado'
      FieldName = 'R_FECHA_TERMINADO'
    end
    object QMListadoR_FECHA_PREPARADO: TDateTimeField
      DisplayLabel = 'F. Preparado'
      FieldName = 'R_FECHA_PREPARADO'
    end
    object QMListadoR_FECHA: TDateTimeField
      DisplayLabel = 'F. Pedido'
      FieldName = 'R_FECHA'
    end
    object QMListadoR_FECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'F. Entrega Prev.'
      FieldName = 'R_FECHA_ENTREGA_PREV'
    end
    object QMListadoR_FECHA_ALBARAN: TDateTimeField
      DisplayLabel = 'F. Albar'#225'n'
      FieldName = 'R_FECHA_ALBARAN'
    end
    object QMListadoZ_COD_BARRAS: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'Z_COD_BARRAS'
    end
    object QMListadoR_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'R_SERIE'
      Size = 10
    end
    object QMListadoR_OPE_CORTE: TIntegerField
      DisplayLabel = 'Corte'
      FieldName = 'R_OPE_CORTE'
    end
    object QMListadoR_OPE_UNION: TIntegerField
      DisplayLabel = 'Union'
      FieldName = 'R_OPE_UNION'
    end
    object QMListadoR_OPE_MACARRON: TIntegerField
      DisplayLabel = 'Macarron'
      FieldName = 'R_OPE_MACARRON'
    end
    object QMListadoR_OPE_MONTAJE: TIntegerField
      DisplayLabel = 'Montaje'
      FieldName = 'R_OPE_MONTAJE'
    end
    object QMListadoR_OPE_TERMINADO: TIntegerField
      DisplayLabel = 'Terminado'
      FieldName = 'R_OPE_TERMINADO'
    end
    object QMListadoR_OPE_PREPARADO: TIntegerField
      DisplayLabel = 'Preparado'
      FieldName = 'R_OPE_PREPARADO'
    end
  end
  object QTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 32
    Top = 84
  end
end
