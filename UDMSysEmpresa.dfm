object DMSysEmpresa: TDMSysEmpresa
  OldCreateOrder = False
  OnCreate = DMSysEmpresaCreate
  Left = 548
  Top = 320
  Height = 460
  Width = 549
  object QMSysEmpresas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_EMPRESAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_EMPRESAS'
      
        '  (EMPRESA,'#13#10'TITULO,TERCERO,FECHA_ALTA,APERTURA,DURACION,MONEDA,' +
        'ABIERTA,MODO_IVA,IMPRIME_CABECERA,CLIENTE_AUT,'#13#10'PMP_CERO,FECHA_C' +
        'ONTABILIZACION_COMPRAS,CIERRE_CONTABLE,FECHA_VENTAS,LISTAR_PEDID' +
        'OS,SERIE_AUTOFAC,E_IMAGEN,CIERRA_DOC_CERO,REG_MERCANTIL,E_MAIL,'#13 +
        #10'SERIALIZADO_AUTO,MOV_STOCK_ANULA_VENTAS,MOV_STOCK_ANULA_COMPRAS' +
        ',NO_CONTABILIZAR_FECHA_KRI,FECHA_NO_CONTABILIZACION_KRI,PORTES_V' +
        'ENTAS,PORTES_COMPRAS,SEPARAR_APUNTES_REMESAS,SEPARAR_PEDIDOS_REC' +
        'EPCION,CONTROL_STOCK_NEG,'#13#10'CONTROL_ASIENTO_NEG,IMPORTE_MAX_PEP,I' +
        'MPORTE_LETRAS,SEPARAR_DTO_CIAL,RECC,INVENTARIO_PERMANENTE,TEXTO_' +
        'LOPD,TEXTO_LOPD_PIE_DOCUMENTO,TAMANYO_EMPRESA,AGENCIA_TRIBUTARIA' +
        ','#13#10'GS1_COMPANY_PREFIX,PROVEEDOR_AUT,ACREEDOR_AUT,F_IMAGEN)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?TITULO,?TERCERO,?FECHA_ALTA,?APERTURA,?DURACION,?' +
        'MONEDA,?ABIERTA,?MODO_IVA,?IMPRIME_CABECERA,?CLIENTE_AUT,'#13#10'?PMP_' +
        'CERO,?FECHA_CONTABILIZACION_COMPRAS,?CIERRE_CONTABLE,?FECHA_VENT' +
        'AS,?LISTAR_PEDIDOS,?SERIE_AUTOFAC,?E_IMAGEN,?CIERRA_DOC_CERO,?RE' +
        'G_MERCANTIL,?E_MAIL,'#13#10'?SERIALIZADO_AUTO,?MOV_STOCK_ANULA_VENTAS,' +
        '?MOV_STOCK_ANULA_COMPRAS,?NO_CONTABILIZAR_FECHA_KRI,?FECHA_NO_CO' +
        'NTABILIZACION_KRI,?PORTES_VENTAS,?PORTES_COMPRAS,?SEPARAR_APUNTE' +
        'S_REMESAS,?SEPARAR_PEDIDOS_RECEPCION,?CONTROL_STOCK_NEG,'#13#10'?CONTR' +
        'OL_ASIENTO_NEG,?IMPORTE_MAX_PEP,?IMPORTE_LETRAS,?SEPARAR_DTO_CIA' +
        'L,?RECC,?INVENTARIO_PERMANENTE,?TEXTO_LOPD,?TEXTO_LOPD_PIE_DOCUM' +
        'ENTO,?TAMANYO_EMPRESA,?AGENCIA_TRIBUTARIA,'#13#10'?GS1_COMPANY_PREFIX,' +
        '?PROVEEDOR_AUT,?ACREEDOR_AUT,?F_IMAGEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_EMPRESAS'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_EMPRESAS'
      ' ORDER BY EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_EMPRESAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,TERCERO=?TERCERO '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,APERTURA=?APERTURA '
      '  ,DURACION=?DURACION '
      '  ,MONEDA=?MONEDA '
      '  ,ABIERTA=?ABIERTA '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,IMPRIME_CABECERA=?IMPRIME_CABECERA '
      '  ,CLIENTE_AUT=?CLIENTE_AUT '
      '  ,PMP_CERO=?PMP_CERO '
      '  ,FECHA_CONTABILIZACION_COMPRAS=?FECHA_CONTABILIZACION_COMPRAS '
      '  ,CIERRE_CONTABLE=?CIERRE_CONTABLE '
      '  ,FECHA_VENTAS=?FECHA_VENTAS '
      '  ,LISTAR_PEDIDOS=?LISTAR_PEDIDOS '
      '  ,SERIE_AUTOFAC=?SERIE_AUTOFAC '
      '  ,E_IMAGEN=?E_IMAGEN '
      '  ,CIERRA_DOC_CERO=?CIERRA_DOC_CERO '
      '  ,REG_MERCANTIL=?REG_MERCANTIL '
      '  ,E_MAIL=?E_MAIL '
      '  ,SERIALIZADO_AUTO=?SERIALIZADO_AUTO '
      '  ,MOV_STOCK_ANULA_VENTAS=?MOV_STOCK_ANULA_VENTAS '
      '  ,MOV_STOCK_ANULA_COMPRAS=?MOV_STOCK_ANULA_COMPRAS '
      '  ,NO_CONTABILIZAR_FECHA_KRI=?NO_CONTABILIZAR_FECHA_KRI '
      '  ,FECHA_NO_CONTABILIZACION_KRI=?FECHA_NO_CONTABILIZACION_KRI '
      '  ,PORTES_VENTAS=?PORTES_VENTAS '
      '  ,PORTES_COMPRAS=?PORTES_COMPRAS '
      '  ,SEPARAR_APUNTES_REMESAS=?SEPARAR_APUNTES_REMESAS '
      '  ,SEPARAR_PEDIDOS_RECEPCION=?SEPARAR_PEDIDOS_RECEPCION '
      '  ,CONTROL_STOCK_NEG=?CONTROL_STOCK_NEG '
      '  ,CONTROL_ASIENTO_NEG=?CONTROL_ASIENTO_NEG '
      '  ,IMPORTE_MAX_PEP=?IMPORTE_MAX_PEP '
      '  ,IMPORTE_LETRAS=?IMPORTE_LETRAS '
      '  ,SEPARAR_DTO_CIAL=?SEPARAR_DTO_CIAL '
      '  ,RECC=?RECC '
      '  ,INVENTARIO_PERMANENTE=?INVENTARIO_PERMANENTE '
      '  ,TEXTO_LOPD=?TEXTO_LOPD '
      '  ,TEXTO_LOPD_PIE_DOCUMENTO=?TEXTO_LOPD_PIE_DOCUMENTO '
      '  ,TAMANYO_EMPRESA=?TAMANYO_EMPRESA '
      '  ,AGENCIA_TRIBUTARIA=?AGENCIA_TRIBUTARIA '
      '  ,GS1_COMPANY_PREFIX=?GS1_COMPANY_PREFIX '
      '  ,PROVEEDOR_AUT=?PROVEEDOR_AUT '
      '  ,ACREEDOR_AUT=?ACREEDOR_AUT '
      '  ,F_IMAGEN=?F_IMAGEN '
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      ' ')
    AfterOpen = QMSysEmpresasAfterOpen
    AfterPost = QMSysEmpresasAfterPost
    AfterScroll = QMSysEmpresasAfterScroll
    BeforeClose = QMSysEmpresasBeforeClose
    BeforeDelete = QMSysEmpresasBeforeDelete
    BeforeEdit = QMSysEmpresasBeforeEdit
    BeforePost = QMSysEmpresasBeforePost
    OnNewRecord = QMSysEmpresasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_EMPRESAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMSysEmpresasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSysEmpresasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMSysEmpresasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMSysEmpresasTERCEROChange
    end
    object QMSysEmpresasFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMSysEmpresasAPERTURA: TDateTimeField
      DisplayLabel = 'Apertura'
      FieldName = 'APERTURA'
    end
    object QMSysEmpresasDURACION: TIntegerField
      DisplayLabel = 'Duracion'
      FieldName = 'DURACION'
    end
    object QMSysEmpresasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      OnChange = QMSysEmpresasMONEDAChange
      Size = 3
    end
    object QMSysEmpresasABIERTA: TIntegerField
      DisplayLabel = 'Abierta'
      FieldName = 'ABIERTA'
    end
    object QMSysEmpresasMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
      OnChange = QMSysEmpresasMODO_IVAChange
    end
    object QMSysEmpresasIMPRIME_CABECERA: TIntegerField
      DisplayLabel = 'Imprime Cab.'
      FieldName = 'IMPRIME_CABECERA'
    end
    object QMSysEmpresasCLIENTE_AUT: TIntegerField
      DisplayLabel = 'Cliente Auto.'
      FieldName = 'CLIENTE_AUT'
    end
    object QMSysEmpresasPMP_CERO: TIntegerField
      DisplayLabel = 'P.M.P. Cero'
      FieldName = 'PMP_CERO'
    end
    object QMSysEmpresasFECHA_CONTABILIZACION_COMPRAS: TIntegerField
      DisplayLabel = 'Fec. Contab. Compras'
      FieldName = 'FECHA_CONTABILIZACION_COMPRAS'
    end
    object QMSysEmpresasCIERRE_CONTABLE: TIntegerField
      DisplayLabel = 'Cierre Cont.'
      FieldName = 'CIERRE_CONTABLE'
    end
    object QMSysEmpresasFECHA_VENTAS: TIntegerField
      DisplayLabel = 'Fec. Ventas'
      FieldName = 'FECHA_VENTAS'
    end
    object QMSysEmpresasLISTAR_PEDIDOS: TIntegerField
      DisplayLabel = 'Listar Ped.'
      FieldName = 'LISTAR_PEDIDOS'
    end
    object QMSysEmpresasSERIE_AUTOFAC: TFIBStringField
      DisplayLabel = 'Serie Autof.'
      FieldName = 'SERIE_AUTOFAC'
      OnChange = QMSysEmpresasSERIE_AUTOFACChange
      Size = 10
    end
    object QMSysEmpresasE_IMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'E_IMAGEN'
    end
    object QMSysEmpresasCIERRA_DOC_CERO: TIntegerField
      DisplayLabel = 'Cierra Doc. Cero'
      FieldName = 'CIERRA_DOC_CERO'
    end
    object QMSysEmpresasE_MAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'E_MAIL'
      Size = 100
    end
    object QMSysEmpresasSERIALIZADO_AUTO: TIntegerField
      DisplayLabel = 'Serializado Auto.'
      FieldName = 'SERIALIZADO_AUTO'
    end
    object QMSysEmpresasMOV_STOCK_ANULA_VENTAS: TIntegerField
      DisplayLabel = 'Mov. Stock Anula Ventas'
      FieldName = 'MOV_STOCK_ANULA_VENTAS'
    end
    object QMSysEmpresasMOV_STOCK_ANULA_COMPRAS: TIntegerField
      DisplayLabel = 'Mov. Stock Anula Compras'
      FieldName = 'MOV_STOCK_ANULA_COMPRAS'
    end
    object QMSysEmpresasPORTES_VENTAS: TIntegerField
      DisplayLabel = 'Portes Ventas'
      FieldName = 'PORTES_VENTAS'
    end
    object QMSysEmpresasPORTES_COMPRAS: TIntegerField
      DisplayLabel = 'Portes Compras'
      FieldName = 'PORTES_COMPRAS'
    end
    object QMSysEmpresasSEPARAR_APUNTES_REMESAS: TIntegerField
      DisplayLabel = 'Separa Apuntes Remesas'
      FieldName = 'SEPARAR_APUNTES_REMESAS'
    end
    object QMSysEmpresasSEPARAR_PEDIDOS_RECEPCION: TIntegerField
      DisplayLabel = 'Separa Ped. Recep.'
      FieldName = 'SEPARAR_PEDIDOS_RECEPCION'
    end
    object QMSysEmpresasCONTROL_STOCK_NEG: TIntegerField
      DisplayLabel = 'Ctrol. Stock Neg.'
      FieldName = 'CONTROL_STOCK_NEG'
    end
    object QMSysEmpresasCONTROL_ASIENTO_NEG: TIntegerField
      DisplayLabel = 'Ctrol. Asi. Neg.'
      FieldName = 'CONTROL_ASIENTO_NEG'
    end
    object QMSysEmpresasIMPORTE_MAX_PEP: TFloatField
      DisplayLabel = 'Importe Max. Ped. Compra'
      FieldName = 'IMPORTE_MAX_PEP'
    end
    object QMSysEmpresasNO_CONTABILIZAR_FECHA_KRI: TIntegerField
      DisplayLabel = 'No contabilizar fecha'
      FieldName = 'NO_CONTABILIZAR_FECHA_KRI'
    end
    object QMSysEmpresasFECHA_NO_CONTABILIZACION_KRI: TDateTimeField
      DisplayLabel = 'Fecha No contabilizar'
      FieldName = 'FECHA_NO_CONTABILIZACION_KRI'
    end
    object QMSysEmpresasIMPORTE_LETRAS: TIntegerField
      DisplayLabel = 'Importe Letras'
      FieldName = 'IMPORTE_LETRAS'
    end
    object QMSysEmpresasSEPARAR_DTO_CIAL: TIntegerField
      DisplayLabel = 'Separa Apunte Dto. Cial.'
      FieldName = 'SEPARAR_DTO_CIAL'
    end
    object QMSysEmpresasRECC: TIntegerField
      DisplayLabel = 'Reg. Esp. Critero de Caja'
      FieldName = 'RECC'
    end
    object QMSysEmpresasINVENTARIO_PERMANENTE: TIntegerField
      DisplayLabel = 'Inventario Permanente'
      FieldName = 'INVENTARIO_PERMANENTE'
    end
    object QMSysEmpresasTAMANYO_EMPRESA: TFIBStringField
      DisplayLabel = 'Tama'#241'o Empresa'
      FieldName = 'TAMANYO_EMPRESA'
      Size = 60
    end
    object QMSysEmpresasAGENCIA_TRIBUTARIA: TFIBStringField
      DisplayLabel = 'Agencia Tributaria'
      FieldName = 'AGENCIA_TRIBUTARIA'
      Size = 60
    end
    object QMSysEmpresasGS1_COMPANY_PREFIX: TFIBStringField
      DisplayLabel = 'GS1 Company Prefix'
      FieldName = 'GS1_COMPANY_PREFIX'
    end
    object QMSysEmpresasPROVEEDOR_AUT: TIntegerField
      DisplayLabel = 'Prov. Auto'
      FieldName = 'PROVEEDOR_AUT'
    end
    object QMSysEmpresasACREEDOR_AUT: TIntegerField
      DisplayLabel = 'Acreedor Auto'
      FieldName = 'ACREEDOR_AUT'
    end
    object QMSysEmpresasF_IMAGEN: TIntegerField
      DisplayLabel = 'Imagen Fondo'
      FieldName = 'F_IMAGEN'
    end
    object QMSysEmpresasTEXTO_LOPD_PIE_DOCUMENTO: TMemoField
      DisplayLabel = 'Texto LOPD Pie Documento'
      FieldName = 'TEXTO_LOPD_PIE_DOCUMENTO'
      BlobType = ftMemo
      Size = 8
    end
    object QMSysEmpresasTEXTO_LOPD: TMemoField
      DisplayLabel = 'Texto LOPD'
      FieldName = 'TEXTO_LOPD'
      BlobType = ftMemo
      Size = 8
    end
    object QMSysEmpresasREG_MERCANTIL: TMemoField
      DisplayLabel = 'Reg. Mercantil'
      FieldName = 'REG_MERCANTIL'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSQMSysEmpresas: TDataSource
    DataSet = QMSysEmpresas
    Left = 144
    Top = 16
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      '  NOMBRE_R_SOCIAL, '
      '  NOMBRE_COMERCIAL,'
      '  TIPO_RAZON, '
      '  NIF, '
      '  TELEFONO01, '
      '  TELEFONO02, '
      '  TELEFAX, '
      '  EMAIL,'
      '  WEB'
      'FROM VER_TERCEROS_EDICION'
      'WHERE TERCERO=?TERCERO')
    UniDirectional = False
    DataSource = DSQMSysEmpresas
    Left = 40
    Top = 64
    object xTercerosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xTercerosNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xTercerosTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Razon'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object xTercerosNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xTercerosTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xTercerosTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xTercerosTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object xTercerosEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xTercerosWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 144
    Top = 64
  end
  object xMoneda: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT TITULO'
      'FROM SYS_MONEDAS'
      'where moneda=?moneda')
    UniDirectional = False
    DataSource = DSQMSysEmpresas
    Left = 40
    Top = 112
  end
  object DSxMoneda: TDataSource
    DataSet = xMoneda
    Left = 144
    Top = 112
  end
  object SPEmpAjusta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure e_empresa_ajusta(?empresa)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 256
    Top = 304
  end
  object QMGenEjercicios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GEN_EJERCICIOS'
      'WHERE'
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GEN_EJERCICIOS'
      'WHERE'
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GEN_EJERCICIOS'
      'where empresa=?empresa'
      'order by ejercicio')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GEN_EJERCICIOS'
      'SET'
      '  ACTIVO=?ACTIVO '
      '  ,APERTURA=?APERTURA '
      '  ,CIERRE=?CIERRE '
      'WHERE'
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GEN_EJERCICIOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 256
    object QMGenEjerciciosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMGenEjerciciosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMGenEjerciciosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMGenEjerciciosAPERTURA: TDateTimeField
      DisplayLabel = 'Fec. Apertura'
      FieldName = 'APERTURA'
    end
    object QMGenEjerciciosCIERRE: TDateTimeField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
  end
  object DSQMGenEjercicios: TDataSource
    DataSet = QMGenEjercicios
    Left = 144
    Top = 256
  end
  object xModosIVA: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT '
      '  TITULO,'
      '  IVA,'
      '  RECARGO,'
      '  DEDUCIBLE'
      'FROM SYS_MODO_IVA'
      'where modo=?modo_iva')
    UniDirectional = False
    DataSource = DSQMSysEmpresas
    Left = 40
    Top = 160
  end
  object DSxModosIVA: TDataSource
    DataSet = xModosIVA
    Left = 144
    Top = 160
  end
  object SPActEjercicios: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure g_ejercicios_alta(?empresa)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 256
    Top = 112
  end
  object SPActEmpresa: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure g_empresa_activa(?empresa)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 256
    Top = 208
  end
  object SPLimEmp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure lim_emp(?empresa,?modo)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 256
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 328
    Top = 16
  end
  object SPJustificaDomicilio: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO(?TERCERO)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 256
    Top = 160
  end
  object SPChangeMoneda: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'EXECUTE PROCEDURE e_ajusta_empresa_moneda (?EMPRESA,?ORIGEN,?DES' +
        'TINO,?FECHA,?ENTRADA)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 256
    Top = 256
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_SERIES'
      'WHERE SERIE = ?SERIE_AUTOFAC')
    UniDirectional = False
    DataSource = DSQMSysEmpresas
    Left = 40
    Top = 208
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 144
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
    Left = 256
    Top = 16
  end
  object xTipoGiro: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_EMPRESAS_GIROS'
      'WHERE'
      '  CODIGO_GIRO=?old_CODIGO_GIRO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_EMPRESAS_GIROS'
      '  (EMPRESA,CODIGO_GIRO,ID_TIPO_GIRO,DEFECTO)'
      'VALUES'
      '  (?EMPRESA,?CODIGO_GIRO,?ID_TIPO_GIRO,?DEFECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_EMPRESAS_GIROS'
      'WHERE'
      '  CODIGO_GIRO=?CODIGO_GIRO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  E.*, T.TITULO'
      'FROM SYS_EMPRESAS_GIROS E'
      'JOIN SYS_TIPO_GIRO T'
      'ON E.CODIGO_GIRO = T.CODIGO'
      'WHERE'
      '  E.EMPRESA=?EMPRESA '
      'ORDER BY E.CODIGO_GIRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_EMPRESAS_GIROS'
      'SET'
      '  ID_TIPO_GIRO=?ID_TIPO_GIRO '
      '  ,DEFECTO=?DEFECTO '
      'WHERE'
      '  CODIGO_GIRO=?CODIGO_GIRO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMSysEmpresas
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    AfterDelete = xTipoGiroAfterDelete
    AfterPost = xTipoGiroAfterPost
    OnNewRecord = xTipoGiroNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO_GIRO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_EMPRESAS_GIROS'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 305
    object xTipoGiroEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTipoGiroCODIGO_GIRO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_GIRO'
    end
    object xTipoGiroDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object xTipoGiroTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 150
    end
  end
  object DSxTipoGiro: TDataSource
    DataSet = xTipoGiro
    Left = 144
    Top = 304
  end
  object xConfigEmail: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_EMPRESAS_CORREO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_EMPRESAS_CORREO'
      '  (EMPRESA,'
      'TIPO,ASUNTO,CUERPO,PIE,ID_CONFIG_SERV_CORREOS)'
      'VALUES'
      '  (?EMPRESA,'
      '?TIPO,?ASUNTO,?CUERPO,?PIE,?ID_CONFIG_SERV_CORREOS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_EMPRESAS_CORREO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_EMPRESAS_CORREO'
      'WHERE'
      '  EMPRESA=?EMPRESA'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_EMPRESAS_CORREO'
      'SET'
      '  ASUNTO=?ASUNTO '
      '  ,CUERPO=?CUERPO '
      '  ,PIE=?PIE '
      '  ,ID_CONFIG_SERV_CORREOS=?ID_CONFIG_SERV_CORREOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO ')
    DataSource = DSQMSysEmpresas
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'TIPO ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_EMPRESAS_CORREO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 352
    object xConfigEmailEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xConfigEmailTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xConfigEmailASUNTO: TFIBStringField
      DisplayLabel = 'Asunto'
      FieldName = 'ASUNTO'
      Size = 256
    end
    object xConfigEmailCUERPO: TBlobField
      DisplayLabel = 'Cuerpo'
      FieldName = 'CUERPO'
      Size = 8
    end
    object xConfigEmailPIE: TBlobField
      DisplayLabel = 'Pie'
      FieldName = 'PIE'
      Size = 8
    end
    object xConfigEmailID_CONFIG_SERV_CORREOS: TIntegerField
      DisplayLabel = 'ID Config Serv Correos'
      FieldName = 'ID_CONFIG_SERV_CORREOS'
    end
  end
  object DSxConfigEmail: TDataSource
    DataSet = xConfigEmail
    Left = 144
    Top = 352
  end
end
