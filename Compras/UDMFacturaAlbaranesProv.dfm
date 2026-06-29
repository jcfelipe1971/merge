object DMFacturaAlbaranesProv: TDMFacturaAlbaranesProv
  OldCreateOrder = False
  OnCreate = DMFacturaAlbaranesProvCreate
  Left = 512
  Top = 242
  Height = 384
  Width = 399
  object QMAlbaranes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_ALBARAN_PROV'
      
        '  (I_DTO_PP,I_DTO_CIAL,S_CUOTA_RE,S_CUOTA_IVA,S_BASES,I_DTO_LINE' +
        'AS,BRUTO,NOTAS,FECHA,ENTRADA,TERCERO,PROVEEDOR,RIG,SERIE,DTO_CIA' +
        'L,DTO_PP,LINEAS,BULTOS,ESTADO,TITULO,CANAL,EJERCICIO,EMPRESA,NUM' +
        '_ALBARAN,MONEDA,ALMACEN,TIPO)'
      'VALUES'
      
        '  (?I_DTO_PP,?I_DTO_CIAL,?S_CUOTA_RE,?S_CUOTA_IVA,?S_BASES,?I_DT' +
        'O_LINEAS,?BRUTO,?NOTAS,?FECHA,?ENTRADA,?TERCERO,?PROVEEDOR,?RIG,' +
        '?SERIE,?DTO_CIAL,?DTO_PP,?LINEAS,?BULTOS,?ESTADO,?TITULO,?CANAL,' +
        '?EJERCICIO,?EMPRESA,?NUM_ALBARAN,?MONEDA,?ALMACEN,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_ALBARAN_PROV'
      'WHERE'
      '  ID_E = ?ID_E')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN_PROV'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO<=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE AND'
      '  TIPO='#39'ALP'#39' AND'
      '  PROVEEDOR=?PROVEEDOR AND'
      '  ESTADO=0'
      'ORDER BY EJERCICIO,RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_ALBARAN_PROV'
      'SET'
      '  ENTRADA_FACTURACION=?ENTRADA_FACTURACION'
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO ')
    AfterOpen = QMAlbaranesAfterOpen
    OnNewRecord = QMAlbaranesNewRecord
    ClavesPrimarias.Strings = (
      'ID_E'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_ALBARAN_PROV'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMAlbaranesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAlbaranesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAlbaranesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
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
    object QMAlbaranesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMAlbaranesALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMAlbaranesMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMAlbaranesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAlbaranesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMAlbaranesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMAlbaranesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAlbaranesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAlbaranesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMAlbaranesBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMAlbaranesLINEAS: TIntegerField
      DisplayLabel = 'L'#237'neas'
      FieldName = 'LINEAS'
    end
    object QMAlbaranesBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMAlbaranesI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. L'#237'neas'
      FieldName = 'I_DTO_LINEAS'
    end
    object QMAlbaranesS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object QMAlbaranesS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object QMAlbaranesS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Cuota R.E.'
      FieldName = 'S_CUOTA_RE'
    end
    object QMAlbaranesB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. L'#237'neas'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMAlbaranesDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP'
      FieldName = 'DTO_PP'
    end
    object QMAlbaranesDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DTO_CIAL'
    end
    object QMAlbaranesI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object QMAlbaranesI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object QMAlbaranesLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
      OnGetText = QMAlbaranesLIQUIDOGetText
    end
    object QMAlbaranesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMAlbaranesNUM_ALBARAN: TFIBStringField
      DisplayLabel = 'Referencia Albar'#225'n Proveedor'
      FieldName = 'NUM_ALBARAN'
      Size = 40
    end
    object QMAlbaranesENTRADA_FACTURACION: TIntegerField
      DisplayLabel = 'Procesado'
      FieldName = 'ENTRADA_FACTURACION'
      OnChange = QMAlbaranesENTRADA_FACTURACIONChange
    end
    object QMAlbaranesID_E: TIntegerField
      DisplayLabel = 'ID E'
      FieldName = 'ID_E'
    end
  end
  object DSQMAlbaranes: TDataSource
    DataSet = QMAlbaranes
    Left = 128
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 216
    Top = 16
  end
  object xDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG'
      'FROM GES_CABECERAS_E C'
      
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
    Left = 40
    Top = 64
  end
  object DSxDocumentos: TDataSource
    DataSet = xDocumentos
    Left = 128
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
    Left = 304
    Top = 16
  end
end
