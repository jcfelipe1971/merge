object DMDatosFactRectificacion: TDMDatosFactRectificacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 458
  Top = 316
  Height = 321
  Width = 274
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 40
    Top = 16
  end
  object xDatosFac: TFIBDataSetRO
    Database = DMMain.DataBase
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM DAME_DATOS_FACTURA(:EMPRESA, :EJERCICIO, :CANAL, :' +
        'SERIE, :TIPO, :RIG)')
    UniDirectional = False
    Left = 40
    Top = 72
    object xDatosFacID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object xDatosFacCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CLI_PRO'
    end
    object xDatosFacNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xDatosFacBASE: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'BASE'
    end
    object xDatosFacIVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'IVA'
    end
    object xDatosFacRECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'RECARGO'
    end
    object xDatosFacLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xDatosFacTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xDatosFacMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xDatosFacTITULO_MONEDA: TFIBStringField
      DisplayLabel = 'Desc. Moneda'
      FieldName = 'TITULO_MONEDA'
      Size = 40
    end
  end
  object DSxDatosFac: TDataSource
    DataSet = xDatosFac
    Left = 120
    Top = 72
  end
end
