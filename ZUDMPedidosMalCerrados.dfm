object ZDMPedidosMalCerrados: TZDMPedidosMalCerrados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 405
  Top = 204
  Height = 224
  Width = 314
  object QMPedidosMalCerrados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from '
      'Z_DAME_PEDIDOS_MAL_CERRADOS'
      '(?tipo , ?procesa, ?empresa ,?ejercicio ,?canal ,'
      '?serie,?fechal , ?fechar )')
    UniDirectional = False
    Left = 56
    Top = 32
    object QMPedidosMalCerradosZ_COD_BARRAS: TIntegerField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'Z_COD_BARRAS'
    end
    object QMPedidosMalCerradosID_ORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMPedidosMalCerradosTITULO: TFIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPedidosMalCerradosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object DSQMPedidosMalCerrados: TDataSource
    DataSet = QMPedidosMalCerrados
    Left = 58
    Top = 96
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 178
    Top = 32
  end
end
