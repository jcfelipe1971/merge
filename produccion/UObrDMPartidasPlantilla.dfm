object ObrDMPartidasPlantilla: TObrDMPartidasPlantilla
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 313
  Top = 458
  Height = 336
  Width = 301
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    Left = 189
    Top = 20
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 108
    Top = 21
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 108
    Top = 76
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 42
    Top = 208
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_PARTIDA_CAB'
      'WHERE'
      '  CODIGO=?old_CODIGO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_PARTIDA_CAB'
      
        '  (EMPRESA,CODIGO,PARTIDA,DESCRIPCION,CANTIDAD,MEDIDA_1,MEDIDA_2' +
        ',MEDIDA_3,P_VENTA,P_COSTE,MARGEN_ABS,MARGEN_POR,NOTAS,DEFECTO)'
      'VALUES'
      
        '  (?EMPRESA,?CODIGO,?PARTIDA,?DESCRIPCION,?CANTIDAD,?MEDIDA_1,?M' +
        'EDIDA_2,?MEDIDA_3,?P_VENTA,?P_COSTE,?MARGEN_ABS,?MARGEN_POR,?NOT' +
        'AS,?DEFECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_PARTIDA_CAB'
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_PARTIDA_CAB'
      'where empresa=?empresa'
      'order by codigo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_PARTIDA_CAB'
      'SET'
      '  PARTIDA=?PARTIDA '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,P_VENTA=?P_VENTA '
      '  ,P_COSTE=?P_COSTE '
      '  ,MARGEN_ABS=?MARGEN_ABS '
      '  ,MARGEN_POR=?MARGEN_POR '
      '  ,NOTAS=?NOTAS '
      '  ,DEFECTO=?DEFECTO '
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = Graba
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_PARTIDA_CAB'
    UpdateTransaction = TLocal
    Left = 28
    Top = 20
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object QMCabeceraPARTIDA: TFIBStringField
      DisplayLabel = 'Partida'
      FieldName = 'PARTIDA'
      OnChange = QMCabeceraPARTIDAChange
      Size = 3
    end
    object QMCabeceraDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMCabeceraCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMCabeceraMEDIDA_1: TFIBStringField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
      Size = 25
    end
    object QMCabeceraMEDIDA_2: TFIBStringField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
      Size = 25
    end
    object QMCabeceraMEDIDA_3: TFIBStringField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
      Size = 25
    end
    object QMCabeceraP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMCabeceraTOTAL_VENTA: TFloatField
      DisplayLabel = 'Total Venta'
      FieldName = 'TOTAL_VENTA'
    end
    object QMCabeceraP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMCabeceraTOTAL_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTE'
    end
    object QMCabeceraMARGEN_ABS: TFloatField
      DisplayLabel = 'Margen Abs.'
      FieldName = 'MARGEN_ABS'
    end
    object QMCabeceraMARGEN_POR: TFloatField
      DisplayLabel = 'Margen Por.'
      FieldName = 'MARGEN_POR'
    end
    object QMCabeceraNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabeceraDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OBR_PARTIDA_DET'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  CODIGO=?old_CODIGO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO OBR_PARTIDA_DET'
      
        '  (EMPRESA,CODIGO,LINEA,ORDEN,ARTICULO,DESCRIPCION,CANTIDAD,MEDI' +
        'DA_1,MEDIDA_2,MEDIDA_3,P_VENTA,DESCUENTO,TOTAL_VENTA,P_COSTE,MAR' +
        'GEN_ABS,MARGEN_POR)'
      'VALUES'
      
        '  (?EMPRESA,?CODIGO,?LINEA,?ORDEN,?ARTICULO,?DESCRIPCION,?CANTID' +
        'AD,?MEDIDA_1,?MEDIDA_2,?MEDIDA_3,?P_VENTA,?DESCUENTO,?TOTAL_VENT' +
        'A,?P_COSTE,?MARGEN_ABS,?MARGEN_POR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OBR_PARTIDA_DET'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM OBR_PARTIDA_DET'
      'where empresa=?empresa and codigo=?codigo'
      'order by orden, linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OBR_PARTIDA_DET'
      'SET'
      '  ORDEN=?ORDEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,P_VENTA=?P_VENTA '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,TOTAL_VENTA=?TOTAL_VENTA '
      '  ,P_COSTE=?P_COSTE '
      '  ,MARGEN_ABS=?MARGEN_ABS '
      '  ,MARGEN_POR=?MARGEN_POR '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCabecera
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'CODIGO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OBR_PARTIDA_DET'
    UpdateTransaction = TLocal
    Left = 28
    Top = 76
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMDetalleARTICULOChange
      Size = 15
    end
    object QMDetalleDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMDetalleCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetalleMEDIDA_1: TFIBStringField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
      Size = 25
    end
    object QMDetalleMEDIDA_2: TFIBStringField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
      Size = 25
    end
    object QMDetalleMEDIDA_3: TFIBStringField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
      Size = 25
    end
    object QMDetalleP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Dto. '
      FieldName = 'DESCUENTO'
    end
    object QMDetalleTOTAL_VENTA: TFloatField
      DisplayLabel = 'Total Venta'
      FieldName = 'TOTAL_VENTA'
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMDetalleTOTAL_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTE'
    end
    object QMDetalleMARGEN_ABS: TFloatField
      DisplayLabel = 'Margen Abs.'
      FieldName = 'MARGEN_ABS'
    end
    object QMDetalleMARGEN_POR: TFloatField
      DisplayLabel = 'Margen Por.'
      FieldName = 'MARGEN_POR'
    end
  end
  object xDescPartida: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from obr_sys_partida'
      'where partida=?partida')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 154
    Top = 159
    object xDescPartidaPARTIDA: TFIBStringField
      DisplayLabel = 'Partida'
      FieldName = 'PARTIDA'
      Size = 3
    end
    object xDescPartidaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object xLineaDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select max(linea) from obr_partida_det'
      'where empresa=?empresa and codigo=?codigo')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 154
    Top = 207
    object xLineaDetMAX: TIntegerField
      DisplayLabel = 'Max.'
      FieldName = 'MAX'
    end
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
    DataSource = DSQMDetalle
    Left = 226
    Top = 159
    object xDescArticuloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select * from obr_partida_cab'
      'where empresa=?empresa and codigo=?codigo')
    SelectSQL.Strings = (
      'select * from obr_partida_cab'
      'where empresa=?empresa and codigo=?codigo')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 43
    Top = 156
    object xInfoActualizadaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xInfoActualizadaCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object xInfoActualizadaPARTIDA: TFIBStringField
      DisplayLabel = 'Partida'
      FieldName = 'PARTIDA'
      Size = 3
    end
    object xInfoActualizadaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
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
    object xInfoActualizadaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xInfoActualizadaDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
end
