object DMSincronizacionSkrit: TDMSincronizacionSkrit
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
      'DELETE FROM SKRIT_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND'
      '  PROVEEDOR=?old_PROVEEDOR')
    InsertSQL.Strings = (
      'INSERT INTO SKRIT_CONFIGURACION'
      '  (EMPRESA,'
      
        'PROVEEDOR,TOKEN,URL_BASE,ASSOCIATE,CLIENT,FECHA_ULTIMA_SINC,PROV' +
        'EEDOR)'
      'VALUES'
      '  (?EMPRESA,'
      
        '?PROVEEDOR,?TOKEN,?URL_BASE,?ASSOCIATE,?CLIENT,?FECHA_ULTIMA_SIN' +
        'C,?PROVEEDOR)')
    RefreshSQL.Strings = (
      'SELECT C.*, T.NOMBRE_R_SOCIAL'
      'FROM SKRIT_CONFIGURACION C'
      
        'JOIN EMP_PROVEEDORES P ON C.EMPRESA = P.EMPRESA AND C.PROVEEDOR ' +
        '= P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.PROVEEDOR = :PROVEEDOR')
    SelectSQL.Strings = (
      'SELECT C.*, T.NOMBRE_R_SOCIAL'
      'FROM SKRIT_CONFIGURACION C'
      
        'JOIN EMP_PROVEEDORES P ON C.EMPRESA = P.EMPRESA AND C.PROVEEDOR ' +
        '= P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA'
      'ORDER BY C.PROVEEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SKRIT_CONFIGURACION'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,TOKEN=?TOKEN '
      '  ,URL_BASE=?URL_BASE '
      '  ,ASSOCIATE=?ASSOCIATE '
      '  ,CLIENT=?CLIENT '
      '  ,FECHA_ULTIMA_SINC=?FECHA_ULTIMA_SINC '
      '  ,PROVEEDOR=?PROVEEDOR '
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AfterOpen = QMConfiguracionAfterOpen
    BeforeClose = QMConfiguracionBeforeClose
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SKRIT_CONFIGURACION'
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
    object QMConfiguracionTOKEN: TFIBStringField
      DisplayLabel = 'Token'
      FieldName = 'TOKEN'
      Size = 256
    end
    object QMConfiguracionURL_BASE: TFIBStringField
      DisplayLabel = 'URL Base'
      FieldName = 'URL_BASE'
      Size = 256
    end
    object QMConfiguracionASSOCIATE: TFIBStringField
      DisplayLabel = 'Associate'
      FieldName = 'ASSOCIATE'
    end
    object QMConfiguracionCLIENT: TFIBStringField
      DisplayLabel = 'Client'
      FieldName = 'CLIENT'
    end
    object QMConfiguracionFECHA_ULTIMA_SINC: TDateTimeField
      DisplayLabel = 'Fec. Ult. Sincronizacion'
      FieldName = 'FECHA_ULTIMA_SINC'
    end
    object QMConfiguracionNOMBRE_R_SOCIAL: TFIBStringField
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
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
    Top = 104
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT D.EMPRESA, D.SERIE, D.CODE, D.LINE, D.REFERENCE, D.EAN, D' +
        '.DESCRIPTION, D.UNITS, D.PRICE, D.DTO1, D.DTO2, D.DTO3,'
      '       D.DTOTOTAL, D.NETLINE, D.ID_DETALLES_E, D.PROVEEDOR,'
      '       (SELECT FIRST 1 ARTICULO'
      '        FROM ART_ARTICULOS_CODPROV'
      '        WHERE'
      '        EMPRESA = D.EMPRESA AND'
      '        CODIGO_PROVEEDOR = D.REFERENCE AND'
      '        PROVEEDOR = :PROVEEDOR'
      '        ORDER BY ARTICULO) ARTICULO'
      'FROM SKRIT_DELIVERY_NOTES_DET D'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.PROVEEDOR = :PROVEEDOR,'
      'D.SERIE = :SERIE AND'
      'D.CODE = :CODE AND '
      'D.LINE = :LINE')
    SelectSQL.Strings = (
      
        'SELECT D.EMPRESA, D.SERIE, D.CODE, D.LINE, D.REFERENCE, D.EAN, D' +
        '.DESCRIPTION, D.UNITS, D.PRICE, D.DTO1, D.DTO2, D.DTO3,'
      '       D.DTOTOTAL, D.NETLINE, D.ID_DETALLES_E, D.PROVEEDOR,'
      '       (SELECT FIRST 1 ARTICULO'
      '        FROM ART_ARTICULOS_CODPROV'
      '        WHERE'
      '        EMPRESA = D.EMPRESA AND'
      '        CODIGO_PROVEEDOR = D.REFERENCE AND'
      '        PROVEEDOR = :PROVEEDOR'
      '        ORDER BY ARTICULO) ARTICULO'
      'FROM SKRIT_DELIVERY_NOTES_DET D'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.PROVEEDOR = :PROVEEDOR AND'
      'D.SERIE = :SERIE AND'
      'D.CODE = :CODE'
      'ORDER BY D.LINE')
    UniDirectional = False
    DataSource = DSxCabecera
    Left = 72
    Top = 152
    object xDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
    end
    object xDetalleCODE: TFIBStringField
      DisplayLabel = 'Nro. Albaran'
      FieldName = 'CODE'
    end
    object xDetalleLINE: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINE'
    end
    object xDetalleREFERENCE: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCE'
    end
    object xDetalleEAN: TFIBStringField
      FieldName = 'EAN'
    end
    object xDetalleDESCRIPTION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPTION'
      Size = 256
    end
    object xDetalleUNITS: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNITS'
    end
    object xDetallePRICE: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRICE'
    end
    object xDetalleDTO1: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DTO1'
    end
    object xDetalleDTO2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DTO2'
    end
    object xDetalleDTO3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DTO3'
    end
    object xDetalleDTOTOTAL: TFloatField
      DisplayLabel = 'Dto.Total'
      FieldName = 'DTOTOTAL'
    end
    object xDetalleNETLINE: TFloatField
      DisplayLabel = 'Neto'
      FieldName = 'NETLINE'
    end
    object xDetalleID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Linea Alb.'
      FieldName = 'ID_DETALLES_E'
    end
    object xDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xDetallePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 256
    Top = 152
  end
  object xCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT S.*,'
      
        '       (COALESCE((SELECT C.TIPO || '#39' '#39' || C.EJERCICIO || '#39'-'#39' || ' +
        'C.SERIE || '#39'/'#39' || C.RIG'
      '                  FROM GES_CABECERAS_E C'
      '                  WHERE'
      '                  ID_E = S.ID_E), '#39#39')) DESTINO'
      'FROM SKRIT_DELIVERY_NOTES S'
      'WHERE'
      'S.EMPRESA=:EMPRESA AND'
      'S.SERIE=:SERIE AND'
      'S.CODE=:CODE')
    SelectSQL.Strings = (
      'SELECT S.*,'
      
        '       (COALESCE((SELECT C.TIPO || '#39' '#39' || C.EJERCICIO || '#39'-'#39' || ' +
        'C.SERIE || '#39'/'#39' || C.RIG'
      '                  FROM GES_CABECERAS_E C'
      '                  WHERE'
      '                  ID_E = S.ID_E), '#39#39')) DESTINO'
      'FROM SKRIT_DELIVERY_NOTES S'
      'WHERE'
      'S.EMPRESA = :EMPRESA AND'
      'S.PROVEEDOR = :PROVEEDOR AND'
      'S.DN_DATE BETWEEN :DESDE AND :HASTA'
      '-- AND S.ID_E = 0'
      'ORDER BY S.SERIE, S.CODE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMConfiguracion
    AfterOpen = xCabeceraAfterOpen
    BeforeClose = xCabeceraBeforeClose
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SKRIT_DELIVERY_NOTES'
    UpdateTransaction = TLocal
    Left = 72
    Top = 104
    object xCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
    end
    object xCabeceraCODE: TFIBStringField
      DisplayLabel = 'Nro. Albaran'
      FieldName = 'CODE'
    end
    object xCabeceraPAYMENT: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAYMENT'
    end
    object xCabeceraDN_DATE: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'DN_DATE'
    end
    object xCabeceraNAME: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NAME'
      Size = 256
    end
    object xCabeceraNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xCabeceraADDRESS: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'ADDRESS'
      Size = 256
    end
    object xCabeceraCOUNTRY: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'COUNTRY'
      Size = 2
    end
    object xCabeceraPROVINCE: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCE'
      Size = 60
    end
    object xCabeceraPROVINCEDESCRIPTION: TFIBStringField
      DisplayLabel = 'Desc. Provincia'
      FieldName = 'PROVINCEDESCRIPTION'
      Size = 60
    end
    object xCabeceraCITY: TFIBStringField
      DisplayLabel = 'Ciudad'
      FieldName = 'CITY'
      Size = 60
    end
    object xCabeceraCITYDESCRIPTION: TFIBStringField
      DisplayLabel = 'Desc. Ciudad'
      FieldName = 'CITYDESCRIPTION'
      Size = 60
    end
    object xCabeceraCP: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CP'
    end
    object xCabeceraPHONE: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'PHONE'
    end
    object xCabeceraEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 256
    end
    object xCabeceraWAREHOUSE: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'WAREHOUSE'
    end
    object xCabeceraREGISTRATION: TFIBStringField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRATION'
      Size = 60
    end
    object xCabeceraORDEREDBY: TFIBStringField
      DisplayLabel = 'Ordenado Por'
      FieldName = 'ORDEREDBY'
      Size = 60
    end
    object xCabeceraORDERNUMBER: TFIBStringField
      DisplayLabel = 'Nro. Orden'
      FieldName = 'ORDERNUMBER'
    end
    object xCabeceraGROSSTOTAL: TFloatField
      DisplayLabel = 'Total Bruto'
      FieldName = 'GROSSTOTAL'
    end
    object xCabeceraSHIPPING: TFloatField
      DisplayLabel = 'Portes'
      FieldName = 'SHIPPING'
    end
    object xCabeceraTAX: TFloatField
      DisplayLabel = 'Impuestos'
      FieldName = 'TAX'
    end
    object xCabeceraRATES: TFloatField
      DisplayLabel = 'Porc. IVA'
      FieldName = 'RATES'
    end
    object xCabeceraPRONTOPAGO: TFloatField
      DisplayLabel = 'Pronto Pago'
      FieldName = 'PRONTOPAGO'
    end
    object xCabeceraRECARGOFINANCIERO: TFloatField
      DisplayLabel = 'Rec. Financiero'
      FieldName = 'RECARGOFINANCIERO'
    end
    object xCabeceraBASEIMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'BASEIMPONIBLE'
    end
    object xCabeceraENTAJEIVA: TFloatField
      DisplayLabel = 'Enteja IVA'
      FieldName = 'ENTAJEIVA'
    end
    object xCabeceraPROMPTPAYMENT: TFloatField
      DisplayLabel = 'Pronto Pago'
      FieldName = 'PROMPTPAYMENT'
    end
    object xCabeceraTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xCabeceraDISCOUNT: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'DISCOUNT'
    end
    object xCabeceraOBSERVATIONS: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVATIONS'
      Size = 256
    end
    object xCabeceraINVOICED: TIntegerField
      DisplayLabel = 'Facturado'
      FieldName = 'INVOICED'
    end
    object xCabeceraID_E: TIntegerField
      DisplayLabel = 'ID Albar'#225'n'
      FieldName = 'ID_E'
    end
    object xCabeceraDESTINO: TFIBStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
      Size = 33
    end
    object xCabeceraPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
  end
  object QMConfiguracionCli: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SKRIT_CONFIGURACION_CLIENT'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  PROVEEDOR=?old_PROVEEDOR AND '
      '  ASSOCIATE=?old_ASSOCIATE AND '
      '  CLIENT=?old_CLIENT ')
    InsertSQL.Strings = (
      'INSERT INTO SKRIT_CONFIGURACION_CLIENT'
      '  (EMPRESA,'#13#10'PROVEEDOR,ASSOCIATE,CLIENT,FECHA_ULTIMA_SINC)'
      'VALUES'
      '  (?EMPRESA,'#13#10'?PROVEEDOR,?ASSOCIATE,?CLIENT,?FECHA_ULTIMA_SINC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SKRIT_CONFIGURACION_CLIENT'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  ASSOCIATE=?ASSOCIATE AND '
      '  CLIENT=?CLIENT ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SKRIT_CONFIGURACION_CLIENT'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  ASSOCIATE=?ASSOCIATE'
      'ORDER BY CLIENT')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SKRIT_CONFIGURACION_CLIENT'
      'SET'
      '  FECHA_ULTIMA_SINC=?FECHA_ULTIMA_SINC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR AND '
      '  ASSOCIATE=?ASSOCIATE AND '
      '  CLIENT=?CLIENT ')
    DataSource = DSQMConfiguracion
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'PROVEEDOR '
      'ASSOCIATE '
      'CLIENT ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SKRIT_CONFIGURACION_CLIENT'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 56
    object QMConfiguracionCliEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfiguracionCliPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMConfiguracionCliASSOCIATE: TFIBStringField
      DisplayLabel = 'Associate'
      FieldName = 'ASSOCIATE'
    end
    object QMConfiguracionCliCLIENT: TFIBStringField
      DisplayLabel = 'Client'
      FieldName = 'CLIENT'
    end
    object QMConfiguracionCliFECHA_ULTIMA_SINC: TDateTimeField
      DisplayLabel = 'Fec. Ult. Sincronizacion'
      FieldName = 'FECHA_ULTIMA_SINC'
    end
  end
  object DSQMConfiguracionCli: TDataSource
    DataSet = QMConfiguracionCli
    Left = 256
    Top = 56
  end
end
