object ObrDMPartidasOferta: TObrDMPartidasOferta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 442
  Top = 189
  Height = 414
  Width = 386
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    Left = 189
    Top = 20
  end
  object DSQMCabOferta: TDataSource
    DataSet = QMCabOferta
    Left = 113
    Top = 20
  end
  object DSQMCabPlantilla: TDataSource
    DataSet = QMCabPlantilla
    Left = 124
    Top = 104
  end
  object DSQMDetPlantilla: TDataSource
    DataSet = QMDetPlantilla
    Left = 124
    Top = 152
  end
  object QMCabOferta: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT rig, id_s, fecha, cliente, titulo  FROM VER_CABECERAS_OFE' +
        'RTA_C'
      'where empresa=?empresa and ejercicio=?ejercicio and '
      '  canal=?canal and serie=?serie'
      'order by rig')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterDelete = Graba
    AfterOpen = QMCabOfertaAfterOpen
    AfterPost = Graba
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_OFERTA_C'
    UpdateTransaction = TLocal
    Left = 35
    Top = 19
    object QMCabOfertaRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMCabOfertaID_S: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 10
      FieldName = 'ID_S'
    end
    object QMCabOfertaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabOfertaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabOfertaTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object QMCabPlantilla: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_PARTIDA_OFC_CAB'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_PARTIDA_OFC_CAB'
      
        '  (ID_S,LINEA,ORDEN,PARTIDA,DESCRIPCION,CANTIDAD,MEDIDA_1,MEDIDA' +
        '_2,MEDIDA_3,P_VENTA,P_COSTE,MARGEN_ABS,MARGEN_POR,NOTAS)'
      'VALUES'
      
        '  (?ID_S,?LINEA,?ORDEN,?PARTIDA,?DESCRIPCION,?CANTIDAD,?MEDIDA_1' +
        ',?MEDIDA_2,?MEDIDA_3,?P_VENTA,?P_COSTE,?MARGEN_ABS,?MARGEN_POR,?' +
        'NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_PARTIDA_OFC_CAB'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_PARTIDA_OFC_CAB'
      'where id_s=?id_s'
      'order by orden')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_PARTIDA_OFC_CAB'
      'SET'
      '  ORDEN=?ORDEN '
      '  ,PARTIDA=?PARTIDA '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,P_VENTA=?P_VENTA '
      '  ,P_COSTE=?P_COSTE '
      '  ,MARGEN_ABS=?MARGEN_ABS '
      '  ,MARGEN_POR=?MARGEN_POR'
      '  ,NOTAS=?NOTAS '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_S=?ID_S ')
    DataSource = DSQMCabOferta
    AfterDelete = GrabaCabecera
    AfterOpen = QMCabPlantillaAfterOpen
    AfterPost = GrabaCabecera
    BeforeDelete = QMCabPlantillaBeforeDelete
    BeforePost = QMCabPlantillaBeforePost
    OnNewRecord = QMCabPlantillaNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ID_S ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_PARTIDA_OFC_CAB'
    UpdateTransaction = TLocal
    Left = 33
    Top = 104
    object QMCabPlantillaID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMCabPlantillaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCabPlantillaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMCabPlantillaPARTIDA: TFIBStringField
      DisplayLabel = 'Partida'
      FieldName = 'PARTIDA'
      Size = 3
    end
    object QMCabPlantillaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMCabPlantillaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMCabPlantillaMEDIDA_1: TFIBStringField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
      Size = 25
    end
    object QMCabPlantillaMEDIDA_2: TFIBStringField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
      Size = 25
    end
    object QMCabPlantillaMEDIDA_3: TFIBStringField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
      Size = 25
    end
    object QMCabPlantillaP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMCabPlantillaTOTAL_VENTA: TFloatField
      DisplayLabel = 'Total Venta'
      FieldName = 'TOTAL_VENTA'
    end
    object QMCabPlantillaP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMCabPlantillaTOTAL_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTE'
    end
    object QMCabPlantillaMARGEN_ABS: TFloatField
      DisplayLabel = 'Margen Abs.'
      FieldName = 'MARGEN_ABS'
    end
    object QMCabPlantillaMARGEN_POR: TFloatField
      DisplayLabel = 'Margen Por.'
      FieldName = 'MARGEN_POR'
    end
    object QMCabPlantillaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object QMDetPlantilla: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_VER_PARTIDA_OFC_DET'
      'WHERE'
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_VER_PARTIDA_OFC_DET'
      
        '  (MEDIDA_2,MEDIDA_3,P_VENTA,DESCUENTO,TOTAL_VENTA,P_COSTE,TOTAL' +
        '_COSTE,MARGEN_ABS,MARGEN_POR,ENTRADA,ID_DETALLES_S,ID_S,LINEA_PA' +
        'RTIDA,ORDEN,ARTICULO,DESCRIPCION,CANTIDAD,MEDIDA_1)'
      'VALUES'
      
        '  (?MEDIDA_2,?MEDIDA_3,?P_VENTA,?DESCUENTO,?TOTAL_VENTA,?P_COSTE' +
        ',?TOTAL_COSTE,?MARGEN_ABS,?MARGEN_POR,?ENTRADA,?ID_DETALLES_S,?I' +
        'D_S,?LINEA_PARTIDA,?ORDEN,?ARTICULO,?DESCRIPCION,?CANTIDAD,?MEDI' +
        'DA_1)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_VER_PARTIDA_OFC_DET'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_VER_PARTIDA_OFC_DET'
      'where id_s=?id_s and linea_partida=?linea'
      'order by linea_partida,orden')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_VER_PARTIDA_OFC_DET'
      'SET'
      '  MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,P_VENTA=?P_VENTA '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,TOTAL_VENTA=?TOTAL_VENTA '
      '  ,P_COSTE=?P_COSTE '
      '  ,TOTAL_COSTE=?TOTAL_COSTE '
      '  ,MARGEN_ABS=?MARGEN_ABS '
      '  ,MARGEN_POR=?MARGEN_POR '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_S=?ID_S '
      '  ,LINEA_PARTIDA=?LINEA_PARTIDA '
      '  ,ORDEN=?ORDEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,MEDIDA_1=?MEDIDA_1'
      ' '
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    DataSource = DSQMCabPlantilla
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMDetPlantillaNewRecord
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_VER_PARTIDA_OFC_DET'
    UpdateTransaction = TLocal
    Left = 32
    Top = 152
    object QMDetPlantillaID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetPlantillaID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMDetPlantillaLINEA_PARTIDA: TIntegerField
      DisplayLabel = 'Linea Partida'
      FieldName = 'LINEA_PARTIDA'
    end
    object QMDetPlantillaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetPlantillaARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMDetPlantillaARTICULOChange
      Size = 15
    end
    object QMDetPlantillaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 256
    end
    object QMDetPlantillaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetPlantillaMEDIDA_1: TFIBStringField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
      Size = 25
    end
    object QMDetPlantillaMEDIDA_2: TFIBStringField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
      Size = 25
    end
    object QMDetPlantillaMEDIDA_3: TFIBStringField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
      Size = 25
    end
    object QMDetPlantillaP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMDetPlantillaDESCUENTO: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'DESCUENTO'
    end
    object QMDetPlantillaTOTAL_VENTA: TFloatField
      DisplayLabel = 'Total Venta'
      FieldName = 'TOTAL_VENTA'
    end
    object QMDetPlantillaP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMDetPlantillaTOTAL_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTE'
    end
    object QMDetPlantillaMARGEN_ABS: TFloatField
      DisplayLabel = 'Margen Abs.'
      FieldName = 'MARGEN_ABS'
    end
    object QMDetPlantillaMARGEN_POR: TFloatField
      DisplayLabel = 'Margen Por.'
      FieldName = 'MARGEN_POR'
    end
    object QMDetPlantillaENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
  end
  object xPlantilla: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from obr_partida_cab'
      'where empresa=?empresa and codigo=?codigo')
    UniDirectional = False
    Left = 296
    Top = 103
    object xPlantillaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPlantillaCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object xPlantillaPARTIDA: TFIBStringField
      DisplayLabel = 'Partida'
      FieldName = 'PARTIDA'
      Size = 3
    end
    object xPlantillaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xPlantillaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xPlantillaMEDIDA_1: TFIBStringField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
      Size = 25
    end
    object xPlantillaMEDIDA_2: TFIBStringField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
      Size = 25
    end
    object xPlantillaMEDIDA_3: TFIBStringField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
      Size = 25
    end
    object xPlantillaP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object xPlantillaTOTAL_VENTA: TFloatField
      DisplayLabel = 'Total Venta'
      FieldName = 'TOTAL_VENTA'
    end
    object xPlantillaP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xPlantillaTOTAL_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTE'
    end
    object xPlantillaMARGEN_ABS: TFloatField
      DisplayLabel = 'Margen Abs.'
      FieldName = 'MARGEN_ABS'
    end
    object xPlantillaMARGEN_POR: TFloatField
      DisplayLabel = 'Margen Por.'
      FieldName = 'MARGEN_POR'
    end
    object xPlantillaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xPlantillaDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object xLineaCab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select max(linea) from obr_partida_ofc_cab'
      'where id_s=?id_s')
    UniDirectional = False
    DataSource = DSQMCabOferta
    Left = 234
    Top = 103
    object xLineaCabMAX: TIntegerField
      DisplayLabel = 'Max.'
      FieldName = 'MAX'
    end
  end
  object QInsertarDetalle: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'insert into obr_ver_partida_ofc_det (id_s, linea_partida, orden,' +
        ' articulo, descripcion,'
      
        '    cantidad, medida_1, medida_2, medida_3, p_venta, descuento, ' +
        'p_coste, entrada)'
      '  select ?id_s, ?linea, orden, articulo, descripcion, '
      
        '      cantidad, medida_1, medida_2, medida_3, p_venta, descuento' +
        ', p_coste, ?entrada'
      '    from obr_partida_det'
      '    where empresa=?empresa and codigo=?codigo'
      '    order by orden')
    Transaction = TLocal
    AutoTrans = True
    Left = 295
    Top = 236
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select * from obr_partida_ofc_cab'
      'where id_s=?id_s and linea=?linea')
    SelectSQL.Strings = (
      'select * from obr_partida_ofc_cab'
      'where id_s=?id_s and linea=?linea')
    UniDirectional = False
    DataSource = DSQMCabPlantilla
    Left = 31
    Top = 220
    object xInfoActualizadaID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xInfoActualizadaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xInfoActualizadaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xInfoActualizadaPARTIDA: TFIBStringField
      DisplayLabel = 'Partida'
      FieldName = 'PARTIDA'
      Size = 3
    end
    object xInfoActualizadaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 256
    end
    object xInfoActualizadaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xInfoActualizadaMEDIDA_1: TFIBStringField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
      Size = 25
    end
    object xInfoActualizadaMEDIDA_2: TFIBStringField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
      Size = 25
    end
    object xInfoActualizadaMEDIDA_3: TFIBStringField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
      Size = 25
    end
    object xInfoActualizadaP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object xInfoActualizadaTOTAL_VENTA: TFloatField
      DisplayLabel = 'Total Venta'
      FieldName = 'TOTAL_VENTA'
    end
    object xInfoActualizadaP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xInfoActualizadaTOTAL_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTE'
    end
    object xInfoActualizadaMARGEN_ABS: TFloatField
      DisplayLabel = 'Margen Abs.'
      FieldName = 'MARGEN_ABS'
    end
    object xInfoActualizadaMARGEN_POR: TFloatField
      DisplayLabel = 'Margen Por.'
      FieldName = 'MARGEN_POR'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 122
    Top = 220
  end
  object QBorrarDetalle: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      '/*Query por codigo*/')
    Transaction = TLocal
    AutoTrans = True
    Left = 295
    Top = 284
  end
  object xDescArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from art_articulos'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 295
    Top = 156
    object xDescArticuloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
end
