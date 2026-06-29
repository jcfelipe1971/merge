object ProDMImputaciones: TProDMImputaciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 696
  Top = 163
  Height = 211
  Width = 287
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_VER_DETALLE_E_PROD'
      'WHERE'
      '  ID_DETALLES_E=?old_ID_DETALLES_E ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_VER_DETALLE_E_PROD'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ID_E,ID_DETALL' +
        'ES_E,ESTADO,ALMACEN,'#13#10'ARTICULO,TITULO,ID_A,UNIDADES,U_IMPUTADAS,' +
        'U_PDTES_IMPUTAR,U_A_IMPUTAR,IMPUTADO,PRECIO,DESCUENTO,'#13#10'P_COSTE,' +
        'BRUTO,B_IMPONIBLE,ENTRADA,ENTRADA_IMPUTACION,FECHA_IMPUTACION,IM' +
        'PUTABLE,ID_ORDEN,RIG_ORDEN,'#13#10'FASE_ORDEN,FECHA_DOC)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ID_E,?' +
        'ID_DETALLES_E,?ESTADO,?ALMACEN,'#13#10'?ARTICULO,?TITULO,?ID_A,?UNIDAD' +
        'ES,?U_IMPUTADAS,?U_PDTES_IMPUTAR,?U_A_IMPUTAR,?IMPUTADO,?PRECIO,' +
        '?DESCUENTO,'#13#10'?P_COSTE,?BRUTO,?B_IMPONIBLE,?ENTRADA,?ENTRADA_IMPU' +
        'TACION,?FECHA_IMPUTACION,?IMPUTABLE,?ID_ORDEN,?RIG_ORDEN,'#13#10'?FASE' +
        '_ORDEN,?FECHA_DOC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_VER_DETALLE_E_PROD'
      'WHERE'
      '  ID_DETALLES_E=?ID_DETALLES_E ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_VER_DETALLE_E_PROD'
      'WHERE '
      'ID_E = ?ID_E'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_VER_DETALLE_E_PROD'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,ID_E=?ID_E '
      '  ,ESTADO=?ESTADO '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,ID_A=?ID_A '
      '  ,UNIDADES=?UNIDADES '
      '  ,U_IMPUTADAS=?U_IMPUTADAS '
      '  ,U_PDTES_IMPUTAR=?U_PDTES_IMPUTAR '
      '  ,U_A_IMPUTAR=?U_A_IMPUTAR '
      '  ,IMPUTADO=?IMPUTADO '
      '  ,PRECIO=?PRECIO '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,P_COSTE=?P_COSTE '
      '  ,BRUTO=?BRUTO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,ENTRADA=?ENTRADA '
      '  ,ENTRADA_IMPUTACION=?ENTRADA_IMPUTACION '
      '  ,FECHA_IMPUTACION=?FECHA_IMPUTACION '
      '  ,IMPUTABLE=?IMPUTABLE '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,RIG_ORDEN=?RIG_ORDEN '
      '  ,FASE_ORDEN=?FASE_ORDEN '
      '  ,FECHA_DOC=?FECHA_DOC '
      'WHERE'
      '  ID_DETALLES_E=?ID_DETALLES_E ')
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_DETALLES_E')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_VER_DETALLE_E_PROD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
      ReadOnly = True
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleID_E: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_E'
    end
    object QMDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Det.'
      FieldName = 'ID_DETALLES_E'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      ReadOnly = True
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      ReadOnly = True
      Size = 256
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      ReadOnly = True
    end
    object QMDetalleU_IMPUTADAS: TFloatField
      DisplayLabel = 'Uds. Imp.'
      FieldName = 'U_IMPUTADAS'
    end
    object QMDetalleU_PDTES_IMPUTAR: TFloatField
      DisplayLabel = 'Uds. Pdtes.'
      FieldName = 'U_PDTES_IMPUTAR'
    end
    object QMDetalleU_A_IMPUTAR: TFloatField
      DisplayLabel = 'Uds. a Imp.'
      FieldName = 'U_A_IMPUTAR'
      OnChange = QMDetalleU_A_IMPUTARChange
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetalleIMPUTADO: TIntegerField
      DisplayLabel = 'Imputado'
      FieldName = 'IMPUTADO'
    end
    object QMDetalleENTRADA_IMPUTACION: TIntegerField
      DisplayLabel = 'Imputar'
      FieldName = 'ENTRADA_IMPUTACION'
    end
    object QMDetalleFECHA_IMPUTACION: TDateTimeField
      DisplayLabel = 'Fecha Imputaci'#243'n'
      FieldName = 'FECHA_IMPUTACION'
    end
    object QMDetalleIMPUTABLE: TIntegerField
      DisplayLabel = 'Imputable'
      FieldName = 'IMPUTABLE'
    end
    object QMDetalleID_ORDEN: TIntegerField
      DisplayLabel = 'Id. Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMDetalleRIG_ORDEN: TIntegerField
      DisplayLabel = 'Rig Orden'
      FieldName = 'RIG_ORDEN'
    end
    object QMDetalleFASE_ORDEN: TIntegerField
      DisplayLabel = 'Fase Orden'
      FieldName = 'FASE_ORDEN'
    end
    object QMDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object QMDetalleFECHA_DOC: TDateTimeField
      DisplayLabel = 'Fec. Documento'
      FieldName = 'FECHA_DOC'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 200
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 200
    Top = 64
  end
end
