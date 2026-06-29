object DMCRM: TDMCRM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 309
  Top = 176
  Height = 259
  Width = 276
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 168
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
        'ANA,'
      
        '  CLIENTE_AUSENTE,CLIENTE_NUEVO,VISITA_EFECTUADA,AUSENTE,VOLVER,' +
        'ANULAR,VISITA_COMERCIAL,GESTION_DE_COBROS,ENTREGA_MATERIAL, CLIE' +
        'NTE_POTENCIAL)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?EJERCICIO,?USUARIO,?AGENTE,?TIT_AGENTE,?CLIENTE' +
        ',?TIT_CLIENTE,?INCIDENCIA,?FECHA,?FECHA_FUTURO,?TIPO,?TIT_TIPO,?' +
        'NOTAS,?RUTA,?SEMANA,'
      
        '   ?CLIENTE_AUSENTE,?CLIENTE_NUEVO,?VISITA_EFECTUADA,?AUSENTE,?V' +
        'OLVER,?ANULAR,?VISITA_COMERCIAL,?GESTION_DE_COBROS,?ENTREGA_MATE' +
        'RIAL,?CLIENTE_POTENCIAL)')
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
      'AGENTE=?AGENTE'
      'ORDER BY ID')
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
      '  ,CLIENTE_AUSENTE=?CLIENTE_AUSENTE'
      '  ,CLIENTE_NUEVO=?CLIENTE_NUEVO'
      '  ,VISITA_EFECTUADA=?VISITA_EFECTUADA'
      '  ,AUSENTE=?AUSENTE'
      '  ,VOLVER=?VOLVER'
      '  ,ANULAR=?ANULAR'
      '  ,VISITA_COMERCIAL=?VISITA_COMERCIAL'
      '  ,GESTION_DE_COBROS=?GESTION_DE_COBROS'
      '  ,ENTREGA_MATERIAL=?ENTREGA_MATERIAL'
      '  ,CLIENTE_POTENCIAL=?CLIENTE_POTENCIAL'
      'WHERE'
      '  ID=?ID ')
    AfterPost = xCRMAfterPost
    BeforePost = xCRMBeforePost
    OnNewRecord = xCRMNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CRM_CABECERA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
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
      OnChange = xCRMCLIENTEChange
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
    object xCRMTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xCRMCLIENTE_POTENCIAL: TIntegerField
      DisplayLabel = 'Cliente Potencial'
      FieldName = 'CLIENTE_POTENCIAL'
    end
  end
  object DSXCRM: TDataSource
    DataSet = xCRM
    Left = 96
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
    Left = 24
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
  object dsXSemana: TDataSource
    DataSet = xSemana
    Left = 96
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
      '  ,TARJETA=?TARJETA'
      '  ,EFECTIVO=?EFECTIVO'
      'WHERE'
      '  RUTA=?RUTA AND '
      '  SEMANA=?SEMANA AND '
      '  USUARIO=?USUARIO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterPost = xTotSemanaAfterPost
    ClavesPrimarias.Strings = (
      'RUTA '
      'SEMANA '
      'USUARIO '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_SEMANAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 104
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
      OnChange = xTotSemanaCambiaPrecio
    end
    object xTotSemanaGASOLINA: TFloatField
      DisplayLabel = 'Gasolina'
      FieldName = 'GASOLINA'
      OnChange = xTotSemanaCambiaPrecio
    end
    object xTotSemanaBILLETES: TFloatField
      DisplayLabel = 'Billetes'
      FieldName = 'BILLETES'
      OnChange = xTotSemanaCambiaPrecio
    end
    object xTotSemanaPEAJES: TFloatField
      DisplayLabel = 'Peajes'
      FieldName = 'PEAJES'
      OnChange = xTotSemanaCambiaPrecio
    end
    object xTotSemanaPARKING: TFloatField
      DisplayLabel = 'Parking'
      FieldName = 'PARKING'
      OnChange = xTotSemanaCambiaPrecio
    end
    object xTotSemanaTELEFONO: TFloatField
      DisplayLabel = 'Tel.'
      FieldName = 'TELEFONO'
      OnChange = xTotSemanaCambiaPrecio
    end
    object xTotSemanaHOTEL: TFloatField
      DisplayLabel = 'Hotel'
      FieldName = 'HOTEL'
      OnChange = xTotSemanaCambiaPrecio
    end
    object xTotSemanaCOMIDAS_VIAJE: TFloatField
      DisplayLabel = 'Comidas Viaje'
      FieldName = 'COMIDAS_VIAJE'
      OnChange = xTotSemanaCambiaPrecio
    end
    object xTotSemanaCOMIDAS_INVITACION: TFloatField
      DisplayLabel = 'Comidas Invitacion'
      FieldName = 'COMIDAS_INVITACION'
      OnChange = xTotSemanaCambiaPrecio
    end
    object xTotSemanaGASTOS_PEQUENOS: TFloatField
      DisplayLabel = 'Gastos Peq.'
      FieldName = 'GASTOS_PEQUENOS'
      OnChange = xTotSemanaCambiaPrecio
    end
    object xTotSemanaVARIOS: TFloatField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
      OnChange = xTotSemanaCambiaPrecio
    end
    object xTotSemanaTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xTotSemanaEFECTIVO: TFloatField
      DisplayLabel = 'Efectivo'
      FieldName = 'EFECTIVO'
      OnChange = xTotSemanaEFECTIVOChange
    end
    object xTotSemanaTARJETA: TFloatField
      DisplayLabel = 'Tarjeta'
      FieldName = 'TARJETA'
      OnChange = xTotSemanaTARJETAChange
    end
  end
  object DSxTotSemana: TDataSource
    DataSet = xTotSemana
    Left = 96
    Top = 104
  end
  object xVisitas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_VISITAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  RUTA=?old_RUTA AND '
      '  AGENTE=?old_AGENTE AND '
      '  EJERCICIO=?old_EJERCICIO ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_VISITAS'
      
        '  (EMPRESA,CLIENTE,TITULO,CODIGO_POSTAL,TITULO_LOCALIDAD,FRECUEN' +
        'CIA,VENTAS_2,VENTAS_1,VENTAS,PREVISION_VENTA,RUTA,CLIENTE_POTENC' +
        'IAL,AGENTE,D01,D02,D03,D04,D05,D06,D07,D08,D09,D10,D11,D12,D13,D' +
        '14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D' +
        '30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D43,D44,D45,D' +
        '46,D47,D48,D49,D50,D51,D52,D53,D54,D55,EJERCICIO)'
      'VALUES'
      
        '  (?EMPRESA,?CLIENTE,?TITULO,?CODIGO_POSTAL,?TITULO_LOCALIDAD,?F' +
        'RECUENCIA,?VENTAS_2,?VENTAS_1,?VENTAS,?PREVISION_VENTA,?RUTA,?CL' +
        'IENTE_POTENCIAL,?AGENTE,?D01,?D02,?D03,?D04,?D05,?D06,?D07,?D08,' +
        '?D09,?D10,?D11,?D12,?D13,?D14,?D15,?D16,?D17,?D18,?D19,?D20,?D21' +
        ',?D22,?D23,?D24,?D25,?D26,?D27,?D28,?D29,?D30,?D31,?D32,?D33,?D3' +
        '4,?D35,?D36,?D37,?D38,?D39,?D40,?D41,?D42,?D43,?D44,?D45,?D46,?D' +
        '47,?D48,?D49,?D50,?D51,?D52,?D53,?D54,?D55,?EJERCICIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_VISITAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE AND '
      '  RUTA=?RUTA AND '
      '  AGENTE=?AGENTE AND '
      '  EJERCICIO=?EJERCICIO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_VISITAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RUTA=?RUTA AND '
      '  AGENTE=?AGENTE AND '
      '  EJERCICIO=?EJERCICIO '
      'ORDER BY CODIGO_POSTAL,EMPRESA,CLIENTE'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_VISITAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,TITULO_LOCALIDAD=?TITULO_LOCALIDAD '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,VENTAS_2=?VENTAS_2 '
      '  ,VENTAS_1=?VENTAS_1 '
      '  ,VENTAS=?VENTAS '
      '  ,PREVISION_VENTA=?PREVISION_VENTA '
      '  ,CLIENTE_POTENCIAL=?CLIENTE_POTENCIAL '
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
      '  ,D30=?D30 '
      '  ,D31=?D31 '
      '  ,D32=?D32 '
      '  ,D33=?D33 '
      '  ,D34=?D34 '
      '  ,D35=?D35 '
      '  ,D36=?D36 '
      '  ,D37=?D37 '
      '  ,D38=?D38 '
      '  ,D39=?D39 '
      '  ,D40=?D40 '
      '  ,D41=?D41 '
      '  ,D42=?D42 '
      '  ,D43=?D43 '
      '  ,D44=?D44 '
      '  ,D45=?D45 '
      '  ,D46=?D46 '
      '  ,D47=?D47 '
      '  ,D48=?D48 '
      '  ,D49=?D49 '
      '  ,D50=?D50 '
      '  ,D51=?D51 '
      '  ,D52=?D52 '
      '  ,D53=?D53 '
      '  ,D54=?D54 '
      '  ,D55=?D55 '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE AND '
      '  RUTA=?RUTA AND '
      '  AGENTE=?AGENTE AND '
      '  EJERCICIO=?EJERCICIO ')
    AfterPost = xVisitasAfterPost
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CLIENTE '
      'RUTA '
      'AGENTE '
      'EJERCICIO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_VISITAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 152
    object xVisitasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ReadOnly = True
    end
    object xVisitasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ReadOnly = True
    end
    object xVisitasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      ReadOnly = True
      Size = 60
    end
    object xVisitasCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'C.P.'
      FieldName = 'CODIGO_POSTAL'
      ReadOnly = True
      Size = 10
    end
    object xVisitasTITULO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TITULO_LOCALIDAD'
      ReadOnly = True
      Size = 40
    end
    object xVisitasFRECUENCIA: TIntegerField
      DisplayLabel = 'Frec.'
      FieldName = 'FRECUENCIA'
      ReadOnly = True
    end
    object xVisitasVENTAS_2: TFloatField
      DisplayLabel = 'Vtas. 2'
      FieldName = 'VENTAS_2'
      ReadOnly = True
    end
    object xVisitasVENTAS_1: TFloatField
      DisplayLabel = 'Vtas. 1'
      FieldName = 'VENTAS_1'
      ReadOnly = True
    end
    object xVisitasVENTAS: TFloatField
      DisplayLabel = 'Ventas'
      FieldName = 'VENTAS'
      ReadOnly = True
    end
    object xVisitasPREVISION_VENTA: TFloatField
      DisplayLabel = 'Prev. Vtas.'
      FieldName = 'PREVISION_VENTA'
      ReadOnly = True
    end
    object xVisitasRUTA: TIntegerField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
      ReadOnly = True
    end
    object xVisitasCLIENTE_POTENCIAL: TIntegerField
      DisplayLabel = 'Cli.Pot.'
      FieldName = 'CLIENTE_POTENCIAL'
      ReadOnly = True
    end
    object xVisitasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
      ReadOnly = True
    end
    object xVisitasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
      ReadOnly = True
    end
    object xVisitasD01: TIntegerField
      DisplayLabel = ''
      FieldName = 'D01'
    end
    object xVisitasD02: TIntegerField
      DisplayLabel = ''
      FieldName = 'D02'
    end
    object xVisitasD03: TIntegerField
      DisplayLabel = ''
      FieldName = 'D03'
    end
    object xVisitasD04: TIntegerField
      DisplayLabel = ''
      FieldName = 'D04'
    end
    object xVisitasD05: TIntegerField
      DisplayLabel = ''
      FieldName = 'D05'
    end
    object xVisitasD06: TIntegerField
      DisplayLabel = ''
      FieldName = 'D06'
    end
    object xVisitasD07: TIntegerField
      DisplayLabel = ''
      FieldName = 'D07'
    end
    object xVisitasD08: TIntegerField
      DisplayLabel = ''
      FieldName = 'D08'
    end
    object xVisitasD09: TIntegerField
      DisplayLabel = ''
      FieldName = 'D09'
    end
    object xVisitasD10: TIntegerField
      DisplayLabel = ''
      FieldName = 'D10'
    end
    object xVisitasD11: TIntegerField
      DisplayLabel = ''
      FieldName = 'D11'
    end
    object xVisitasD12: TIntegerField
      DisplayLabel = ''
      FieldName = 'D12'
    end
    object xVisitasD13: TIntegerField
      DisplayLabel = ''
      FieldName = 'D13'
    end
    object xVisitasD14: TIntegerField
      DisplayLabel = ''
      FieldName = 'D14'
    end
    object xVisitasD15: TIntegerField
      DisplayLabel = ''
      FieldName = 'D15'
    end
    object xVisitasD16: TIntegerField
      DisplayLabel = ''
      FieldName = 'D16'
    end
    object xVisitasD17: TIntegerField
      DisplayLabel = ''
      FieldName = 'D17'
    end
    object xVisitasD18: TIntegerField
      DisplayLabel = ''
      FieldName = 'D18'
    end
    object xVisitasD19: TIntegerField
      DisplayLabel = ''
      FieldName = 'D19'
    end
    object xVisitasD20: TIntegerField
      DisplayLabel = ''
      FieldName = 'D20'
    end
    object xVisitasD21: TIntegerField
      DisplayLabel = ''
      FieldName = 'D21'
    end
    object xVisitasD22: TIntegerField
      DisplayLabel = ''
      FieldName = 'D22'
    end
    object xVisitasD23: TIntegerField
      DisplayLabel = ''
      FieldName = 'D23'
    end
    object xVisitasD24: TIntegerField
      DisplayLabel = ''
      FieldName = 'D24'
    end
    object xVisitasD25: TIntegerField
      DisplayLabel = ''
      FieldName = 'D25'
    end
    object xVisitasD26: TIntegerField
      DisplayLabel = ''
      FieldName = 'D26'
    end
    object xVisitasD27: TIntegerField
      DisplayLabel = ''
      FieldName = 'D27'
    end
    object xVisitasD28: TIntegerField
      DisplayLabel = ''
      FieldName = 'D28'
    end
    object xVisitasD29: TIntegerField
      DisplayLabel = ''
      FieldName = 'D29'
    end
    object xVisitasD30: TIntegerField
      DisplayLabel = ''
      FieldName = 'D30'
    end
    object xVisitasD31: TIntegerField
      DisplayLabel = ''
      FieldName = 'D31'
    end
    object xVisitasD32: TIntegerField
      DisplayLabel = ''
      FieldName = 'D32'
    end
    object xVisitasD33: TIntegerField
      DisplayLabel = ''
      FieldName = 'D33'
    end
    object xVisitasD34: TIntegerField
      DisplayLabel = ''
      FieldName = 'D34'
    end
    object xVisitasD35: TIntegerField
      DisplayLabel = ''
      FieldName = 'D35'
    end
    object xVisitasD36: TIntegerField
      DisplayLabel = ''
      FieldName = 'D36'
    end
    object xVisitasD37: TIntegerField
      DisplayLabel = ''
      FieldName = 'D37'
    end
    object xVisitasD38: TIntegerField
      DisplayLabel = ''
      FieldName = 'D38'
    end
    object xVisitasD39: TIntegerField
      DisplayLabel = ''
      FieldName = 'D39'
    end
    object xVisitasD40: TIntegerField
      DisplayLabel = ''
      FieldName = 'D40'
    end
    object xVisitasD41: TIntegerField
      DisplayLabel = ''
      FieldName = 'D41'
    end
    object xVisitasD42: TIntegerField
      DisplayLabel = ''
      FieldName = 'D42'
    end
    object xVisitasD43: TIntegerField
      DisplayLabel = ''
      FieldName = 'D43'
    end
    object xVisitasD44: TIntegerField
      DisplayLabel = ''
      FieldName = 'D44'
    end
    object xVisitasD45: TIntegerField
      DisplayLabel = ''
      FieldName = 'D45'
    end
    object xVisitasD46: TIntegerField
      DisplayLabel = ''
      FieldName = 'D46'
    end
    object xVisitasD47: TIntegerField
      DisplayLabel = ''
      FieldName = 'D47'
    end
    object xVisitasD48: TIntegerField
      DisplayLabel = ''
      FieldName = 'D48'
    end
    object xVisitasD49: TIntegerField
      DisplayLabel = ''
      FieldName = 'D49'
    end
    object xVisitasD50: TIntegerField
      DisplayLabel = ''
      FieldName = 'D50'
    end
    object xVisitasD51: TIntegerField
      DisplayLabel = ''
      FieldName = 'D51'
    end
    object xVisitasD52: TIntegerField
      DisplayLabel = ''
      FieldName = 'D52'
    end
    object xVisitasD53: TIntegerField
      DisplayLabel = ''
      FieldName = 'D53'
    end
    object xVisitasD54: TIntegerField
      DisplayLabel = ''
      FieldName = 'D54'
    end
    object xVisitasD55: TIntegerField
      DisplayLabel = ''
      FieldName = 'D55'
    end
  end
  object DSVisitas: TDataSource
    DataSet = xVisitas
    Left = 96
    Top = 152
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 220
    Top = 8
  end
end
