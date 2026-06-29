object ProDMInfoCierresParciales: TProDMInfoCierresParciales
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 322
  Top = 267
  Height = 268
  Width = 316
  object QCierresParciales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CAB.*, '
      'DET.ARTICULO, DET.UNIDADES, LOT.ALM_DEST,'
      'LOT.ID_LOTE, LOT.LOTE, LOT.UNIDADES UDS_CIERRE, LOT.ID_RESERVA'
      'FROM PRO_ORD_CIERRE_PARCIAL CAB'
      'JOIN PRO_ORD_CIERRE_PARCIAL_DET DET'
      'ON CAB.ID = DET.ID_CIERRE'
      'LEFT JOIN PRO_ORD_CIERRE_PARCIAL_DET_LOTE LOT'
      'ON DET.ID = LOT.ID_DET'
      'WHERE'
      'DET.ID_ORDEN = :ID_ORDEN')
    UniDirectional = False
    Left = 40
    Top = 16
    object QCierresParcialesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QCierresParcialesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QCierresParcialesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QCierresParcialesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QCierresParcialesCIERRE: TIntegerField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
    object QCierresParcialesFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREACION'
    end
    object QCierresParcialesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QCierresParcialesCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object QCierresParcialesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QCierresParcialesENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QCierresParcialesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QCierresParcialesALM_DEST: TFIBStringField
      DisplayLabel = 'Alm. Dst.'
      FieldName = 'ALM_DEST'
      Size = 3
    end
    object QCierresParcialesID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QCierresParcialesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QCierresParcialesUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QCierresParcialesUDS_CIERRE: TFloatField
      DisplayLabel = 'Uds. Cerradas'
      FieldName = 'UDS_CIERRE'
    end
    object QCierresParcialesID_RESERVA: TIntegerField
      DisplayLabel = 'Id Reserva'
      FieldName = 'ID_RESERVA'
    end
  end
  object DSQCierresParciales: TDataSource
    DataSet = QCierresParciales
    Left = 144
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 244
    Top = 16
  end
end
