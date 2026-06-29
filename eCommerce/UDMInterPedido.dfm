object DMInterPedido: TDMInterPedido
  OldCreateOrder = False
  OnCreate = DMInterPedidoCreate
  OnDestroy = DataModuleDestroy
  Left = 242
  Top = 165
  Height = 305
  Width = 460
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 248
    Top = 16
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 112
    Top = 16
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_INTERPRETA_PEDIDO'
      'WHERE'
      '  PEDIDO=?old_PEDIDO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_INTERPRETA_PEDIDO'
      
        '  (EMPRESA,PEDIDO,CLIENTE,ARTICULO,UNIDADES,FECHA,DIRECCIONDESTI' +
        'NO,ERROR,TRASPASAR,PRECIO,OBSERVACIONES_CLI,NUM_PEDIDO_CLI)'
      'VALUES'
      
        '  (?EMPRESA,?PEDIDO,?CLIENTE,?ARTICULO,?UNIDADES,?FECHA,?DIRECCI' +
        'ONDESTINO,?ERROR,?TRASPASAR,?PRECIO,?OBSERVACIONES_CLI,?NUM_PEDI' +
        'DO_CLI)')
    RefreshSQL.Strings = (
      'SELECT * FROM EMP_INTERPRETA_PEDIDO'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'PEDIDO=?PEDIDO')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_INTERPRETA_PEDIDO'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'CLIENTE=?CLIENTE AND'
      'NUM_PEDIDO_CLI=?NUM_PEDIDO_CLI')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_INTERPRETA_PEDIDO'
      'SET'
      '  CLIENTE=?CLIENTE '
      '  ,ARTICULO=?ARTICULO '
      '  ,UNIDADES=?UNIDADES '
      '  ,FECHA=?FECHA '
      '  ,DIRECCIONDESTINO=?DIRECCIONDESTINO '
      '  ,ERROR=?ERROR '
      '  ,TRASPASAR=?TRASPASAR '
      '  ,PRECIO=?PRECIO '
      '  ,OBSERVACIONES_CLI=?OBSERVACIONES_CLI '
      '  ,NUM_PEDIDO_CLI=?NUM_PEDIDO_CLI '
      '  ,DIRECCION=?DIRECCION'
      'WHERE'
      '  PEDIDO=?PEDIDO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCabecera
    AfterPost = QMDetalleAfterPost
    AfterScroll = QMDetalleAfterScroll
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'PEDIDO'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_INTERPRETA_PEDIDO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 72
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetallePEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QMDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMDetalleDescArt: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescArt'
      OnGetText = QMDetalleDescArtGetText
      Size = 40
      Calculated = True
    end
    object QMDetalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDetalleDIRECCIONDESTINO: TFIBStringField
      DisplayLabel = 'Direccion Dst.'
      FieldName = 'DIRECCIONDESTINO'
      Size = 100
    end
    object QMDetalleERROR: TIntegerField
      DisplayLabel = 'Error'
      FieldName = 'ERROR'
    end
    object QMDetalleTRASPASAR: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASAR'
    end
    object QMDetalleCODIGO_ARTICULO: TFIBStringField
      DisplayLabel = 'Cod. Art.'
      FieldName = 'CODIGO_ARTICULO'
      Size = 15
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleOBSERVACIONES_CLI: TBlobField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES_CLI'
      Size = 8
    end
    object QMDetalleNUM_PEDIDO_CLI: TFIBStringField
      DisplayLabel = 'Num. Pedido Cliente'
      FieldName = 'NUM_PEDIDO_CLI'
      Size = 40
    end
    object QMDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMDetalleDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 72
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT DISTINCT P.EMPRESA,P.PEDIDO,P.CLIENTE,T.NOMBRE_R_SOCIAL F' +
        'ROM EMP_INTERPRETA_PEDIDO P'
      'LEFT JOIN EMP_CLIENTES C'
      'ON P.EMPRESA=C.EMPRESA AND P.CLIENTE=C.CLIENTE'
      'LEFT JOIN SYS_TERCEROS T'
      'ON C.TERCERO=T.TERCERO'
      
        'WHERE P.EMPRESA=?EMPRESA AND P.PEDIDO=?PEDIDO AND P.CLIENTE=?CLI' +
        'ENTE')
    SelectSQL.Strings = (
      
        'SELECT DISTINCT P.EMPRESA,P.NUM_PEDIDO_CLI,P.CLIENTE,T.NOMBRE_R_' +
        'SOCIAL,P.FECHA,D.DIR_COMPLETA_N FROM EMP_INTERPRETA_PEDIDO P'
      'LEFT JOIN EMP_CLIENTES C'
      'ON P.EMPRESA=C.EMPRESA AND P.CLIENTE=C.CLIENTE'
      'LEFT JOIN SYS_TERCEROS T'
      'ON C.TERCERO=T.TERCERO'
      'LEFT JOIN SYS_TERCEROS_DIRECCIONES D'
      'ON T.TERCERO=D.TERCERO AND P.DIRECCION=D.DIRECCION'
      'WHERE P.EMPRESA=?EMPRESA')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 32
    Top = 16
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabeceraNUM_PEDIDO_CLI: TFIBStringField
      DisplayLabel = 'Pedido'
      FieldName = 'NUM_PEDIDO_CLI'
      Size = 40
    end
    object QMCabeceraNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 320
    Top = 16
  end
end
