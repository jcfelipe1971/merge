object ZDMRUnidadesPendientes: TZDMRUnidadesPendientes
  OldCreateOrder = False
  OnCreate = DMRDepositosActivosCreate
  OnDestroy = DMRInventario_StocksDestroy
  Left = 352
  Top = 293
  Height = 520
  Width = 648
  object frUnidadesPendientes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Unidades Pendientes'
    RebuildPrinter = False
    OnGetValue = frUnidadesPendientesGetValue
    OnBeforePrint = frUnidadesPendientesEnterRect
    OnEnterRect = frUnidadesPendientesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 304
    Top = 8
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 56
    Top = 8
  end
  object xArt_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ARTICULO,TITULO FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo'
      '')
    UniDirectional = False
    Left = 56
    Top = 200
    object xArt_DesdeARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArt_DesdeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xArt_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ARTICULO,TITULO FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo'
      '')
    UniDirectional = False
    Left = 56
    Top = 248
    object xArt_HastaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArt_HastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 176
    Top = 200
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 176
    Top = 248
  end
  object xUnidadesPendientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM z_lst_unidades_pendientes(?empresa, ?ejercicio, '
      
        '?cli_ini,?cli_fin,?articulo_ini,?articulo_fin,?almacen_ini,?alma' +
        'cen_fin,'
      
        '?familia_ini,?familia_fin,?fecha_ini,?fecha_fin,?serie_ini,?seri' +
        'e_fin,?canal_ini,'
      '?canal_fin)')
    UniDirectional = False
    Left = 56
    Top = 56
  end
  object DSxUnidadesPendientes: TDataSource
    DataSet = xUnidadesPendientes
    Left = 176
    Top = 56
  end
  object frDBxUnidadesPendientes: TfrDBDataSet
    DataSource = DSxUnidadesPendientes
    Left = 304
    Top = 56
  end
  object xAlm_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ALMACEN,TITULO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA AND ALMACEN=?ALMACEN')
    UniDirectional = False
    Left = 56
    Top = 296
    object xAlm_DesdeALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlm_DesdeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAlm_Desde: TDataSource
    DataSet = xAlm_Desde
    Left = 176
    Top = 296
  end
  object xAlm_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ALMACEN,TITULO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA AND ALMACEN=?ALMACEN'
      '')
    UniDirectional = False
    Left = 56
    Top = 344
    object xAlm_HastaALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlm_HastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAlm_Hasta: TDataSource
    DataSet = xAlm_Hasta
    Left = 176
    Top = 344
  end
  object xClienteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CLIENTE,NOMBRE_COMERCIAL FROM VER_CLIENTES'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 56
    Top = 104
    object xClienteDCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xClienteDNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
  object DSxClienteD: TDataSource
    DataSet = xClienteD
    Left = 176
    Top = 104
  end
  object xClienteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CLIENTE,NOMBRE_COMERCIAL FROM VER_CLIENTES'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 56
    Top = 152
    object xClienteHCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xClienteHNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
  object DSxClienteH: TDataSource
    DataSet = xClienteH
    Left = 176
    Top = 152
  end
  object xSerie_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SERIE,TITULO FROM VER_SERIES'
      
        'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL' +
        ' AND '
      '               SERIE=?SERIE')
    UniDirectional = False
    Left = 424
    Top = 56
    object xSerie_HastaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xSerie_HastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxSerie_Hasta: TDataSource
    DataSet = xSerie_Hasta
    Left = 544
    Top = 56
  end
  object xSerie_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SERIE,TITULO FROM VER_SERIES'
      
        'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL' +
        ' AND '
      '               SERIE=?SERIE')
    UniDirectional = False
    Left = 56
    Top = 392
    object xSerie_DesdeSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xSerie_DesdeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxSerie_Desde: TDataSource
    DataSet = xSerie_Desde
    Left = 176
    Top = 392
  end
  object xFamiliaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT FAMILIA,TITULO TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 424
    Top = 152
    object xFamiliaHFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliaHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxFamiliaH: TDataSource
    DataSet = xFamiliaH
    Left = 544
    Top = 152
  end
  object DSxFamiliaD: TDataSource
    DataSet = xFamiliaD
    Left = 544
    Top = 104
  end
  object xFamiliaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT FAMILIA,TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 424
    Top = 104
    object xFamiliaDFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliaDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
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
    Left = 424
    Top = 200
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
    Left = 544
    Top = 200
  end
  object DSxCanalHasta: TDataSource
    DataSet = xCanalHasta
    Left = 544
    Top = 248
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
    Left = 424
    Top = 248
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
end
