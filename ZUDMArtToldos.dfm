object ZDMArtToldos: TZDMArtToldos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 290
  Top = 187
  Height = 311
  Width = 524
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 448
    Top = 16
  end
  object QMToldos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_ART_ARTICULOS_TOLDO_PRECIOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  LONA=?old_LONA AND '
      '  TARIFA=?old_TARIFA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_ART_ARTICULOS_TOLDO_PRECIOS'
      
        '  (ID_A_LONA,ID_A_ARMAZON,ID_A,DEFECTO,EMPRESA,MOTOR,ARMAZON,ART' +
        'ICULO,TARIFA,LONA,INCR_LACADO_PVP,P_INCR_LACADO_PVP)'
      'VALUES'
      
        '  (?ID_A_LONA,?ID_A_ARMAZON,?ID_A,?DEFECTO,?EMPRESA,?MOTOR,?ARMA' +
        'ZON,?ARTICULO,?TARIFA,?LONA,?INCR_LACADO_PVP,?P_INCR_LACADO_PVP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_ART_ARTICULOS_TOLDO_PRECIOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LONA=?LONA AND '
      '  TARIFA=?TARIFA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_ART_ARTICULOS_TOLDO_PRECIOS'
      'where empresa=?empresa and articulo=?articulo'
      'order by defecto desc, tarifa, lona')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_ART_ARTICULOS_TOLDO_PRECIOS'
      'SET'
      '  ID_A_LONA=?ID_A_LONA '
      '  ,ID_A_ARMAZON=?ID_A_ARMAZON '
      '  ,ID_A=?ID_A '
      '  ,DEFECTO=?DEFECTO '
      '  ,MOTOR=?MOTOR '
      '  ,ARMAZON=?ARMAZON '
      '  ,INCR_LACADO_PVP=?INCR_LACADO_PVP '
      '  ,P_INCR_LACADO_PVP=?P_INCR_LACADO_PVP '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LONA=?LONA AND '
      '  TARIFA=?TARIFA ')
    AfterOpen = QMToldosAfterOpen
    BeforeClose = QMToldosBeforeClose
    OnNewRecord = QMToldosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'LONA '
      'TARIFA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_ART_ARTICULOS_TOLDO_PRECIOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMToldosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMToldosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMToldosLONA: TFIBStringField
      DisplayLabel = 'Lona'
      FieldName = 'LONA'
      Size = 15
    end
    object QMToldosTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMToldosID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMToldosID_A_LONA: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_LONA'
    end
    object QMToldosARMAZON: TFIBStringField
      DisplayLabel = 'Armaz'#243'n'
      FieldName = 'ARMAZON'
      Size = 15
    end
    object QMToldosID_A_ARMAZON: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_ARMAZON'
    end
    object QMToldosMOTOR: TIntegerField
      DisplayLabel = 'Motor'
      FieldName = 'MOTOR'
    end
    object QMToldosDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QMToldosPCosteToldo: TFloatField
      DisplayLabel = 'P.Coste Toldo'
      FieldKind = fkCalculated
      FieldName = 'PCosteToldo'
      OnGetText = QMToldosPCosteToldoGetText
      Calculated = True
    end
    object QMToldosPVentaToldo: TFloatField
      DisplayLabel = 'P.Venta Toldo'
      FieldKind = fkCalculated
      FieldName = 'PVentaToldo'
      OnGetText = QMToldosPVentaToldoGetText
      Calculated = True
    end
    object QMToldosMargenToldo: TFloatField
      DisplayLabel = 'Margen Toldo'
      FieldKind = fkCalculated
      FieldName = 'MargenToldo'
      OnGetText = QMToldosMargenToldoGetText
      Calculated = True
    end
    object QMToldosPCosteLona: TFloatField
      DisplayLabel = 'P.Coste Lona'
      FieldKind = fkCalculated
      FieldName = 'PCosteLona'
      OnGetText = QMToldosPCosteLonaGetText
      Calculated = True
    end
    object QMToldosPVentaLona: TFloatField
      DisplayLabel = 'P.Venta Lona'
      FieldKind = fkCalculated
      FieldName = 'PVentaLona'
      OnGetText = QMToldosPVentaLonaGetText
      Calculated = True
    end
    object QMToldosMargenLona: TFloatField
      DisplayLabel = 'Margen Lona'
      FieldKind = fkCalculated
      FieldName = 'MargenLona'
      OnGetText = QMToldosMargenLonaGetText
      Calculated = True
    end
    object QMToldosMultiploLona: TSmallintField
      DisplayLabel = 'M'#250'ltiplo'
      FieldKind = fkCalculated
      FieldName = 'MultiploLona'
      OnGetText = QMToldosMultiploLonaGetText
      Calculated = True
    end
    object QMToldosTotalLinea: TSmallintField
      DisplayLabel = 'L'#237'nea'
      FieldKind = fkCalculated
      FieldName = 'TotalLinea'
      OnGetText = QMToldosTotalLineaGetText
      Calculated = True
    end
    object QMToldosTotalSalida: TSmallintField
      DisplayLabel = 'Salida'
      FieldKind = fkCalculated
      FieldName = 'TotalSalida'
      OnGetText = QMToldosTotalSalidaGetText
      Calculated = True
    end
    object QMToldosM2_Lona: TFloatField
      DisplayLabel = 'M2 Lona'
      FieldKind = fkCalculated
      FieldName = 'M2_Lona'
      OnGetText = QMToldosM2_LonaGetText
      Calculated = True
    end
    object QMToldosINCR_LACADO_PVP: TIntegerField
      DisplayLabel = 'Incr. Lacado PVP'
      FieldName = 'INCR_LACADO_PVP'
    end
    object QMToldosP_INCR_LACADO_PVP: TFloatField
      DisplayLabel = '% Incr.Lacado PVP'
      FieldName = 'P_INCR_LACADO_PVP'
    end
  end
  object QMToldosDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_ART_ARTICULOS_TOLDO_DET'
      'WHERE'
      '  DETALLE=?old_DETALLE AND '
      '  TARIFA=?old_TARIFA AND '
      '  LONA=?old_LONA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_ART_ARTICULOS_TOLDO_DET'
      
        '  (LONA,ESCANDALLO_DEF,ID_A_DET,ID_A,EMPRESA,DETALLE,TARIFA,ARTI' +
        'CULO,'
      '  VALORAR)'
      'VALUES'
      
        '  (?LONA,?ESCANDALLO_DEF,?ID_A_DET,?ID_A,?EMPRESA,?DETALLE,?TARI' +
        'FA,?ARTICULO,'
      '  ?VALORAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_ART_ARTICULOS_TOLDO_DET'
      'WHERE'
      '  DETALLE=?DETALLE AND '
      '  TARIFA=?TARIFA AND '
      '  LONA=?LONA AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_ART_ARTICULOS_TOLDO_DET'
      'where empresa=?empresa and articulo=?articulo and'
      '  lona=?lona and tarifa=?tarifa ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_ART_ARTICULOS_TOLDO_DET'
      'SET'
      '  ESCANDALLO_DEF=?ESCANDALLO_DEF '
      '  ,VALORAR=?VALORAR'
      '  ,DETALLE=?DETALLE'
      'WHERE'
      '  DETALLE=?old_DETALLE AND '
      '  TARIFA=?TARIFA AND '
      '  LONA=?LONA AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMToldos
    AfterOpen = QMToldosDetAfterOpen
    AfterPost = QMToldosDetAfterPost
    AfterScroll = QMToldosDetAfterScroll
    BeforeClose = QMToldosDetBeforeClose
    OnNewRecord = QMToldosDetNewRecord
    ClavesPrimarias.Strings = (
      'DETALLE '
      'TARIFA '
      'LONA '
      'ARTICULO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_ART_ARTICULOS_TOLDO_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 112
    object QMToldosDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMToldosDetARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMToldosDetLONA: TFIBStringField
      DisplayLabel = 'Lona'
      FieldName = 'LONA'
      Size = 15
    end
    object QMToldosDetTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMToldosDetDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object QMToldosDetID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMToldosDetID_A_DET: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_DET'
    end
    object QMToldosDetTipoArt: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkCalculated
      FieldName = 'TipoArt'
      OnGetText = QMToldosDetTipoArtGetText
      Size = 1
      Calculated = True
    end
    object QMToldosDetDescArt: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescArt'
      OnGetText = QMToldosDetDescArtGetText
      Size = 60
      Calculated = True
    end
    object QMToldosDetPCoste: TFloatField
      DisplayLabel = 'P. Coste'
      FieldKind = fkCalculated
      FieldName = 'PCoste'
      OnGetText = QMToldosDetPCosteGetText
      Calculated = True
    end
    object QMToldosDetPVenta: TFloatField
      DisplayLabel = 'P. Venta'
      FieldKind = fkCalculated
      FieldName = 'PVenta'
      OnGetText = QMToldosDetPVentaGetText
      Calculated = True
    end
    object QMToldosDetMargen: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Margen'
      OnGetText = QMToldosDetMargenGetText
      Calculated = True
    end
    object QMToldosDetESCANDALLO_DEF: TIntegerField
      DisplayLabel = 'Escandallo Def.'
      FieldName = 'ESCANDALLO_DEF'
    end
    object QMToldosDetVALORAR: TIntegerField
      DisplayLabel = 'Val.'
      FieldName = 'VALORAR'
    end
  end
  object xDatosDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_DAME_PRECIOS_TOLDO_DET(:EMPRESA, :ARTICULO, :LON' +
        'A, :TARIFA, :DETALLE, 0)')
    UniDirectional = False
    DataSource = DSQMToldosDet
    Left = 232
    Top = 112
    object xDatosDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xDatosDetalleP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object xDatosDetalleMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object xDatosDetalleTITULO_DET: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_DET'
      Size = 256
    end
    object xDatosDetalleTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 1
    end
  end
  object DSQMToldos: TDataSource
    DataSet = QMToldos
    Left = 128
    Top = 16
  end
  object DSQMToldosDet: TDataSource
    DataSet = QMToldosDet
    Left = 128
    Top = 112
  end
  object DSxDatosDetalle: TDataSource
    DataSet = xDatosDetalle
    Left = 328
    Top = 112
  end
  object xDatosToldo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from z_dame_precios_toldo (?empresa, ?articulo, ?lona, ' +
        '?tarifa, '#39'TOL'#39')')
    UniDirectional = False
    DataSource = DSQMToldos
    Left = 32
    Top = 64
    object xDatosToldoP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xDatosToldoP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object xDatosToldoMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
  end
  object DSxDatosToldo: TDataSource
    DataSet = xDatosToldo
    Left = 128
    Top = 64
  end
  object xDatosArmazon: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_DAME_PRECIOS_TOLDO_DET(:EMPRESA, :ARTICULO, :LON' +
        'A, :TARIFA, :ARMAZON, 0)')
    UniDirectional = False
    DataSource = DSQMToldos
    Left = 232
    Top = 160
    object xDatosArmazonP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xDatosArmazonP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object xDatosArmazonMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
  end
  object DSxDatosArmazon: TDataSource
    DataSet = xDatosArmazon
    Left = 320
    Top = 160
  end
  object xDatosLona: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_DAME_PRECIOS_TOLDO_DET(:EMPRESA, :ARTICULO, :LON' +
        'A, :TARIFA, :LONA, 0)')
    UniDirectional = False
    DataSource = DSQMToldos
    Left = 232
    Top = 16
    object xDatosLonaP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xDatosLonaP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object xDatosLonaMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
  end
  object DSxDatosLona: TDataSource
    DataSet = xDatosLona
    Left = 328
    Top = 16
  end
  object xTipoLona: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select z_lon_tipo from art_articulos'
      'where id_a=?id_a_lona')
    UniDirectional = False
    DataSource = DSQMToldos
    Left = 232
    Top = 64
    object xTipoLonaZ_LON_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Z_LON_TIPO'
      Size = 3
    end
  end
  object DSxTipoLona: TDataSource
    DataSet = xTipoLona
    Left = 328
    Top = 64
  end
  object xCalcLona: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_DAME_CALCULO_LONA(:CODIGO, :LINEA, :SALIDA, :LON' +
        'A_TIPO, 0)')
    UniDirectional = False
    Left = 32
    Top = 160
    object xCalcLonaDESC_TIPO_LONA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_TIPO_LONA'
      Size = 60
    end
    object xCalcLonaMULTIPLO: TIntegerField
      DisplayLabel = 'Multiplo'
      FieldName = 'MULTIPLO'
    end
    object xCalcLonaTOTAL_LINEA: TIntegerField
      DisplayLabel = 'Total Linea'
      FieldName = 'TOTAL_LINEA'
    end
    object xCalcLonaTOTAL_SALIDA: TIntegerField
      DisplayLabel = 'Total Salida'
      FieldName = 'TOTAL_SALIDA'
    end
    object xCalcLonaTOTAL_M2_LONA: TFloatField
      DisplayLabel = 'Total M2 Lona'
      FieldName = 'TOTAL_M2_LONA'
    end
  end
  object DSxCalcLona: TDataSource
    DataSet = xCalcLona
    Left = 128
    Top = 160
  end
  object xTipoArmazon: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from z_art_articulos_armazon'
      'where id_a=?id_a_armazon')
    UniDirectional = False
    DataSource = DSQMToldos
    Left = 232
    Top = 208
    object xTipoArmazonMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 3
    end
    object xTipoArmazonLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xTipoArmazonSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
  end
  object DSxTipoArmazon: TDataSource
    DataSet = xTipoArmazon
    Left = 320
    Top = 208
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 448
    Top = 64
  end
end
