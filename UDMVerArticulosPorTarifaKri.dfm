object DMVerArticulosPorTarifaKri: TDMVerArticulosPorTarifaKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 322
  Top = 141
  Height = 150
  Width = 257
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 64
  end
  object xVerArticulosPorTarifa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select a.empresa, a.ejercicio, a.canal, a.proveedor,'
      
        'a.tarifa, a.titulo as titulo_tarifa, a.fecha_inicio, a.fecha_fin' +
        'al, '
      'b.p_coste, a.descuento1, a.descuento2, a.descuento3, '
      'a.moneda, b.articulo, b.articulo_proveedor '
      'from art_tarifas_proveedor a'
      'join art_tarifas_proveedor_detalle b '
      'on'
      'a.empresa=b.empresa and '
      'a.ejercicio=b.ejercicio and '
      'a.canal=b.canal and'
      'a.proveedor=b.proveedor and '
      'a.tarifa=b.tarifa'
      'where '
      'b.empresa=?empresa and'
      'b.ejercicio=?ejercicio and'
      'b.canal=?canal and '
      'b.articulo=?articulo'
      'order by a.tarifa')
    UniDirectional = False
    Left = 32
    Top = 16
    object xVerArticulosPorTarifaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerArticulosPorTarifaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerArticulosPorTarifaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerArticulosPorTarifaPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xVerArticulosPorTarifaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xVerArticulosPorTarifaTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xVerArticulosPorTarifaTITULO_TARIFA: TFIBStringField
      DisplayLabel = 'Titulo Tarifa'
      FieldName = 'TITULO_TARIFA'
      Size = 40
    end
    object xVerArticulosPorTarifaFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fecha Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object xVerArticulosPorTarifaFECHA_FINAL: TDateTimeField
      DisplayLabel = 'Fecha Fin.'
      FieldName = 'FECHA_FINAL'
    end
    object xVerArticulosPorTarifaDESCUENTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO1'
    end
    object xVerArticulosPorTarifaDESCUENTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO2'
    end
    object xVerArticulosPorTarifaDESCUENTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO3'
    end
    object xVerArticulosPorTarifaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xVerArticulosPorTarifaP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xVerArticulosPorTarifaARTICULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Art. Proveedor'
      FieldName = 'ARTICULO_PROVEEDOR'
      Size = 40
    end
  end
  object DSxVerArticulosPorTarifa: TDataSource
    DataSet = xVerArticulosPorTarifa
    Left = 160
    Top = 16
  end
end
