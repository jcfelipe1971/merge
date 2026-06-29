object ZDMOfertasArtDet: TZDMOfertasArtDet
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 392
  Top = 352
  Height = 281
  Width = 549
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 48
    Top = 8
  end
  object QMOfertasDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_GES_DETALLES_S_PED_DET'
      'WHERE'
      '  DETALLE=?old_DETALLE AND '
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO Z_GES_DETALLES_S_PED_DET'
      '  (ID_DETALLES_S,DETALLE,ESCANDALLO,ID_A_DET,UNIDADES)'
      'VALUES'
      '  (?ID_DETALLES_S,?DETALLE,?ESCANDALLO,?ID_A_DET,?UNIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_GES_DETALLES_S_PED_DET'
      'WHERE'
      '  DETALLE=?old_DETALLE AND '
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_GES_DETALLES_S_PED_DET'
      'WHERE'
      'ID_DETALLES_S = :ID_DETALLES_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_GES_DETALLES_S_PED_DET'
      'SET'
      '  DETALLE=?DETALLE'
      '  ,ESCANDALLO=?ESCANDALLO '
      '  ,UNIDADES=?UNIDADES'
      'WHERE'
      '  DETALLE=?old_DETALLE AND '
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    AfterDelete = GrabaDetalle
    AfterPost = QMOfertasDetAfterPost
    AfterScroll = QMOfertasDetAfterScroll
    OnNewRecord = QMOfertasDetNewRecord
    ClavesPrimarias.Strings = (
      'DETALLE '
      'ID_DETALLES_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_GES_DETALLES_S_PED_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 104
    object QMOfertasDetID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMOfertasDetTIPO_ARTICULO_TYC: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkCalculated
      FieldName = 'TIPO_ARTICULO_TYC'
      OnGetText = QMOfertasDetTIPO_ARTICULO_TYCGetText
      Size = 1
      Calculated = True
    end
    object QMOfertasDetDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      OnChange = QMOfertasDetDETALLEChange
      Size = 15
    end
    object QMOfertasDetDescArt: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescArt'
      OnGetText = QMOfertasDetDescArtGetText
      Size = 60
      Calculated = True
    end
    object QMOfertasDetPCoste: TFloatField
      DisplayLabel = 'P. Coste'
      FieldKind = fkCalculated
      FieldName = 'PCoste'
      OnGetText = QMOfertasDetPCosteGetText
      Calculated = True
    end
    object QMOfertasDetPVenta: TFloatField
      DisplayLabel = 'P. Venta'
      FieldKind = fkCalculated
      FieldName = 'PVenta'
      OnGetText = QMOfertasDetPVentaGetText
      Calculated = True
    end
    object QMOfertasDetMargen: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Margen'
      OnGetText = QMOfertasDetMargenGetText
      Calculated = True
    end
    object QMOfertasDetESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMOfertasDetID_A_DET: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_DET'
    end
    object QMOfertasDetUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
  end
  object xDatosDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_DAME_PRECIOS_TOLDO_DET(:EMPRESA, :ARTICULO, :LON' +
        'A, :TARIFA, :DETALLE, :ID_DETALLES_S)')
    UniDirectional = False
    BeforeOpen = xDatosDetalleBeforeOpen
    Left = 48
    Top = 152
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
    object xDatosDetalleFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
  end
  object DSQMOfertasDet: TDataSource
    DataSet = QMOfertasDet
    Left = 152
    Top = 104
  end
  object DSxDatosDetalle: TDataSource
    DataSet = xDatosDetalle
    Left = 152
    Top = 152
  end
  object xDatosTotal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_DAME_PRECIOS_PEDIDO_DET(:EMPRESA, :ARTICULO, :TA' +
        'RIFA, :ID_DETALLES_S)')
    UniDirectional = False
    BeforeOpen = xDatosTotalBeforeOpen
    Left = 48
    Top = 200
    object xDatosTotalP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xDatosTotalP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object xDatosTotalMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
  end
  object DSxDatosTotal: TDataSource
    DataSet = xDatosTotal
    Left = 152
    Top = 200
  end
  object QMOfertasCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_GES_DETALLES_S_PED_CAB'
      'WHERE'
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO Z_GES_DETALLES_S_PED_CAB'
      
        '  (ID_DETALLES_S,MOTOR,LACADO,INCR_LACADO_PVP,P_INCR_LACADO_PVP,' +
        'MODELO,LINEAL,SALIDA,UNIDADES_LONA,TOTAL_INC_LACADO)'
      'VALUES'
      
        '  (?ID_DETALLES_S,?MOTOR,?LACADO,?INCR_LACADO_PVP,?P_INCR_LACADO' +
        '_PVP,?MODELO,?LINEAL,?SALIDA,?UNIDADES_LONA,?TOTAL_INC_LACADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_GES_DETALLES_S_PED_CAB'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Z_GES_DETALLES_S_PED_CAB'
      'WHERE'
      'ID_DETALLES_S = :ID_DETALLES_S ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_GES_DETALLES_S_PED_CAB'
      'SET'
      '  MOTOR=?MOTOR '
      '  ,LACADO=?LACADO '
      '  ,INCR_LACADO_PVP=?INCR_LACADO_PVP '
      '  ,P_INCR_LACADO_PVP=?P_INCR_LACADO_PVP '
      '  ,MODELO=?MODELO'
      '  ,LINEAL=?LINEAL'
      '  ,SALIDA=?SALIDA'
      '  ,UNIDADES_LONA=?UNIDADES_LONA'
      '  ,TOTAL_INC_LACADO=?TOTAL_INC_LACADO'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_GES_DETALLES_S_PED_CAB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMOfertasCabID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMOfertasCabLACADO: TFIBStringField
      DisplayLabel = 'Lacado'
      FieldName = 'LACADO'
      OnChange = QMOfertasCabLACADOChange
      Size = 2
    end
    object QMOfertasCabMOTOR: TIntegerField
      DisplayLabel = 'Motor'
      FieldName = 'MOTOR'
    end
    object QMOfertasCabINCR_LACADO_PVP: TIntegerField
      DisplayLabel = 'Incr. Lacado PVP'
      FieldName = 'INCR_LACADO_PVP'
    end
    object QMOfertasCabP_INCR_LACADO_PVP: TFloatField
      DisplayLabel = '% Incr. Lacado PVP'
      FieldName = 'P_INCR_LACADO_PVP'
    end
    object QMOfertasCabMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 3
    end
    object QMOfertasCabLINEAL: TFloatField
      DisplayLabel = 'Lineal'
      FieldName = 'LINEAL'
      OnChange = QMOfertasCabLINEALChange
    end
    object QMOfertasCabSALIDA: TFloatField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
      OnChange = QMOfertasCabSALIDAChange
    end
    object QMOfertasCabUNIDADES_LONA: TFloatField
      DisplayLabel = 'Uds. Lona'
      FieldName = 'UNIDADES_LONA'
      OnChange = QMOfertasCabUNIDADES_LONAChange
    end
    object QMOfertasCabTOTAL_INC_LACADO: TFloatField
      DisplayLabel = 'Total Inc. Lacado'
      FieldName = 'TOTAL_INC_LACADO'
    end
  end
  object DSQMOfertasCab: TDataSource
    DataSet = QMOfertasCab
    Left = 152
    Top = 56
  end
  object xLacado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DESCRIPCION, INCREMENTO_PVP'
      'FROM Z_SYS_COLORES'
      'WHERE'
      'CODIGO = :LACADO')
    UniDirectional = False
    DataSource = DSQMOfertasCab
    Left = 256
    Top = 104
    object xLacadoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
    end
    object xLacadoINCREMENTO_PVP: TFloatField
      DisplayLabel = '% Incr. PVP'
      FieldName = 'INCREMENTO_PVP'
    end
  end
  object xLonaDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT FIRST (1) ART.ARTICULO, ART.TITULO_LARGO AS TITULO, ART.I' +
        'D_A, LON.Z_LON_TIPO'
      'FROM Z_GES_DETALLES_S_PED_DET DET'
      
        'JOIN GES_DETALLES_S DET2 ON (DET2.ID_DETALLES_S = DET.ID_DETALLE' +
        'S_S)'
      
        'JOIN ART_ARTICULOS ART ON (ART.EMPRESA = DET2.EMPRESA AND ART.AR' +
        'TICULO = DET.DETALLE)'
      'JOIN ART_ARTICULOS LON ON (ART.ID_A = LON.ID_A)'
      'WHERE'
      'DET.ID_DETALLES_S = :ID_DETALLES_S AND'
      'ART.TIPO_ARTICULO_TYC = '#39'L'#39)
    UniDirectional = False
    DataSource = DSQMOfertasCab
    Left = 432
    Top = 104
    object xLonaDetARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLonaDetTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xLonaDetID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xLonaDetZ_LON_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Z_LON_TIPO'
      Size = 3
    end
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT DET.ARTICULO, DET.TITULO AS TITULO_DET, ART.TITULO_LARGO ' +
        'AS TITULO_ART, ART.TIPO_ARTICULO_TYC'
      'FROM GES_DETALLES_S DET'
      'JOIN ART_ARTICULOS ART ON (ART.ID_A = DET.ID_A)'
      'WHERE'
      'DET.ID_DETALLES_S = :ID_DETALLES_S')
    UniDirectional = False
    DataSource = DSQMOfertasCab
    Left = 432
    Top = 56
    object xArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticuloTITULO_DET: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_DET'
      Size = 60
    end
    object xArticuloTITULO_ART: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object xArticuloTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo Art.'
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 3
    end
  end
  object xLonaM2: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TOTAL_M2_LONA FROM Z_DAME_CALCULO_LONA_SIMPLE(:MODELO, :L' +
        'INEA, :SALIDA, :ID_LONA)')
    UniDirectional = False
    Left = 256
    Top = 56
    object xLonaM2TOTAL_M2_LONA: TFloatField
      DisplayLabel = 'Total M2 Lona'
      FieldName = 'TOTAL_M2_LONA'
    end
  end
  object xTipoArt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select TIPO_ARTICULO_TYC from art_articulos'
      'where id_a=?id_a')
    UniDirectional = False
    Left = 256
    Top = 152
    object xTipoArtTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo Art.'
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 3
    end
  end
  object xLineaCalc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT FIRST (1) LINEA'
      'FROM Z_SYS_MODELOS_DET'
      'WHERE'
      'CODIGO = :MODELO AND'
      'LINEA >= :LINEA'
      'ORDER BY LINEA')
    UniDirectional = False
    Left = 432
    Top = 152
    object xLineaCalcLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object xSalidaCalc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT FIRST (1) SALIDA'
      'FROM Z_SYS_MODELOS_DET'
      'WHERE'
      'CODIGO = :MODELO AND'
      'LINEA = :LINEA AND'
      'SALIDA >= :SALIDA'
      'ORDER BY SALIDA')
    UniDirectional = False
    Left = 432
    Top = 200
    object xSalidaCalcSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
  end
  object DSxLonaM2: TDataSource
    DataSet = xLonaM2
    Left = 344
    Top = 56
  end
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT FIRST (1) ESCANDALLO'
      'FROM PRO_ESCANDALLO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'COMPUESTO = :DETALLE'
      'ORDER BY DEFECTO DESC, ESCANDALLO DESC')
    UniDirectional = False
    Left = 256
    Top = 200
    object xEscandalloESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 152
    Top = 8
  end
end
