object DMRCVCompra: TDMRCVCompra
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 715
  Top = 212
  Height = 558
  Width = 566
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 376
    Top = 32
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 312
    Top = 32
  end
  object DSQMQMRCV_COMPRA: TDataSource
    DataSet = QMRCV_COMPRA
    Left = 168
    Top = 32
  end
  object QMRCV_COMPRA: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM RCV_COMPRA'
      'WHERE'
      '  RUT_PROVEEDOR=?old_RUT_PROVEEDOR AND '
      '  FOLIO=?Fold_OLIO AND '
      '  TIPO_DOC=?old_TIPO_DOC AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO RCV_COMPRA'
      
        '  (MONTO_IVA_NO_RECUPERABLE,CODIGO_IVA_NO_RECUPERABLE,IVA_NO_RET' +
        'ENIDO,TABACOS_PUROS,EMPRESA,TIPO_DOC,TIPO_COMPRA,RUT_PROVEEDOR,R' +
        'AZON_SOCIAL,FOLIO,FECHA_DOCTO,FECHA_RECEPCION,FECHA_ACUSE_RECIBO' +
        ',FECHA_ACUSE,MONTO_EXENTO,MONTO_NETO,MONTO_IVA_RECUPERABLE,MONTO' +
        '_TOTAL,MONTO_NETO_ACTIVO_FIJO,IVA_ACTIVO_FIJO,IVA_USO_COMUN,IMPU' +
        'ESTO_SIN_DERECHO_CREDITO,TABACOS_SIGARRILLOS,NCE_NDE_FACTURA_COM' +
        'PRA,TABACOS_ELABORADOS,CODIGO_OTRO,VALOR_OTRO_IMP,TASA_OTRO_IMP,' +
        'ENTRADA_SELECCION)'
      'VALUES'
      
        '  (?MONTO_IVA_NO_RECUPERABLE,?CODIGO_IVA_NO_RECUPERABLE,?IVA_NO_' +
        'RETENIDO,?TABACOS_PUROS,?EMPRESA,?TIPO_DOC,?TIPO_COMPRA,?RUT_PRO' +
        'VEEDOR,?RAZON_SOCIAL,?FOLIO,?FECHA_DOCTO,?FECHA_RECEPCION,?FECHA' +
        '_ACUSE_RECIBO,?FECHA_ACUSE,?MONTO_EXENTO,?MONTO_NETO,?MONTO_IVA_' +
        'RECUPERABLE,?MONTO_TOTAL,?MONTO_NETO_ACTIVO_FIJO,?IVA_ACTIVO_FIJ' +
        'O,?IVA_USO_COMUN,?IMPUESTO_SIN_DERECHO_CREDITO,?TABACOS_SIGARRIL' +
        'LOS,?NCE_NDE_FACTURA_COMPRA,?TABACOS_ELABORADOS,?CODIGO_OTRO,?VA' +
        'LOR_OTRO_IMP,?TASA_OTRO_IMP,?ENTRADA_SELECCION)')
    RefreshSQL.Strings = (
      
        'SELECT C.EMPRESA, FAC.EJERCICIO, FAC.SERIE, C.RUT_PROVEEDOR, C.T' +
        'IPO_DOC, C.FOLIO, FAC.ID_E, FAC.RIG,'
      
        '       TER.NOMBRE_R_SOCIAL, C.TIPO_COMPRA, C.RAZON_SOCIAL, C.FEC' +
        'HA_DOCTO, C.FECHA_RECEPCION, C.FECHA_ACUSE,'
      
        '       C.MONTO_EXENTO, C.MONTO_NETO, C.MONTO_IVA_RECUPERABLE, C.' +
        'MONTO_IVA_NO_RECUPERABLE, C.CODIGO_IVA_NO_RECUPERABLE,'
      
        '       C.MONTO_TOTAL, C.MONTO_NETO_ACTIVO_FIJO, C.IVA_ACTIVO_FIJ' +
        'O, C.IVA_USO_COMUN, C.IMPUESTO_SIN_DERECHO_CREDITO,'
      
        '       C.IVA_NO_RETENIDO, C.TABACOS_PUROS, C.TABACOS_SIGARRILLOS' +
        ', C.TABACOS_ELABORADOS, C.NCE_NDE_FACTURA_COMPRA,'
      
        '       C.CODIGO_OTRO, C.VALOR_OTRO_IMP, C.TASA_OTRO_IMP, P.PERIO' +
        'DO, P.TITULO AS TITULO_PERIODO, TDT.TITULO AS T_D_TRIB,'
      
        '       C.ID_ADJUNTO_SIE, C.XML_ACUSE_DTE, C.ESTADORECEPDTE, C.RE' +
        'CEPDTEGLOSA, C.TASA_IVA, C.IVA, C.ENTRADA_SELECCION,'
      '       TER.TERCERO, '
      '       (SELECT FIRST 1 EA.ID'
      '        FROM EMP_ADJUNTOS_RELACION EAR'
      '        JOIN EMP_ADJUNTOS EA ON EAR.ID_ADJUNTO = EA.ID'
      '        WHERE'
      '        EAR.TIPO = '#39'SIE'#39' AND'
      '        EAR.ID = C.ID_ADJUNTO_SIE AND'
      '        UPPER(EA.NOMBRE) LIKE UPPER('#39'%.XML'#39')'
      '        ORDER BY EA.ID DESC) ID_ADJUNTO_XML,'
      '       (SELECT FIRST 1 EA.ID'
      '        FROM EMP_ADJUNTOS_RELACION EAR'
      '        JOIN EMP_ADJUNTOS EA ON EAR.ID_ADJUNTO = EA.ID'
      '        WHERE'
      '        EAR.TIPO = '#39'SIE'#39' AND'
      '        EAR.ID = C.ID_ADJUNTO_SIE AND'
      '        UPPER(EA.NOMBRE) LIKE UPPER('#39'%.PDF'#39')'
      '        ORDER BY EA.ID DESC) ID_ADJUNTO_PDF'
      'FROM RCV_COMPRA C'
      
        'JOIN EMP_PERIODOS P ON C.EMPRESA = P.EMPRESA AND C.FECHA_DOCTO B' +
        'ETWEEN P.DESDE AND P.HASTA AND P.TIPO = 1'
      
        'LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON C.TIPO_DOC = TDT.' +
        'CODIGO'
      'LEFT JOIN SYS_TERCEROS TER ON C.RUT_PROVEEDOR = TER.NIF'
      
        'LEFT JOIN GES_CABECERAS_E_FAC FAC ON FAC.EMPRESA = C.EMPRESA AND' +
        ' /*FAC.EJERCICIO = _EJERCICIO AND FAC.CANAL = _CANAL AND FAC.SER' +
        'IE = _SERIE AND*/ FAC.TIPO = '#39'FAP'#39' AND FAC.FOLIO = C.FOLIO AND -' +
        '-'
      'FAC.PROVEEDOR = (SELECT FIRST 1 PROVEEDOR'
      '                 FROM EMP_PROVEEDORES'
      '                 WHERE'
      '                 EMPRESA = C.EMPRESA AND'
      '                 TERCERO = TER.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.RUT_PROVEEDOR = :RUT_PROVEEDOR AND'
      'C.TIPO_DOC = :TIPO_DOC AND'
      'C.FOLIO = :FOLIO AND'
      'TER.TERCERO = :TERCERO')
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, FAC.EJERCICIO, FAC.SERIE, C.RUT_PROVEEDOR, C.T' +
        'IPO_DOC, C.FOLIO, FAC.ID_E, FAC.RIG,'
      
        '       TER.NOMBRE_R_SOCIAL, C.TIPO_COMPRA, C.RAZON_SOCIAL, C.FEC' +
        'HA_DOCTO, C.FECHA_RECEPCION, C.FECHA_ACUSE,'
      
        '       C.MONTO_EXENTO, C.MONTO_NETO, C.MONTO_IVA_RECUPERABLE, C.' +
        'MONTO_IVA_NO_RECUPERABLE, C.CODIGO_IVA_NO_RECUPERABLE,'
      
        '       C.MONTO_TOTAL, C.MONTO_NETO_ACTIVO_FIJO, C.IVA_ACTIVO_FIJ' +
        'O, C.IVA_USO_COMUN, C.IMPUESTO_SIN_DERECHO_CREDITO,'
      
        '       C.IVA_NO_RETENIDO, C.TABACOS_PUROS, C.TABACOS_SIGARRILLOS' +
        ', C.TABACOS_ELABORADOS, C.NCE_NDE_FACTURA_COMPRA,'
      
        '       C.CODIGO_OTRO, C.VALOR_OTRO_IMP, C.TASA_OTRO_IMP, P.PERIO' +
        'DO, P.TITULO AS TITULO_PERIODO, TDT.TITULO AS T_D_TRIB,'
      
        '       C.ID_ADJUNTO_SIE, C.XML_ACUSE_DTE, C.ESTADORECEPDTE, C.RE' +
        'CEPDTEGLOSA, C.TASA_IVA, C.IVA, C.ENTRADA_SELECCION,'
      '       TER.TERCERO, '
      '       (SELECT FIRST 1 EA.ID'
      '        FROM EMP_ADJUNTOS_RELACION EAR'
      '        JOIN EMP_ADJUNTOS EA ON EAR.ID_ADJUNTO = EA.ID'
      '        WHERE'
      '        EAR.TIPO = '#39'SIE'#39' AND'
      '        EAR.ID = C.ID_ADJUNTO_SIE AND'
      '        UPPER(EA.NOMBRE) LIKE UPPER('#39'%.XML'#39')'
      '        ORDER BY EA.ID DESC) ID_ADJUNTO_XML,'
      '       (SELECT FIRST 1 EA.ID'
      '        FROM EMP_ADJUNTOS_RELACION EAR'
      '        JOIN EMP_ADJUNTOS EA ON EAR.ID_ADJUNTO = EA.ID'
      '        WHERE'
      '        EAR.TIPO = '#39'SIE'#39' AND'
      '        EAR.ID = C.ID_ADJUNTO_SIE AND'
      '        UPPER(EA.NOMBRE) LIKE UPPER('#39'%.PDF'#39')'
      '        ORDER BY EA.ID DESC) ID_ADJUNTO_PDF'
      'FROM RCV_COMPRA C'
      
        'JOIN EMP_PERIODOS P ON C.EMPRESA = P.EMPRESA AND C.FECHA_DOCTO B' +
        'ETWEEN P.DESDE AND P.HASTA AND P.TIPO = 1'
      
        'LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON C.TIPO_DOC = TDT.' +
        'CODIGO'
      'LEFT JOIN SYS_TERCEROS TER ON C.RUT_PROVEEDOR = TER.NIF'
      
        'LEFT JOIN GES_CABECERAS_E_FAC FAC ON FAC.EMPRESA = C.EMPRESA AND' +
        ' /*FAC.EJERCICIO = _EJERCICIO AND FAC.CANAL = _CANAL AND FAC.SER' +
        'IE = _SERIE AND*/ FAC.TIPO = '#39'FAP'#39' AND FAC.FOLIO = C.FOLIO AND -' +
        '-'
      'FAC.PROVEEDOR = (SELECT FIRST 1 PROVEEDOR'
      '                 FROM EMP_PROVEEDORES'
      '                 WHERE'
      '                 EMPRESA = C.EMPRESA AND'
      '                 TERCERO = TER.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA'
      'ORDER BY C.TIPO_DOC, C.FECHA_DOCTO, C.FOLIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE RCV_COMPRA'
      'SET'
      '  MONTO_IVA_NO_RECUPERABLE=?MONTO_IVA_NO_RECUPERABLE '
      '  ,CODIGO_IVA_NO_RECUPERABLE=?CODIGO_IVA_NO_RECUPERABLE '
      '  ,IVA_NO_RETENIDO=?IVA_NO_RETENIDO '
      '  ,TABACOS_PUROS=?TABACOS_PUROS '
      '  ,TIPO_COMPRA=?TIPO_COMPRA '
      '  ,RAZON_SOCIAL=?RAZON_SOCIAL '
      '  ,FECHA_DOCTO=?FECHA_DOCTO '
      '  ,FECHA_RECEPCION=?FECHA_RECEPCION '
      '/*  ,FECHA_ACUSE_RECIBO=?FECHA_ACUSE_RECIBO */'
      '  ,FECHA_ACUSE=?FECHA_ACUSE '
      '  ,MONTO_EXENTO=?MONTO_EXENTO '
      '  ,MONTO_NETO=?MONTO_NETO '
      '  ,MONTO_IVA_RECUPERABLE=?MONTO_IVA_RECUPERABLE '
      '  ,MONTO_TOTAL=?MONTO_TOTAL '
      '  ,MONTO_NETO_ACTIVO_FIJO=?MONTO_NETO_ACTIVO_FIJO '
      '  ,IVA_ACTIVO_FIJO=?IVA_ACTIVO_FIJO '
      '  ,IVA_USO_COMUN=?IVA_USO_COMUN '
      '  ,IMPUESTO_SIN_DERECHO_CREDITO=?IMPUESTO_SIN_DERECHO_CREDITO '
      '  ,TABACOS_SIGARRILLOS=?TABACOS_SIGARRILLOS '
      '  ,NCE_NDE_FACTURA_COMPRA=?NCE_NDE_FACTURA_COMPRA '
      '  ,TABACOS_ELABORADOS=?TABACOS_ELABORADOS '
      '  ,CODIGO_OTRO=?CODIGO_OTRO '
      '  ,VALOR_OTRO_IMP=?VALOR_OTRO_IMP '
      '  ,TASA_OTRO_IMP=?TASA_OTRO_IMP '
      '  ,ENTRADA_SELECCION=?ENTRADA_SELECCION '
      'WHERE'
      '  RUT_PROVEEDOR=?RUT_PROVEEDOR AND '
      '  FOLIO=?FOLIO AND '
      '  TIPO_DOC=?TIPO_DOC AND '
      '  EMPRESA=?EMPRESA ')
    BeforePost = QMRCV_COMPRABeforePost
    OnCalcFields = QMRCV_COMPRACalcFields
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'RCV_COMPRA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 32
    object QMRCV_COMPRARIG: TIntegerField
      DisplayLabel = 'Documento'
      FieldName = 'RIG'
    end
    object QMRCV_COMPRAFOLIO: TFIBStringField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
      Size = 40
    end
    object QMRCV_COMPRANOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMRCV_COMPRAEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRCV_COMPRATIPO_DOC: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPO_DOC'
      Size = 3
    end
    object QMRCV_COMPRATIPO_COMPRA: TFIBStringField
      DisplayLabel = 'Tipo Compra'
      FieldName = 'TIPO_COMPRA'
      Size = 35
    end
    object QMRCV_COMPRARUT_PROVEEDOR: TFIBStringField
      DisplayLabel = 'RUT Proveedor'
      FieldName = 'RUT_PROVEEDOR'
    end
    object QMRCV_COMPRARAZON_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'RAZON_SOCIAL'
      Size = 60
    end
    object QMRCV_COMPRAFECHA_DOCTO: TDateTimeField
      DisplayLabel = 'Fecha Dto.'
      FieldName = 'FECHA_DOCTO'
    end
    object QMRCV_COMPRAFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fecha Recepci'#243'n'
      FieldName = 'FECHA_RECEPCION'
    end
    object QMRCV_COMPRAFECHA_ACUSE: TDateTimeField
      DisplayLabel = 'Fecha Acuse'
      FieldName = 'FECHA_ACUSE'
    end
    object QMRCV_COMPRAMONTO_EXENTO: TFloatField
      DisplayLabel = 'Monto Exento'
      FieldName = 'MONTO_EXENTO'
    end
    object QMRCV_COMPRAMONTO_NETO: TFloatField
      DisplayLabel = 'Monto Neto'
      FieldName = 'MONTO_NETO'
    end
    object QMRCV_COMPRAMONTO_IVA_RECUPERABLE: TFloatField
      DisplayLabel = 'Monto IVA Recuperable'
      FieldName = 'MONTO_IVA_RECUPERABLE'
    end
    object QMRCV_COMPRAMONTO_IVA_NO_RECUPERABLE: TFloatField
      DisplayLabel = 'Monto IVA No Recuperable'
      FieldName = 'MONTO_IVA_NO_RECUPERABLE'
    end
    object QMRCV_COMPRACODIGO_IVA_NO_RECUPERABLE: TIntegerField
      DisplayLabel = 'Codigo IVA No Recuperable'
      FieldName = 'CODIGO_IVA_NO_RECUPERABLE'
    end
    object QMRCV_COMPRAMONTO_TOTAL: TFloatField
      DisplayLabel = 'Monto Total'
      FieldName = 'MONTO_TOTAL'
    end
    object QMRCV_COMPRAMONTO_NETO_ACTIVO_FIJO: TFloatField
      DisplayLabel = 'Monto Neto Activo Fijo'
      FieldName = 'MONTO_NETO_ACTIVO_FIJO'
    end
    object QMRCV_COMPRAIVA_ACTIVO_FIJO: TFloatField
      DisplayLabel = 'IVA Activo Fijo'
      FieldName = 'IVA_ACTIVO_FIJO'
    end
    object QMRCV_COMPRAIVA_USO_COMUN: TFloatField
      DisplayLabel = 'IVA Uso Com'#250'n'
      FieldName = 'IVA_USO_COMUN'
    end
    object QMRCV_COMPRAIMPUESTO_SIN_DERECHO_CREDITO: TFloatField
      DisplayLabel = 'Impuesto sin derecho Cr'#233'dito'
      FieldName = 'IMPUESTO_SIN_DERECHO_CREDITO'
    end
    object QMRCV_COMPRAIVA_NO_RETENIDO: TFloatField
      DisplayLabel = 'IVA No Retenido'
      FieldName = 'IVA_NO_RETENIDO'
    end
    object QMRCV_COMPRATABACOS_PUROS: TFloatField
      DisplayLabel = 'Tabacos Puros'
      FieldName = 'TABACOS_PUROS'
    end
    object QMRCV_COMPRATABACOS_SIGARRILLOS: TFloatField
      DisplayLabel = 'Tabacos Cigarrillos'
      FieldName = 'TABACOS_SIGARRILLOS'
    end
    object QMRCV_COMPRATABACOS_ELABORADOS: TFloatField
      DisplayLabel = 'Tabacos Elaborados'
      FieldName = 'TABACOS_ELABORADOS'
    end
    object QMRCV_COMPRANCE_NDE_FACTURA_COMPRA: TFloatField
      DisplayLabel = 'NCE NDE Factura compra'
      FieldName = 'NCE_NDE_FACTURA_COMPRA'
    end
    object QMRCV_COMPRACODIGO_OTRO: TIntegerField
      DisplayLabel = 'Codigo Otro'
      FieldName = 'CODIGO_OTRO'
    end
    object QMRCV_COMPRAVALOR_OTRO_IMP: TFloatField
      DisplayLabel = 'Valor Otro Impuesto'
      FieldName = 'VALOR_OTRO_IMP'
    end
    object QMRCV_COMPRATASA_OTRO_IMP: TFloatField
      DisplayLabel = 'Tasa Otro Impuesto'
      FieldName = 'TASA_OTRO_IMP'
    end
    object QMRCV_COMPRAPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMRCV_COMPRATITULO_PERIODO: TFIBStringField
      DisplayLabel = 'Titulo Periodo'
      FieldName = 'TITULO_PERIODO'
      Size = 100
    end
    object QMRCV_COMPRAT_D_TRIB: TFIBStringField
      FieldName = 'T_D_TRIB'
      Size = 60
    end
    object QMRCV_COMPRAID_ADJUNTO_SIE: TIntegerField
      DisplayLabel = 'ID Adjunto SIE'
      FieldName = 'ID_ADJUNTO_SIE'
    end
    object QMRCV_COMPRAXML_ACUSE_DTE: TMemoField
      DisplayLabel = 'XML Acuse DTE'
      FieldName = 'XML_ACUSE_DTE'
      BlobType = ftMemo
      Size = 8
    end
    object QMRCV_COMPRAESTADORECEPDTE: TIntegerField
      DisplayLabel = 'Estado Recepcion DTE'
      FieldName = 'ESTADORECEPDTE'
    end
    object QMRCV_COMPRARECEPDTEGLOSA: TFIBStringField
      DisplayLabel = 'Recep. DTE Glosa'
      FieldName = 'RECEPDTEGLOSA'
      Size = 256
    end
    object QMRCV_COMPRAID_ADJUNTO_XML: TIntegerField
      DisplayLabel = 'ID Adjunto XML'
      FieldName = 'ID_ADJUNTO_XML'
    end
    object QMRCV_COMPRAID_ADJUNTO_PDF: TIntegerField
      DisplayLabel = 'ID Adjunto PDF'
      FieldName = 'ID_ADJUNTO_PDF'
    end
    object QMRCV_COMPRAXML_RECIBIDO: TIntegerField
      DisplayLabel = 'Xml Rec.'
      FieldKind = fkCalculated
      FieldName = 'XML_RECIBIDO'
      ReadOnly = True
      Calculated = True
    end
    object QMRCV_COMPRAID_E: TIntegerField
      FieldName = 'ID_E'
    end
    object QMRCV_COMPRAPDF_RECIBIDO: TSmallintField
      DisplayLabel = 'PDF Rec.'
      FieldKind = fkCalculated
      FieldName = 'PDF_RECIBIDO'
      ReadOnly = True
      Calculated = True
    end
    object QMRCV_COMPRAEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMRCV_COMPRASERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMRCV_COMPRATASA_IVA: TFloatField
      DisplayLabel = 'Tasa IVA'
      FieldName = 'TASA_IVA'
    end
    object QMRCV_COMPRAIVA: TFloatField
      FieldName = 'IVA'
    end
    object QMRCV_COMPRAENTRADA_SELECCION: TIntegerField
      DisplayLabel = 'Facturar'
      FieldName = 'ENTRADA_SELECCION'
    end
    object QMRCV_COMPRATERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
end
