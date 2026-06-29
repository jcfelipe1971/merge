object ZDMModelos: TZDMModelos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 840
  Top = 212
  Height = 400
  Width = 371
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 280
    Top = 16
  end
  object QMModelos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_MODELOS'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_MODELOS'
      
        '  (CODIGO,'#13#10'DESCRIPCION,NOTAS,DIAS_SERVIR,CONFIG_TIPO,CONFIG_SUB' +
        'TIPO,INC_CORTE,TIPO_AUX,TIPO_CONFECCION,ESCANDALLO_DEFECTO,BARRA' +
        '_SUPERIOR,'#13#10'BARRA_INFERIOR,BARRAS_TIENEN_FORMULA,WEB,EMPRESA,ENT' +
        'RADA,EJERCICIO,TIPO_LINEA_SALIDA,TIPO_MODELO,IMAGEN,BULTOS,'#13#10'DEC' +
        '_MANUAL_MEDIDA_LONA,DEC_MOTOR_MEDIDA_LONA,DEC_BARRAS_MANUAL_ARRI' +
        'BA,DEC_BARRAS_MANUAL_ABAJO,DEC_BARRAS_MOTOR_ARRIBA,DEC_BARRAS_MO' +
        'TOR_ABAJO,ID,COEFICIENTE_COMPRA,FAMILIA,SUBFAMILIA,'#13#10'TIEMPO_FASE' +
        '_CHE,TIEMPO_FASE_MON,TIEMPO_FASE_PRE,TIEMPO_FASE_TER)'
      'VALUES'
      
        '  (?CODIGO,'#13#10'?DESCRIPCION,?NOTAS,?DIAS_SERVIR,?CONFIG_TIPO,?CONF' +
        'IG_SUBTIPO,?INC_CORTE,?TIPO_AUX,?TIPO_CONFECCION,?ESCANDALLO_DEF' +
        'ECTO,?BARRA_SUPERIOR,'#13#10'?BARRA_INFERIOR,?BARRAS_TIENEN_FORMULA,?W' +
        'EB,?EMPRESA,?ENTRADA,?EJERCICIO,?TIPO_LINEA_SALIDA,?TIPO_MODELO,' +
        '?IMAGEN,?BULTOS,'#13#10'?DEC_MANUAL_MEDIDA_LONA,?DEC_MOTOR_MEDIDA_LONA' +
        ',?DEC_BARRAS_MANUAL_ARRIBA,?DEC_BARRAS_MANUAL_ABAJO,?DEC_BARRAS_' +
        'MOTOR_ARRIBA,?DEC_BARRAS_MOTOR_ABAJO,?ID,?COEFICIENTE_COMPRA,?FA' +
        'MILIA,?SUBFAMILIA,'#13#10'?TIEMPO_FASE_CHE,?TIEMPO_FASE_MON,?TIEMPO_FA' +
        'SE_PRE,?TIEMPO_FASE_TER)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_MODELOS'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_MODELOS'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_MODELOS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,NOTAS=?NOTAS '
      '  ,DIAS_SERVIR=?DIAS_SERVIR '
      '  ,CONFIG_TIPO=?CONFIG_TIPO '
      '  ,CONFIG_SUBTIPO=?CONFIG_SUBTIPO '
      '  ,INC_CORTE=?INC_CORTE '
      '  ,TIPO_AUX=?TIPO_AUX '
      '  ,TIPO_CONFECCION=?TIPO_CONFECCION '
      '  ,ESCANDALLO_DEFECTO=?ESCANDALLO_DEFECTO '
      '  ,BARRA_SUPERIOR=?BARRA_SUPERIOR '
      '  ,BARRA_INFERIOR=?BARRA_INFERIOR '
      '  ,BARRAS_TIENEN_FORMULA=?BARRAS_TIENEN_FORMULA '
      '  ,WEB=?WEB '
      '  ,EMPRESA=?EMPRESA '
      '  ,ENTRADA=?ENTRADA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,TIPO_LINEA_SALIDA=?TIPO_LINEA_SALIDA '
      '  ,TIPO_MODELO=?TIPO_MODELO '
      '  ,IMAGEN=?IMAGEN '
      '  ,BULTOS=?BULTOS '
      '  ,DEC_MANUAL_MEDIDA_LONA=?DEC_MANUAL_MEDIDA_LONA '
      '  ,DEC_MOTOR_MEDIDA_LONA=?DEC_MOTOR_MEDIDA_LONA '
      '  ,DEC_BARRAS_MANUAL_ARRIBA=?DEC_BARRAS_MANUAL_ARRIBA '
      '  ,DEC_BARRAS_MANUAL_ABAJO=?DEC_BARRAS_MANUAL_ABAJO '
      '  ,DEC_BARRAS_MOTOR_ARRIBA=?DEC_BARRAS_MOTOR_ARRIBA '
      '  ,DEC_BARRAS_MOTOR_ABAJO=?DEC_BARRAS_MOTOR_ABAJO '
      '  ,ID=?ID '
      '  ,COEFICIENTE_COMPRA=?COEFICIENTE_COMPRA '
      '  ,FAMILIA=?FAMILIA '
      '  ,SUBFAMILIA=?SUBFAMILIA '
      '  ,TIEMPO_FASE_CHE=?TIEMPO_FASE_CHE '
      '  ,TIEMPO_FASE_MON=?TIEMPO_FASE_MON '
      '  ,TIEMPO_FASE_PRE=?TIEMPO_FASE_PRE '
      '  ,TIEMPO_FASE_TER=?TIEMPO_FASE_TER '
      'WHERE'
      '  CODIGO=?CODIGO ')
    AfterOpen = QMModelosAfterOpen
    AfterPost = QMModelosAfterPost
    BeforeClose = QMModelosBeforeClose
    BeforeEdit = QMModelosBeforeEdit
    BeforeInsert = QMModelosBeforeInsert
    OnNewRecord = QMModelosNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_MODELOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMModelosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMModelosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMModelosDIAS_SERVIR: TIntegerField
      DisplayLabel = 'D'#237'as a servir'
      FieldName = 'DIAS_SERVIR'
    end
    object QMModelosCONFIG_TIPO: TIntegerField
      DisplayLabel = 'Config. Tipo'
      FieldName = 'CONFIG_TIPO'
    end
    object QMModelosCONFIG_SUBTIPO: TIntegerField
      DisplayLabel = 'Config. Subtipo'
      FieldName = 'CONFIG_SUBTIPO'
    end
    object QMModelosINC_CORTE: TIntegerField
      DisplayLabel = 'Inc. Corte'
      FieldName = 'INC_CORTE'
    end
    object QMModelosDEC_BARRAS_MANUAL_ARRIBA: TFloatField
      DisplayLabel = 'Dec. Barras Manual Arriba'
      FieldName = 'DEC_BARRAS_MANUAL_ARRIBA'
    end
    object QMModelosDEC_BARRAS_MANUAL_ABAJO: TFloatField
      DisplayLabel = 'Dec. Barras Manual Abajo'
      FieldName = 'DEC_BARRAS_MANUAL_ABAJO'
    end
    object QMModelosDEC_BARRAS_MOTOR_ARRIBA: TFloatField
      DisplayLabel = 'Dec. Barras Motor Arriba'
      FieldName = 'DEC_BARRAS_MOTOR_ARRIBA'
    end
    object QMModelosDEC_BARRAS_MOTOR_ABAJO: TFloatField
      DisplayLabel = 'Dec. Barras Motor Abajo'
      FieldName = 'DEC_BARRAS_MOTOR_ABAJO'
    end
    object QMModelosDEC_MANUAL_MEDIDA_LONA: TFloatField
      DisplayLabel = 'Dec. Medida Lona'
      FieldName = 'DEC_MANUAL_MEDIDA_LONA'
    end
    object QMModelosTIPO_AUX: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_AUX'
      Size = 3
    end
    object QMModelosTIPO_CONFECCION: TFIBStringField
      DisplayLabel = 'Tipo Confecci'#243'n'
      FieldName = 'TIPO_CONFECCION'
      Size = 3
    end
    object QMModelosCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 5
    end
    object QMModelosWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
    object QMModelosESCANDALLO_DEFECTO: TIntegerField
      DisplayLabel = 'Escandallo Def.'
      FieldName = 'ESCANDALLO_DEFECTO'
    end
    object QMModelosBARRA_SUPERIOR: TFIBStringField
      DisplayLabel = 'Barra Sup.'
      FieldName = 'BARRA_SUPERIOR'
      Size = 15
    end
    object QMModelosBARRA_INFERIOR: TFIBStringField
      DisplayLabel = 'Barra Int.'
      FieldName = 'BARRA_INFERIOR'
      Size = 15
    end
    object QMModelosBARRAS_TIENEN_FORMULA: TIntegerField
      DisplayLabel = 'Barras Tienen Formula'
      FieldName = 'BARRAS_TIENEN_FORMULA'
    end
    object QMModelosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMModelosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMModelosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMModelosORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldKind = fkCalculated
      FieldName = 'ORIGEN'
      Calculated = True
    end
    object QMModelosTIPO_LINEA_SALIDA: TIntegerField
      DisplayLabel = 'Tipo Linea Salida'
      FieldName = 'TIPO_LINEA_SALIDA'
    end
    object QMModelosTIPO_MODELO: TFIBStringField
      DisplayLabel = 'Tipo Modelo'
      FieldName = 'TIPO_MODELO'
      Size = 3
    end
    object QMModelosIMAGEN: TIntegerField
      DisplayLabel = 'Id Imagen'
      FieldName = 'IMAGEN'
    end
    object QMModelosBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMModelosDEC_MOTOR_MEDIDA_LONA: TFloatField
      DisplayLabel = 'De. Medida Motor Lona'
      FieldName = 'DEC_MOTOR_MEDIDA_LONA'
    end
    object QMModelosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMModelosCOEFICIENTE_COMPRA: TFloatField
      DisplayLabel = 'Coefic. Compra'
      FieldName = 'COEFICIENTE_COMPRA'
    end
    object QMModelosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMModelosSUBFAMILIA: TFIBStringField
      DisplayLabel = 'Subfamilia'
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
    object QMModelosTIEMPO_FASE_CHE: TIntegerField
      DisplayLabel = 'Tiempo Fase CHE'
      FieldName = 'TIEMPO_FASE_CHE'
    end
    object QMModelosTIEMPO_FASE_MON: TIntegerField
      DisplayLabel = 'Tiempo Fase MON'
      FieldName = 'TIEMPO_FASE_MON'
    end
    object QMModelosTIEMPO_FASE_PRE: TIntegerField
      DisplayLabel = 'Tiempo Fase PRE'
      FieldName = 'TIEMPO_FASE_PRE'
    end
    object QMModelosTIEMPO_FASE_TER: TIntegerField
      DisplayLabel = 'Tiempo Fase TER'
      FieldName = 'TIEMPO_FASE_TER'
    end
  end
  object DSQMModelos: TDataSource
    DataSet = QMModelos
    Left = 160
    Top = 16
  end
  object xRegDatosModelos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select count(*) from z_sys_modelos_det'
      'where codigo=?codigo')
    UniDirectional = False
    DataSource = DSQMModelos
    Left = 40
    Top = 112
    object xRegDatosModelosCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
  end
  object DSxRegDatosModelos: TDataSource
    DataSet = xRegDatosModelos
    Left = 160
    Top = 112
  end
  object xTipoModelo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_TIPO_MODELO'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_TIPO_MODELO'
      '  (CODIGO,DESCRIPCION)'
      'VALUES'
      '  (?CODIGO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_TIPO_MODELO'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_TIPO_MODELO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_TIPO_MODELO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  CODIGO=?CODIGO ')
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_TIPO_MODELO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    Left = 40
    Top = 160
    object xTipoModeloCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object xTipoModeloDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 25
    end
  end
  object DSxTipoModelo: TDataSource
    DataSet = xTipoModelo
    Left = 160
    Top = 160
  end
  object QMModelosDiasColor: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_MODELOS_DIAS_COLOR'
      'WHERE'
      '  CODIGO_COLOR=?old_CODIGO_COLOR AND '
      '  CODIGO_MODELO=?old_CODIGO_MODELO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_MODELOS_DIAS_COLOR'
      '  (CODIGO_MODELO,CODIGO_COLOR,DIAS_RETRASO)'
      'VALUES'
      '  (?CODIGO_MODELO,?CODIGO_COLOR,?DIAS_RETRASO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MODELOS_DIAS_COLOR'
      'WHERE'
      '  CODIGO_COLOR=?CODIGO_COLOR AND '
      '  CODIGO_MODELO=?CODIGO_MODELO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MODELOS_DIAS_COLOR'
      'WHERE CODIGO_MODELO = :CODIGO'
      'ORDER BY CODIGO_COLOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_MODELOS_DIAS_COLOR'
      'SET'
      '  DIAS_RETRASO=?DIAS_RETRASO '
      'WHERE'
      '  CODIGO_COLOR=?CODIGO_COLOR AND '
      '  CODIGO_MODELO=?CODIGO_MODELO ')
    DataSource = DSQMModelos
    OnNewRecord = QMModelosDiasColorNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO_COLOR '
      'CODIGO_MODELO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_MODELOS_DIAS_COLOR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMModelosDiasColorCODIGO_MODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'CODIGO_MODELO'
      Size = 5
    end
    object QMModelosDiasColorCODIGO_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'CODIGO_COLOR'
      Size = 2
    end
    object QMModelosDiasColorDIAS_RETRASO: TIntegerField
      DisplayLabel = 'D'#237'as Retraso'
      FieldName = 'DIAS_RETRASO'
    end
    object QMModelosDiasColorDESC_COLOR: TStringField
      DisplayLabel = 'Descripci'#243'n color'
      FieldKind = fkCalculated
      FieldName = 'DESC_COLOR'
      OnGetText = QMModelosDiasColorDESC_COLORGetText
      Calculated = True
    end
  end
  object DSQMModelosDiasColor: TDataSource
    DataSet = QMModelosDiasColor
    Left = 160
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 280
    Top = 64
  end
  object xAgrupSon: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT AGRUPACION,TITULO FROM VER_AGRUPACIONES_MOD'
      'where '
      'empresa=?empresa and '
      'codigo=?codigo'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMModelos
    Plan.Strings = (
      '')
    Left = 40
    Top = 208
  end
  object DSxAgrupSon: TDataSource
    DataSet = xAgrupSon
    Left = 160
    Top = 208
  end
  object xAgrupDisp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,AGRUPACION'
      'FROM VER_AGRUPACIONES'
      'where '
      'tipo='#39'M'#39' and '
      
        'agrupacion not in (select agrupacion from emp_agrupaciones_mod w' +
        'here empresa=?empresa and codigo =?codigo)'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMModelos
    Left = 40
    Top = 256
  end
  object DSxAgrupDisp: TDataSource
    DataSet = xAgrupDisp
    Left = 160
    Top = 256
  end
  object QMIncrPrecioColor: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_MODELOS_INCR_PREC_COLOR'
      'WHERE'
      '  CODIGO_COLOR=?old_CODIGO_COLOR AND '
      '  CODIGO_MODELO=?old_CODIGO_MODELO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_MODELOS_INCR_PREC_COLOR'
      '  (CODIGO_MODELO,CODIGO_COLOR,INCR_PRECIO)'
      'VALUES'
      '  (?CODIGO_MODELO,?CODIGO_COLOR,?INCR_PRECIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MODELOS_INCR_PREC_COLOR'
      'WHERE'
      '  CODIGO_COLOR=?CODIGO_COLOR AND '
      '  CODIGO_MODELO=?CODIGO_MODELO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MODELOS_INCR_PREC_COLOR'
      'WHERE'
      'CODIGO_MODELO = :CODIGO'
      'ORDER BY CODIGO_COLOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_MODELOS_INCR_PREC_COLOR'
      'SET'
      '  INCR_PRECIO=?INCR_PRECIO '
      'WHERE'
      '  CODIGO_COLOR=?CODIGO_COLOR AND '
      '  CODIGO_MODELO=?CODIGO_MODELO ')
    DataSource = DSQMModelos
    OnNewRecord = QMIncrPrecioColorNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO_COLOR '
      'CODIGO_MODELO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_MODELOS_INCR_PREC_COLOR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 304
    object QMIncrPrecioColorCODIGO_MODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'CODIGO_MODELO'
      Size = 5
    end
    object QMIncrPrecioColorCODIGO_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'CODIGO_COLOR'
      Size = 2
    end
    object QMIncrPrecioColorINCR_PRECIO: TFloatField
      DisplayLabel = '% Incr. Precio'
      FieldName = 'INCR_PRECIO'
    end
    object QMIncrPrecioColorDESC_COLOR: TStringField
      DisplayLabel = 'Descripci'#243'n color'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'DESC_COLOR'
      ReadOnly = True
      OnGetText = QMIncrPrecioColorDESC_COLORGetText
      Calculated = True
    end
  end
  object DSIncrPrecioColor: TDataSource
    DataSet = QMIncrPrecioColor
    Left = 160
    Top = 304
  end
end
