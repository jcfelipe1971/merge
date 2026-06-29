object ZDMLstPedEntrega: TZDMLstPedEntrega
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 466
  Top = 266
  Height = 499
  Width = 661
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 136
    Top = 16
  end
  object frPedEntrega: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frPedEntregaGetValue
    OnBeforePrint = frPedEntregaBeforePrint
    OnEnterRect = frPedEntregaBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 40
    Top = 16
    ReportForm = {19000000}
  end
  object QMListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_LST_PEDIDOS_PDTE_ENTREGA(:EMPRESA, :EJERCICIO, :' +
        'CANAL, :SERIE,'
      
        ':FECHAD, :FECHAH, :FECHAPREVD, :FECHAPREVH, :CLIENTED, :CLIENTEH' +
        ','
      
        ':TRANSPORTISTAD, :TRANSPORTISTAH, :CANALD, :CANALH, :AGRUPACIOND' +
        ', :AGRUPACIONH)')
    UniDirectional = False
    Left = 40
    Top = 64
    object QMListadoFECHA_CORTE: TDateTimeField
      DisplayLabel = 'Fec. Corte'
      FieldName = 'FECHA_CORTE'
    end
    object QMListadoFECHA_UNION: TDateTimeField
      DisplayLabel = 'Fec. Union'
      FieldName = 'FECHA_UNION'
    end
    object QMListadoFECHA_MACARRON: TDateTimeField
      DisplayLabel = 'Fec. Macarron'
      FieldName = 'FECHA_MACARRON'
    end
    object QMListadoFECHA_MONTAJE: TDateTimeField
      DisplayLabel = 'Fec. Montaje'
      FieldName = 'FECHA_MONTAJE'
    end
    object QMListadoFECHA_TERMINADO: TDateTimeField
      DisplayLabel = 'Fec. Terminado'
      FieldName = 'FECHA_TERMINADO'
    end
    object QMListadoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMListadoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMListadoNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMListadoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMListadoZ_COD_BARRAS_PED: TIntegerField
      DisplayLabel = 'Cod Barras'
      FieldName = 'Z_COD_BARRAS_PED'
    end
    object QMListadoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMListadoFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Ent. Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMListadoFECHA_REC_CAB: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_CAB'
    end
    object QMListadoTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMListadoNOMBRE_TRANSPORTISTA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_TRANSPORTISTA'
      Size = 60
    end
    object QMListadoSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMListadoLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMListadoDIAS_ENTREGA: TIntegerField
      DisplayLabel = 'Dias Entrega'
      FieldName = 'DIAS_ENTREGA'
    end
    object QMListadoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMListadoDESC_ARTICULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_ARTICULO'
      Size = 60
    end
  end
  object DSListado: TDataSource
    DataSet = QMListado
    Left = 136
    Top = 64
  end
  object FrDBPedEntrega: TfrDBDataSet
    DataSource = DSListado
    Left = 232
    Top = 64
  end
  object xClienteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TER.NOMBRE_R_SOCIAL as TITULO, TER.NOMBRE_COMERCIAL '
      
        'FROM EMP_CLIENTES CLI LEFT JOIN SYS_TERCEROS TER ON (CLI.TERCERO' +
        '=TER.TERCERO)'
      'WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 312
    Top = 16
    object xClienteDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xClienteDNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
  object xClienteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TER.NOMBRE_R_SOCIAL as TITULO, TER.NOMBRE_COMERCIAL'
      
        'FROM EMP_CLIENTES CLI LEFT JOIN SYS_TERCEROS TER ON (CLI.TERCERO' +
        '=TER.TERCERO)'
      'WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 312
    Top = 64
    object xClienteHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xClienteHNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
  object DSclienteH: TDataSource
    DataSet = xClienteH
    Left = 400
    Top = 64
  end
  object DSClienteD: TDataSource
    DataSet = xClienteD
    Left = 400
    Top = 16
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 504
    Top = 64
  end
  object xTransportistaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select ST.NOMBRE_R_SOCIAL as TITULO'
      'from EMP_ACREEDORES EA JOIN SYS_TERCEROS ST '
      'ON (EA.TERCERO=ST.TERCERO)'
      'where EA.EMPRESA=?EMPRESA and EA.ACREEDOR=?TRANSPORTISTA'
      '           and EA.TIPO = 7')
    UniDirectional = False
    Left = 312
    Top = 112
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xTransportistaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select ST.NOMBRE_R_SOCIAL as TITULO'
      'from EMP_ACREEDORES EA JOIN SYS_TERCEROS ST '
      'ON (EA.TERCERO=ST.TERCERO)'
      'where EA.EMPRESA=?EMPRESA and EA.ACREEDOR=?TRANSPORTISTA'
      '           and EA.TIPO = 7'
      '')
    UniDirectional = False
    Left = 312
    Top = 160
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSTransportistaH: TDataSource
    DataSet = xTransportistaH
    Left = 400
    Top = 160
  end
  object DSTransportistaD: TDataSource
    DataSet = xTransportistaD
    Left = 400
    Top = 112
  end
  object xCanalDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT canal, titulo FROM gen_canales'
      'where empresa=?empresa and canal=?canal')
    UniDirectional = False
    Left = 312
    Top = 208
    object xCanalDesdeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xCanalDesdeCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
  end
  object DSxCanalDesde: TDataSource
    DataSet = xCanalDesde
    Left = 400
    Top = 208
  end
  object DSxCanalHasta: TDataSource
    DataSet = xCanalHasta
    Left = 400
    Top = 256
  end
  object xCanalHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT canal,titulo FROM gen_canales'
      'where empresa=?empresa and canal=?canal')
    UniDirectional = False
    Left = 312
    Top = 256
    object xCanalHastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xCanalHastaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
  end
  object SPCanal: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 504
    Top = 16
  end
  object xAgrupacionD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_agrupaciones'
      'where agrupacion=?agrupacion')
    UniDirectional = False
    Left = 312
    Top = 304
    object xAgrupacionDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xAgrupacionH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_agrupaciones'
      'where agrupacion=?agrupacion')
    UniDirectional = False
    Left = 312
    Top = 352
    object xAgrupacionHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSAgrupacionD: TDataSource
    DataSet = xAgrupacionD
    Left = 400
    Top = 304
  end
  object DSAgrupacionH: TDataSource
    DataSet = xAgrupacionH
    Left = 400
    Top = 352
  end
end
