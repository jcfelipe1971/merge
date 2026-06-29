object ProDMLstMatEsc: TProDMLstMatEsc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 862
  Top = 265
  Height = 381
  Width = 265
  object QGenerarLst: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from  pro_lst_esc_mat_lanzar(?EMPRESA,?COMPONENTE_DESDE' +
        ',?COMPONENTE_HASTA,?TIPO,?CANAL,?ENTRADA,?COMPUESTO_DESDE,?COMPU' +
        'ESTO_HASTA ,?POR_DEFECTO)')
    UniDirectional = False
    Left = 36
    Top = 76
    object QGenerarLstV_COMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'V_COMPONENTE'
      Size = 15
    end
    object QGenerarLstV_COMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'V_COMPUESTO'
      Size = 15
    end
    object QGenerarLstV_NUM_ESC: TIntegerField
      DisplayLabel = 'Nro. Esc.'
      FieldName = 'V_NUM_ESC'
    end
    object QGenerarLstV_ENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'V_ENTRADA'
    end
    object QGenerarLstV_TITULO_COMPUESTO: TFIBStringField
      DisplayLabel = 'Desc. Compuesto'
      FieldName = 'V_TITULO_COMPUESTO'
      Size = 60
    end
    object QGenerarLstV_TITULO_COMPONENTE: TFIBStringField
      DisplayLabel = 'Desc. Componente'
      FieldName = 'V_TITULO_COMPONENTE'
      Size = 60
    end
    object QGenerarLstV_UNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'V_UNIDAD'
      Size = 2
    end
    object QGenerarLstV_UNDS_NEC: TFloatField
      DisplayLabel = 'Uds. Nec.'
      FieldName = 'V_UNDS_NEC'
    end
    object QGenerarLstV_UNDS_STOCK: TFloatField
      DisplayLabel = 'Uds. Stock'
      FieldName = 'V_UNDS_STOCK'
    end
    object QGenerarLstV_UNDS_FABRICAR: TFloatField
      DisplayLabel = 'Uds. Fabricar'
      FieldName = 'V_UNDS_FABRICAR'
    end
    object QGenerarLstV_ESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'V_ESCANDALLO'
    end
    object QGenerarLstV_STOCK_ESC: TFloatField
      DisplayLabel = 'Stock Esc.'
      FieldName = 'V_STOCK_ESC'
    end
    object QGenerarLstV_UNIDADES_ESC: TFloatField
      DisplayLabel = 'Uds. Esc.'
      FieldName = 'V_UNIDADES_ESC'
    end
    object QGenerarLstV_UNDS_COMPRAR: TFloatField
      DisplayLabel = 'Uds. Comprar'
      FieldName = 'V_UNDS_COMPRAR'
    end
    object QGenerarLstV_LINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'V_LINEA_FASE'
    end
    object QGenerarLstV_TITULO_FASE: TFIBStringField
      DisplayLabel = 'Desc. Fase'
      FieldName = 'V_TITULO_FASE'
      Size = 60
    end
    object QGenerarLstV_LINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'V_LINEA'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 128
    Top = 75
  end
  object frDBlstNecesidades: TfrDBDataSet
    DataSet = QGenerarLst
    Left = 127
    Top = 17
  end
  object frListadoN: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Escandallos por Articulo'
    RebuildPrinter = False
    OnGetValue = frListadoNGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 32
    Top = 16
    ReportForm = {19000000}
  end
  object QTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 38
    Top = 138
  end
end
