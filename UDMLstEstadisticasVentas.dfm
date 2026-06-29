object DMLstEstadisticasVentas: TDMLstEstadisticasVentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 428
  Top = 333
  Height = 531
  Width = 583
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 488
    Top = 24
  end
  object QDameFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select duracion,apertura from sys_empresas'
      '  where empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 32
    Top = 224
  end
  object xLstAgentesArt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM LST_VENTAS_AGENTES_ARTICULO(:EMPRESA, :EJERCICIO, :CANAL, :' +
        'SERIE,'
      
        ':ARTICULO_D, :ARTICULO_H, :FAMILIA_D, :FAMILIA_H, :AGENTE_D, :AG' +
        'ENTE_H,'
      ':FECHA_D, :FECHA_H, :ALCANCE, :CANALCAL)')
    UniDirectional = False
    Left = 32
    Top = 72
  end
  object DSxLstAgentesArt: TDataSource
    DataSet = xLstAgentesArt
    Left = 120
    Top = 72
  end
  object frEstadisticasArt: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frEstadisticasArtGetValue
    OnBeforePrint = frEstadisticasArtBeforePrint
    OnEnterRect = frEstadisticasArtBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 16
    ReportForm = {19000000}
  end
  object frDBDSLstAgentesArt: TfrDBDataSet
    DataSource = DSxLstAgentesArt
    Left = 224
    Top = 72
  end
  object xLstClientesArt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM LST_VENTAS_CLIENTES_ARTICULO(:EMPRESA, :EJERCICIO,' +
        ' :CANAL, :SERIE, '
      
        ':ARTICULO_D, :ARTICULO_H,  :FAMILIA_D, :FAMILIA_H, :CLIENTE_D, :' +
        'CLIENTE_H, '
      ':AGENTE_D, :AGENTE_H, :FECHA_D, :FECHA_H, :ALCANCE, :CANALCAL)  ')
    UniDirectional = False
    Left = 32
    Top = 120
  end
  object DSxLstClientesArt: TDataSource
    DataSet = xLstClientesArt
    Left = 120
    Top = 120
  end
  object frDBDSLstClientesArt: TfrDBDataSet
    DataSource = DSxLstClientesArt
    Left = 224
    Top = 120
  end
  object xLstProvArt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM LST_COMPRAS_PROV_ARTICULO(:EMPRESA, :EJERCICIO, :CANAL, :SE' +
        'RIE,'
      
        ':ARTICULO_D, :ARTICULO_H, :FAMILIA_D, :FAMILIA_H, :PROV_D, :PROV' +
        '_H,'
      ':FECHA_D, :FECHA_H, :ALCANCE, :CANALCAL, :PRORRATEAR_PORTES)')
    UniDirectional = False
    Left = 32
    Top = 168
  end
  object DSxLstProvArt: TDataSource
    DataSet = xLstProvArt
    Left = 120
    Top = 168
  end
  object frDBDSLstProvArt: TfrDBDataSet
    DataSource = DSxLstProvArt
    Left = 224
    Top = 168
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 488
    Top = 72
  end
end
