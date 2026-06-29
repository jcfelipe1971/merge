object DMLstCRM: TDMLstCRM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 354
  Top = 114
  Height = 390
  Width = 463
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 328
    Top = 8
  end
  object xCRM: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CRM_CABECERA'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CRM_CABECERA'
      
        '  (ID,EMPRESA,EJERCICIO,USUARIO,AGENTE,TIT_AGENTE,CLIENTE,TIT_CL' +
        'IENTE,INCIDENCIA,FECHA,FECHA_FUTURO,TIPO,TIT_TIPO,NOTAS,RUTA,SEM' +
        'ANA)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?EJERCICIO,?USUARIO,?AGENTE,?TIT_AGENTE,?CLIENTE' +
        ',?TIT_CLIENTE,?INCIDENCIA,?FECHA,?FECHA_FUTURO,?TIPO,?TIT_TIPO,?' +
        'NOTAS,?RUTA,?SEMANA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CRM_CABECERA'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CRM_CABECERA'
      'WHERE'
      'EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND AGENTE=?AGENTE AND'
      'CLIENTE BETWEEN ?DCLIENTE AND ?HCLIENTE AND'
      'FECHA BETWEEN ?DFECHA AND ?HFECHA'
      'ORDER BY TIPO,FECHA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CRM_CABECERA'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,USUARIO=?USUARIO '
      '  ,AGENTE=?AGENTE '
      '  ,TIT_AGENTE=?TIT_AGENTE '
      '  ,CLIENTE=?CLIENTE '
      '  ,TIT_CLIENTE=?TIT_CLIENTE '
      '  ,INCIDENCIA=?INCIDENCIA '
      '  ,FECHA=?FECHA '
      '  ,FECHA_FUTURO=?FECHA_FUTURO '
      '  ,TIPO=?TIPO '
      '  ,TIT_TIPO=?TIT_TIPO '
      '  ,NOTAS=?NOTAS '
      '  ,RUTA=?RUTA '
      '  ,SEMANA=?SEMANA '
      'WHERE'
      '  ID=?ID ')
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CRM_CABECERA'
    UpdateTransaction = TLocal
    Left = 40
    Top = 8
    object xCRMID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object xCRMEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCRMEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCRMUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xCRMAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xCRMCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCRMINCIDENCIA: TFIBStringField
      DisplayLabel = 'Incidencia'
      FieldName = 'INCIDENCIA'
      Size = 60
    end
    object xCRMFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xCRMFECHA_FUTURO: TDateTimeField
      DisplayLabel = 'Fecha Fut.'
      FieldName = 'FECHA_FUTURO'
    end
    object xCRMTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xCRMNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xCRMTIT_AGENTE: TFIBStringField
      DisplayLabel = 'Nom. Agente'
      FieldName = 'TIT_AGENTE'
      Size = 60
    end
    object xCRMTIT_CLIENTE: TFIBStringField
      DisplayLabel = 'Nom. Cliente'
      FieldName = 'TIT_CLIENTE'
      Size = 60
    end
    object xCRMTIT_TIPO: TFIBStringField
      DisplayLabel = 'Tit. Tipo'
      FieldName = 'TIT_TIPO'
      Size = 40
    end
    object xCRMRUTA: TIntegerField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
    end
    object xCRMSEMANA: TIntegerField
      DisplayLabel = 'Semana'
      FieldName = 'SEMANA'
    end
    object xCRMCLIENTE_AUSENTE: TIntegerField
      DisplayLabel = 'Cliente Ausente'
      FieldName = 'CLIENTE_AUSENTE'
    end
    object xCRMCLIENTE_NUEVO: TIntegerField
      DisplayLabel = 'Cliente Nuevo'
      FieldName = 'CLIENTE_NUEVO'
    end
    object xCRMVISITA_EFECTUADA: TIntegerField
      DisplayLabel = 'Visita Efectuada'
      FieldName = 'VISITA_EFECTUADA'
    end
    object xCRMAUSENTE: TIntegerField
      DisplayLabel = 'Ausente'
      FieldName = 'AUSENTE'
    end
    object xCRMVOLVER: TIntegerField
      DisplayLabel = 'Volver'
      FieldName = 'VOLVER'
    end
    object xCRMANULAR: TIntegerField
      DisplayLabel = 'Anular'
      FieldName = 'ANULAR'
    end
    object xCRMVISITA_COMERCIAL: TIntegerField
      DisplayLabel = 'Visita Comercial'
      FieldName = 'VISITA_COMERCIAL'
    end
    object xCRMGESTION_DE_COBROS: TIntegerField
      DisplayLabel = 'Gestion de Cobros'
      FieldName = 'GESTION_DE_COBROS'
    end
    object xCRMENTREGA_MATERIAL: TIntegerField
      DisplayLabel = 'Entrega de Material'
      FieldName = 'ENTREGA_MATERIAL'
    end
  end
  object DSXCRM: TDataSource
    DataSet = xCRM
    Left = 144
    Top = 8
  end
  object xSemana: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CRM_CABECERA'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CRM_CABECERA'
      
        '  (ID,EMPRESA,USUARIO,AGENTE,TIT_AGENTE,CLIENTE,TIT_CLIENTE,INCI' +
        'DENCIA,FECHA,FECHA_FUTURO,TIPO,TIT_TIPO,NOTAS)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?USUARIO,?AGENTE,?TIT_AGENTE,?CLIENTE,?TIT_CLIEN' +
        'TE,?INCIDENCIA,?FECHA,?FECHA_FUTURO,?TIPO,?TIT_TIPO,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CRM_CABECERA'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CRM_CABECERA'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'AGENTE=?AGENTE AND'
      'SEMANA=?SEMANA AND'
      'RUTA=?RUTA'
      'ORDER BY ID'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CRM_CABECERA'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,USUARIO=?USUARIO '
      '  ,AGENTE=?AGENTE '
      '  ,TIT_AGENTE=?TIT_AGENTE '
      '  ,CLIENTE=?CLIENTE '
      '  ,TIT_CLIENTE=?TIT_CLIENTE '
      '  ,INCIDENCIA=?INCIDENCIA '
      '  ,FECHA=?FECHA '
      '  ,FECHA_FUTURO=?FECHA_FUTURO '
      '  ,TIPO=?TIPO '
      '  ,TIT_TIPO=?TIT_TIPO '
      '  ,NOTAS=?NOTAS '
      'WHERE'
      '  ID=?ID ')
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CRM_CABECERA'
    UpdateTransaction = TLocal
    Left = 40
    Top = 56
    object xSemanaID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object xSemanaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSemanaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xSemanaUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xSemanaAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xSemanaTIT_AGENTE: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TIT_AGENTE'
      Size = 60
    end
    object xSemanaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xSemanaTIT_CLIENTE: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TIT_CLIENTE'
      Size = 60
    end
    object xSemanaINCIDENCIA: TFIBStringField
      DisplayLabel = 'Incidencia'
      FieldName = 'INCIDENCIA'
      Size = 60
    end
    object xSemanaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xSemanaFECHA_FUTURO: TDateTimeField
      DisplayLabel = 'Fecha Fut.'
      FieldName = 'FECHA_FUTURO'
    end
    object xSemanaTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xSemanaTIT_TIPO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TIT_TIPO'
      Size = 40
    end
    object xSemanaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xSemanaRUTA: TIntegerField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
    end
    object xSemanaSEMANA: TIntegerField
      DisplayLabel = 'Semana'
      FieldName = 'SEMANA'
    end
    object xSemanaCLIENTE_AUSENTE: TIntegerField
      DisplayLabel = 'Cliente Ausente'
      FieldName = 'CLIENTE_AUSENTE'
    end
    object xSemanaCLIENTE_NUEVO: TIntegerField
      DisplayLabel = 'Cliente Nuevo'
      FieldName = 'CLIENTE_NUEVO'
    end
    object xSemanaVISITA_EFECTUADA: TIntegerField
      DisplayLabel = 'Visita Efectuada'
      FieldName = 'VISITA_EFECTUADA'
    end
    object xSemanaAUSENTE: TIntegerField
      DisplayLabel = 'Ausente'
      FieldName = 'AUSENTE'
    end
    object xSemanaVOLVER: TIntegerField
      DisplayLabel = 'Volver'
      FieldName = 'VOLVER'
    end
    object xSemanaANULAR: TIntegerField
      DisplayLabel = 'Anular'
      FieldName = 'ANULAR'
    end
    object xSemanaVISITA_COMERCIAL: TIntegerField
      DisplayLabel = 'Visita Comercial'
      FieldName = 'VISITA_COMERCIAL'
    end
    object xSemanaGESTION_DE_COBROS: TIntegerField
      DisplayLabel = 'Gestion de Cobros'
      FieldName = 'GESTION_DE_COBROS'
    end
    object xSemanaENTREGA_MATERIAL: TIntegerField
      DisplayLabel = 'Entrega de Material'
      FieldName = 'ENTREGA_MATERIAL'
    end
  end
  object DSxSemana: TDataSource
    DataSet = xSemana
    Left = 144
    Top = 56
  end
  object xTotSemana: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_SEMANAS'
      'WHERE'
      '  RUTA=?old_RUTA AND '
      '  SEMANA=?old_SEMANA AND '
      '  USUARIO=?old_USUARIO AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_SEMANAS'
      
        '  (EMPRESA,USUARIO,AGENTE,SEMANA,RUTA,KILOMETROS,GASOLINA,BILLET' +
        'ES,PEAJES,PARKING,TELEFONO,HOTEL,COMIDAS_VIAJE,COMIDAS_INVITACIO' +
        'N,GASTOS_PEQUENOS,VARIOS,EJERCICIO)'
      'VALUES'
      
        '  (?EMPRESA,?USUARIO,?AGENTE,?SEMANA,?RUTA,?KILOMETROS,?GASOLINA' +
        ',?BILLETES,?PEAJES,?PARKING,?TELEFONO,?HOTEL,?COMIDAS_VIAJE,?COM' +
        'IDAS_INVITACION,?GASTOS_PEQUENOS,?VARIOS,?EJERCICIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_SEMANAS'
      'WHERE'
      '  RUTA=?RUTA AND '
      '  SEMANA=?SEMANA AND '
      '  USUARIO=?USUARIO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_SEMANAS'
      'WHERE'
      '  RUTA=?RUTA AND '
      '  SEMANA=?SEMANA AND '
      '  AGENTE=?AGENTE AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_SEMANAS'
      'SET'
      '  AGENTE=?AGENTE '
      '  ,KILOMETROS=?KILOMETROS '
      '  ,GASOLINA=?GASOLINA '
      '  ,BILLETES=?BILLETES '
      '  ,PEAJES=?PEAJES '
      '  ,PARKING=?PARKING '
      '  ,TELEFONO=?TELEFONO '
      '  ,HOTEL=?HOTEL '
      '  ,COMIDAS_VIAJE=?COMIDAS_VIAJE '
      '  ,COMIDAS_INVITACION=?COMIDAS_INVITACION '
      '  ,GASTOS_PEQUENOS=?GASTOS_PEQUENOS '
      '  ,VARIOS=?VARIOS '
      'WHERE'
      '  RUTA=?RUTA AND '
      '  SEMANA=?SEMANA AND '
      '  USUARIO=?USUARIO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    ClavesPrimarias.Strings = (
      'RUTA '
      'SEMANA '
      'USUARIO '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_SEMANAS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 152
    object xTotSemanaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTotSemanaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTotSemanaUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xTotSemanaAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xTotSemanaSEMANA: TIntegerField
      DisplayLabel = 'Semana'
      FieldName = 'SEMANA'
    end
    object xTotSemanaRUTA: TIntegerField
      DisplayLabel = 'Carpeta'
      FieldName = 'RUTA'
    end
    object xTotSemanaKILOMETROS: TFloatField
      DisplayLabel = 'Km.'
      FieldName = 'KILOMETROS'
    end
    object xTotSemanaGASOLINA: TFloatField
      DisplayLabel = 'Gasolina'
      FieldName = 'GASOLINA'
    end
    object xTotSemanaBILLETES: TFloatField
      DisplayLabel = 'Billetes'
      FieldName = 'BILLETES'
    end
    object xTotSemanaPEAJES: TFloatField
      DisplayLabel = 'Peajes'
      FieldName = 'PEAJES'
    end
    object xTotSemanaPARKING: TFloatField
      DisplayLabel = 'Parking'
      FieldName = 'PARKING'
    end
    object xTotSemanaTELEFONO: TFloatField
      DisplayLabel = 'Tel.'
      FieldName = 'TELEFONO'
    end
    object xTotSemanaHOTEL: TFloatField
      DisplayLabel = 'Hotel'
      FieldName = 'HOTEL'
    end
    object xTotSemanaCOMIDAS_VIAJE: TFloatField
      DisplayLabel = 'Comidas Viaje'
      FieldName = 'COMIDAS_VIAJE'
    end
    object xTotSemanaCOMIDAS_INVITACION: TFloatField
      DisplayLabel = 'Comidas Invitacion'
      FieldName = 'COMIDAS_INVITACION'
    end
    object xTotSemanaGASTOS_PEQUENOS: TFloatField
      DisplayLabel = 'Gastos Peq.'
      FieldName = 'GASTOS_PEQUENOS'
    end
    object xTotSemanaVARIOS: TFloatField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
    end
    object xTotSemanaTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xTotSemanaEFECTIVO: TFloatField
      DisplayLabel = 'Efectivo'
      FieldName = 'EFECTIVO'
    end
    object xTotSemanaTARJETA: TFloatField
      DisplayLabel = 'Tarjeta'
      FieldName = 'TARJETA'
    end
  end
  object DSxTotSemana: TDataSource
    DataSet = xTotSemana
    Left = 144
    Top = 152
  end
  object FrCRM: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado CRM'
    RebuildPrinter = False
    OnGetValue = FrCRMGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 400
    Top = 8
    ReportForm = {19000000}
  end
  object xCliente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CLIENTES_CPOSTAL'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  DIRECCION=?old_DIRECCION ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CLIENTES_CPOSTAL'
      
        '  (COD_POSTAL,CLIENTE,PROVINCIA,LOCALIDAD,TELEFONO,NIF,NOMBRE,CA' +
        'NAL,EJERCICIO,EMPRESA,CUENTA)'
      'VALUES'
      
        '  (?COD_POSTAL,?CLIENTE,?PROVINCIA,?LOCALIDAD,?TELEFONO,?NIF,?NO' +
        'MBRE,?CANAL,?EJERCICIO,?EMPRESA,?CUENTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CLIENTES_CPOSTAL'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  CLIENTE=?CLIENTE AND '
      '  DIRECCION=?DIRECCION ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CLIENTES_CPOSTAL'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=1 AND '
      '  CLIENTE=?CLIENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CLIENTES_CPOSTAL'
      'SET'
      '  COD_POSTAL=?COD_POSTAL '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,LOCALIDAD=?LOCALIDAD '
      '  ,TELEFONO=?TELEFONO '
      '  ,NIF=?NIF '
      '  ,NOMBRE=?NOMBRE '
      '  ,CUENTA=?CUENTA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  CLIENTE=?CLIENTE AND '
      '  DIRECCION=?DIRECCION ')
    DataSource = DSxSemana
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'CLIENTE '
      'DIRECCION ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CLIENTES_CPOSTAL'
    UpdateTransaction = TLocal
    Left = 40
    Top = 104
    object xClienteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xClienteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xClienteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xClienteCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xClienteCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xClienteNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xClienteNIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'NIF'
    end
    object xClienteTELEFONO: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'TELEFONO'
    end
    object xClienteDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 76
    end
    object xClienteCOD_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'COD_POSTAL'
      Size = 10
    end
    object xClienteLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object xClientePROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 144
    Top = 104
  end
  object frDBxCRM: TfrDBDataSet
    DataSet = xCRM
    Left = 256
    Top = 8
  end
  object frDBxSemana: TfrDBDataSet
    DataSet = xSemana
    Left = 256
    Top = 56
  end
  object frDBxTotSemana: TfrDBDataSet
    DataSet = xTotSemana
    Left = 256
    Top = 152
  end
  object frDBxCliente: TfrDBDataSet
    DataSet = xCliente
    Left = 256
    Top = 104
  end
  object xVisitasConFrec: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_LST_CRM'
      'WHERE'
      '  ENTRADA=?old_ENTRADA AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  CLIENTE=?old_CLIENTE ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_LST_CRM'
      
        '  (ENTRADA,CLIENTE,TITULO,CODIGO_POSTAL,TITULO_LOCALIDAD,FRECUEN' +
        'CIA,VENTAS_2,VENTAS_1,VENTAS,PREVISION_VENTA,D00,D01,D02,D03,D04' +
        ',D05,D06,D07,D08,D09,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20' +
        ',D21,D22,D23,D24,D25,D26,D27,D28,D29,EMPRESA,RUTA)'
      'VALUES'
      
        '  (?ENTRADA,?CLIENTE,?TITULO,?CODIGO_POSTAL,?TITULO_LOCALIDAD,?F' +
        'RECUENCIA,?VENTAS_2,?VENTAS_1,?VENTAS,?PREVISION_VENTA,?D00,?D01' +
        ',?D02,?D03,?D04,?D05,?D06,?D07,?D08,?D09,?D10,?D11,?D12,?D13,?D1' +
        '4,?D15,?D16,?D17,?D18,?D19,?D20,?D21,?D22,?D23,?D24,?D25,?D26,?D' +
        '27,?D28,?D29,?EMPRESA,?RUTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_LST_CRM'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_LST_CRM'
      'WHERE'
      '  ENTRADA=?ENTRADA AND'
      '  RUTA=?RUTA AND'
      '  CLIENTE_POTENCIAL = 0 AND'
      '  FRECUENCIA > 0'
      'ORDER BY ENTRADA,CODIGO_POSTAL,EMPRESA,CLIENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_LST_CRM'
      'SET'
      '  TITULO=?TITULO '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,TITULO_LOCALIDAD=?TITULO_LOCALIDAD '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,VENTAS_2=?VENTAS_2 '
      '  ,VENTAS_1=?VENTAS_1 '
      '  ,VENTAS=?VENTAS '
      '  ,PREVISION_VENTA=?PREVISION_VENTA '
      '  ,D00=?D00 '
      '  ,D01=?D01 '
      '  ,D02=?D02 '
      '  ,D03=?D03 '
      '  ,D04=?D04 '
      '  ,D05=?D05 '
      '  ,D06=?D06 '
      '  ,D07=?D07 '
      '  ,D08=?D08 '
      '  ,D09=?D09 '
      '  ,D10=?D10 '
      '  ,D11=?D11 '
      '  ,D12=?D12 '
      '  ,D13=?D13 '
      '  ,D14=?D14 '
      '  ,D15=?D15 '
      '  ,D16=?D16 '
      '  ,D17=?D17 '
      '  ,D18=?D18 '
      '  ,D19=?D19 '
      '  ,D20=?D20 '
      '  ,D21=?D21 '
      '  ,D22=?D22 '
      '  ,D23=?D23 '
      '  ,D24=?D24 '
      '  ,D25=?D25 '
      '  ,D26=?D26 '
      '  ,D27=?D27 '
      '  ,D28=?D28 '
      '  ,D29=?D29 '
      '  ,RUTA=?RUTA '
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'EMPRESA '
      'CLIENTE ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_LST_CRM'
    UpdateTransaction = TLocal
    Left = 40
    Top = 200
    object xVisitasConFrecENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xVisitasConFrecEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVisitasConFrecCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xVisitasConFrecTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xVisitasConFrecCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xVisitasConFrecTITULO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TITULO_LOCALIDAD'
      Size = 40
    end
    object xVisitasConFrecFRECUENCIA: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
    object xVisitasConFrecVENTAS_2: TFloatField
      DisplayLabel = 'Ventas A'#241'o-2'
      FieldName = 'VENTAS_2'
    end
    object xVisitasConFrecVENTAS_1: TFloatField
      DisplayLabel = 'Ventas A'#241'o-1'
      FieldName = 'VENTAS_1'
    end
    object xVisitasConFrecVENTAS: TFloatField
      DisplayLabel = 'Ventas'
      FieldName = 'VENTAS'
    end
    object xVisitasConFrecPREVISION_VENTA: TFloatField
      DisplayLabel = 'Prev. Venta'
      FieldName = 'PREVISION_VENTA'
    end
    object xVisitasConFrecRUTA: TIntegerField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
    end
    object xVisitasConFrecD01: TIntegerField
      DisplayLabel = ''
      FieldName = 'D01'
    end
    object xVisitasConFrecD02: TIntegerField
      DisplayLabel = ''
      FieldName = 'D02'
    end
    object xVisitasConFrecD03: TIntegerField
      DisplayLabel = ''
      FieldName = 'D03'
    end
    object xVisitasConFrecD04: TIntegerField
      DisplayLabel = ''
      FieldName = 'D04'
    end
    object xVisitasConFrecD05: TIntegerField
      DisplayLabel = ''
      FieldName = 'D05'
    end
    object xVisitasConFrecD06: TIntegerField
      DisplayLabel = ''
      FieldName = 'D06'
    end
    object xVisitasConFrecD07: TIntegerField
      DisplayLabel = ''
      FieldName = 'D07'
    end
    object xVisitasConFrecD08: TIntegerField
      DisplayLabel = ''
      FieldName = 'D08'
    end
    object xVisitasConFrecD09: TIntegerField
      DisplayLabel = ''
      FieldName = 'D09'
    end
    object xVisitasConFrecD10: TIntegerField
      DisplayLabel = ''
      FieldName = 'D10'
    end
    object xVisitasConFrecD11: TIntegerField
      DisplayLabel = ''
      FieldName = 'D11'
    end
    object xVisitasConFrecD12: TIntegerField
      DisplayLabel = ''
      FieldName = 'D12'
    end
    object xVisitasConFrecD13: TIntegerField
      DisplayLabel = ''
      FieldName = 'D13'
    end
    object xVisitasConFrecD14: TIntegerField
      DisplayLabel = ''
      FieldName = 'D14'
    end
    object xVisitasConFrecD15: TIntegerField
      DisplayLabel = ''
      FieldName = 'D15'
    end
    object xVisitasConFrecD16: TIntegerField
      DisplayLabel = ''
      FieldName = 'D16'
    end
    object xVisitasConFrecD17: TIntegerField
      DisplayLabel = ''
      FieldName = 'D17'
    end
    object xVisitasConFrecD18: TIntegerField
      DisplayLabel = ''
      FieldName = 'D18'
    end
    object xVisitasConFrecD19: TIntegerField
      DisplayLabel = ''
      FieldName = 'D19'
    end
    object xVisitasConFrecD20: TIntegerField
      DisplayLabel = ''
      FieldName = 'D20'
    end
    object xVisitasConFrecD21: TIntegerField
      DisplayLabel = ''
      FieldName = 'D21'
    end
    object xVisitasConFrecD22: TIntegerField
      DisplayLabel = ''
      FieldName = 'D22'
    end
    object xVisitasConFrecD23: TIntegerField
      DisplayLabel = ''
      FieldName = 'D23'
    end
    object xVisitasConFrecD24: TIntegerField
      DisplayLabel = ''
      FieldName = 'D24'
    end
    object xVisitasConFrecD25: TIntegerField
      DisplayLabel = ''
      FieldName = 'D25'
    end
    object xVisitasConFrecD26: TIntegerField
      DisplayLabel = ''
      FieldName = 'D26'
    end
    object xVisitasConFrecD27: TIntegerField
      DisplayLabel = ''
      FieldName = 'D27'
    end
    object xVisitasConFrecD28: TIntegerField
      DisplayLabel = ''
      FieldName = 'D28'
    end
    object xVisitasConFrecD29: TIntegerField
      DisplayLabel = ''
      FieldName = 'D29'
    end
    object xVisitasConFrecD30: TIntegerField
      DisplayLabel = ''
      FieldName = 'D30'
    end
    object xVisitasConFrecD31: TIntegerField
      DisplayLabel = ''
      FieldName = 'D31'
    end
    object xVisitasConFrecD32: TIntegerField
      DisplayLabel = ''
      FieldName = 'D32'
    end
    object xVisitasConFrecD33: TIntegerField
      DisplayLabel = ''
      FieldName = 'D33'
    end
    object xVisitasConFrecD34: TIntegerField
      DisplayLabel = ''
      FieldName = 'D34'
    end
    object xVisitasConFrecD35: TIntegerField
      DisplayLabel = ''
      FieldName = 'D35'
    end
    object xVisitasConFrecD36: TIntegerField
      DisplayLabel = ''
      FieldName = 'D36'
    end
    object xVisitasConFrecD37: TIntegerField
      DisplayLabel = ''
      FieldName = 'D37'
    end
    object xVisitasConFrecD38: TIntegerField
      DisplayLabel = ''
      FieldName = 'D38'
    end
    object xVisitasConFrecD39: TIntegerField
      DisplayLabel = ''
      FieldName = 'D39'
    end
    object xVisitasConFrecD40: TIntegerField
      DisplayLabel = ''
      FieldName = 'D40'
    end
    object xVisitasConFrecD41: TIntegerField
      DisplayLabel = ''
      FieldName = 'D41'
    end
    object xVisitasConFrecD42: TIntegerField
      DisplayLabel = ''
      FieldName = 'D42'
    end
    object xVisitasConFrecD43: TIntegerField
      DisplayLabel = ''
      FieldName = 'D43'
    end
    object xVisitasConFrecD44: TIntegerField
      DisplayLabel = ''
      FieldName = 'D44'
    end
    object xVisitasConFrecD45: TIntegerField
      DisplayLabel = ''
      FieldName = 'D45'
    end
    object xVisitasConFrecD46: TIntegerField
      DisplayLabel = ''
      FieldName = 'D46'
    end
    object xVisitasConFrecD47: TIntegerField
      DisplayLabel = ''
      FieldName = 'D47'
    end
    object xVisitasConFrecD48: TIntegerField
      DisplayLabel = ''
      FieldName = 'D48'
    end
    object xVisitasConFrecD49: TIntegerField
      DisplayLabel = ''
      FieldName = 'D49'
    end
    object xVisitasConFrecD50: TIntegerField
      DisplayLabel = ''
      FieldName = 'D50'
    end
    object xVisitasConFrecD51: TIntegerField
      DisplayLabel = ''
      FieldName = 'D51'
    end
    object xVisitasConFrecD52: TIntegerField
      DisplayLabel = ''
      FieldName = 'D52'
    end
    object xVisitasConFrecD53: TIntegerField
      DisplayLabel = ''
      FieldName = 'D53'
    end
    object xVisitasConFrecD54: TIntegerField
      DisplayLabel = ''
      FieldName = 'D54'
    end
    object xVisitasConFrecD55: TIntegerField
      DisplayLabel = ''
      FieldName = 'D55'
    end
    object xVisitasConFrecCLIENTE_POTENCIAL: TIntegerField
      DisplayLabel = 'Cliente Potencial'
      FieldName = 'CLIENTE_POTENCIAL'
    end
  end
  object DSVisitasConFrec: TDataSource
    DataSet = xVisitasConFrec
    Left = 144
    Top = 200
  end
  object frDBxVisitasConFrec: TfrDBDataSet
    DataSet = xVisitasConFrec
    Left = 256
    Top = 200
  end
  object xVisitasSinFrec: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_LST_CRM'
      'WHERE'
      '  ENTRADA=?old_ENTRADA AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  CLIENTE=?old_CLIENTE ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_LST_CRM'
      
        '  (ENTRADA,CLIENTE,TITULO,CODIGO_POSTAL,TITULO_LOCALIDAD,FRECUEN' +
        'CIA,VENTAS_2,VENTAS_1,VENTAS,PREVISION_VENTA,D00,D01,D02,D03,D04' +
        ',D05,D06,D07,D08,D09,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20' +
        ',D21,D22,D23,D24,D25,D26,D27,D28,D29,EMPRESA,RUTA)'
      'VALUES'
      
        '  (?ENTRADA,?CLIENTE,?TITULO,?CODIGO_POSTAL,?TITULO_LOCALIDAD,?F' +
        'RECUENCIA,?VENTAS_2,?VENTAS_1,?VENTAS,?PREVISION_VENTA,?D00,?D01' +
        ',?D02,?D03,?D04,?D05,?D06,?D07,?D08,?D09,?D10,?D11,?D12,?D13,?D1' +
        '4,?D15,?D16,?D17,?D18,?D19,?D20,?D21,?D22,?D23,?D24,?D25,?D26,?D' +
        '27,?D28,?D29,?EMPRESA,?RUTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_LST_CRM'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_LST_CRM'
      'WHERE'
      '  ENTRADA=?ENTRADA AND'
      '  RUTA=?RUTA AND'
      '  CLIENTE_POTENCIAL = 0 AND'
      '  FRECUENCIA = 0'
      'ORDER BY ENTRADA,CODIGO_POSTAL,EMPRESA,CLIENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_LST_CRM'
      'SET'
      '  TITULO=?TITULO '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,TITULO_LOCALIDAD=?TITULO_LOCALIDAD '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,VENTAS_2=?VENTAS_2 '
      '  ,VENTAS_1=?VENTAS_1 '
      '  ,VENTAS=?VENTAS '
      '  ,PREVISION_VENTA=?PREVISION_VENTA '
      '  ,D00=?D00 '
      '  ,D01=?D01 '
      '  ,D02=?D02 '
      '  ,D03=?D03 '
      '  ,D04=?D04 '
      '  ,D05=?D05 '
      '  ,D06=?D06 '
      '  ,D07=?D07 '
      '  ,D08=?D08 '
      '  ,D09=?D09 '
      '  ,D10=?D10 '
      '  ,D11=?D11 '
      '  ,D12=?D12 '
      '  ,D13=?D13 '
      '  ,D14=?D14 '
      '  ,D15=?D15 '
      '  ,D16=?D16 '
      '  ,D17=?D17 '
      '  ,D18=?D18 '
      '  ,D19=?D19 '
      '  ,D20=?D20 '
      '  ,D21=?D21 '
      '  ,D22=?D22 '
      '  ,D23=?D23 '
      '  ,D24=?D24 '
      '  ,D25=?D25 '
      '  ,D26=?D26 '
      '  ,D27=?D27 '
      '  ,D28=?D28 '
      '  ,D29=?D29 '
      '  ,RUTA=?RUTA '
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'EMPRESA '
      'CLIENTE ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_LST_CRM'
    UpdateTransaction = TLocal
    Left = 40
    Top = 248
    object IntegerField1: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object FIBStringField3: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TITULO_LOCALIDAD'
      Size = 40
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Ventas A'#241'o-2'
      FieldName = 'VENTAS_2'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Ventas A'#241'o-1'
      FieldName = 'VENTAS_1'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Ventas'
      FieldName = 'VENTAS'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Prev. Venta'
      FieldName = 'PREVISION_VENTA'
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
    end
    object IntegerField7: TIntegerField
      DisplayLabel = ''
      FieldName = 'D01'
    end
    object IntegerField8: TIntegerField
      DisplayLabel = ''
      FieldName = 'D02'
    end
    object IntegerField9: TIntegerField
      DisplayLabel = ''
      FieldName = 'D03'
    end
    object IntegerField10: TIntegerField
      DisplayLabel = ''
      FieldName = 'D04'
    end
    object IntegerField11: TIntegerField
      DisplayLabel = ''
      FieldName = 'D05'
    end
    object IntegerField12: TIntegerField
      DisplayLabel = ''
      FieldName = 'D06'
    end
    object IntegerField13: TIntegerField
      DisplayLabel = ''
      FieldName = 'D07'
    end
    object IntegerField14: TIntegerField
      DisplayLabel = ''
      FieldName = 'D08'
    end
    object IntegerField15: TIntegerField
      DisplayLabel = ''
      FieldName = 'D09'
    end
    object IntegerField16: TIntegerField
      DisplayLabel = ''
      FieldName = 'D10'
    end
    object IntegerField17: TIntegerField
      DisplayLabel = ''
      FieldName = 'D11'
    end
    object IntegerField18: TIntegerField
      DisplayLabel = ''
      FieldName = 'D12'
    end
    object IntegerField19: TIntegerField
      DisplayLabel = ''
      FieldName = 'D13'
    end
    object IntegerField20: TIntegerField
      DisplayLabel = ''
      FieldName = 'D14'
    end
    object IntegerField21: TIntegerField
      DisplayLabel = ''
      FieldName = 'D15'
    end
    object IntegerField22: TIntegerField
      DisplayLabel = ''
      FieldName = 'D16'
    end
    object IntegerField23: TIntegerField
      DisplayLabel = ''
      FieldName = 'D17'
    end
    object IntegerField24: TIntegerField
      DisplayLabel = ''
      FieldName = 'D18'
    end
    object IntegerField25: TIntegerField
      DisplayLabel = ''
      FieldName = 'D19'
    end
    object IntegerField26: TIntegerField
      DisplayLabel = ''
      FieldName = 'D20'
    end
    object IntegerField27: TIntegerField
      DisplayLabel = ''
      FieldName = 'D21'
    end
    object IntegerField28: TIntegerField
      DisplayLabel = ''
      FieldName = 'D22'
    end
    object IntegerField29: TIntegerField
      DisplayLabel = ''
      FieldName = 'D23'
    end
    object IntegerField30: TIntegerField
      DisplayLabel = ''
      FieldName = 'D24'
    end
    object IntegerField31: TIntegerField
      DisplayLabel = ''
      FieldName = 'D25'
    end
    object IntegerField32: TIntegerField
      DisplayLabel = ''
      FieldName = 'D26'
    end
    object IntegerField33: TIntegerField
      DisplayLabel = ''
      FieldName = 'D27'
    end
    object IntegerField34: TIntegerField
      DisplayLabel = ''
      FieldName = 'D28'
    end
    object IntegerField35: TIntegerField
      DisplayLabel = ''
      FieldName = 'D29'
    end
    object xVisitasSinFrecD30: TIntegerField
      DisplayLabel = ''
      FieldName = 'D30'
    end
    object xVisitasSinFrecD31: TIntegerField
      DisplayLabel = ''
      FieldName = 'D31'
    end
    object xVisitasSinFrecD32: TIntegerField
      DisplayLabel = ''
      FieldName = 'D32'
    end
    object xVisitasSinFrecD33: TIntegerField
      DisplayLabel = ''
      FieldName = 'D33'
    end
    object xVisitasSinFrecD34: TIntegerField
      DisplayLabel = ''
      FieldName = 'D34'
    end
    object xVisitasSinFrecD35: TIntegerField
      DisplayLabel = ''
      FieldName = 'D35'
    end
    object xVisitasSinFrecD36: TIntegerField
      DisplayLabel = ''
      FieldName = 'D36'
    end
    object xVisitasSinFrecD37: TIntegerField
      DisplayLabel = ''
      FieldName = 'D37'
    end
    object xVisitasSinFrecD38: TIntegerField
      DisplayLabel = ''
      FieldName = 'D38'
    end
    object xVisitasSinFrecD39: TIntegerField
      DisplayLabel = ''
      FieldName = 'D39'
    end
    object xVisitasSinFrecD40: TIntegerField
      DisplayLabel = ''
      FieldName = 'D40'
    end
    object xVisitasSinFrecD41: TIntegerField
      DisplayLabel = ''
      FieldName = 'D41'
    end
    object xVisitasSinFrecD42: TIntegerField
      DisplayLabel = ''
      FieldName = 'D42'
    end
    object xVisitasSinFrecD43: TIntegerField
      DisplayLabel = ''
      FieldName = 'D43'
    end
    object xVisitasSinFrecD44: TIntegerField
      DisplayLabel = ''
      FieldName = 'D44'
    end
    object xVisitasSinFrecD45: TIntegerField
      DisplayLabel = ''
      FieldName = 'D45'
    end
    object xVisitasSinFrecD46: TIntegerField
      DisplayLabel = ''
      FieldName = 'D46'
    end
    object xVisitasSinFrecD47: TIntegerField
      DisplayLabel = ''
      FieldName = 'D47'
    end
    object xVisitasSinFrecD48: TIntegerField
      DisplayLabel = ''
      FieldName = 'D48'
    end
    object xVisitasSinFrecD49: TIntegerField
      DisplayLabel = ''
      FieldName = 'D49'
    end
    object xVisitasSinFrecD50: TIntegerField
      DisplayLabel = ''
      FieldName = 'D50'
    end
    object xVisitasSinFrecD51: TIntegerField
      DisplayLabel = ''
      FieldName = 'D51'
    end
    object xVisitasSinFrecD52: TIntegerField
      DisplayLabel = ''
      FieldName = 'D52'
    end
    object xVisitasSinFrecD53: TIntegerField
      DisplayLabel = ''
      FieldName = 'D53'
    end
    object xVisitasSinFrecD54: TIntegerField
      DisplayLabel = ''
      FieldName = 'D54'
    end
    object xVisitasSinFrecD55: TIntegerField
      DisplayLabel = ''
      FieldName = 'D55'
    end
    object xVisitasSinFrecCLIENTE_POTENCIAL: TIntegerField
      DisplayLabel = 'Cliente Potencial'
      FieldName = 'CLIENTE_POTENCIAL'
    end
  end
  object DSVisitasSinFrec: TDataSource
    DataSet = xVisitasSinFrec
    Left = 144
    Top = 248
  end
  object frDBVisitasSinFrec: TfrDBDataSet
    DataSet = xVisitasSinFrec
    Left = 256
    Top = 248
  end
  object xVisitasPotenciales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_LST_CRM'
      'WHERE'
      '  ENTRADA=?old_ENTRADA AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  CLIENTE=?old_CLIENTE ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_LST_CRM'
      
        '  (ENTRADA,CLIENTE,TITULO,CODIGO_POSTAL,TITULO_LOCALIDAD,FRECUEN' +
        'CIA,VENTAS_2,VENTAS_1,VENTAS,PREVISION_VENTA,D00,D01,D02,D03,D04' +
        ',D05,D06,D07,D08,D09,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20' +
        ',D21,D22,D23,D24,D25,D26,D27,D28,D29,EMPRESA,RUTA)'
      'VALUES'
      
        '  (?ENTRADA,?CLIENTE,?TITULO,?CODIGO_POSTAL,?TITULO_LOCALIDAD,?F' +
        'RECUENCIA,?VENTAS_2,?VENTAS_1,?VENTAS,?PREVISION_VENTA,?D00,?D01' +
        ',?D02,?D03,?D04,?D05,?D06,?D07,?D08,?D09,?D10,?D11,?D12,?D13,?D1' +
        '4,?D15,?D16,?D17,?D18,?D19,?D20,?D21,?D22,?D23,?D24,?D25,?D26,?D' +
        '27,?D28,?D29,?EMPRESA,?RUTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_LST_CRM'
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_LST_CRM'
      'WHERE'
      '  ENTRADA=?ENTRADA AND'
      '  RUTA=?RUTA AND'
      '  CLIENTE_POTENCIAL = 1'
      'ORDER BY ENTRADA,CODIGO_POSTAL,EMPRESA,CLIENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_LST_CRM'
      'SET'
      '  TITULO=?TITULO '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,TITULO_LOCALIDAD=?TITULO_LOCALIDAD '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,VENTAS_2=?VENTAS_2 '
      '  ,VENTAS_1=?VENTAS_1 '
      '  ,VENTAS=?VENTAS '
      '  ,PREVISION_VENTA=?PREVISION_VENTA '
      '  ,D00=?D00 '
      '  ,D01=?D01 '
      '  ,D02=?D02 '
      '  ,D03=?D03 '
      '  ,D04=?D04 '
      '  ,D05=?D05 '
      '  ,D06=?D06 '
      '  ,D07=?D07 '
      '  ,D08=?D08 '
      '  ,D09=?D09 '
      '  ,D10=?D10 '
      '  ,D11=?D11 '
      '  ,D12=?D12 '
      '  ,D13=?D13 '
      '  ,D14=?D14 '
      '  ,D15=?D15 '
      '  ,D16=?D16 '
      '  ,D17=?D17 '
      '  ,D18=?D18 '
      '  ,D19=?D19 '
      '  ,D20=?D20 '
      '  ,D21=?D21 '
      '  ,D22=?D22 '
      '  ,D23=?D23 '
      '  ,D24=?D24 '
      '  ,D25=?D25 '
      '  ,D26=?D26 '
      '  ,D27=?D27 '
      '  ,D28=?D28 '
      '  ,D29=?D29 '
      '  ,RUTA=?RUTA '
      'WHERE'
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'EMPRESA '
      'CLIENTE ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_LST_CRM'
    UpdateTransaction = TLocal
    Left = 40
    Top = 296
    object xVisitasPotencialesENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xVisitasPotencialesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVisitasPotencialesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xVisitasPotencialesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xVisitasPotencialesCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xVisitasPotencialesTITULO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_LOCALIDAD'
      Size = 40
    end
    object xVisitasPotencialesFRECUENCIA: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
    object xVisitasPotencialesVENTAS_2: TFloatField
      DisplayLabel = 'Ventas 2'
      FieldName = 'VENTAS_2'
    end
    object xVisitasPotencialesPREVISION_VENTA: TFloatField
      DisplayLabel = 'Prev. Venta'
      FieldName = 'PREVISION_VENTA'
    end
    object xVisitasPotencialesVENTAS_1: TFloatField
      DisplayLabel = 'Ventas 1'
      FieldName = 'VENTAS_1'
    end
    object xVisitasPotencialesVENTAS: TFloatField
      DisplayLabel = 'Ventas'
      FieldName = 'VENTAS'
    end
    object xVisitasPotencialesRUTA: TIntegerField
      DisplayLabel = 'Carpeta'
      FieldName = 'RUTA'
    end
    object xVisitasPotencialesD01: TIntegerField
      DisplayLabel = ''
      FieldName = 'D01'
    end
    object xVisitasPotencialesD02: TIntegerField
      DisplayLabel = ''
      FieldName = 'D02'
    end
    object xVisitasPotencialesD03: TIntegerField
      DisplayLabel = ''
      FieldName = 'D03'
    end
    object xVisitasPotencialesD04: TIntegerField
      DisplayLabel = ''
      FieldName = 'D04'
    end
    object xVisitasPotencialesD05: TIntegerField
      DisplayLabel = ''
      FieldName = 'D05'
    end
    object xVisitasPotencialesD06: TIntegerField
      DisplayLabel = ''
      FieldName = 'D06'
    end
    object xVisitasPotencialesD07: TIntegerField
      DisplayLabel = ''
      FieldName = 'D07'
    end
    object xVisitasPotencialesD08: TIntegerField
      DisplayLabel = ''
      FieldName = 'D08'
    end
    object xVisitasPotencialesD09: TIntegerField
      DisplayLabel = ''
      FieldName = 'D09'
    end
    object xVisitasPotencialesD10: TIntegerField
      DisplayLabel = ''
      FieldName = 'D10'
    end
    object xVisitasPotencialesD11: TIntegerField
      DisplayLabel = ''
      FieldName = 'D11'
    end
    object xVisitasPotencialesD12: TIntegerField
      DisplayLabel = ''
      FieldName = 'D12'
    end
    object xVisitasPotencialesD13: TIntegerField
      DisplayLabel = ''
      FieldName = 'D13'
    end
    object xVisitasPotencialesD14: TIntegerField
      DisplayLabel = ''
      FieldName = 'D14'
    end
    object xVisitasPotencialesD15: TIntegerField
      DisplayLabel = ''
      FieldName = 'D15'
    end
    object xVisitasPotencialesD16: TIntegerField
      DisplayLabel = ''
      FieldName = 'D16'
    end
    object xVisitasPotencialesD17: TIntegerField
      DisplayLabel = ''
      FieldName = 'D17'
    end
    object xVisitasPotencialesD18: TIntegerField
      DisplayLabel = ''
      FieldName = 'D18'
    end
    object xVisitasPotencialesD19: TIntegerField
      DisplayLabel = ''
      FieldName = 'D19'
    end
    object xVisitasPotencialesD20: TIntegerField
      DisplayLabel = ''
      FieldName = 'D20'
    end
    object xVisitasPotencialesD21: TIntegerField
      DisplayLabel = ''
      FieldName = 'D21'
    end
    object xVisitasPotencialesD22: TIntegerField
      DisplayLabel = ''
      FieldName = 'D22'
    end
    object xVisitasPotencialesD23: TIntegerField
      DisplayLabel = ''
      FieldName = 'D23'
    end
    object xVisitasPotencialesD24: TIntegerField
      DisplayLabel = ''
      FieldName = 'D24'
    end
    object xVisitasPotencialesD25: TIntegerField
      DisplayLabel = ''
      FieldName = 'D25'
    end
    object xVisitasPotencialesD26: TIntegerField
      DisplayLabel = ''
      FieldName = 'D26'
    end
    object xVisitasPotencialesD27: TIntegerField
      DisplayLabel = ''
      FieldName = 'D27'
    end
    object xVisitasPotencialesD28: TIntegerField
      DisplayLabel = ''
      FieldName = 'D28'
    end
    object xVisitasPotencialesD29: TIntegerField
      DisplayLabel = ''
      FieldName = 'D29'
    end
    object xVisitasPotencialesD30: TIntegerField
      DisplayLabel = ''
      FieldName = 'D30'
    end
    object xVisitasPotencialesD31: TIntegerField
      DisplayLabel = ''
      FieldName = 'D31'
    end
    object xVisitasPotencialesD32: TIntegerField
      DisplayLabel = ''
      FieldName = 'D32'
    end
    object xVisitasPotencialesD33: TIntegerField
      DisplayLabel = ''
      FieldName = 'D33'
    end
    object xVisitasPotencialesD34: TIntegerField
      DisplayLabel = ''
      FieldName = 'D34'
    end
    object xVisitasPotencialesD35: TIntegerField
      DisplayLabel = ''
      FieldName = 'D35'
    end
    object xVisitasPotencialesD36: TIntegerField
      DisplayLabel = ''
      FieldName = 'D36'
    end
    object xVisitasPotencialesD37: TIntegerField
      DisplayLabel = ''
      FieldName = 'D37'
    end
    object xVisitasPotencialesD38: TIntegerField
      DisplayLabel = ''
      FieldName = 'D38'
    end
    object xVisitasPotencialesD39: TIntegerField
      DisplayLabel = ''
      FieldName = 'D39'
    end
    object xVisitasPotencialesD40: TIntegerField
      DisplayLabel = ''
      FieldName = 'D40'
    end
    object xVisitasPotencialesD41: TIntegerField
      DisplayLabel = ''
      FieldName = 'D41'
    end
    object xVisitasPotencialesD42: TIntegerField
      DisplayLabel = ''
      FieldName = 'D42'
    end
    object xVisitasPotencialesD43: TIntegerField
      DisplayLabel = ''
      FieldName = 'D43'
    end
    object xVisitasPotencialesD44: TIntegerField
      DisplayLabel = ''
      FieldName = 'D44'
    end
    object xVisitasPotencialesD45: TIntegerField
      DisplayLabel = ''
      FieldName = 'D45'
    end
    object xVisitasPotencialesD46: TIntegerField
      DisplayLabel = ''
      FieldName = 'D46'
    end
    object xVisitasPotencialesD47: TIntegerField
      DisplayLabel = ''
      FieldName = 'D47'
    end
    object xVisitasPotencialesD48: TIntegerField
      FieldName = 'D48'
    end
    object xVisitasPotencialesD49: TIntegerField
      FieldName = 'D49'
    end
    object xVisitasPotencialesD50: TIntegerField
      FieldName = 'D50'
    end
    object xVisitasPotencialesD51: TIntegerField
      FieldName = 'D51'
    end
    object xVisitasPotencialesD52: TIntegerField
      FieldName = 'D52'
    end
    object xVisitasPotencialesD53: TIntegerField
      FieldName = 'D53'
    end
    object xVisitasPotencialesD54: TIntegerField
      FieldName = 'D54'
    end
    object xVisitasPotencialesD55: TIntegerField
      FieldName = 'D55'
    end
    object xVisitasPotencialesCLIENTE_POTENCIAL: TIntegerField
      DisplayLabel = 'Cliente Potencial'
      FieldName = 'CLIENTE_POTENCIAL'
    end
    object xVisitasPotencialesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
  end
  object DSVisitasPotenciales: TDataSource
    DataSet = xVisitasPotenciales
    Left = 144
    Top = 296
  end
  object frDBDVisitasPotenciales: TfrDBDataSet
    DataSet = xVisitasPotenciales
    Left = 256
    Top = 296
  end
end
