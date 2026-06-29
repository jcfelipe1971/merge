object ZDMLstFechaPrevProv: TZDMLstFechaPrevProv
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 645
  Top = 300
  Height = 182
  Width = 382
  object QMListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT V_RIGPEP, V_NOMBREPROVEEDOR, V_CODPROVEEDOR, V_FECHAPREVI' +
        'STA, V_FECHA_PEDIDO, V_SERIE, V_ARTICULO,'
      
        '       V_DESCRIPCION_ART, V_UD_PED, V_UD_POR_SERVIR, V_SU_REFERE' +
        'NCIA'
      
        'FROM Z_LST_PED_P_FECHA_PREV_RESUMIDO(:EMPRESA, :CANAL, :SERIE, :' +
        'FECHAD, :FECHAH, :FECHAPREVD, :FECHAPREVH, :PROVEEDORD, :PROVEED' +
        'ORH, :ENTRADA)'
      'ORDER BY V_CODPROVEEDOR')
    UniDirectional = False
    Left = 40
    Top = 64
    object QMListadoV_RIGPEP: TIntegerField
      DisplayLabel = 'Nro. Ped.'
      FieldName = 'V_RIGPEP'
    end
    object QMListadoV_NOMBREPROVEEDOR: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'V_NOMBREPROVEEDOR'
      Size = 60
    end
    object QMListadoV_CODPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'V_CODPROVEEDOR'
    end
    object QMListadoV_FECHAPREVISTA: TDateTimeField
      DisplayLabel = 'Fec. Prevista'
      FieldName = 'V_FECHAPREVISTA'
    end
    object QMListadoV_FECHA_PEDIDO: TDateTimeField
      DisplayLabel = 'Fec. Pedido'
      FieldName = 'V_FECHA_PEDIDO'
    end
    object QMListadoV_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'V_SERIE'
      Size = 10
    end
    object QMListadoV_ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'V_ARTICULO'
      Size = 15
    end
    object QMListadoV_DESCRIPCION_ART: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'V_DESCRIPCION_ART'
      Size = 60
    end
    object QMListadoV_UD_PED: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'V_UD_PED'
    end
    object QMListadoV_UD_POR_SERVIR: TFloatField
      DisplayLabel = 'Uds. Por Servir'
      FieldName = 'V_UD_POR_SERVIR'
    end
    object QMListadoV_SU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su. Referencia'
      FieldName = 'V_SU_REFERENCIA'
      Size = 40
    end
  end
  object frPedEntregaProv: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frPedEntregaProvGetValue
    OnBeforePrint = frPedEntregaProvBeforePrint
    OnEnterRect = frPedEntregaProvBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 240
    Top = 16
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 16
  end
  object DSListado: TDataSource
    DataSet = QMListado
    Left = 136
    Top = 64
  end
  object FrDBPedEntregaProv: TfrDBDataSet
    DataSource = DSListado
    Left = 240
    Top = 64
  end
end
