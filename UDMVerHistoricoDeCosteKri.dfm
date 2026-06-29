object DMVerHistoricoDeCosteKri: TDMVerHistoricoDeCosteKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 249
  Top = 103
  Height = 150
  Width = 238
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 32
    Top = 64
  end
  object xVerHistoricoCostes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_HISTORICO_DE_COSTES_KRI'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO<=?EJERCICIO AND '
      '  EJERCICIO>=?EJERCICIO -1 AND '
      '  CANAL=?CANAL AND '
      '  COD_ART=?COD_ART '
      'ORDER BY FECHA DESC, PROVEEDOR ASC')
    UniDirectional = False
    Left = 32
    Top = 8
    object xVerHistoricoCostesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerHistoricoCostesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerHistoricoCostesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerHistoricoCostesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVerHistoricoCostesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xVerHistoricoCostesCOD_ART: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'COD_ART'
      Size = 15
    end
    object xVerHistoricoCostesARTICULO: TFIBStringField
      DisplayLabel = 'Titulo Art.'
      FieldName = 'ARTICULO'
      Size = 60
    end
    object xVerHistoricoCostesCOD_PROV: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'COD_PROV'
    end
    object xVerHistoricoCostesPROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo Prov.'
      FieldName = 'PROVEEDOR'
      Size = 60
    end
    object xVerHistoricoCostesCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object xVerHistoricoCostesDESCUENTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO1'
    end
    object xVerHistoricoCostesDESCUENTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO2'
    end
    object xVerHistoricoCostesDESCUENTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO3'
    end
    object xVerHistoricoCostesCON_DESCUENTO: TFloatField
      DisplayLabel = 'Con Desc.'
      FieldName = 'CON_DESCUENTO'
    end
    object xVerHistoricoCostesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xVerHistoricoCostesUSUARIO: TFIBStringField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
      Size = 31
    end
  end
  object DSxVerHistoricoCostes: TDataSource
    DataSet = xVerHistoricoCostes
    Left = 144
    Top = 8
  end
end
