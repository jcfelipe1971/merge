object DMLstListados: TDMLstListados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 106
  Height = 499
  Width = 514
  object QMListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    UniDirectional = False
    Left = 32
    Top = 64
  end
  object DSQMListado: TDataSource
    DataSet = QMListado
    Left = 144
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 32
    Top = 16
  end
  object frxInforme: TfrxHYReport
    Version = '3.19'
    DataSet = frDBDSQMListado
    DataSetName = 'Datos'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39290.5693140509
    ReportOptions.LastChange = 39370.7549329282
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '')
    StoreInDFM = False
    OnBeforePrint = frxInformeBeforePrint
    OnGetValue = frxInformeGetValue
    OnUserFunction = frxInformeUserFunction
    FIBOptions.DataSet = QMConf
    FIBOptions.KeyField = 'NUMERO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'LISTADO'
    Left = 240
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object QListados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM LST_LISTADOS_DETALLE'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'GRUPO=?GRUPO AND '
      'LISTADO=?LISTADO'
      '')
    UniDirectional = False
    Left = 32
    Top = 160
    object QListadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QListadosGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QListadosLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QListadosNUMERO: TIntegerField
      DisplayLabel = 'Nro.'
      FieldName = 'NUMERO'
    end
    object QListadosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QListadosDEF_LISTADO: TBlobField
      DisplayLabel = 'Def. Listado'
      FieldName = 'DEF_LISTADO'
      Size = 8
    end
    object QListadosEDITABLE: TIntegerField
      DisplayLabel = 'Editable'
      FieldName = 'EDITABLE'
    end
    object QListadosCABECERA: TIntegerField
      DisplayLabel = 'Cabecera'
      FieldName = 'CABECERA'
    end
  end
  object QListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM LST_LISTADOS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'GRUPO=?GRUPO AND '
      'LISTADO=?LISTADO')
    UniDirectional = False
    Left = 32
    Top = 112
    object QListadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QListadoGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QListadoLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QListadoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QListadoDESCRIPCION: TBlobField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 8
    end
    object QListadoCONSULTA: TBlobField
      DisplayLabel = 'Consulta'
      FieldName = 'CONSULTA'
      Size = 8
    end
    object QListadoMOSTRAR_OPCIONES: TIntegerField
      DisplayLabel = 'Mostrar Opc.'
      FieldName = 'MOSTRAR_OPCIONES'
    end
    object QListadoMOSTRAR_SALIDA: TIntegerField
      DisplayLabel = 'Mostrar Salida'
      FieldName = 'MOSTRAR_SALIDA'
    end
    object QListadoMOSTRAR_TIPO: TIntegerField
      DisplayLabel = 'Mostrar Tipo'
      FieldName = 'MOSTRAR_TIPO'
    end
    object QListadoMOSTRAR_RESUMIDO: TIntegerField
      DisplayLabel = 'Mostrar Resum.'
      FieldName = 'MOSTRAR_RESUMIDO'
    end
    object QListadoMOSTRAR_GENERAL: TIntegerField
      DisplayLabel = 'Mostrar Gen.'
      FieldName = 'MOSTRAR_GENERAL'
    end
    object QListadoPOR_DEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'POR_DEFECTO'
    end
    object QListadoPERMITIR_NUEVOS_LISTADOS: TIntegerField
      DisplayLabel = 'Permitir Nuevos'
      FieldName = 'PERMITIR_NUEVOS_LISTADOS'
    end
    object QListadoPERMITIR_MODIFICAR_LISTADOS: TIntegerField
      DisplayLabel = 'Permitir Modif.'
      FieldName = 'PERMITIR_MODIFICAR_LISTADOS'
    end
    object QListadoPERMITIR_ELIMINAR: TIntegerField
      DisplayLabel = 'Permitir Eliminar'
      FieldName = 'PERMITIR_ELIMINAR'
    end
  end
  object QFiltros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM LST_LISTADOS_FILTROS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'GRUPO=?GRUPO AND '
      'LISTADO=?LISTADO'
      'ORDER BY ORDEN DESC')
    UniDirectional = False
    Left = 32
    Top = 208
  end
  object QMConf: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM LST_LISTADOS_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  GRUPO=?old_GRUPO AND '
      '  LISTADO=?old_LISTADO AND '
      '  NUMERO=?old_NUMERO ')
    InsertSQL.Strings = (
      'INSERT INTO LST_LISTADOS_DETALLE'
      
        '  (DEF_LISTADO,CABECERA,EDITABLE,TITULO,NUMERO,LISTADO,GRUPO,EMP' +
        'RESA)'
      'VALUES'
      
        '  (?DEF_LISTADO,?CABECERA,?EDITABLE,?TITULO,?NUMERO,?LISTADO,?GR' +
        'UPO,?EMPRESA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM LST_LISTADOS_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  GRUPO=?GRUPO AND '
      '  LISTADO=?LISTADO AND '
      '  NUMERO=?NUMERO ')
    SelectSQL.Strings = (
      'SELECT * FROM LST_LISTADOS_DETALLE'
      'WHERE EMPRESA=?EMPRESA'
      'AND GRUPO=?GRUPO'
      'AND LISTADO=?LISTADO'
      'AND NUMERO=?NUMERO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE LST_LISTADOS_DETALLE'
      'SET'
      '  DEF_LISTADO=?DEF_LISTADO '
      '  ,CABECERA=?CABECERA '
      '  ,EDITABLE=?EDITABLE '
      '  ,TITULO=?TITULO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  GRUPO=?GRUPO AND '
      '  LISTADO=?LISTADO AND '
      '  NUMERO=?NUMERO ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'GRUPO '
      'LISTADO '
      'NUMERO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'LST_LISTADOS_DETALLE'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 32
    Top = 256
    object QMConfEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMConfLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QMConfNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
    end
    object QMConfTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMConfDEF_LISTADO: TBlobField
      DisplayLabel = 'Def. Listado'
      FieldName = 'DEF_LISTADO'
      Size = 8
    end
    object QMConfEDITABLE: TIntegerField
      DisplayLabel = 'Editable'
      FieldName = 'EDITABLE'
    end
    object QMConfCABECERA: TIntegerField
      DisplayLabel = 'Cabecera'
      FieldName = 'CABECERA'
    end
  end
  object DSQMConf: TDataSource
    DataSet = QMConf
    Left = 144
    Top = 256
  end
  object frDBDSQMListado: TfrxDBDataset
    UserName = 'Datos'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = DSQMListado
    Left = 240
    Top = 64
  end
  object QMEdicionListado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM LST_LISTADOS'
      'WHERE'
      '  LISTADO=?old_LISTADO AND '
      '  GRUPO=?old_GRUPO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO LST_LISTADOS'
      
        '  (EMPRESA,GRUPO,LISTADO,TITULO,DESCRIPCION,CONSULTA,MOSTRAR_OPC' +
        'IONES,MOSTRAR_SALIDA,MOSTRAR_TIPO,MOSTRAR_RESUMIDO,MOSTRAR_GENER' +
        'AL,POR_DEFECTO,ORDEN,PERMITIR_NUEVOS_LISTADOS,PERMITIR_MODIFICAR' +
        '_LISTADOS,PERMITIR_ELIMINAR)'
      'VALUES'
      
        '  (?EMPRESA,?GRUPO,?LISTADO,?TITULO,?DESCRIPCION,?CONSULTA,?MOST' +
        'RAR_OPCIONES,?MOSTRAR_SALIDA,?MOSTRAR_TIPO,?MOSTRAR_RESUMIDO,?MO' +
        'STRAR_GENERAL,?POR_DEFECTO,?ORDEN,?PERMITIR_NUEVOS_LISTADOS,?PER' +
        'MITIR_MODIFICAR_LISTADOS,?PERMITIR_ELIMINAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM LST_LISTADOS'
      'WHERE'
      '  LISTADO=?LISTADO AND '
      '  GRUPO=?GRUPO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM LST_LISTADOS'
      'WHERE EMPRESA=?EMPRESA'
      'AND GRUPO=?GRUPO'
      'AND LISTADO=?LISTADO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE LST_LISTADOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,CONSULTA=?CONSULTA '
      '  ,MOSTRAR_OPCIONES=?MOSTRAR_OPCIONES '
      '  ,MOSTRAR_SALIDA=?MOSTRAR_SALIDA '
      '  ,MOSTRAR_TIPO=?MOSTRAR_TIPO '
      '  ,MOSTRAR_RESUMIDO=?MOSTRAR_RESUMIDO '
      '  ,MOSTRAR_GENERAL=?MOSTRAR_GENERAL '
      '  ,POR_DEFECTO=?POR_DEFECTO '
      '  ,ORDEN=?ORDEN '
      '  ,PERMITIR_NUEVOS_LISTADOS=?PERMITIR_NUEVOS_LISTADOS '
      '  ,PERMITIR_MODIFICAR_LISTADOS=?PERMITIR_MODIFICAR_LISTADOS '
      '  ,PERMITIR_ELIMINAR=?PERMITIR_ELIMINAR '
      'WHERE'
      '  LISTADO=?LISTADO AND '
      '  GRUPO=?GRUPO AND '
      '  EMPRESA=?EMPRESA ')
    ClavesPrimarias.Strings = (
      'LISTADO '
      'GRUPO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'LST_LISTADOS'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 32
    Top = 304
    object QMEdicionListadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEdicionListadoGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMEdicionListadoLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QMEdicionListadoTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMEdicionListadoDESCRIPCION: TBlobField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 8
    end
    object QMEdicionListadoCONSULTA: TBlobField
      DisplayLabel = 'Consulta'
      FieldName = 'CONSULTA'
      Size = 8
    end
    object QMEdicionListadoMOSTRAR_OPCIONES: TIntegerField
      DisplayLabel = 'Mostrar Opc.'
      FieldName = 'MOSTRAR_OPCIONES'
    end
    object QMEdicionListadoMOSTRAR_SALIDA: TIntegerField
      DisplayLabel = 'Mostrar Salida'
      FieldName = 'MOSTRAR_SALIDA'
    end
    object QMEdicionListadoMOSTRAR_TIPO: TIntegerField
      DisplayLabel = 'Mostrar Tipo'
      FieldName = 'MOSTRAR_TIPO'
    end
    object QMEdicionListadoMOSTRAR_RESUMIDO: TIntegerField
      DisplayLabel = 'Mostrar Resum.'
      FieldName = 'MOSTRAR_RESUMIDO'
    end
    object QMEdicionListadoMOSTRAR_GENERAL: TIntegerField
      DisplayLabel = 'Mostrar Gen.'
      FieldName = 'MOSTRAR_GENERAL'
    end
    object QMEdicionListadoPOR_DEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'POR_DEFECTO'
    end
    object QMEdicionListadoPERMITIR_NUEVOS_LISTADOS: TIntegerField
      DisplayLabel = 'Permitir Nuevos'
      FieldName = 'PERMITIR_NUEVOS_LISTADOS'
    end
    object QMEdicionListadoPERMITIR_MODIFICAR_LISTADOS: TIntegerField
      DisplayLabel = 'Permitir Modif.'
      FieldName = 'PERMITIR_MODIFICAR_LISTADOS'
    end
    object QMEdicionListadoPERMITIR_ELIMINAR: TIntegerField
      DisplayLabel = 'Permitir Eliminar'
      FieldName = 'PERMITIR_ELIMINAR'
    end
    object QMEdicionListadoORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
  end
  object DSQMEdicionListado: TDataSource
    DataSet = QMEdicionListado
    Left = 144
    Top = 304
  end
  object QMFiltros: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM LST_LISTADOS_FILTROS'
      'WHERE'
      '  PARAMETRO=?old_PARAMETRO AND '
      '  LISTADO=?old_LISTADO AND '
      '  GRUPO=?old_GRUPO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO LST_LISTADOS_FILTROS'
      
        '  (EMPRESA,GRUPO,LISTADO,PARAMETRO,TIPO,MOSTRAR_TITULO,TEXTO,TAB' +
        'LA,CAMPO_CODIGO,CAMPO_TITULO,CONDICION_BUSQUEDA,ORDEN)'
      'VALUES'
      
        '  (?EMPRESA,?GRUPO,?LISTADO,?PARAMETRO,?TIPO,?MOSTRAR_TITULO,?TE' +
        'XTO,?TABLA,?CAMPO_CODIGO,?CAMPO_TITULO,?CONDICION_BUSQUEDA,?ORDE' +
        'N)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM LST_LISTADOS_FILTROS'
      'WHERE'
      '  PARAMETRO=?PARAMETRO AND '
      '  LISTADO=?LISTADO AND '
      '  GRUPO=?GRUPO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM LST_LISTADOS_FILTROS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'GRUPO=?GRUPO AND '
      'LISTADO=?LISTADO'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE LST_LISTADOS_FILTROS'
      'SET'
      '  TIPO=?TIPO '
      '  ,MOSTRAR_TITULO=?MOSTRAR_TITULO '
      '  ,TEXTO=?TEXTO '
      '  ,TABLA=?TABLA '
      '  ,CAMPO_CODIGO=?CAMPO_CODIGO '
      '  ,CAMPO_TITULO=?CAMPO_TITULO '
      '  ,CONDICION_BUSQUEDA=?CONDICION_BUSQUEDA '
      '  ,ORDEN=?ORDEN '
      'WHERE'
      '  PARAMETRO=?PARAMETRO AND '
      '  LISTADO=?LISTADO AND '
      '  GRUPO=?GRUPO AND '
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMFiltrosNewRecord
    ClavesPrimarias.Strings = (
      'PARAMETRO '
      'LISTADO '
      'GRUPO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'LST_LISTADOS_FILTROS'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 32
    Top = 352
    object QMFiltrosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFiltrosGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMFiltrosLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QMFiltrosPARAMETRO: TFIBStringField
      DisplayLabel = 'Parametro'
      FieldName = 'PARAMETRO'
      Size = 35
    end
    object QMFiltrosTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMFiltrosMOSTRAR_TITULO: TIntegerField
      DisplayLabel = 'Mostrar Tit.'
      FieldName = 'MOSTRAR_TITULO'
    end
    object QMFiltrosTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 60
    end
    object QMFiltrosTABLA: TFIBStringField
      DisplayLabel = 'Tabla'
      FieldName = 'TABLA'
      Size = 35
    end
    object QMFiltrosCAMPO_CODIGO: TFIBStringField
      DisplayLabel = 'Campo Cod.'
      FieldName = 'CAMPO_CODIGO'
      Size = 35
    end
    object QMFiltrosCAMPO_TITULO: TFIBStringField
      DisplayLabel = 'Campo Tit.'
      FieldName = 'CAMPO_TITULO'
      Size = 35
    end
    object QMFiltrosCONDICION_BUSQUEDA: TFIBStringField
      DisplayLabel = 'Cond. Busqueda'
      FieldName = 'CONDICION_BUSQUEDA'
      Size = 100
    end
    object QMFiltrosORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
  end
  object DSQMFiltros: TDataSource
    DataSet = QMFiltros
    Left = 144
    Top = 352
  end
  object QMOrdenes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM LST_LISTADOS_ORDENES'
      'WHERE'
      '  NUMERO=?old_NUMERO AND '
      '  LISTADO=?old_LISTADO AND '
      '  GRUPO=?old_GRUPO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO LST_LISTADOS_ORDENES'
      '  (EMPRESA,GRUPO,LISTADO,NUMERO,ORDEN,SQL)'
      'VALUES'
      '  (?EMPRESA,?GRUPO,?LISTADO,?NUMERO,?ORDEN,?SQL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM LST_LISTADOS_ORDENES'
      'WHERE'
      '  NUMERO=?NUMERO AND '
      '  LISTADO=?LISTADO AND '
      '  GRUPO=?GRUPO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM LST_LISTADOS_ORDENES'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'GRUPO=?GRUPO AND '
      'LISTADO=?LISTADO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE LST_LISTADOS_ORDENES'
      'SET'
      '  ORDEN=?ORDEN '
      '  ,SQL=?SQL '
      'WHERE'
      '  NUMERO=?NUMERO AND '
      '  LISTADO=?LISTADO AND '
      '  GRUPO=?GRUPO AND '
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMFiltrosNewRecord
    ClavesPrimarias.Strings = (
      'NUMERO '
      'LISTADO '
      'GRUPO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'LST_LISTADOS_ORDENES'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 32
    Top = 400
    object QMOrdenesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMOrdenesGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMOrdenesLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QMOrdenesNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
    end
    object QMOrdenesORDEN: TFIBStringField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
      Size = 35
    end
    object QMOrdenesSQL: TFIBStringField
      DisplayLabel = 'Sql'
      FieldName = 'SQL'
      Size = 60
    end
  end
  object DSQMOrdenes: TDataSource
    DataSet = QMOrdenes
    Left = 144
    Top = 400
  end
end
