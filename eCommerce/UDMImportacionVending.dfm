object DMImportacionVending: TDMImportacionVending
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 592
  Top = 438
  Height = 281
  Width = 528
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 368
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 464
    Top = 8
  end
  object RXMDDatosImportacion: TRxMemoryData
    FieldDefs = <>
    Left = 56
    Top = 104
    object RXMDDatosImportacionUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object RXMDDatosImportacionCENTRO_COSTE: TStringField
      DisplayLabel = 'Centro Coste'
      DisplayWidth = 15
      FieldName = 'CENTRO_COSTE'
      Size = 15
    end
    object RXMDDatosImportacionCODIGO_EXTERNO: TStringField
      DisplayLabel = 'Cod. Externo'
      FieldName = 'CODIGO_EXTERNO'
      Size = 15
    end
    object RXMDDatosImportacionCODIGO_PERSONA: TStringField
      DisplayLabel = 'Cod. Persona'
      FieldName = 'CODIGO_PERSONA'
      Size = 15
    end
    object RXMDDatosImportacionDESCRIPCION_MAQUINA: TStringField
      DisplayLabel = 'Descrip. Maquina'
      FieldName = 'DESCRIPCION_MAQUINA'
      Size = 60
    end
    object RXMDDatosImportacionDESCRIPCION_PRODUCTO: TStringField
      DisplayLabel = 'Descrip. Producto'
      FieldName = 'DESCRIPCION_PRODUCTO'
      Size = 60
    end
    object RXMDDatosImportacionUBICACION: TStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
    end
    object RXMDDatosImportacionCLIENTE_VENDING: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE_VENDING'
      Size = 15
    end
    object RXMDDatosImportacionFECHA: TDateField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object RXMDDatosImportacionINDENTIFICADOR_PERSONA: TIntegerField
      DisplayLabel = 'Indentif. Persona'
      FieldName = 'INDENTIFICADOR_PERSONA'
    end
    object RXMDDatosImportacionMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object RXMDDatosImportacionPRODUCTO: TStringField
      DisplayLabel = 'Producto'
      FieldName = 'PRODUCTO'
      Size = 15
    end
    object RXMDDatosImportacionEXISTE_ARTICULO: TIntegerField
      DisplayLabel = 'Existe Articulo'
      FieldName = 'EXISTE_ARTICULO'
    end
    object RXMDDatosImportacionEXISTE_CLIENTE: TIntegerField
      DisplayLabel = 'Existe Cliente'
      FieldName = 'EXISTE_CLIENTE'
    end
  end
  object DSRXMDDatosImportacion: TDataSource
    DataSet = RXMDDatosImportacion
    Left = 192
    Top = 104
  end
  object QMMaquinas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  MAQUINA=?old_MAQUINA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_MAQUINAS_VENDING'
      
        '  (ID_MAQUINA,MAQUINA,ID_CLIENTE,CLIENTE,EMPRESA,TITULO,ACTIVO,P' +
        'ARAMETRO_CLIENTE,PARAMETRO_MAQUINA)'
      'VALUES'
      
        '  (?ID_MAQUINA,?MAQUINA,?ID_CLIENTE,?CLIENTE,?EMPRESA,?TITULO,?A' +
        'CTIVO,?PARAMETRO_CLIENTE,?PARAMETRO_MAQUINA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MAQUINA=?MAQUINA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      '  EMPRESA = :EMPRESA AND'
      '  CLIENTE = :CLIENTE AND'
      
        '  ((CAST(:PARAMETRO_UBICACION AS VARCHAR(20)) = '#39#39') OR (PARAMETR' +
        'O_UBICACION = CAST(:PARAMETRO_UBICACION AS VARCHAR(20)))) AND'
      '  ACTIVO = 1'
      'ORDER BY MAQUINA'
      ' ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_MAQUINAS_VENDING'
      'SET'
      '  ID_MAQUINA=?ID_MAQUINA '
      '  ,ID_CLIENTE=?ID_CLIENTE '
      '  ,CLIENTE=?CLIENTE '
      '  ,TITULO=?TITULO '
      '  ,ACTIVO=?ACTIVO '
      '  ,PARAMETRO_CLIENTE=?PARAMETRO_CLIENTE '
      '  ,PARAMETRO_MAQUINA=?PARAMETRO_MAQUINA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MAQUINA=?MAQUINA ')
    DataSource = DSCliente
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'MAQUINA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_MAQUINAS_VENDING'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMMaquinasID_MAQUINA: TIntegerField
      DisplayLabel = 'Id Maq.'
      FieldName = 'ID_MAQUINA'
    end
    object QMMaquinasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMaquinasMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object QMMaquinasTITULO: TFIBStringField
      DisplayLabel = 'titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMMaquinasID_CLIENTE: TIntegerField
      DisplayLabel = 'Id Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object QMMaquinasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMMaquinasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMMaquinasPARAMETRO_CLIENTE: TFIBStringField
      DisplayLabel = 'Param. Cliente'
      FieldName = 'PARAMETRO_CLIENTE'
    end
    object QMMaquinasPARAMETRO_MAQUINA: TFIBStringField
      DisplayLabel = 'Param. Maquina'
      FieldName = 'PARAMETRO_MAQUINA'
    end
    object QMMaquinasPARAMETRO_UBICACION: TFIBStringField
      DisplayLabel = 'Param. Ubicacion'
      FieldName = 'PARAMETRO_UBICACION'
    end
    object QMMaquinasPARAMETRO_DOMINIO: TFIBStringField
      DisplayLabel = 'Param. Dominio'
      FieldName = 'PARAMETRO_DOMINIO'
      Size = 60
    end
  end
  object DSQMMaquinas: TDataSource
    DataSet = QMMaquinas
    Left = 192
    Top = 56
  end
  object xCliente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  MAQUINA=?old_MAQUINA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_MAQUINAS_VENDING'
      
        '  (ID_MAQUINA,MAQUINA,ID_CLIENTE,CLIENTE,EMPRESA,TITULO,ACTIVO,P' +
        'ARAMETRO_CLIENTE,PARAMETRO_MAQUINA)'
      'VALUES'
      
        '  (?ID_MAQUINA,?MAQUINA,?ID_CLIENTE,?CLIENTE,?EMPRESA,?TITULO,?A' +
        'CTIVO,?PARAMETRO_CLIENTE,?PARAMETRO_MAQUINA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MAQUINA=?MAQUINA ')
    SelectSQL.Strings = (
      
        'SELECT DISTINCT EMPRESA, CLIENTE, PARAMETRO_UBICACION, PARAMETRO' +
        '_DOMINIO'
      'FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ACTIVO = 1'
      'ORDER BY MAQUINA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_MAQUINAS_VENDING'
      'SET'
      '  ID_MAQUINA=?ID_MAQUINA '
      '  ,ID_CLIENTE=?ID_CLIENTE '
      '  ,CLIENTE=?CLIENTE '
      '  ,TITULO=?TITULO '
      '  ,ACTIVO=?ACTIVO '
      '  ,PARAMETRO_CLIENTE=?PARAMETRO_CLIENTE '
      '  ,PARAMETRO_MAQUINA=?PARAMETRO_MAQUINA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MAQUINA=?MAQUINA ')
    AfterOpen = xClienteAfterOpen
    BeforeClose = xClienteBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'MAQUINA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_MAQUINAS_VENDING'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object xClienteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xClienteCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xClientePARAMETRO_UBICACION: TFIBStringField
      DisplayLabel = 'Param. Ubicacion'
      FieldName = 'PARAMETRO_UBICACION'
    end
    object xClientePARAMETRO_DOMINIO: TFIBStringField
      DisplayLabel = 'Param. Dominio'
      FieldName = 'PARAMETRO_DOMINIO'
      Size = 60
    end
  end
  object DSCliente: TDataSource
    DataSet = xCliente
    Left = 192
    Top = 8
  end
  object xMaquinasImportar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  MAQUINA=?old_MAQUINA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_MAQUINAS_VENDING'
      
        '  (ID_MAQUINA,MAQUINA,ID_CLIENTE,CLIENTE,EMPRESA,TITULO,ACTIVO,P' +
        'ARAMETRO_CLIENTE,PARAMETRO_MAQUINA)'
      'VALUES'
      
        '  (?ID_MAQUINA,?MAQUINA,?ID_CLIENTE,?CLIENTE,?EMPRESA,?TITULO,?A' +
        'CTIVO,?PARAMETRO_CLIENTE,?PARAMETRO_MAQUINA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MAQUINA=?MAQUINA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MAQUINAS_VENDING'
      'WHERE'
      '  EMPRESA = :EMPRESA'
      'ORDER BY MAQUINA'
      ' ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_MAQUINAS_VENDING'
      'SET'
      '  ACTIVO=?ACTIVO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MAQUINA=?MAQUINA ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'MAQUINA ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_MAQUINAS_VENDING'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 152
    object xMaquinasImportarID_MAQUINA: TIntegerField
      DisplayLabel = 'Id Maq.'
      FieldName = 'ID_MAQUINA'
      ReadOnly = True
    end
    object xMaquinasImportarEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ReadOnly = True
    end
    object xMaquinasImportarMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
      ReadOnly = True
    end
    object xMaquinasImportarTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      ReadOnly = True
      Size = 60
    end
    object xMaquinasImportarID_CLIENTE: TIntegerField
      DisplayLabel = 'Id Cliente'
      FieldName = 'ID_CLIENTE'
      ReadOnly = True
    end
    object xMaquinasImportarCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ReadOnly = True
    end
    object xMaquinasImportarACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xMaquinasImportarPARAMETRO_CLIENTE: TFIBStringField
      DisplayLabel = 'Param. Cli.'
      FieldName = 'PARAMETRO_CLIENTE'
      ReadOnly = True
    end
    object xMaquinasImportarPARAMETRO_MAQUINA: TFIBStringField
      DisplayLabel = 'Param. Maq.'
      FieldName = 'PARAMETRO_MAQUINA'
      ReadOnly = True
    end
    object xMaquinasImportarPARAMETRO_UBICACION: TFIBStringField
      DisplayLabel = 'Param. Ubic.'
      FieldName = 'PARAMETRO_UBICACION'
      ReadOnly = True
    end
    object xMaquinasImportarPARAMETRO_DOMINIO: TFIBStringField
      DisplayLabel = 'Param. Dominio'
      FieldName = 'PARAMETRO_DOMINIO'
      ReadOnly = True
      Size = 60
    end
  end
  object DSxMaquinasImportar: TDataSource
    DataSet = xMaquinasImportar
    Left = 192
    Top = 152
  end
end
