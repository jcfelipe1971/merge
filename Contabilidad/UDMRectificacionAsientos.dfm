object DMRectificacionAsientos: TDMRectificacionAsientos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 522
  Top = 313
  Height = 245
  Width = 333
  object DSxRectificacion_Tabla: TDataSource
    DataSet = xRectificacion_Tabla
    Left = 50
    Top = 82
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 166
    Top = 26
  end
  object xRectificacion_Tabla: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM C_RECTIFICA_ASIENTOS_TABLA'
      '(?EMPRESA,?EJERCICIO,?CANAL)')
    UniDirectional = False
    Left = 50
    Top = 28
    object xRectificacion_TablaASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xRectificacion_TablaRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xRectificacion_TablaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      DisplayWidth = 9
      FieldName = 'FECHA'
    end
    object xRectificacion_TablaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 100
    end
    object xRectificacion_TablaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xRectificacion_TablaDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xRectificacion_TablaHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xRectificacion_TablaCANAL_R: TIntegerField
      DisplayLabel = 'Canal R.'
      FieldName = 'CANAL_R'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 238
    Top = 26
  end
end
