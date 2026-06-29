object DMAlarmasIberfluidKri: TDMAlarmasIberfluidKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 694
  Top = 101
  Height = 305
  Width = 282
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 218
    Top = 15
  end
  object xAlarmaVerde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT A.ID_E, A.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE,' +
        ' C.TIPO,C.RIG,'
      
        'C.ALMACEN, C.MONEDA, C.S_BASES, C.LIQUIDO, C.SU_REFERENCIA, C.FE' +
        'CHA, C.FECHA_ENTREGA,'
      
        'P.TERCERO, P.PROVEEDOR, T.NOMBRE_R_SOCIAL, P.FECHA_ENTREGA AS FE' +
        'CHA_ENTREGA_PED,'
      
        'P.FECHA_PRE_CAB, P.FECHA_REC_CAB, P.FECHA_CONFIRMADA_KRI, P.PLAZ' +
        'O_INICIAL_KRI,'
      
        'P.PLAZO_CONFIRM_KRI, V.EJERCICIO AS EJERCICIO_PED, V.SERIE AS SE' +
        'RIE_PED, V.RIG AS RIG_PED'
      'FROM KRI_ALARMAS_IBERFLUID (?EMPRESA, ?FECHA, ?TIPO) A'
      'JOIN GES_CABECERAS_E C ON A.ID_E = C.ID_E'
      'JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'JOIN GES_CABECERAS_S V ON A.ID_S = V.ID_S'
      'WHERE'
      'A.FECHA_RESULTADO >= ?DESDE_FECHA'
      'AND C.SERIE=?SERIE'
      'AND P.PROVEEDOR =?PROVEEDOR'
      'ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG')
    UniDirectional = False
    Left = 32
    Top = 16
    object xAlarmaVerdeID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xAlarmaVerdeID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xAlarmaVerdeEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAlarmaVerdeEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object xAlarmaVerdeCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAlarmaVerdeSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xAlarmaVerdeTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAlarmaVerdeRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xAlarmaVerdeALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlarmaVerdeMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xAlarmaVerdeS_BASES: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'S_BASES'
    end
    object xAlarmaVerdeLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xAlarmaVerdeSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xAlarmaVerdeFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVerdeFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entr.'
      FieldName = 'FECHA_ENTREGA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVerdeTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xAlarmaVerdePROVEEDOR: TIntegerField
      DisplayLabel = 'Prov.'
      FieldName = 'PROVEEDOR'
    end
    object xAlarmaVerdeFECHA_ENTREGA_PED: TDateTimeField
      DisplayLabel = 'Fecha Ent. Ped.'
      FieldName = 'FECHA_ENTREGA_PED'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVerdeFECHA_PRE_CAB: TDateTimeField
      DisplayLabel = 'Fecha Prev.'
      FieldName = 'FECHA_PRE_CAB'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVerdeFECHA_REC_CAB: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_CAB'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVerdeFECHA_CONFIRMADA_KRI: TDateTimeField
      DisplayLabel = 'Fec. Conf.'
      FieldName = 'FECHA_CONFIRMADA_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVerdePLAZO_INICIAL_KRI: TDateTimeField
      DisplayLabel = 'Plazo Ini.'
      FieldName = 'PLAZO_INICIAL_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVerdePLAZO_CONFIRM_KRI: TDateTimeField
      DisplayLabel = 'Plazo Conf.'
      FieldName = 'PLAZO_CONFIRM_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVerdeNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xAlarmaVerdeEJERCICIO_PED: TIntegerField
      DisplayLabel = 'Ejer. Cli.'
      FieldName = 'EJERCICIO_PED'
    end
    object xAlarmaVerdeSERIE_PED: TFIBStringField
      DisplayLabel = 'Serie Cli.'
      FieldName = 'SERIE_PED'
      Size = 10
    end
    object xAlarmaVerdeRIG_PED: TIntegerField
      DisplayLabel = 'Nro. Doc. Cli.'
      FieldName = 'RIG_PED'
    end
  end
  object DSxAlarmaVerde: TDataSource
    DataSet = xAlarmaVerde
    Left = 128
    Top = 16
  end
  object xAlarmaAmarilla: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT A.ID_E, A.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE,' +
        ' C.TIPO,C.RIG,'
      
        'C.ALMACEN, C.MONEDA, C.S_BASES, C.LIQUIDO, C.SU_REFERENCIA, C.FE' +
        'CHA, C.FECHA_ENTREGA,'
      
        'P.TERCERO, P.PROVEEDOR, T.NOMBRE_R_SOCIAL, P.FECHA_ENTREGA AS FE' +
        'CHA_ENTREGA_PED,'
      
        'P.FECHA_PRE_CAB, P.FECHA_REC_CAB, P.FECHA_CONFIRMADA_KRI, P.PLAZ' +
        'O_INICIAL_KRI,'
      
        'P.PLAZO_CONFIRM_KRI, V.EJERCICIO AS EJERCICIO_PED, V.SERIE AS SE' +
        'RIE_PED, V.RIG AS RIG_PED'
      'FROM KRI_ALARMAS_IBERFLUID (?EMPRESA, ?FECHA, ?TIPO) A'
      'JOIN GES_CABECERAS_E C ON A.ID_E = C.ID_E'
      'JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'JOIN GES_CABECERAS_S V ON A.ID_S = V.ID_S'
      'WHERE'
      'A.FECHA_RESULTADO >= ?DESDE_FECHA'
      'AND C.SERIE=?SERIE'
      'AND P.PROVEEDOR =?PROVEEDOR'
      'ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG'
      '')
    UniDirectional = False
    Left = 32
    Top = 64
    object xAlarmaAmarillaID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xAlarmaAmarillaID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xAlarmaAmarillaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAlarmaAmarillaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object xAlarmaAmarillaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAlarmaAmarillaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xAlarmaAmarillaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAlarmaAmarillaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xAlarmaAmarillaALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlarmaAmarillaMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xAlarmaAmarillaS_BASES: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'S_BASES'
    end
    object xAlarmaAmarillaLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xAlarmaAmarillaSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xAlarmaAmarillaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaAmarillaFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entr.'
      FieldName = 'FECHA_ENTREGA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaAmarillaTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xAlarmaAmarillaPROVEEDOR: TIntegerField
      DisplayLabel = 'Prov.'
      FieldName = 'PROVEEDOR'
    end
    object xAlarmaAmarillaFECHA_ENTREGA_PED: TDateTimeField
      DisplayLabel = 'Fec. Entr. Ped.'
      FieldName = 'FECHA_ENTREGA_PED'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaAmarillaFECHA_PRE_CAB: TDateTimeField
      DisplayLabel = 'Fecha Prev.'
      FieldName = 'FECHA_PRE_CAB'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaAmarillaFECHA_REC_CAB: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_CAB'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaAmarillaFECHA_CONFIRMADA_KRI: TDateTimeField
      DisplayLabel = 'Fec. Conf.'
      FieldName = 'FECHA_CONFIRMADA_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaAmarillaPLAZO_INICIAL_KRI: TDateTimeField
      DisplayLabel = 'Plazo Ini.'
      FieldName = 'PLAZO_INICIAL_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaAmarillaPLAZO_CONFIRM_KRI: TDateTimeField
      DisplayLabel = 'Plazo Conf.'
      FieldName = 'PLAZO_CONFIRM_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaAmarillaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xAlarmaAmarillaEJERCICIO_PED: TIntegerField
      DisplayLabel = 'Ejer. Cli.'
      FieldName = 'EJERCICIO_PED'
    end
    object xAlarmaAmarillaSERIE_PED: TFIBStringField
      DisplayLabel = 'Serie Cli.'
      FieldName = 'SERIE_PED'
      Size = 10
    end
    object xAlarmaAmarillaRIG_PED: TIntegerField
      DisplayLabel = 'Nro. Doc. Cli.'
      FieldName = 'RIG_PED'
    end
  end
  object DSxAlarmaAmarilla: TDataSource
    DataSet = xAlarmaAmarilla
    Left = 128
    Top = 64
  end
  object xAlarmaRoja: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT A.ID_E, A.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE,' +
        ' C.TIPO,C.RIG,'
      
        'C.ALMACEN, C.MONEDA, C.S_BASES, C.LIQUIDO, C.SU_REFERENCIA, C.FE' +
        'CHA, C.FECHA_ENTREGA,'
      
        'P.TERCERO, P.PROVEEDOR, T.NOMBRE_R_SOCIAL, P.FECHA_ENTREGA AS FE' +
        'CHA_ENTREGA_PED,'
      
        'P.FECHA_PRE_CAB, P.FECHA_REC_CAB, P.FECHA_CONFIRMADA_KRI, P.PLAZ' +
        'O_INICIAL_KRI,'
      
        'P.PLAZO_CONFIRM_KRI, V.EJERCICIO AS EJERCICIO_PED, V.SERIE AS SE' +
        'RIE_PED, V.RIG AS RIG_PED'
      'FROM KRI_ALARMAS_IBERFLUID (?EMPRESA, ?FECHA, ?TIPO) A'
      'JOIN GES_CABECERAS_E C ON A.ID_E = C.ID_E'
      'JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'JOIN GES_CABECERAS_S V ON A.ID_S = V.ID_S'
      'WHERE'
      'A.FECHA_RESULTADO >= ?DESDE_FECHA'
      'AND C.SERIE=?SERIE'
      'AND P.PROVEEDOR =?PROVEEDOR'
      'ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG'
      '')
    UniDirectional = False
    Left = 32
    Top = 112
    object xAlarmaRojaID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xAlarmaRojaID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xAlarmaRojaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAlarmaRojaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object xAlarmaRojaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAlarmaRojaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xAlarmaRojaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAlarmaRojaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xAlarmaRojaALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlarmaRojaMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xAlarmaRojaS_BASES: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'S_BASES'
    end
    object xAlarmaRojaLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xAlarmaRojaSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xAlarmaRojaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaRojaFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entr.'
      FieldName = 'FECHA_ENTREGA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaRojaTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xAlarmaRojaPROVEEDOR: TIntegerField
      DisplayLabel = 'Prov.'
      FieldName = 'PROVEEDOR'
    end
    object xAlarmaRojaFECHA_ENTREGA_PED: TDateTimeField
      DisplayLabel = 'Fec. Ent. Prev.'
      FieldName = 'FECHA_ENTREGA_PED'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaRojaFECHA_PRE_CAB: TDateTimeField
      DisplayLabel = 'Fecha Prev.'
      FieldName = 'FECHA_PRE_CAB'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaRojaFECHA_REC_CAB: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_CAB'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaRojaFECHA_CONFIRMADA_KRI: TDateTimeField
      DisplayLabel = 'Fec. Conf.'
      FieldName = 'FECHA_CONFIRMADA_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaRojaPLAZO_INICIAL_KRI: TDateTimeField
      DisplayLabel = 'Plazo Ini.'
      FieldName = 'PLAZO_INICIAL_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaRojaPLAZO_CONFIRM_KRI: TDateTimeField
      DisplayLabel = 'Plazo Conf.'
      FieldName = 'PLAZO_CONFIRM_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaRojaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xAlarmaRojaEJERCICIO_PED: TIntegerField
      DisplayLabel = 'Ejer. Cli.'
      FieldName = 'EJERCICIO_PED'
    end
    object xAlarmaRojaSERIE_PED: TFIBStringField
      DisplayLabel = 'Serie Cli.'
      FieldName = 'SERIE_PED'
      Size = 10
    end
    object xAlarmaRojaRIG_PED: TIntegerField
      DisplayLabel = 'Nro. Doc. Cli.'
      FieldName = 'RIG_PED'
    end
  end
  object DSxAlarmaRoja: TDataSource
    DataSet = xAlarmaRoja
    Left = 128
    Top = 112
  end
  object xAlarmaVioleta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT A.ID_E, A.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE,' +
        ' C.TIPO,C.RIG,'
      
        'C.ALMACEN, C.MONEDA, C.S_BASES, C.LIQUIDO, C.SU_REFERENCIA, C.FE' +
        'CHA, C.FECHA_ENTREGA,'
      
        'P.TERCERO, P.PROVEEDOR, T.NOMBRE_R_SOCIAL, P.FECHA_ENTREGA AS FE' +
        'CHA_ENTREGA_PED,'
      
        'P.FECHA_PRE_CAB, P.FECHA_REC_CAB, P.FECHA_CONFIRMADA_KRI, P.PLAZ' +
        'O_INICIAL_KRI,'
      
        'P.PLAZO_CONFIRM_KRI, V.EJERCICIO AS EJERCICIO_PED, V.SERIE AS SE' +
        'RIE_PED, V.RIG AS RIG_PED'
      'FROM KRI_ALARMAS_IBERFLUID (?EMPRESA, ?FECHA, ?TIPO) A'
      'JOIN GES_CABECERAS_E C ON A.ID_E = C.ID_E'
      'JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'JOIN GES_CABECERAS_S V ON A.ID_S = V.ID_S'
      'WHERE'
      'A.FECHA_RESULTADO >= ?DESDE_FECHA'
      'AND C.SERIE=?SERIE'
      'AND P.PROVEEDOR =?PROVEEDOR'
      'ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG'
      '')
    UniDirectional = False
    Left = 32
    Top = 160
    object xAlarmaVioletaID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xAlarmaVioletaID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xAlarmaVioletaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAlarmaVioletaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object xAlarmaVioletaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAlarmaVioletaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xAlarmaVioletaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAlarmaVioletaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xAlarmaVioletaALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlarmaVioletaMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xAlarmaVioletaS_BASES: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'S_BASES'
    end
    object xAlarmaVioletaLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xAlarmaVioletaSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xAlarmaVioletaFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entr.'
      FieldName = 'FECHA_ENTREGA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVioletaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVioletaTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xAlarmaVioletaPROVEEDOR: TIntegerField
      DisplayLabel = 'Prov.'
      FieldName = 'PROVEEDOR'
    end
    object xAlarmaVioletaFECHA_ENTREGA_PED: TDateTimeField
      DisplayLabel = 'Fec. Ent.'
      FieldName = 'FECHA_ENTREGA_PED'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVioletaFECHA_PRE_CAB: TDateTimeField
      DisplayLabel = 'Fecha Prev.'
      FieldName = 'FECHA_PRE_CAB'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVioletaFECHA_REC_CAB: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_CAB'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVioletaFECHA_CONFIRMADA_KRI: TDateTimeField
      DisplayLabel = 'Fec. Conf.'
      FieldName = 'FECHA_CONFIRMADA_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVioletaPLAZO_INICIAL_KRI: TDateTimeField
      DisplayLabel = 'Plazo Ini.'
      FieldName = 'PLAZO_INICIAL_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVioletaPLAZO_CONFIRM_KRI: TDateTimeField
      DisplayLabel = 'Plazo Conf.'
      FieldName = 'PLAZO_CONFIRM_KRI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xAlarmaVioletaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xAlarmaVioletaEJERCICIO_PED: TIntegerField
      DisplayLabel = 'Ejer. Cli.'
      FieldName = 'EJERCICIO_PED'
    end
    object xAlarmaVioletaSERIE_PED: TFIBStringField
      DisplayLabel = 'Serie Cli.'
      FieldName = 'SERIE_PED'
      Size = 10
    end
    object xAlarmaVioletaRIG_PED: TIntegerField
      DisplayLabel = 'Nro. Doc. Cli.'
      FieldName = 'RIG_PED'
    end
  end
  object DSxAlarmaVioleta: TDataSource
    DataSet = xAlarmaVioleta
    Left = 128
    Top = 160
  end
end
