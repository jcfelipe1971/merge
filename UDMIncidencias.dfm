object DMIncidencias: TDMIncidencias
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 720
  Top = 190
  Height = 386
  Width = 340
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 208
    Top = 8
  end
  object QMIncidencias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_INCIDENCIAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  INCIDENCIA=?old_INCIDENCIA AND '
      '  TIPO_TERCERO=?old_TIPO_TERCERO AND '
      '  COD_CLI_PRO=?old_COD_CLI_PRO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_INCIDENCIAS'
      '  (EMPRESA,INCIDENCIA,TITULO_INCIDENCIA,FECHA,FECHA_RECEPCION,'
      
        '  TIPO_TERCERO,COD_CLI_PRO,TERCERO,TITULO_TERCERO,DATOS_INCIDENC' +
        'IA,'
      
        '  FECHA_RESPUESTA,RESPUESTA_INCIDENCIA,ID_S,ID_E,DOC_RIG,DOC_EJE' +
        'RCICIO,'
      '   DOC_SERIE,DOC_CANAL,DOC_TIPO,ENTRADA,DIRECCION,AGENTE,'
      
        '   CONTACTO,CONTACTO2,CONTACTO3,TIPO_INCIDENCIA_KRI,HORAS,FINALI' +
        'ZADO)'
      'VALUES'
      
        '  (?EMPRESA,?INCIDENCIA,?TITULO_INCIDENCIA,?FECHA,?FECHA_RECEPCI' +
        'ON,'
      
        '  ?TIPO_TERCERO,?COD_CLI_PRO,?TERCERO,?TITULO_TERCERO,?DATOS_INC' +
        'IDENCIA,'
      
        '  ?FECHA_RESPUESTA,?RESPUESTA_INCIDENCIA,?ID_S,?ID_E,?DOC_RIG,?D' +
        'OC_EJERCICIO,'
      '   ?DOC_SERIE,?DOC_CANAL,?DOC_TIPO,?ENTRADA,?DIRECCION,?AGENTE,'
      
        '   ?CONTACTO,?CONTACTO2,?CONTACTO3,?TIPO_INCIDENCIA_KRI,?HORAS,?' +
        'FINALIZADO)'
      '')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_INCIDENCIAS'
      'WHERE'
      '   EMPRESA=?EMPRESA AND '
      '   INCIDENCIA=?INCIDENCIA AND '
      '   TIPO_TERCERO=?TIPO_TERCERO AND '
      '   COD_CLI_PRO=?COD_CLI_PRO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_INCIDENCIAS'
      ' WHERE EMPRESA = ?EMPRESA AND'
      '                TIPO_TERCERO = ?TIPO_TERCERO AND '
      '                COD_CLI_PRO=?COD_CLI_PRO'
      'ORDER BY INCIDENCIA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_INCIDENCIAS'
      'SET'
      '  TITULO_INCIDENCIA=?TITULO_INCIDENCIA '
      '  ,FECHA=?FECHA '
      '  ,FECHA_RECEPCION=?FECHA_RECEPCION '
      '  ,TERCERO=?TERCERO '
      '  ,TITULO_TERCERO=?TITULO_TERCERO '
      '  ,DATOS_INCIDENCIA=?DATOS_INCIDENCIA '
      '  ,FECHA_RESPUESTA=?FECHA_RESPUESTA '
      '  ,RESPUESTA_INCIDENCIA=?RESPUESTA_INCIDENCIA '
      '  ,ID_S=?ID_S '
      '  ,ID_E=?ID_E'
      '  ,DOC_EJERCICIO=?DOC_EJERCICIO'
      '  ,DOC_SERIE=?DOC_SERIE'
      '  ,DOC_CANAL=?DOC_CANAL'
      '  ,DOC_TIPO=?DOC_TIPO'
      '  ,DOC_RIG=?DOC_RIG'
      '  ,ENTRADA=?ENTRADA'
      '  ,DIRECCION=?DIRECCION'
      '  ,AGENTE=?AGENTE'
      '  ,CONTACTO=?CONTACTO'
      '  ,CONTACTO2=?CONTACTO2'
      '  ,CONTACTO3=?CONTACTO3'
      '  ,TIPO_INCIDENCIA_KRI=?TIPO_INCIDENCIA_KRI'
      '  ,HORAS=?HORAS'
      '  ,FINALIZADO=?FINALIZADO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  INCIDENCIA=?INCIDENCIA AND '
      '  TIPO_TERCERO=?TIPO_TERCERO AND '
      '  COD_CLI_PRO=?COD_CLI_PRO ')
    AfterDelete = Graba
    AfterOpen = QMIncidenciasAfterOpen
    AfterPost = Graba
    AfterScroll = QMIncidenciasAfterScroll
    BeforeDelete = QMIncidenciasBeforeDelete
    BeforePost = QMIncidenciasBeforePost
    BeforeScroll = QMIncidenciasBeforeScroll
    OnNewRecord = QMIncidenciasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'INCIDENCIA '
      'TIPO_TERCERO '
      'COD_CLI_PRO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_INCIDENCIAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMIncidenciasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMIncidenciasINCIDENCIA: TIntegerField
      DisplayLabel = 'Incidencia'
      FieldName = 'INCIDENCIA'
    end
    object QMIncidenciasTITULO_INCIDENCIA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_INCIDENCIA'
      Size = 60
    end
    object QMIncidenciasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMIncidenciasFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fecha Recepci'#243'n'
      FieldName = 'FECHA_RECEPCION'
    end
    object QMIncidenciasTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo Ter.'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object QMIncidenciasCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
      OnChange = QMIncidenciasCOD_CLI_PROChange
    end
    object QMIncidenciasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMIncidenciasTERCEROChange
    end
    object QMIncidenciasTITULO_TERCERO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_TERCERO'
      Size = 60
    end
    object QMIncidenciasDATOS_INCIDENCIA: TBlobField
      DisplayLabel = 'Datos Incidencia'
      FieldName = 'DATOS_INCIDENCIA'
      Size = 8
    end
    object QMIncidenciasFECHA_RESPUESTA: TDateTimeField
      DisplayLabel = 'Fec. Respuesta'
      FieldName = 'FECHA_RESPUESTA'
    end
    object QMIncidenciasRESPUESTA_INCIDENCIA: TBlobField
      DisplayLabel = 'Respuesta'
      FieldName = 'RESPUESTA_INCIDENCIA'
      Size = 8
    end
    object QMIncidenciasID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMIncidenciasID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object QMIncidenciasDOC_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejer. Doc.'
      FieldName = 'DOC_EJERCICIO'
    end
    object QMIncidenciasDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      OnChange = QMIncidenciasDOC_SERIEChange
      Size = 10
    end
    object QMIncidenciasDOC_CANAL: TIntegerField
      DisplayLabel = 'Canal Doc.'
      FieldName = 'DOC_CANAL'
      OnChange = QMIncidenciasDOC_CANALChange
    end
    object QMIncidenciasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      OnChange = QMIncidenciasDOC_TIPOChange
      Size = 3
    end
    object QMIncidenciasDOC_RIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_RIG'
    end
    object QMIncidenciasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMIncidenciasDIRECCION: TIntegerField
      DisplayLabel = 'Dir.'
      FieldName = 'DIRECCION'
      OnChange = QMIncidenciasDIRECCIONChange
    end
    object QMIncidenciasDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Dir. Nombre'
      FieldName = 'DIR_NOMBRE'
      Size = 76
    end
    object QMIncidenciasAGENTE: TIntegerField
      DisplayLabel = 'Age.'
      FieldName = 'AGENTE'
      OnChange = QMIncidenciasAGENTEChange
    end
    object QMIncidenciasCONTACTO: TIntegerField
      DisplayLabel = 'Cont.'
      FieldName = 'CONTACTO'
      OnChange = QMIncidenciasCONTACTOChange
    end
    object QMIncidenciasTIT_CONTACTO: TFIBStringField
      DisplayLabel = 'Tit. Contacto'
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object QMIncidenciasCONTACTO2: TIntegerField
      DisplayLabel = 'Cont. 2'
      FieldName = 'CONTACTO2'
      OnChange = QMIncidenciasCONTACTO2Change
    end
    object QMIncidenciasTIT_CONTACTO2: TFIBStringField
      DisplayLabel = 'Tit. Contacto 2'
      FieldName = 'TIT_CONTACTO2'
      Size = 81
    end
    object QMIncidenciasCONTACTO3: TIntegerField
      DisplayLabel = 'Cont. 3'
      FieldName = 'CONTACTO3'
      OnChange = QMIncidenciasCONTACTO3Change
    end
    object QMIncidenciasTIT_CONTACTO3: TFIBStringField
      DisplayLabel = 'Tit. Contacto 3'
      FieldName = 'TIT_CONTACTO3'
      Size = 81
    end
    object QMIncidenciasTIT_AGENTE: TFIBStringField
      DisplayLabel = 'Tit. Agente'
      FieldName = 'TIT_AGENTE'
      Size = 60
    end
    object QMIncidenciasTIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_INCIDENCIA_KRI'
      OnChange = QMIncidenciasTIPO_INCIDENCIA_KRIChange
      Size = 3
    end
    object QMIncidenciasTIT_TIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Tipo Incidencia'
      FieldName = 'TIT_TIPO_INCIDENCIA_KRI'
      Size = 40
    end
    object QMIncidenciasUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMIncidenciasNOMBRE_USUARIO: TFIBStringField
      DisplayLabel = 'Nomb. Usu.'
      FieldName = 'NOMBRE_USUARIO'
      Size = 31
    end
    object QMIncidenciasFINALIZADO: TIntegerField
      DisplayLabel = 'Finalizado'
      FieldName = 'FINALIZADO'
    end
    object QMIncidenciasHORAS: TFloatField
      DisplayLabel = 'Horas Dec.'
      FieldName = 'HORAS'
    end
    object QMIncidenciasHORASEDIT: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Horas'
      FieldKind = fkCalculated
      FieldName = 'HORASEDIT'
      OnChange = QMIncidenciasHORASEDITChange
      OnGetText = QMIncidenciasHORASEDITGetText
      Size = 10
      Calculated = True
    end
  end
  object DSQMIncidencias: TDataSource
    DataSet = QMIncidencias
    Left = 128
    Top = 16
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 224
    Top = 88
  end
  object xTipoMov: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_MOVIMIENTO'
      '  WHERE TIPO = ?DOC_TIPO')
    UniDirectional = False
    DataSource = DSQMIncidencias
    Left = 32
    Top = 64
    object xTipoMovTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTipoMov: TDataSource
    DataSet = xTipoMov
    Left = 128
    Top = 64
  end
  object xSerie: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM GEN_SERIES '
      '   WHERE SERIE = ?DOC_SERIE')
    UniDirectional = False
    DataSource = DSQMIncidencias
    Left = 32
    Top = 112
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxSerie: TDataSource
    DataSet = xSerie
    Left = 128
    Top = 112
  end
  object xCanal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM GEN_CANALES'
      '   WHERE CANAL = ?DOC_CANAL')
    UniDirectional = False
    DataSource = DSQMIncidencias
    Left = 32
    Top = 160
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxCanal: TDataSource
    DataSet = xCanal
    Left = 128
    Top = 160
  end
  object xUsuarios: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select usuario,nombre from sys_usuarios usr'
      'join sys_entradas ent'
      'on (usr.usuario=ent.usuario)'
      'where entrada=?entrada'
      '')
    UniDirectional = False
    DataSource = DSQMIncidencias
    Left = 32
    Top = 208
    object xUsuariosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
    object xUsuariosUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
  end
  object DSxUsuarios: TDataSource
    DataSet = xUsuarios
    Left = 128
    Top = 208
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 8
  end
  object xVentas: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ges_cabeceras_s'
      'where '
      'empresa=:empresa and'
      '(tipo='#39'OFC'#39' or tipo='#39'PEC'#39') and'
      'cliente=:COD_CLI_PRO and'
      '((DIRECCION=?DIRECCION) or (?DIRECCION=0))'
      'order by fecha desc')
    UniDirectional = False
    AfterOpen = xVentasAfterOpen
    BeforeClose = xVentasBeforeClose
    Opciones = []
    AutoSQLdeVistas = False
    Left = 32
    Top = 256
    object xVentasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVentasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVentasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVentasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVentasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xVentasALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xVentasMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xVentasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xVentasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xVentasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xVentasDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xVentasSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xVentasFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xVentasCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object xVentasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xVentasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xVentasBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xVentasLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xVentasBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xVentasI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Linea'
      FieldName = 'I_DTO_LINEAS'
    end
    object xVentasS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xVentasM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xVentasC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
    end
    object xVentasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xVentasS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xVentasS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object xVentasB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lin.'
      FieldName = 'B_DTO_LINEAS'
    end
    object xVentasDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object xVentasDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DTO_CIAL'
    end
    object xVentasB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object xVentasI_COMISION: TFloatField
      DisplayLabel = 'Imp. Com.'
      FieldName = 'I_COMISION'
    end
    object xVentasPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Finan.'
      FieldName = 'POR_FINANCIACION'
    end
    object xVentasI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Finan.'
      FieldName = 'I_FINANCIACION'
    end
    object xVentasLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xVentasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xVentasPROCESO_AUTO: TIntegerField
      DisplayLabel = 'Proc. Auto'
      FieldName = 'PROCESO_AUTO'
    end
    object xVentasI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. P.P.'
      FieldName = 'I_DTO_PP'
    end
    object xVentasI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xVentasPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object xVentasI_FINANCIACION_CANAL: TFloatField
      DisplayLabel = 'Imp. Finan. Can.'
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object xVentasS_BASES_CANAL: TFloatField
      DisplayLabel = 'S. Bases Can.'
      FieldName = 'S_BASES_CANAL'
    end
    object xVentasS_CUOTA_IVA_CANAL: TFloatField
      DisplayLabel = 'S. Cuota IVA Can.'
      FieldName = 'S_CUOTA_IVA_CANAL'
    end
    object xVentasS_CUOTA_RE_CANAL: TFloatField
      DisplayLabel = 'S. Cuota Ret. Can.'
      FieldName = 'S_CUOTA_RE_CANAL'
    end
    object xVentasLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xVentasCHG_MONEDA: TIntegerField
      DisplayLabel = 'Chg. Mon.'
      FieldName = 'CHG_MONEDA'
    end
    object xVentasTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xVentasID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
  end
  object DSxVentas: TDataSource
    DataSet = xVentas
    Left = 128
    Top = 256
  end
  object xVentasDetalle: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ges_detalles_s'
      'where '
      'id_s=?id_s'
      'order by orden')
    UniDirectional = False
    DataSource = DSxVentas
    Opciones = []
    AutoSQLdeVistas = False
    Left = 32
    Top = 304
    object xVentasDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVentasDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVentasDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVentasDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVentasDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVentasDetalleRIG: TIntegerField
      DisplayLabel = 'Doc.'
      FieldName = 'RIG'
    end
    object xVentasDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xVentasDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xVentasDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xVentasDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xVentasDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xVentasDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xVentasDetallePIEZAS_X_BULTO: TIntegerField
      DisplayLabel = 'Piezas x Bulto'
      FieldName = 'PIEZAS_X_BULTO'
    end
    object xVentasDetalleBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xVentasDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object xVentasDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xVentasDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xVentasDetalleCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object xVentasDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xVentasDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object xVentasDetallePAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xVentasDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xVentasDetalleP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xVentasDetalleP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object xVentasDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xVentasDetalleB_COMISION: TFloatField
      DisplayLabel = 'B. Com.'
      FieldName = 'B_COMISION'
    end
    object xVentasDetalleDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object xVentasDetalleDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DTO_CIAL'
    end
    object xVentasDetalleI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. P.P.'
      FieldName = 'I_DTO_PP'
    end
    object xVentasDetalleI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xVentasDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Desc.'
      FieldName = 'I_DESCUENTO'
    end
    object xVentasDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imp.'
      FieldName = 'B_IMPONIBLE'
    end
    object xVentasDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object xVentasDetalleI_COMISION: TFloatField
      DisplayLabel = 'Imp. Com.'
      FieldName = 'I_COMISION'
    end
    object xVentasDetalleC_IVA: TFloatField
      DisplayLabel = 'Cuota IVA'
      FieldName = 'C_IVA'
    end
    object xVentasDetalleC_RECARGO: TFloatField
      DisplayLabel = 'Cuota Rec.'
      FieldName = 'C_RECARGO'
    end
    object xVentasDetalleT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object xVentasDetalleM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xVentasDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xVentasDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xVentasDetalleNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xVentasDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object xVentasDetalleIVA_INCLUIDO: TIntegerField
      DisplayLabel = 'IVA Inc.'
      FieldName = 'IVA_INCLUIDO'
    end
    object xVentasDetalleNSERIE: TFIBStringField
      DisplayLabel = 'N. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object xVentasDetalleB_COMISION_CANAL: TFloatField
      DisplayLabel = 'B. Com. Can.'
      FieldName = 'B_COMISION_CANAL'
    end
    object xVentasDetalleEJER_MOV: TIntegerField
      DisplayLabel = 'Ejer. Mov.'
      FieldName = 'EJER_MOV'
    end
    object xVentasDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object xVentasDetalleNO_FABRICACION_KRI: TFIBStringField
      DisplayLabel = 'Nro. Fab.'
      FieldName = 'NO_FABRICACION_KRI'
      Size = 15
    end
    object xVentasDetalleID_S: TIntegerField
      DisplayLabel = 'ID Cab.'
      FieldName = 'ID_S'
    end
    object xVentasDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object xVentasDetalleID_D_S_GR: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_S_GR'
    end
    object xVentasDetalleID_A_M_C_T: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C_T'
    end
    object xVentasDetalleID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
    object xVentasDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xVentasDetalleID_MOV_STOCKS: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCKS'
    end
    object xVentasDetalleCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Com. Lin.'
      FieldName = 'COMISION_LINEAL'
    end
    object xVentasDetalleI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Com. Lin.'
      FieldName = 'I_COMISION_LINEAL'
    end
    object xVentasDetalleTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'Titulo Idioma'
      FieldName = 'TITULO_IDIOMA'
      Size = 60
    end
    object xVentasDetalleMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object xVentasDetalleTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object xVentasDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xVentasDetalleTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object xVentasDetalleORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object xVentasDetallePROC_PROMOCION: TIntegerField
      DisplayLabel = 'Proc. Prom.'
      FieldName = 'PROC_PROMOCION'
    end
    object xVentasDetalleID_P: TIntegerField
      DisplayLabel = 'ID P.'
      FieldName = 'ID_P'
    end
    object xVentasDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplic. Uds.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object xVentasDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proy.'
      FieldName = 'PROYECTO'
    end
    object xVentasDetalleCERTIFICADO: TIntegerField
      DisplayLabel = 'Certif.'
      FieldName = 'CERTIFICADO'
    end
    object xVentasDetalleCERT_NEGATIVO: TIntegerField
      DisplayLabel = 'Cert. Neg.'
      FieldName = 'CERT_NEGATIVO'
    end
    object xVentasDetalleLINEA_RELACION: TIntegerField
      DisplayLabel = 'Linea Rel.'
      FieldName = 'LINEA_RELACION'
    end
    object xVentasDetalleNOTAS2: TBlobField
      DisplayLabel = 'Notas 2'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object xVentasDetalleCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object xVentasDetalleCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas 2'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object xVentasDetallePRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Num. Plano'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
  end
  object DSxVentasDetalle: TDataSource
    DataSet = xVentasDetalle
    Left = 128
    Top = 304
  end
end
