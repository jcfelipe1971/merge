object DMLstEstadisticasVentas: TDMLstEstadisticasVentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 388
  Top = 379
  Height = 391
  Width = 514
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 102
    Top = 17
  end
  object QMinArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ARTICULO) AS MINIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 30
    Top = 250
  end
  object QMaxArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ARTICULO) AS MAXIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 98
    Top = 250
  end
  object xArticuloD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 344
    Top = 24
  end
  object DSxArticuloD: TDataSource
    DataSet = xArticuloD
    Left = 344
    Top = 74
  end
  object xArticuloH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 415
    Top = 22
  end
  object DSxArticuloH: TDataSource
    DataSet = xArticuloH
    Left = 416
    Top = 76
  end
  object xCanales: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select canal from emp_canales '
      
        '  where((empresa=?empresa)and(ejercicio=?ejercicio)and(activo=1)' +
        ') '
      '  order by canal')
    Transaction = TLocal
    Left = 36
    Top = 170
  end
  object xSeries: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select serie from emp_series'
      
        '  where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?ca' +
        'nal)and(activo=1)) '
      '  order by serie')
    Transaction = TLocal
    Left = 102
    Top = 170
  end
  object QDameFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select duracion,apertura from sys_empresas'
      '  where empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 220
    Top = 166
  end
  object xLstAgentesArt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from lst_ventas_agentes_articulo'
      '(?empresa, ?ejercicio, ?canal, ?serie, ?articulo_d, ?articulo_h,'
      ' ?agente_d, ?agente_h, ?fecha_d, ?fecha_h, ?alcance, ?canalcal)')
    UniDirectional = False
    Left = 25
    Top = 71
    object xLstAgentesArtAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xLstAgentesArtNOMBRE_AGENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_AGENTE'
      Size = 60
    end
    object xLstAgentesArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLstAgentesArtTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xLstAgentesArtSUMA_UD: TFloatField
      DisplayLabel = 'Suma Uds.'
      FieldName = 'SUMA_UD'
    end
    object xLstAgentesArtSUMA_UE: TFloatField
      DisplayLabel = 'Suma Uds. Ext.'
      FieldName = 'SUMA_UE'
    end
    object xLstAgentesArtCOSTES: TFloatField
      DisplayLabel = 'Costes'
      FieldName = 'COSTES'
    end
    object xLstAgentesArtVENTAS: TFloatField
      DisplayLabel = 'Ventas'
      FieldName = 'VENTAS'
    end
    object xLstAgentesArtMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object xLstAgentesArtPORCENTAJE: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORCENTAJE'
    end
  end
  object DSxLstAgentesArt: TDataSource
    DataSet = xLstAgentesArt
    Left = 107
    Top = 71
  end
  object frAgentesArt: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    OnGetValue = frAgentesArtGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 16
    ReportForm = {18000000}
  end
  object frDBDSLstAgentesArt: TfrDBDataSet
    DataSource = DSxLstAgentesArt
    Left = 208
    Top = 71
  end
  object QMinAgente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(AGENTE) AS MINIMO FROM VER_AGENTES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 30
    Top = 298
  end
  object QMaxAgente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(AGENTE) AS MAXIMO FROM VER_AGENTES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 98
    Top = 298
  end
  object xAgenteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGENTES'
      'WHERE EMPRESA=?EMPRESA AND AGENTE=?AGENTE')
    UniDirectional = False
    Left = 348
    Top = 136
  end
  object DSxAgenteD: TDataSource
    DataSet = xAgenteD
    Left = 348
    Top = 186
  end
  object xAgenteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGENTES'
      'WHERE EMPRESA=?EMPRESA AND AGENTE=?AGENTE')
    UniDirectional = False
    Left = 419
    Top = 134
  end
  object DSxAgenteH: TDataSource
    DataSet = xAgenteH
    Left = 420
    Top = 188
  end
end
