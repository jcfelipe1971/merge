object DMDupArtEscandallo: TDMDupArtEscandallo
  OldCreateOrder = False
  OnCreate = DMArt_EscandalloCreate
  Left = 390
  Top = 71
  Height = 479
  Width = 741
  object QMEscandallo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_ESCANDALLO'
      'where'
      '  Articulo=?articulo AND '
      '  Empresa=?Empresa and'
      '  detalle=?detalle')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_ESCANDALLO'
      'WHERE (ARTICULO=?ARTICULO) and (EMPRESA=?EMPRESA)'
      'order by detalle')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_ESCANDALLO'
      'SET  MARCADO=?MARCADO'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA AND DETALLE=?DETALLE')
    DataSource = DSQMArticulos
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'articulo '
      'Empresa '
      'detalle'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_ESCANDALLO'
    UpdateTransaction = TLocal
    Left = 30
    Top = 22
    object QMEscandalloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEscandalloARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMEscandalloDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      OnChange = QMEscandalloDETALLEChange
      Size = 15
    end
    object QMEscandalloTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMEscandalloP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMEscandalloCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMEscandalloFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMEscandalloMARCADO: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'MARCADO'
    end
  end
  object DSQMEscandallo: TDataSource
    DataSet = QMEscandallo
    Left = 112
    Top = 24
  end
  object DSxArticulo: TDataSource
    DataSet = xArticulo
    Left = 120
    Top = 248
  end
  object SPDuplica_Escandallo: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure g_duplica_escandallo'
      '(?empresa,?articulo_origen,?articulo_destino)')
    Transaction = TLocal
    Left = 212
    Top = 22
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 144
  end
  object QMArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      '  ARTICULO=?old_ARTICULO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_CUENTAS'
      
        '  (P_COSTE,EMPRESA,EJERCICIO,CANAL,TITULO,CONTROL_STOCK,TIPO_IVA' +
        ',ARTICULO,FAMILIA,PAIS,CTA_COMPRAS,CTA_VENTAS,ENTRADA'
      ' ,UNIDADES,VIRTUAL, DISPONIBILIDAD,ACTUALIZA_VENTA,PTO_VERDE)'
      'VALUES'
      '  (?P_COSTE,?EMPRESA,?EJERCICIO,?CANAL,'
      
        '  ?TITULO,?CONTROL_STOCK,?TIPO_IVA,?ARTICULO,?FAMILIA,?PAIS,?CTA' +
        '_COMPRAS,'
      
        '  ?CTA_VENTAS,?ENTRADA, ?UNIDADES,?VIRTUAL,?DISPONIBILIDAD,?ACTU' +
        'ALIZA_VENTA,?PTO_VERDE)'
      ' '
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      '  ARTICULO=?old_ARTICULO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal =?cana' +
        'l'
      'and familia<>?familia and articulo=?articulo and abierto=1'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_CUENTAS'
      'SET'
      '  P_COSTE=?P_COSTE '
      '  ,TITULO=?TITULO '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,FAMILIA=?FAMILIA '
      '  ,PAIS=?PAIS '
      '  ,CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_VENTAS=?CTA_VENTAS '
      '  ,ENTRADA=?ENTRADA  '
      '  ,UNIDADES=?UNIDADES'
      '  ,VIRTUAL=?VIRTUAL'
      ' ,NOTAS =?NOTAS'
      ' ,TITULO_CORTO =?TITULO_CORTO'
      ' ,DISPONIBILIDAD=?DISPONIBILIDAD'
      ' ,ACTUALIZA_VENTA=?ACTUALIZA_VENTA'
      ' ,PTO_VERDE=?PTO_VERDE'
      'WHERE'
      '  ARTICULO=?old_ARTICULO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    ClavesPrimarias.Strings = (
      'ARTICULO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_CUENTAS'
    UpdateTransaction = TLocal
    Left = 140
    Top = 162
    object QMArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticulosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMArticulosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMArticulosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMArticulosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMArticulosABIERTO: TIntegerField
      DisplayLabel = 'Abierto'
      FieldName = 'ABIERTO'
    end
    object QMArticulosCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Ctrol. Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object QMArticulosPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMArticulosTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMArticulosCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object QMArticulosCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object QMArticulosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMArticulosUNIDADES: TFIBStringField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      Size = 2
    end
    object QMArticulosVIRTUAL: TIntegerField
      DisplayLabel = 'Virtual'
      FieldName = 'VIRTUAL'
    end
    object QMArticulosTITULO_CORTO: TFIBStringField
      DisplayLabel = 'Titulo Corto'
      FieldName = 'TITULO_CORTO'
    end
    object QMArticulosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMArticulosDISPONIBILIDAD: TIntegerField
      DisplayLabel = 'Disponibilidad'
      FieldName = 'DISPONIBILIDAD'
    end
    object QMArticulosACTUALIZA_VENTA: TIntegerField
      DisplayLabel = 'Act. Venta'
      FieldName = 'ACTUALIZA_VENTA'
    end
    object QMArticulosPTO_VERDE: TFloatField
      DisplayLabel = 'Pto. Verde'
      FieldName = 'PTO_VERDE'
    end
  end
  object DSQMArticulos: TDataSource
    DataSet = QMArticulos
    Left = 228
    Top = 222
  end
  object DSXArticuloDest: TDataSource
    DataSet = xArticuloDest
    Left = 136
    Top = 312
  end
  object xLimpia: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update art_articulos_escandallo'
      'set marcado=0'
      'where empresa=?empresa and '
      '           articulo=?articulo and'
      '           marcado=1')
    Transaction = TLocal
    Left = 172
    Top = 94
  end
  object xArticuloDest: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO_LARGO AS TITULO FROM ART_ARTICULOS'
      'where (ARTICULO=?ARTICULO) AND (EMPRESA=?EMPRESA)')
    UniDirectional = False
    Left = 46
    Top = 312
    object xArticuloDestTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO_LARGO AS TITULO FROM ART_ARTICULOS'
      'where (ARTICULO=?DETALLE) AND (EMPRESA=?EMPRESA)')
    UniDirectional = False
    DataSource = DSQMEscandallo
    Left = 46
    Top = 248
    object xArticuloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
end
