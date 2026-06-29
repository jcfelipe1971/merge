object DMSincronizacionColon: TDMSincronizacionColon
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 328
  Top = 102
  Height = 311
  Width = 507
  object QMConfiguracion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM IMP_ALP_COLON_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO IMP_ALP_COLON_CONFIGURACION'
      
        '  (EMPRESA,'#13#10'PROVEEDOR,HOST,PUERTO,USUARIO,CLAVE,DIRECTORIO,FECH' +
        'A_ULTIMA_SINC)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?PROVEEDOR,?HOST,?PUERTO,?USUARIO,?CLAVE,?DIRECTOR' +
        'IO,?FECHA_ULTIMA_SINC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM IMP_ALP_COLON_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM IMP_ALP_COLON_CONFIGURACION'
      'WHERE'
      'EMPRESA=:EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE IMP_ALP_COLON_CONFIGURACION'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,HOST=?HOST '
      '  ,PUERTO=?PUERTO '
      '  ,USUARIO=?USUARIO '
      '  ,CLAVE=?CLAVE '
      '  ,DIRECTORIO=?DIRECTORIO '
      '  ,FECHA_ULTIMA_SINC=?FECHA_ULTIMA_SINC '
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'IMP_ALP_COLON_CONFIGURACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 8
    object QMConfiguracionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfiguracionPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMConfiguracionHOST: TFIBStringField
      DisplayLabel = 'Host'
      FieldName = 'HOST'
      Size = 256
    end
    object QMConfiguracionPUERTO: TIntegerField
      DisplayLabel = 'Puerto'
      FieldName = 'PUERTO'
    end
    object QMConfiguracionUSUARIO: TFIBStringField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
      Size = 256
    end
    object QMConfiguracionCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 256
    end
    object QMConfiguracionDIRECTORIO: TFIBStringField
      DisplayLabel = 'Directorio'
      FieldName = 'DIRECTORIO'
      Size = 256
    end
    object QMConfiguracionFECHA_ULTIMA_SINC: TDateTimeField
      DisplayLabel = 'Fec. Ult. Sincronizacion'
      FieldName = 'FECHA_ULTIMA_SINC'
    end
  end
  object DSQMConfiguracion: TDataSource
    DataSet = QMConfiguracion
    Left = 256
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 432
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 432
    Top = 56
  end
  object DSxCabecera: TDataSource
    DataSet = xCabecera
    Left = 256
    Top = 56
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT D.EMPRESA, D.ID_DETALLES_E, D.NRO_DOCUMENTO, D.REFERENCIA' +
        ', D.CODIGO_BARRAS, D.REF_CATALOGO, D.DESCRIPCION,'
      
        '       D.CANTIDAD, D.PRECIO_UNITARIO, D.DESCUENTO, D.IMPORTE_TOT' +
        'AL, D.ID_A, D.LINEA,'
      '       (SELECT FIRST 1 ARTICULO'
      '        FROM ART_ARTICULOS_CODPROV'
      '        WHERE'
      '        EMPRESA = D.EMPRESA AND'
      '        CODIGO_PROVEEDOR = D.REFERENCIA AND'
      '        PROVEEDOR = :PROVEEDOR'
      '        ORDER BY ARTICULO) ARTICULO'
      'FROM IMP_ALP_COLON_DET D'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.NRO_DOCUMENTO = :NRO_DOCUMENTO AND'
      'D.LINEA = :LINEA')
    SelectSQL.Strings = (
      
        'SELECT D.EMPRESA, D.ID_DETALLES_E, D.NRO_DOCUMENTO, D.REFERENCIA' +
        ', D.CODIGO_BARRAS, D.REF_CATALOGO, D.DESCRIPCION,'
      
        '       D.CANTIDAD, D.PRECIO_UNITARIO, D.DESCUENTO, D.IMPORTE_TOT' +
        'AL, D.ID_A, D.LINEA,'
      '       (SELECT FIRST 1 ARTICULO'
      '        FROM ART_ARTICULOS_CODPROV'
      '        WHERE'
      '        EMPRESA = D.EMPRESA AND'
      '        CODIGO_PROVEEDOR = D.REFERENCIA AND'
      '        PROVEEDOR = :PROVEEDOR'
      '        ORDER BY ARTICULO) ARTICULO'
      'FROM IMP_ALP_COLON_DET D'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.NRO_DOCUMENTO = :NRO_DOCUMENTO '
      'ORDER BY D.LINEA')
    UniDirectional = False
    DataSource = DSxCabecera
    Left = 72
    Top = 104
    object xDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_DETALLES_E'
    end
    object xDetalleNRO_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Nro. Documento'
      FieldName = 'NRO_DOCUMENTO'
      Size = 40
    end
    object xDetalleREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object xDetalleCODIGO_BARRAS: TFIBStringField
      DisplayLabel = 'Cod. Barras'
      FieldName = 'CODIGO_BARRAS'
      Size = 40
    end
    object xDetalleREF_CATALOGO: TFIBStringField
      DisplayLabel = 'Ref. Catalogo'
      FieldName = 'REF_CATALOGO'
      Size = 40
    end
    object xDetalleDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 256
    end
    object xDetalleCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xDetallePRECIO_UNITARIO: TFloatField
      DisplayLabel = 'Precio Unit.'
      FieldName = 'PRECIO_UNITARIO'
    end
    object xDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'DESCUENTO'
    end
    object xDetalleIMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Importe total'
      FieldName = 'IMPORTE_TOTAL'
    end
    object xDetalleID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 256
    Top = 104
  end
  object xCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM IMP_ALP_COLON_CAB'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  NRO_DOCUMENTO=?old_NRO_DOCUMENTO ')
    InsertSQL.Strings = (
      'INSERT INTO IMP_ALP_COLON_CAB'
      
        '  (EMPRESA,'#13#10'ID_E,CIF_PROVEEDOR,NRO_DOCUMENTO,CARGO_ABONO,FECHA,' +
        'CODIGO_CLIENTE,CIF_CLIENTE,NRO_ENVIO,DIRECCION_ENVIO,SU_REFERENC' +
        'IA,'#13#10'AGENCIA_TRANSPORTE,DEBIDOS_PAGADOS)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?ID_E,?CIF_PROVEEDOR,?NRO_DOCUMENTO,?CARGO_ABONO,?' +
        'FECHA,?CODIGO_CLIENTE,?CIF_CLIENTE,?NRO_ENVIO,?DIRECCION_ENVIO,?' +
        'SU_REFERENCIA,'#13#10'?AGENCIA_TRANSPORTE,?DEBIDOS_PAGADOS)')
    RefreshSQL.Strings = (
      'SELECT I.*,'
      
        '       (COALESCE((SELECT C.TIPO || '#39' '#39' || C.EJERCICIO || '#39'-'#39' || ' +
        'C.SERIE || '#39'/'#39' || C.RIG'
      '                  FROM GES_CABECERAS_E C'
      '                  WHERE'
      '                  ID_E = I.ID_E), '#39#39')) DESTINO'
      'FROM IMP_ALP_COLON_CAB I'
      'WHERE'
      'I.EMPRESA = :EMPRESA AND '
      'I.NRO_DOCUMENTO = :NRO_DOCUMENTO'
      '')
    SelectSQL.Strings = (
      'SELECT I.*,'
      
        '       (COALESCE((SELECT C.TIPO || '#39' '#39' || C.EJERCICIO || '#39'-'#39' || ' +
        'C.SERIE || '#39'/'#39' || C.RIG'
      '                  FROM GES_CABECERAS_E C'
      '                  WHERE'
      '                  ID_E = I.ID_E), '#39#39')) DESTINO'
      'FROM IMP_ALP_COLON_CAB I'
      'WHERE'
      'I.EMPRESA = :EMPRESA AND'
      'I.FECHA BETWEEN :DESDE AND :HASTA'
      '-- AND I.ID_E = 0'
      'ORDER BY I.NRO_DOCUMENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE IMP_ALP_COLON_CAB'
      'SET'
      '  ID_E=?ID_E '
      '  ,CIF_PROVEEDOR=?CIF_PROVEEDOR '
      '  ,CARGO_ABONO=?CARGO_ABONO '
      '  ,FECHA=?FECHA '
      '  ,CODIGO_CLIENTE=?CODIGO_CLIENTE '
      '  ,CIF_CLIENTE=?CIF_CLIENTE '
      '  ,NRO_ENVIO=?NRO_ENVIO '
      '  ,DIRECCION_ENVIO=?DIRECCION_ENVIO '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,AGENCIA_TRANSPORTE=?AGENCIA_TRANSPORTE '
      '  ,DEBIDOS_PAGADOS=?DEBIDOS_PAGADOS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  NRO_DOCUMENTO=?NRO_DOCUMENTO ')
    AfterOpen = xCabeceraAfterOpen
    BeforeClose = xCabeceraBeforeClose
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'IMP_ALP_COLON_CAB'
    UpdateTransaction = TLocal
    Left = 72
    Top = 56
    object xCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCabeceraID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object xCabeceraCIF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'CIF Prov.'
      FieldName = 'CIF_PROVEEDOR'
    end
    object xCabeceraNRO_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Nro. Documento'
      FieldName = 'NRO_DOCUMENTO'
      Size = 40
    end
    object xCabeceraCARGO_ABONO: TFIBStringField
      DisplayLabel = 'Cargo/Abono'
      FieldName = 'CARGO_ABONO'
      Size = 15
    end
    object xCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xCabeceraCODIGO_CLIENTE: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'CODIGO_CLIENTE'
    end
    object xCabeceraCIF_CLIENTE: TFIBStringField
      DisplayLabel = 'CIF Cliente'
      FieldName = 'CIF_CLIENTE'
    end
    object xCabeceraNRO_ENVIO: TFIBStringField
      DisplayLabel = 'Nro. Envio'
      FieldName = 'NRO_ENVIO'
      Size = 15
    end
    object xCabeceraDIRECCION_ENVIO: TFIBStringField
      DisplayLabel = 'Dir. Envio'
      FieldName = 'DIRECCION_ENVIO'
      Size = 256
    end
    object xCabeceraSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xCabeceraAGENCIA_TRANSPORTE: TFIBStringField
      DisplayLabel = 'Ag. Transporte'
      FieldName = 'AGENCIA_TRANSPORTE'
      Size = 40
    end
    object xCabeceraDEBIDOS_PAGADOS: TFIBStringField
      DisplayLabel = 'Portes'
      FieldName = 'DEBIDOS_PAGADOS'
      Size = 15
    end
    object xCabeceraDESTINO: TFIBStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
      Size = 33
    end
  end
end
