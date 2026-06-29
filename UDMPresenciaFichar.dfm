object DMPresenciaFichar: TDMPresenciaFichar
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 330
  Top = 218
  Height = 219
  Width = 332
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 248
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 245
    Top = 16
  end
  object DSxPresencia: TDataSource
    DataSet = xPresencia
    Left = 136
    Top = 16
  end
  object DSxMarcaje: TDataSource
    DataSet = xMarcaje
    Left = 136
    Top = 64
  end
  object xPresencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT C.FECHA, D.HORA_ENTRADA, D.HORA_SALIDA, D.TIEMPO, I.DESCR' +
        'IPCION'
      'FROM PRO_CAB_PRESENCIA C'
      
        'JOIN PRO_DET_PRESENCIA D ON C.ID_CAB_PRESENCIA = D.ID_CAB_PRESEN' +
        'CIA'
      
        'JOIN PRO_SYS_TIPO_INCIDENCIA I ON D.ID_INCIDENCIA = I.ID_INCIDEN' +
        'CIA'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = '#39'A'#39' AND'
      'C.TIPO = '#39'PRE'#39' AND'
      'C.OPERARIO = :EMPLEADO'
      
        '-- Los registros con HORA_SALIDA nulos salen antes que los que e' +
        'stan rellenados'
      
        'ORDER BY C.FECHA DESC, D.HORA_ENTRADA DESC, COALESCE(D.HORA_SALI' +
        'DA, '#39'3000.01.01'#39') DESC, D.ID_DET_PRESENCIA')
    UniDirectional = False
    Left = 32
    Top = 16
    object xPresenciaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xPresenciaHORA_ENTRADA: TDateTimeField
      DisplayLabel = 'Entrada'
      FieldName = 'HORA_ENTRADA'
    end
    object xPresenciaHORA_SALIDA: TDateTimeField
      DisplayLabel = 'Salida'
      FieldName = 'HORA_SALIDA'
    end
    object xPresenciaTIEMPO: TDateTimeField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object xPresenciaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Incidencia'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object xMarcaje: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT M.FECHA_MARCAJE, M.TIPO_MARCAJE, I.DESCRIPCION'
      'FROM OPE_PRESENCIA_MARCAJE M'
      
        'JOIN PRO_SYS_TIPO_INCIDENCIA I ON M.ID_INCIDENCIA = I.ID_INCIDEN' +
        'CIA'
      'WHERE'
      'M.ID_EMPLEADO = :ID_EMPLEADO'
      'ORDER BY M.FECHA_MARCAJE DESC')
    UniDirectional = False
    Left = 32
    Top = 64
    object xMarcajeFECHA_MARCAJE: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_MARCAJE'
    end
    object xMarcajeTIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_MARCAJE'
      Size = 3
    end
    object xMarcajeDESCRIPCION: TFIBStringField
      DisplayLabel = 'Incidencia'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
end
