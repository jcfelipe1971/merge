object DMDetalleDeLinea: TDMDetalleDeLinea
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 205
  Top = 103
  Height = 253
  Width = 328
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
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
    Left = 264
    Top = 64
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_S_DETALLES'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_S_DETALLES'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ID_S,ID_DETALLES' +
        '_S,'
      
        '  REFERENCIA,SOPORTE,ENTREGA_AAFF,ALTO_AREA_VISIBLE,UNIDADES,ACA' +
        'BADO,'
      
        '  EMBALAJE,ANCHO_AREA_VISIBLE,FECHA_INSTALACION,LUGAR_INSTALACIO' +
        'N,'
      
        '  ENTRADA,ALTO_MEDIDA_TOTAL,ANCHO_MEDIDA_TOTAL,FECHA_INSTALACION' +
        '_PEND,'
      
        '  ENTREGA_AAFF_PEND,HORA_INSTALACION_PEND,PRECIO,ID_MARCA,ID_MOD' +
        'ELO,'
      
        '  BASTIDOR,FECHA_RECOGIDA,TRANSPORTISTA,FECHA_PREVISTA_RECEPCION' +
        ','
      
        '  COMENTARIO_PREVISION_RECEPCION,FECHA_RECEPCION,COMENTARIO_RECE' +
        'PCION,'
      '  NOTA,IMAGEN,ESTADO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ID_S,?ID' +
        '_DETALLES_S,'
      
        '  ?REFERENCIA,?SOPORTE,?ENTREGA_AAFF,?ALTO_AREA_VISIBLE,?UNIDADE' +
        'S,?ACABADO,'
      
        '  ?EMBALAJE,?ANCHO_AREA_VISIBLE,?FECHA_INSTALACION,?LUGAR_INSTAL' +
        'ACION,'
      
        '  ?ENTRADA,?ALTO_MEDIDA_TOTAL,?ANCHO_MEDIDA_TOTAL,?FECHA_INSTALA' +
        'CION_PEND,'
      
        '  ?ENTREGA_AAFF_PEND,?HORA_INSTALACION_PEND,?PRECIO,?ID_MARCA,?I' +
        'D_MODELO,'
      
        '  ?BASTIDOR,?FECHA_RECOGIDA,?TRANSPORTISTA,?FECHA_PREVISTA_RECEP' +
        'CION,'
      
        '  ?COMENTARIO_PREVISION_RECEPCION,?FECHA_RECEPCION,?COMENTARIO_R' +
        'ECEPCION,'
      '  ?NOTA,?IMAGEN,?ESTADO)'
      ''
      '')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_S_DETALLES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S_DETALLES'
      'WHERE '
      'ID_DETALLES_S = ?ID_DETALLES_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_DETALLES'
      'SET'
      '  REFERENCIA=?REFERENCIA '
      '  ,SOPORTE=?SOPORTE '
      '  ,ENTREGA_AAFF=?ENTREGA_AAFF '
      '  ,ALTO_AREA_VISIBLE=?ALTO_AREA_VISIBLE '
      '  ,UNIDADES=?UNIDADES '
      '  ,ACABADO=?ACABADO '
      '  ,EMBALAJE=?EMBALAJE '
      '  ,ANCHO_AREA_VISIBLE=?ANCHO_AREA_VISIBLE '
      '  ,FECHA_INSTALACION=?FECHA_INSTALACION '
      '  ,LUGAR_INSTALACION=?LUGAR_INSTALACION '
      '  ,ENTRADA=?ENTRADA '
      '  ,ALTO_MEDIDA_TOTAL=?ALTO_MEDIDA_TOTAL '
      '  ,ANCHO_MEDIDA_TOTAL=?ANCHO_MEDIDA_TOTAL '
      '  ,FECHA_INSTALACION_PEND=?FECHA_INSTALACION_PEND'
      '  ,ENTREGA_AAFF_PEND=?ENTREGA_AAFF_PEND'
      '  ,HORA_INSTALACION_PEND=?HORA_INSTALACION_PEND'
      '  ,PRECIO=?PRECIO'
      '  ,ID_MARCA=?ID_MARCA'
      '  ,ID_MODELO=?ID_MODELO'
      '  ,BASTIDOR=?BASTIDOR'
      '  ,FECHA_RECOGIDA=?FECHA_RECOGIDA'
      '  ,TRANSPORTISTA=?TRANSPORTISTA'
      '  ,FECHA_PREVISTA_RECEPCION=?FECHA_PREVISTA_RECEPCION'
      
        '  ,COMENTARIO_PREVISION_RECEPCION=?COMENTARIO_PREVISION_RECEPCIO' +
        'N'
      '  ,FECHA_RECEPCION=?FECHA_RECEPCION'
      '  ,COMENTARIO_RECEPCION=?COMENTARIO_RECEPCION'
      '  ,NOTA=?NOTA'
      '  ,IMAGEN=?IMAGEN'
      '  ,ESTADO=?ESTADO'
      'WHERE'
      '  LINEA=?LINEA AND'
      '  RIG=?RIG AND'
      '  TIPO=?TIPO AND'
      '  SERIE=?SERIE AND'
      '  CANAL=?CANAL AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  EMPRESA=?EMPRESA')
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_S_DETALLES'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
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
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'Id Detalle Doc.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 60
    end
    object QMDetalleSOPORTE: TFIBStringField
      DisplayLabel = 'Soporte'
      FieldName = 'SOPORTE'
      Size = 60
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMDetalleACABADO: TFIBStringField
      DisplayLabel = 'Acabado'
      FieldName = 'ACABADO'
      Size = 60
    end
    object QMDetalleEMBALAJE: TFIBStringField
      DisplayLabel = 'Embalaje'
      FieldName = 'EMBALAJE'
      Size = 60
    end
    object QMDetalleFECHA_INSTALACION: TDateTimeField
      DisplayLabel = 'Fecha Instal.'
      FieldName = 'FECHA_INSTALACION'
    end
    object QMDetalleLUGAR_INSTALACION: TFIBStringField
      DisplayLabel = 'Lugar Instal.'
      FieldName = 'LUGAR_INSTALACION'
      Size = 60
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetalleENTREGA_AAFF: TDateTimeField
      FieldName = 'ENTREGA_AAFF'
    end
    object QMDetalleALTO_AREA_VISIBLE: TFloatField
      FieldName = 'ALTO_AREA_VISIBLE'
    end
    object QMDetalleANCHO_AREA_VISIBLE: TFloatField
      FieldName = 'ANCHO_AREA_VISIBLE'
    end
    object QMDetalleALTO_MEDIDA_TOTAL: TFloatField
      FieldName = 'ALTO_MEDIDA_TOTAL'
    end
    object QMDetalleANCHO_MEDIDA_TOTAL: TFloatField
      FieldName = 'ANCHO_MEDIDA_TOTAL'
    end
    object QMDetalleFECHA_INSTALACION_PEND: TIntegerField
      DisplayLabel = 'Fec. Instalacion Pend.'
      FieldName = 'FECHA_INSTALACION_PEND'
    end
    object QMDetalleENTREGA_AAFF_PEND: TIntegerField
      DisplayLabel = 'Fec. Entrega Pend.'
      FieldName = 'ENTREGA_AAFF_PEND'
    end
    object QMDetalleHORA_INSTALACION_PEND: TIntegerField
      DisplayLabel = 'Horario Instalacion Pend.'
      FieldName = 'HORA_INSTALACION_PEND'
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleID_MARCA: TIntegerField
      DisplayLabel = 'Id Marca'
      FieldName = 'ID_MARCA'
    end
    object QMDetalleID_MODELO: TIntegerField
      DisplayLabel = 'Id Modelo'
      FieldName = 'ID_MODELO'
    end
    object QMDetalleBASTIDOR: TFIBStringField
      DisplayLabel = 'Bastidor'
      FieldName = 'BASTIDOR'
      Size = 60
    end
    object QMDetalleFECHA_RECOGIDA: TDateTimeField
      DisplayLabel = 'Fec. Recogida'
      FieldName = 'FECHA_RECOGIDA'
    end
    object QMDetalleTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMDetalleFECHA_PREVISTA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fec. Prevista'
      FieldName = 'FECHA_PREVISTA_RECEPCION'
    end
    object QMDetalleCOMENTARIO_PREVISION_RECEPCION: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO_PREVISION_RECEPCION'
      Size = 60
    end
    object QMDetalleFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fec. Recepcion'
      FieldName = 'FECHA_RECEPCION'
    end
    object QMDetalleCOMENTARIO_RECEPCION: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO_RECEPCION'
      Size = 60
    end
    object QMDetalleNOTA: TBlobField
      DisplayLabel = 'Nota'
      FieldName = 'NOTA'
      Size = 8
    end
    object QMDetalleIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 120
    Top = 8
  end
end
