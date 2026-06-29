object ZDMModelosDet: TZDMModelosDet
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 566
  Top = 303
  Height = 595
  Width = 607
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 464
    Top = 8
  end
  object QMModelosDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_MODELOS_DET'
      'WHERE'
      '  CODIGO=?old_CODIGO AND '
      '  LINEA=?old_LINEA AND '
      '  SALIDA=?old_SALIDA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_MODELOS_DET'
      
        '  (DEC_MANUAL_MEDIDA_LONA,INC_CORTE,DEC_BARRAS_MOTOR_ABAJO,DEC_B' +
        'ARRAS_MOTOR_ARRIBA,DEC_BARRAS_MANUAL_ABAJO,DEC_BARRAS_MANUAL_ARR' +
        'IBA,SALIDA,LINEA,CODIGO,TIPO_CONFECCION,TIPO_AUX,INCR_LACADO_PVP' +
        ',EMPRESA,ESCANDALLO,EJERCICIO,CANAL,ENTRADA,OBSOLETO,ESCANDALLO_' +
        'COLOR,CODIGO_IMAGEN,LINEA_MINIMA,DEC_MOTOR_MEDIDA_LONA)'
      'VALUES'
      
        '  (?DEC_MANUAL_MEDIDA_LONA,?INC_CORTE,?DEC_BARRAS_MOTOR_ABAJO,?D' +
        'EC_BARRAS_MOTOR_ARRIBA,?DEC_BARRAS_MANUAL_ABAJO,?DEC_BARRAS_MANU' +
        'AL_ARRIBA,?SALIDA,?LINEA,?CODIGO,?TIPO_CONFECCION,?TIPO_AUX,?INC' +
        'R_LACADO_PVP,?EMPRESA,?ESCANDALLO,?EJERCICIO,?CANAL,?ENTRADA,?OB' +
        'SOLETO,?ESCANDALLO_COLOR,?CODIGO_IMAGEN,?LINEA_MINIMA,?DEC_MOTOR' +
        '_MEDIDA_LONA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_MODELOS_DET'
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA AND '
      '  SALIDA=?SALIDA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_MODELOS_DET'
      'WHERE'
      'CODIGO = ?CODIGO AND'
      '(LINEA + SALIDA <> 0)'
      'ORDER BY LINEA, SALIDA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_MODELOS_DET'
      'SET'
      '  DEC_MANUAL_MEDIDA_LONA=?DEC_MANUAL_MEDIDA_LONA '
      '  ,INC_CORTE=?INC_CORTE '
      '  ,DEC_BARRAS_MOTOR_ABAJO=?DEC_BARRAS_MOTOR_ABAJO '
      '  ,DEC_BARRAS_MOTOR_ARRIBA=?DEC_BARRAS_MOTOR_ARRIBA '
      '  ,DEC_BARRAS_MANUAL_ABAJO=?DEC_BARRAS_MANUAL_ABAJO '
      '  ,DEC_BARRAS_MANUAL_ARRIBA=?DEC_BARRAS_MANUAL_ARRIBA '
      '  ,TIPO_CONFECCION=?TIPO_CONFECCION '
      '  ,TIPO_AUX=?TIPO_AUX '
      '  ,INCR_LACADO_PVP=?INCR_LACADO_PVP '
      '  ,ESCANDALLO=?ESCANDALLO'
      '  ,EJERCICIO=?EJERCICIO'
      '  ,CANAL=?CANAL'
      '  ,ENTRADA=?ENTRADA'
      '  ,OBSOLETO=?OBSOLETO'
      '  ,ESCANDALLO_COLOR=?ESCANDALLO_COLOR'
      '  ,CODIGO_IMAGEN=?CODIGO_IMAGEN'
      '  ,LINEA_MINIMA=?LINEA_MINIMA'
      '  ,DEC_MOTOR_MEDIDA_LONA=?DEC_MOTOR_MEDIDA_LONA'
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA AND '
      '  SALIDA=?SALIDA ')
    AfterOpen = QMModelosDetAfterOpen
    AfterPost = Graba
    AfterScroll = QMModelosDetAfterScroll
    OnNewRecord = QMModelosDetNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO '
      'LINEA '
      'SALIDA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_MODELOS_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMModelosDetLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMModelosDetSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
    object QMModelosDetTIPO_AUX: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_AUX'
      Size = 3
    end
    object QMModelosDetTIPO_CONFECCION: TFIBStringField
      DisplayLabel = 'Tipo Confecci'#243'n'
      FieldName = 'TIPO_CONFECCION'
      Size = 3
    end
    object QMModelosDetINCR_LACADO_PVP: TIntegerField
      DisplayLabel = 'Incr. Lacado PVP'
      FieldName = 'INCR_LACADO_PVP'
    end
    object QMModelosDetCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 5
    end
    object QMModelosDetBARRA_SUPERIOR: TFIBStringField
      DisplayLabel = 'Barra Sup.'
      FieldName = 'BARRA_SUPERIOR'
      Size = 15
    end
    object QMModelosDetBARRA_INFERIOR: TFIBStringField
      DisplayLabel = 'Barra Int.'
      FieldName = 'BARRA_INFERIOR'
      Size = 15
    end
    object QMModelosDetESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMModelosDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMModelosDetARMAZON: TStringField
      DisplayLabel = 'Armazon'
      FieldKind = fkCalculated
      FieldName = 'ARMAZON'
      Size = 15
      Calculated = True
    end
    object QMModelosDetDESCARMAZON: TStringField
      DisplayLabel = 'Desc. Armazon'
      FieldKind = fkCalculated
      FieldName = 'DescArmazon'
      Size = 60
      Calculated = True
    end
    object QMModelosDetToldo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Toldo'
      Size = 15
      Calculated = True
    end
    object QMModelosDetDescToldo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescToldo'
      Size = 60
      Calculated = True
    end
    object QMModelosDetEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMModelosDetCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMModelosDetENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMModelosDetINC_CORTE: TFloatField
      DisplayLabel = 'Inc. Corte'
      FieldName = 'INC_CORTE'
    end
    object QMModelosDetDEC_MANUAL_MEDIDA_LONA: TFloatField
      DisplayLabel = 'Dec. Medida Lona'
      FieldName = 'DEC_MANUAL_MEDIDA_LONA'
    end
    object QMModelosDetDEC_BARRAS_MANUAL_ARRIBA: TFloatField
      DisplayLabel = 'Dec. Barras Manual Arriba'
      FieldName = 'DEC_BARRAS_MANUAL_ARRIBA'
    end
    object QMModelosDetDEC_BARRAS_MANUAL_ABAJO: TFloatField
      DisplayLabel = 'Dec. Barras Manual Abajo'
      FieldName = 'DEC_BARRAS_MANUAL_ABAJO'
    end
    object QMModelosDetDEC_BARRAS_MOTOR_ARRIBA: TFloatField
      DisplayLabel = 'Dec. Barras Motor Arriba'
      FieldName = 'DEC_BARRAS_MOTOR_ARRIBA'
    end
    object QMModelosDetDEC_BARRAS_MOTOR_ABAJO: TFloatField
      DisplayLabel = 'Dec. Barras Motor Abajo'
      FieldName = 'DEC_BARRAS_MOTOR_ABAJO'
    end
    object QMModelosDetOBSOLETO: TIntegerField
      DisplayLabel = 'Obsoleto'
      FieldName = 'OBSOLETO'
    end
    object QMModelosDetESCANDALLO_COLOR: TIntegerField
      DisplayLabel = 'Escalado Color'
      FieldName = 'ESCANDALLO_COLOR'
    end
    object QMModelosDetID_A_ARMAZON: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_ARMAZON'
    end
    object QMModelosDetID_A_TOLDO: TIntegerField
      DisplayLabel = 'ID Toldo'
      FieldName = 'ID_A_TOLDO'
    end
    object QMModelosDetID_A_PERSIANA: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_PERSIANA'
    end
    object QMModelosDetCODIGO_IMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'CODIGO_IMAGEN'
    end
    object QMModelosDetLINEA_MINIMA: TIntegerField
      DisplayLabel = 'Linea Minima'
      FieldName = 'LINEA_MINIMA'
    end
    object QMModelosDetDEC_MOTOR_MEDIDA_LONA: TFloatField
      DisplayLabel = 'Dec. Motoro Medida Lona'
      FieldName = 'DEC_MOTOR_MEDIDA_LONA'
    end
  end
  object DSQMModelosDet: TDataSource
    DataSet = QMModelosDet
    Left = 136
    Top = 8
  end
  object xModelo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_MODELOS'
      'where codigo=?codigo')
    UniDirectional = False
    Left = 32
    Top = 152
    object xModeloCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object xModeloDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xModeloNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xModeloDIAS_SERVIR: TIntegerField
      DisplayLabel = 'Dias Servir'
      FieldName = 'DIAS_SERVIR'
    end
    object xModeloCONFIG_TIPO: TIntegerField
      DisplayLabel = 'Config. Tipo'
      FieldName = 'CONFIG_TIPO'
    end
    object xModeloCONFIG_SUBTIPO: TIntegerField
      DisplayLabel = 'Config. Subtipo'
      FieldName = 'CONFIG_SUBTIPO'
    end
    object xModeloINC_CORTE: TIntegerField
      DisplayLabel = 'Inc. Corte'
      FieldName = 'INC_CORTE'
    end
    object xModeloDEC_BARRAS_MANUAL_ARRIBA: TFloatField
      DisplayLabel = 'Dec. Barras Manual Arriba'
      FieldName = 'DEC_BARRAS_MANUAL_ARRIBA'
    end
    object xModeloDEC_BARRAS_MANUAL_ABAJO: TFloatField
      DisplayLabel = 'Dec. Barras Manual Abajo'
      FieldName = 'DEC_BARRAS_MANUAL_ABAJO'
    end
    object xModeloDEC_BARRAS_MOTOR_ARRIBA: TFloatField
      DisplayLabel = 'Dec. Barras Motor Arriba'
      FieldName = 'DEC_BARRAS_MOTOR_ARRIBA'
    end
    object xModeloDEC_BARRAS_MOTOR_ABAJO: TFloatField
      DisplayLabel = 'Dec. Barras Motor Abajo'
      FieldName = 'DEC_BARRAS_MOTOR_ABAJO'
    end
    object xModeloDEC_MANUAL_MEDIDA_LONA: TFloatField
      DisplayLabel = 'Dec. Medida Lona'
      FieldName = 'DEC_MANUAL_MEDIDA_LONA'
    end
    object xModeloTIPO_AUX: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_AUX'
      Size = 3
    end
    object xModeloTIPO_CONFECCION: TFIBStringField
      DisplayLabel = 'Tipo Confec.'
      FieldName = 'TIPO_CONFECCION'
      Size = 3
    end
    object xModeloESCANDALLO_DEFECTO: TIntegerField
      DisplayLabel = 'Escandallo Def.'
      FieldName = 'ESCANDALLO_DEFECTO'
    end
    object xModeloBARRA_SUPERIOR: TFIBStringField
      DisplayLabel = 'Barra Sup.'
      FieldName = 'BARRA_SUPERIOR'
      Size = 15
    end
    object xModeloBARRA_INFERIOR: TFIBStringField
      DisplayLabel = 'Barra Int.'
      FieldName = 'BARRA_INFERIOR'
      Size = 15
    end
    object xModeloBARRAS_TIENEN_FORMULA: TIntegerField
      DisplayLabel = 'Barras Tienen Formula'
      FieldName = 'BARRAS_TIENEN_FORMULA'
    end
    object xModeloWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
    object xModeloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xModeloENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xModeloEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xModeloTIPO_LINEA_SALIDA: TIntegerField
      DisplayLabel = 'Tipo Linea Salida'
      FieldName = 'TIPO_LINEA_SALIDA'
    end
    object xModeloTIPO_MODELO: TFIBStringField
      DisplayLabel = 'Tipo Modelo'
      FieldName = 'TIPO_MODELO'
      Size = 3
    end
    object xModeloIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object xModeloDEC_MOTOR_MEDIDA_LONA: TFloatField
      DisplayLabel = 'Dec. Motor Medida Lona'
      FieldName = 'DEC_MOTOR_MEDIDA_LONA'
    end
  end
  object DSxModelo: TDataSource
    DataSet = xModelo
    Left = 136
    Top = 152
  end
  object QMModelosCalc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_MODELOS_DET_CALC'
      'WHERE'
      '  CODIGO=?old_CODIGO AND '
      '  LINEA=?old_LINEA AND '
      '  SALIDA=?old_SALIDA AND '
      '  TIPO_LONA=?old_TIPO_LONA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_MODELOS_DET_CALC'
      
        '  (INC_SALIDA,SALIDA,LINEA,TOTAL_LINEA,TOTAL_SALIDA,TIPO_LONA,CO' +
        'DIGO,LONA,FABRICACION,TIPO_CALCULO)'
      'VALUES'
      
        '  (?INC_SALIDA,?SALIDA,?LINEA,?TOTAL_LINEA,?TOTAL_SALIDA,?TIPO_L' +
        'ONA,?CODIGO,?LONA,?FABRICACION,?TIPO_CALCULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_MODELOS_DET_CALC'
      'WHERE'
      '  CODIGO=?CODIGO AND '
      '  LINEA=?LINEA AND '
      '  SALIDA=?SALIDA AND '
      '  TIPO_LONA=?TIPO_LONA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_MODELOS_DET_CALC'
      'where codigo=?codigo and linea=?linea and salida=?salida'
      'order by tipo_lona')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_MODELOS_DET_CALC'
      'SET'
      '  INC_SALIDA=?INC_SALIDA'
      '  ,TOTAL_LINEA=?TOTAL_LINEA'
      '  ,TOTAL_SALIDA=?TOTAL_SALIDA'
      '  ,LONA=?LONA'
      '  ,FABRICACION=?FABRICACION'
      '  ,TIPO_CALCULO=?TIPO_CALCULO'
      'WHERE'
      '  CODIGO=?CODIGO AND'
      '  LINEA=?LINEA AND'
      '  SALIDA=?SALIDA AND'
      '  TIPO_LONA=?TIPO_LONA ')
    DataSource = DSQMModelosDet
    AfterOpen = QMModelosCalcAfterOpen
    AfterPost = QMModelosCalcAfterPost
    BeforeEdit = QMModelosCalcBeforeEdit
    OnNewRecord = QMModelosCalcNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO '
      'LINEA '
      'SALIDA '
      'TIPO_LONA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_MODELOS_DET_CALC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
    object QMModelosCalcLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMModelosCalcSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
    object QMModelosCalcTIPO_LONA: TFIBStringField
      DisplayLabel = 'Tipo Lona'
      FieldName = 'TIPO_LONA'
      OnChange = QMModelosCalcTIPO_LONAChange
      Size = 3
    end
    object QMModelosCalcDescTipoLona: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescTipoLona'
      OnGetText = QMModelosCalcDescTipoLonaGetText
      Size = 60
      Calculated = True
    end
    object QMModelosCalcMultiplo: TSmallintField
      DisplayLabel = 'M'#250'ltiplo'
      FieldKind = fkCalculated
      FieldName = 'Multiplo'
      OnGetText = QMModelosCalcMultiploGetText
      Calculated = True
    end
    object QMModelosCalcMultiplo_Salida: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Multiplo_Salida'
      OnGetText = QMModelosCalcMultiplo_SalidaGetText
      Calculated = True
    end
    object QMModelosCalcINC_SALIDA: TIntegerField
      DisplayLabel = 'Inc. Bambalina'
      FieldName = 'INC_SALIDA'
      OnChange = QMModelosCalcINC_SALIDAChange
    end
    object QMModelosCalcTOTAL_LINEA: TIntegerField
      DisplayLabel = 'Total L'#237'nea'
      FieldName = 'TOTAL_LINEA'
      OnGetText = QMModelosCalcTOTAL_LINEAGetText
    end
    object QMModelosCalcTOTAL_SALIDA: TIntegerField
      DisplayLabel = 'Total Salida'
      FieldName = 'TOTAL_SALIDA'
      OnGetText = QMModelosCalcTOTAL_SALIDAGetText
    end
    object QMModelosCalcTotalM2Lona: TSmallintField
      DisplayLabel = 'Total M2 Lona'
      FieldKind = fkCalculated
      FieldName = 'TotalM2Lona'
      OnGetText = QMModelosCalcTotalM2LonaGetText
      Calculated = True
    end
    object QMModelosCalcLONA: TFIBStringField
      DisplayLabel = 'Lona Def.'
      FieldName = 'LONA'
      Size = 15
    end
    object QMModelosCalcFABRICACION: TFIBStringField
      DisplayLabel = 'Fabricaci'#243'n Def.'
      FieldName = 'FABRICACION'
      Size = 15
    end
    object QMModelosCalcCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 5
    end
    object QMModelosCalcTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMModelosCalcTIPO_CALCULO: TIntegerField
      DisplayLabel = 'Tipo Calculo'
      FieldName = 'TIPO_CALCULO'
    end
  end
  object DSQMModelosCalc: TDataSource
    DataSet = QMModelosCalc
    Left = 136
    Top = 56
  end
  object xCalcLonas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_DAME_CALCULO_LONA (?codigo, ?linea, ?salida, ?ti' +
        'po_lona, ?tipo_calculo)'
      '')
    UniDirectional = False
    DataSource = DSQMModelosCalc
    Left = 32
    Top = 200
    object xCalcLonasDESC_TIPO_LONA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_TIPO_LONA'
      Size = 60
    end
    object xCalcLonasMULTIPLO: TIntegerField
      DisplayLabel = 'Multiplo'
      FieldName = 'MULTIPLO'
    end
    object xCalcLonasTOTAL_LINEA: TIntegerField
      DisplayLabel = 'Total Linea'
      FieldName = 'TOTAL_LINEA'
    end
    object xCalcLonasTOTAL_SALIDA: TIntegerField
      DisplayLabel = 'Total Salida'
      FieldName = 'TOTAL_SALIDA'
    end
    object xCalcLonasTOTAL_M2_LONA: TFloatField
      DisplayLabel = 'Total M2 Lona'
      FieldName = 'TOTAL_M2_LONA'
    end
    object xCalcLonasMULTIPLO_SALIDA: TIntegerField
      DisplayLabel = 'Mult. Salida'
      FieldName = 'MULTIPLO_SALIDA'
    end
  end
  object DSxCalcLonas: TDataSource
    DataSet = xCalcLonas
    Left = 136
    Top = 200
  end
  object xTipoLona: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select multiplo from z_sys_lonas'
      'where codigo=?tipo_lona'
      '')
    UniDirectional = False
    DataSource = DSQMModelosCalc
    Left = 32
    Top = 248
    object xTipoLonaMULTIPLO: TIntegerField
      DisplayLabel = 'Multiplo'
      FieldName = 'MULTIPLO'
    end
  end
  object DSxTipoLona: TDataSource
    DataSet = xTipoLona
    Left = 136
    Top = 248
  end
  object QMMotores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_MODELOS_DET_MOTOR'
      'WHERE'
      '  MOTOR=?old_MOTOR AND '
      '  SALIDA=?old_SALIDA AND '
      '  LINEA=?old_LINEA AND '
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_MODELOS_DET_MOTOR'
      '  (CODIGO,LINEA,SALIDA,MOTOR,ORDEN,EMPRESA,ARTICULO_KIT)'
      'VALUES'
      '  (?CODIGO,?LINEA,?SALIDA,?MOTOR,?ORDEN,?EMPRESA,?ARTICULO_KIT)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_MODELOS_DET_MOTOR'
      'WHERE'
      '  MOTOR=?MOTOR AND '
      '  SALIDA=?SALIDA AND '
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO AND'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * '
      'FROM Z_SYS_MODELOS_DET_MOTOR'
      
        'where codigo=?codigo and linea=?linea and salida=?salida and emp' +
        'resa=?empresa'
      'order by orden')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_MODELOS_DET_MOTOR'
      'SET'
      '  ORDEN=?ORDEN,'
      '  ARTICULO_KIT=?ARTICULO_KIT'
      'WHERE'
      '  MOTOR=?MOTOR AND '
      '  SALIDA=?SALIDA AND '
      '  LINEA=?LINEA AND '
      '  CODIGO=?CODIGO AND'
      '  EMPRESA=?EMPRESA')
    DataSource = DSQMModelosDet
    AfterPost = QMMotoresAfterPost
    OnCalcFields = QMMotoresCalcFields
    OnNewRecord = QMMotoresNewRecord
    ClavesPrimarias.Strings = (
      'MOTOR '
      'SALIDA '
      'LINEA '
      'CODIGO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_MODELOS_DET_MOTOR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 104
    object QMMotoresLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMMotoresSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
    object QMMotoresMOTOR: TFIBStringField
      DisplayLabel = 'Motor'
      FieldName = 'MOTOR'
      Size = 15
    end
    object QMMotoresDescMotor: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescMotor'
      Size = 60
      Calculated = True
    end
    object QMMotoresORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMMotoresCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 5
    end
    object QMMotoresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMotoresTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMMotoresUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMMotoresARTICULO_KIT: TFIBStringField
      DisplayLabel = 'Kit'
      FieldName = 'ARTICULO_KIT'
      Size = 15
    end
    object QMMotoresDescKit: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescKit'
      Size = 60
      Calculated = True
    end
  end
  object DSQMMotores: TDataSource
    DataSet = QMMotores
    Left = 136
    Top = 104
  end
  object xArmazonToldo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select articulo,titulo_largo as titulo from art_articulos'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 248
    Top = 104
    object xArmazonToldoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArmazonToldoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSQMLamas: TDataSource
    DataSet = QMLamas
    Left = 136
    Top = 392
  end
  object QMLamas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_MODELOS_DET_LAMA'
      'WHERE'
      '  LARGO=?old_LARGO AND '
      '  ANCHO=?old_ANCHO AND '
      '  CODIGO=?old_CODIGO AND '
      '  EMPRESA=?old_EMPRESA AND'
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_MODELOS_DET_LAMA'
      
        '  (EMPRESA,CODIGO,ANCHO,LARGO,ORDEN,NUM_LAMAS,MERMA,ARTICULO,TIP' +
        'O_LAMA,LINEA,SALIDA)'
      'VALUES'
      
        '  (?EMPRESA,?CODIGO,?ANCHO,?LARGO,?ORDEN,?NUM_LAMAS,?MERMA,?ARTI' +
        'CULO,?TIPO_LAMA,?LINEA,?SALIDA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_MODELOS_DET_LAMA'
      'WHERE'
      '  LARGO=?LARGO AND '
      '  ANCHO=?ANCHO AND '
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA AND'
      '  ARTICULO=?ARTICULO')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_MODELOS_DET_LAMA'
      'where codigo=?codigo and ancho=?linea and largo=?salida'
      'order by orden')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_MODELOS_DET_LAMA'
      'SET'
      '  ORDEN=?ORDEN '
      '  ,NUM_LAMAS=?NUM_LAMAS '
      '  ,MERMA=?MERMA '
      '  ,ARTICULO=?ARTICULO '
      '  ,TIPO_LAMA=?TIPO_LAMA'
      'WHERE'
      '  LARGO=?LARGO AND '
      '  ANCHO=?ANCHO AND '
      '  CODIGO=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMModelosDet
    AfterPost = GrabaDetalle
    OnCalcFields = QMLamasCalcFields
    OnNewRecord = QMLamasNewRecord
    ClavesPrimarias.Strings = (
      'LARGO '
      'ANCHO '
      'CODIGO '
      'EMPRESA '
      'ARTICULO'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_MODELOS_DET_LAMA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 392
    object QMLamasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLamasCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 5
    end
    object QMLamasANCHO: TIntegerField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMLamasLARGO: TIntegerField
      DisplayLabel = 'Largo'
      FieldName = 'LARGO'
    end
    object QMLamasORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMLamasNUM_LAMAS: TIntegerField
      DisplayLabel = 'Nro. Lamas'
      FieldName = 'NUM_LAMAS'
    end
    object QMLamasMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QMLamasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMLamasARTICULOChange
      Size = 15
    end
    object QMLamasDescArticulo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = QMLamasDescArticuloGetText
      Size = 60
      Calculated = True
    end
    object QMLamasAnchoLama: TFloatField
      DisplayLabel = 'Ancho Lama'
      FieldKind = fkCalculated
      FieldName = 'AnchoLama'
      OnGetText = QMLamasAnchoLamaGetText
      Calculated = True
    end
    object QMLamasLargoLama: TFloatField
      DisplayLabel = 'Largo Lama'
      FieldKind = fkCalculated
      FieldName = 'LargoLama'
      OnGetText = QMLamasLargoLamaGetText
      Calculated = True
    end
    object QMLamasColorLama: TStringField
      FieldKind = fkCalculated
      FieldName = 'ColorLama'
      OnGetText = QMLamasColorLamaGetText
      Calculated = True
    end
    object QMLamasDescColor: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescColor'
      OnGetText = QMLamasDescColorGetText
      Calculated = True
    end
    object QMLamasTIPO_LAMA: TFIBStringField
      DisplayLabel = 'Tipo Lama'
      FieldName = 'TIPO_LAMA'
      OnChange = QMLamasTIPO_LAMAChange
      Size = 3
    end
    object QMLamasDESCLAMA: TStringField
      DisplayLabel = 'Desc Lama'
      FieldKind = fkCalculated
      FieldName = 'DescLama'
      OnGetText = QMLamasDESCLAMAGetText
      Size = 60
      Calculated = True
    end
    object QMLamasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMLamasSALIDA: TIntegerField
      DisplayLabel = 'Salida'
      FieldName = 'SALIDA'
    end
  end
  object xArticulosLama: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from z_art_articulos_lama'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    DataSource = DSQMLamas
    Left = 32
    Top = 344
    object xArticulosLamaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArticulosLamaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosLamaID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xArticulosLamaANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object xArticulosLamaLARGO: TFloatField
      DisplayLabel = 'Largo'
      FieldName = 'LARGO'
    end
    object xArticulosLamaCOLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
      Size = 2
    end
  end
  object DSxArticulosLama: TDataSource
    DataSet = xArticulosLama
    Left = 136
    Top = 344
  end
  object xDescColores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from z_sys_colores'
      'where codigo=:codigo')
    UniDirectional = False
    DataSource = DSxArticulosLama
    Left = 248
    Top = 8
    object xDescColoresCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 2
    end
    object xDescColoresDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
    end
  end
  object DSxColores: TDataSource
    DataSet = xDescColores
    Left = 368
    Top = 8
  end
  object xDescLama: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from z_sys_lonas'
      'where codigo=?codigo and tipo=?tipo')
    UniDirectional = False
    Left = 248
    Top = 56
    object xDescLamaCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object xDescLamaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxDescLama: TDataSource
    DataSet = xDescLama
    Left = 368
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 464
    Top = 56
  end
end
