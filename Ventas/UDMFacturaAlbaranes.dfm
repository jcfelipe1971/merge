object DMFacturaAlbaranes: TDMFacturaAlbaranes
  OldCreateOrder = False
  OnCreate = DMFacturaAlbaranesCreate
  Left = 565
  Top = 332
  Height = 298
  Width = 470
  object QMAlbaranes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_ALBARAN'
      'WHERE'
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_ALBARAN'
      '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_ALBARAN'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      '/* Se define dinamicamente */'
      
        'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ALMACEN, CLI' +
        'ENTE, FECHA, TITULO, NOMBRE_COMERCIAL, CAMPANYA, '
      
        '       ESTADO, LIQUIDO, SU_REFERENCIA, MONEDA, FORMA_PAGO, PROYE' +
        'CTO, ID_S, TOTAL_ANTICIPADO, ENTRADA_FACTURACION, '
      
        '       DOCUMENTO_MUESTRAS, TIPO_PORTES, POR_PORTES, I_PORTES, RA' +
        'NGO, INDICE, FACTURABLE, AGENTE, FOLIO, '
      
        '       PEDIDO_CLIENTE, Z_OBSERVACION, DIA_PAGO_1, DIA_PAGO_2, DI' +
        'A_PAGO_3'
      'FROM VER_CABECERAS_ALBARAN'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO > 2001 AND'
      'CANAL = :CANAL AND'
      'TIPO = '#39'ALB'#39' AND'
      '(ESTADO <> 2 AND'
      'ESTADO <> 5 AND'
      'ESTADO <> 6) AND'
      '/*dji lrk kri*/'
      '((EJERCICIO = :EJERCICIO) OR (EJERCICIO < :EJERCICIO)) AND'
      '((SERIE = :SERIE) OR ('#39'X'#39' || :SERIE = '#39'X '#39')) AND'
      '(GARANTIA = 0)'
      'ORDER BY EJERCICIO, SERIE, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_ALBARAN'
      'SET'
      '  ENTRADA_FACTURACION=?ENTRADA_FACTURACION'
      'WHERE'
      '  ID_S=?ID_S '
      ' ')
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    AfterOpen = QMAlbaranesAfterOpen
    BeforePost = QMAlbaranesBeforePost
    OnCalcFields = QMAlbaranesCalcFields
    OnNewRecord = QMAlbaranesNewRecord
    ClavesPrimarias.Strings = (
      'ID_S ')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_ALBARAN'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMAlbaranesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMAlbaranesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMAlbaranesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAlbaranesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAlbaranesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAlbaranesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMAlbaranesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMAlbaranesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAlbaranesTITULO: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAlbaranesCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object QMAlbaranesESTADO: TIntegerField
      DisplayLabel = 'Procesar'
      FieldName = 'ESTADO'
    end
    object QMAlbaranesLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMAlbaranesSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMAlbaranesMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMAlbaranesALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMAlbaranesFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F.Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMAlbaranesPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMAlbaranesID_S: TIntegerField
      DisplayLabel = 'Id. Doc.'
      FieldName = 'ID_S'
    end
    object QMAlbaranesTOTAL_ANTICIPADO: TFloatField
      DisplayLabel = 'T.Anticipado'
      FieldName = 'TOTAL_ANTICIPADO'
    end
    object QMAlbaranesENTRADA_FACTURACION: TIntegerField
      DisplayLabel = 'Procesar'
      FieldName = 'ENTRADA_FACTURACION'
      OnChange = QMAlbaranesENTRADA_FACTURACIONChange
    end
    object QMAlbaranesDOCUMENTO_MUESTRAS: TIntegerField
      DisplayLabel = 'Muestras'
      FieldName = 'DOCUMENTO_MUESTRAS'
    end
    object QMAlbaranesTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Porte'
      FieldName = 'TIPO_PORTES'
    end
    object QMAlbaranesPOR_PORTES: TFloatField
      DisplayLabel = '% Porte'
      FieldName = 'POR_PORTES'
    end
    object QMAlbaranesI_PORTES: TFloatField
      DisplayLabel = 'Imp. Porte'
      FieldName = 'I_PORTES'
    end
    object QMAlbaranesRANGO: TIntegerField
      DisplayLabel = 'Rango'
      FieldName = 'RANGO'
    end
    object QMAlbaranesINDICE: TIntegerField
      DisplayLabel = 'Indice'
      FieldName = 'INDICE'
    end
    object QMAlbaranesFACTURABLE: TIntegerField
      DisplayLabel = 'Facturable'
      FieldName = 'FACTURABLE'
    end
    object QMAlbaranesNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMAlbaranesFOLIO: TIntegerField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
    end
    object QMAlbaranesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMAlbaranesPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Nro. Pedido'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object QMAlbaranesZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object QMAlbaranesO_COMPRA: TStringField
      DisplayLabel = 'Origen Compra'
      FieldKind = fkCalculated
      FieldName = 'O_COMPRA'
      Calculated = True
    end
    object QMAlbaranesDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QMAlbaranesDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QMAlbaranesDIA_PAGO_3: TIntegerField
      DisplayLabel = 'Dia Pago 3'
      FieldName = 'DIA_PAGO_3'
    end
  end
  object DSQMAlbaranes: TDataSource
    DataSet = QMAlbaranes
    Left = 112
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 288
    Top = 16
  end
  object xRecorre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT ID_S, EJERCICIODEV AS EJERCICIO, CANALDEV AS CANAL, SERIE' +
        'DEV AS SERIE, RIG'
      
        'FROM G_FACTURA_ALBARANES_RECORRE (?EMPRESA, ?EJERCICIO, ?CANAL, ' +
        '?SERIE, ?ENTRADA, ?PROYECTO, ?CERTIFICA)')
    UniDirectional = False
    Left = 32
    Top = 112
  end
  object xProcesar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM TMP_FACTURA_ALBARANES'
      'WHERE'
      'ENTRADA = ?ENTRADA')
    UniDirectional = True
    Left = 112
    Top = 112
  end
  object xFacturas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT DISTINCT(ID_S_D) AS ID_S_D, SERIED AS SERIE, RIGD AS RIG,' +
        ' EJERCICIO, CANAL'
      'FROM TMP_FACTURA_ALBARANES'
      'WHERE'
      'ENTRADA = ?ENTRADA')
    UniDirectional = True
    Left = 200
    Top = 112
  end
  object DSxDocumentos: TDataSource
    DataSet = xDocumentos
    Left = 112
    Top = 64
  end
  object xDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG'
      'FROM GES_CABECERAS_S C'
      
        'JOIN TMP_PROCESOS_AUTO T ON C.EMPRESA = T.EMPRESA AND C.EJERCICI' +
        'O = T.EJERCICIO AND C.CANAL = T.CANAL AND C.SERIE = T.SERIE AND ' +
        'C.TIPO = T.TIPO AND C.RIG = T.RIG'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.SERIE = :SERIE AND'
      'C.TIPO = :TIPO AND'
      'T.CONTADOR = :CONTADOR'
      'ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG')
    UniDirectional = False
    Left = 32
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
    Left = 368
    Top = 16
  end
end
