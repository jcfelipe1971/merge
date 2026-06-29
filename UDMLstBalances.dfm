object DMLstBalances: TDMLstBalances
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 412
  Top = 216
  Height = 347
  Width = 388
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 96
    Top = 28
  end
  object xCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from sys_balances'
      'where pais=?pais and balance=?balance')
    UniDirectional = False
    Left = 104
    Top = 92
    object xCabeceraPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xCabeceraBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xCabeceraTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xCabeceraGENERICO: TIntegerField
      DisplayLabel = 'Generico'
      FieldName = 'GENERICO'
    end
    object xCabeceraTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xCabeceraORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from sys_balances_definicion'
      'where pais=?pais and balance=?balance'
      'order by orden')
    UniDirectional = False
    AfterOpen = xDetalleAfterOpen
    Left = 104
    Top = 166
    object xDetallePAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xDetalleBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xDetalleCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 15
    end
    object xDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object xDetalleGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 1
    end
    object xDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xDetalleSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xDetalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 100
    end
  end
  object xSubDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from sys_balances_definicion_detalle'
      
        'where pais=?pais and balance=?balance and clave=?clave and tipo=' +
        #39'L'#39)
    UniDirectional = False
    DataSource = DSxDetalle
    Left = 98
    Top = 224
    object xSubDetallePAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xSubDetalleBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xSubDetalleCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 15
    end
    object xSubDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object xSubDetalleACUMULA: TFIBStringField
      DisplayLabel = 'Acumula'
      FieldName = 'ACUMULA'
      Size = 15
    end
    object xSubDetalleSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
  end
  object frDBxCabecera: TfrDBDataSet
    DataSource = DSxCabecera
    Left = 256
    Top = 92
  end
  object frDBxDetalle: TfrDBDataSet
    DataSource = DSxDetalle
    Left = 256
    Top = 164
  end
  object frDBSubDetalle: TfrDBDataSet
    DataSource = DSxSubDetalle
    Left = 256
    Top = 228
  end
  object DSxCabecera: TDataSource
    DataSet = xCabecera
    Left = 168
    Top = 92
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 176
    Top = 164
  end
  object DSxSubDetalle: TDataSource
    DataSet = xSubDetalle
    Left = 168
    Top = 228
  end
  object frBalances: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Definici'#243'n de Balances'
    RebuildPrinter = False
    OnGetValue = frBalancesGetValue
    OnBeforePrint = frBalancesEnterRect
    OnEnterRect = frBalancesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 28
    ReportForm = {19000000}
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 168
    Top = 28
  end
end
