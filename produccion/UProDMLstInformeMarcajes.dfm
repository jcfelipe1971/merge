object ProDMLstInformeMarcajes: TProDMLstInformeMarcajes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 553
  Top = 440
  Height = 210
  Width = 495
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 360
    Top = 16
  end
  object frInformeMarcajes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de etiquetas empleados'
    RebuildPrinter = False
    OnGetValue = frInformeMarcajesGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 248
    Top = 16
    ReportForm = {19000000}
  end
  object xLstInforme: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'Select * from pro_lst_inf_marc_esp_tur(?empresa, ?ejercicio, ?ca' +
        'nal, ?serie, '
      '?fechad, ?fechah, ?maquinad, ?maquinah)')
    UniDirectional = False
    Left = 64
    Top = 16
    object xLstInformeID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xLstInformeMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object xLstInformeDESCMAQUINA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCMAQUINA'
      Size = 100
    end
    object xLstInformeHORAS_PRODUCTIVAS: TFloatField
      DisplayLabel = 'Horas Prod.'
      FieldName = 'HORAS_PRODUCTIVAS'
    end
    object xLstInformeHORAS_NO_PRODUCTIVAS: TFloatField
      DisplayLabel = 'Horas no Prod.'
      FieldName = 'HORAS_NO_PRODUCTIVAS'
    end
    object xLstInformeUNIDADES_FABRICADAS: TFloatField
      DisplayLabel = 'Uds. Fabricadas'
      FieldName = 'UNIDADES_FABRICADAS'
    end
    object xLstInformeUNIDADES_DEFECTUOSAS: TFloatField
      DisplayLabel = 'Uds. Defectuosas'
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
    object xLstInformeHORAS_TRABAJADAS: TFloatField
      DisplayLabel = 'Horas Trab.'
      FieldName = 'HORAS_TRABAJADAS'
    end
  end
  object DSxLstInforme: TDataSource
    DataSet = xLstInforme
    Left = 152
    Top = 16
  end
  object frDBLstInforme: TfrDBDataSet
    DataSource = DSxLstInforme
    Left = 248
    Top = 64
  end
  object xLstEficiencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from pro_lst_marcajes_esp_tur (?empresa, ?ejercicio, ?c' +
        'anal, ?serie, '
      '?fechad, ?fechah, ?maquinad, ?maquinah)')
    UniDirectional = False
    Left = 64
    Top = 64
    object xLstEficienciaFECHA_DET: TDateTimeField
      DisplayLabel = 'Fec. Det.'
      FieldName = 'FECHA_DET'
    end
    object xLstEficienciaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xLstEficienciaMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object xLstEficienciaDESCMAQUINA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCMAQUINA'
      Size = 100
    end
    object xLstEficienciaTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object xLstEficienciaTIEMPO_DEC: TFloatField
      DisplayLabel = 'Tiempo Dec.'
      FieldName = 'TIEMPO_DEC'
    end
    object xLstEficienciaHORAS_NO_PRODUCTIVAS: TFloatField
      DisplayLabel = 'Horas no Prod.'
      FieldName = 'HORAS_NO_PRODUCTIVAS'
    end
    object xLstEficienciaUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uds. Fab.'
      FieldName = 'UNIDADES_FAB'
    end
    object xLstEficienciaNO_PRODUCTIVA: TIntegerField
      DisplayLabel = 'No Productiva'
      FieldName = 'NO_PRODUCTIVA'
    end
    object xLstEficienciaUNIDADES_DEFECTUOSAS: TFloatField
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
  end
  object DSxLstEficiencia: TDataSource
    DataSet = xLstEficiencia
    Left = 152
    Top = 64
  end
  object frDBLstEficiencia: TfrDBDataSet
    DataSource = DSxLstEficiencia
    Left = 360
    Top = 64
  end
end
