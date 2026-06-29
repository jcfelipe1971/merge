object DMModificaPGC: TDMModificaPGC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 616
  Top = 188
  Height = 361
  Width = 480
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 238
    Top = 21
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 302
    Top = 21
  end
  object QMEmpCanales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CANALES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CANALES'
      
        'WHERE EMPRESA = ?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CAN' +
        'AL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CANALES'
      'SET'
      '   ATO_REGULARIZACION=?ATO_REGULARIZACION '
      '  ,ATO_APERTURA=?ATO_APERTURA '
      '  ,ATO_CIERRE=?ATO_CIERRE '
      '  ,MONEDA=?MONEDA'
      '  ,LIQUIDAR_IVA_MODELO_300 = ?LIQUIDAR_IVA_MODELO_300'
      '  ,CIERRE_PERIODO = ?CIERRE_PERIODO'
      '  ,PGC=?PGC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL ')
    AfterOpen = QMEmpCanalesAfterOpen
    BeforeClose = QMEmpCanalesBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CANALES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 80
    object QMEmpCanalesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEmpCanalesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEmpCanalesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEmpCanalesATO_APERTURA: TIntegerField
      DisplayLabel = 'Ato. Apertura'
      FieldName = 'ATO_APERTURA'
    end
    object QMEmpCanalesATO_CIERRE: TIntegerField
      DisplayLabel = 'Ato. Cierre'
      FieldName = 'ATO_CIERRE'
    end
    object QMEmpCanalesACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMEmpCanalesAPERTURA: TDateTimeField
      DisplayLabel = 'Fec. Apertura'
      FieldName = 'APERTURA'
    end
    object QMEmpCanalesCIERRE: TDateTimeField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
    object QMEmpCanalesLIMITE: TDateTimeField
      DisplayLabel = 'Fec. Limite'
      FieldName = 'LIMITE'
    end
    object QMEmpCanalesNIVELES: TIntegerField
      DisplayLabel = 'Niveles'
      FieldName = 'NIVELES'
    end
    object QMEmpCanalesACTIVACION: TDateTimeField
      DisplayLabel = 'Activacion'
      FieldName = 'ACTIVACION'
    end
    object QMEmpCanalesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMEmpCanalesTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMEmpCanalesMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMEmpCanalesMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMEmpCanalesATO_REGULARIZACION: TIntegerField
      DisplayLabel = 'Ato. Regularizacion'
      FieldName = 'ATO_REGULARIZACION'
    end
    object QMEmpCanalesPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMEmpCanalesLIQUIDAR_IVA_MODELO_300: TIntegerField
      DisplayLabel = 'Liquidar IVA Moneda'
      FieldName = 'LIQUIDAR_IVA_MODELO_300'
    end
    object QMEmpCanalesCIERRE_PERIODO: TDateTimeField
      DisplayLabel = 'Cierre Periodo'
      FieldName = 'CIERRE_PERIODO'
    end
    object QMEmpCanalesPGC: TIntegerField
      DisplayLabel = 'P.G.C.'
      FieldName = 'PGC'
    end
  end
  object DSQMEmpCanales: TDataSource
    DataSet = QMEmpCanales
    Left = 144
    Top = 80
  end
  object xCanales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM GEN_CANALES'
      'WHERE EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL')
    UniDirectional = False
    DataSource = DSQMEmpCanales
    Left = 40
    Top = 144
  end
  object DSxCanales: TDataSource
    DataSet = xCanales
    Left = 144
    Top = 136
  end
  object xPaises: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_PAISES'
      'WHERE PAIS = ?PAIS')
    UniDirectional = False
    DataSource = DSQMEmpCanales
    Left = 40
    Top = 200
  end
  object DSxPaises: TDataSource
    DataSet = xPaises
    Left = 144
    Top = 200
  end
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
      
        '  (E_IMAGEN,APERTURA,FECHA_ALTA,TERCERO,CLIENTE_AUT,IMPRIME_CABE' +
        'CERA,MODO_IVA,ABIERTA,TITULO,DURACION,EMPRESA,PMP_CERO,FECHA_VEN' +
        'TAS,FECHA_CONTABILIZACION_COMPRAS,CIERRE_CONTABLE,LISTAR_PEDIDOS' +
        ',MONEDA,SERIE_AUTOFAC,CIERRA_DOC_CERO,REG_MERCANTIL,E_MAIL,'
      
        '  SERIALIZADO_AUTO, MOV_STOCK_ANULA_VENTAS,MOV_STOCK_ANULA_COMPR' +
        'AS,'
      'PORTES_COMPRAS,PORTES_VENTAS,SEPARAR_APUNTES_REMESAS,'
      'SEPARAR_PEDIDOS_RECEPCION,CONTROL_STOCK_NEG,CONTROL_ASIENTO_NEG)'
      'VALUES'
      
        '  (?E_IMAGEN,?APERTURA,?FECHA_ALTA,?TERCERO,?CLIENTE_AUT,?IMPRIM' +
        'E_CABECERA,?MODO_IVA,?ABIERTA,?TITULO,?DURACION,?EMPRESA,?PMP_CE' +
        'RO,?FECHA_VENTAS,?FECHA_CONTABILIZACION_COMPRAS,?CIERRE_CONTABLE' +
        ',?LISTAR_PEDIDOS,?MONEDA,?SERIE_AUTOFAC,?CIERRA_DOC_CERO,?REG_ME' +
        'RCANTIL,?E_MAIL,'
      
        '  ?SERIALIZADO_AUTO,?MOV_STOCK_ANULA_VENTAS,?MOV_STOCK_ANULA_COM' +
        'PRAS,'
      '?PORTES_COMPRAS,?PORTES_VENTAS,?SEPARAR_APUNTES_REMESAS,'
      
        '?SEPARAR_PEDIDOS_RECEPCION,?CONTROL_STOCK_NEG,?CONTROL_ASIENTO_N' +
        'EG)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_EMPRESAS'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_EMPRESAS'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_EMPRESAS'
      'SET'
      '  E_IMAGEN=?E_IMAGEN '
      '  ,APERTURA=?APERTURA '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,TERCERO=?TERCERO '
      '  ,CLIENTE_AUT=?CLIENTE_AUT '
      '  ,IMPRIME_CABECERA=?IMPRIME_CABECERA '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,ABIERTA=?ABIERTA '
      '  ,TITULO=?TITULO '
      '  ,DURACION=?DURACION '
      '  ,PMP_CERO=?PMP_CERO '
      '  ,FECHA_VENTAS=?FECHA_VENTAS '
      '  ,FECHA_CONTABILIZACION_COMPRAS=?FECHA_CONTABILIZACION_COMPRAS '
      '  ,CIERRE_CONTABLE=?CIERRE_CONTABLE '
      '  ,LISTAR_PEDIDOS=?LISTAR_PEDIDOS '
      '  ,MONEDA=?MONEDA '
      '  ,SERIE_AUTOFAC=?SERIE_AUTOFAC'
      '  ,CIERRA_DOC_CERO = ?CIERRA_DOC_CERO'
      '  ,REG_MERCANTIL = ?REG_MERCANTIL'
      '  ,E_MAIL = ?E_MAIL'
      '  ,SERIALIZADO_AUTO=?SERIALIZADO_AUTO'
      '  ,MOV_STOCK_ANULA_VENTAS=?MOV_STOCK_ANULA_VENTAS'
      '  ,MOV_STOCK_ANULA_COMPRAS=?MOV_STOCK_ANULA_COMPRAS'
      '  ,PORTES_COMPRAS=?PORTES_COMPRAS'
      '  ,PORTES_VENTAS=?PORTES_VENTAS'
      '  ,SEPARAR_APUNTES_REMESAS=?SEPARAR_APUNTES_REMESAS'
      '  ,SEPARAR_PEDIDOS_RECEPCION=?SEPARAR_PEDIDOS_RECEPCION'
      '  ,CONTROL_STOCK_NEG=?CONTROL_STOCK_NEG'
      '  ,CONTROL_ASIENTO_NEG=?CONTROL_ASIENTO_NEG'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_EMPRESAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 34
    Top = 24
    object QMSysEmpresasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSysEmpresasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMSysEmpresasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMSysEmpresasFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMSysEmpresasAPERTURA: TDateTimeField
      DisplayLabel = 'Fec. Apertura'
      FieldName = 'APERTURA'
    end
    object QMSysEmpresasDURACION: TIntegerField
      DisplayLabel = 'Duracion'
      FieldName = 'DURACION'
    end
    object QMSysEmpresasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMSysEmpresasABIERTA: TIntegerField
      DisplayLabel = 'Abierta'
      FieldName = 'ABIERTA'
    end
    object QMSysEmpresasMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMSysEmpresasIMPRIME_CABECERA: TIntegerField
      DisplayLabel = 'Imprime Cabecera'
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
    object QMSysEmpresasREG_MERCANTIL: TBlobField
      DisplayLabel = 'Reg. Mercantil'
      FieldName = 'REG_MERCANTIL'
      Size = 8
    end
    object QMSysEmpresasE_MAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'E_MAIL'
      Size = 40
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
  end
  object DSQMSysEmpresas: TDataSource
    DataSet = QMSysEmpresas
    Left = 130
    Top = 22
  end
  object xPGC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_planes_contables'
      'where pais=?pais and pgc=?pgc')
    UniDirectional = False
    DataSource = DSQMEmpCanales
    Left = 42
    Top = 256
    object xPGCTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxPGC: TDataSource
    DataSet = xPGC
    Left = 146
    Top = 256
  end
  object xPGCN: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_planes_contables'
      'where  pgc=?pgc')
    UniDirectional = False
    Left = 234
    Top = 137
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxPGCN: TDataSource
    DataSet = xPGCN
    Left = 304
    Top = 137
  end
  object xPGCCuentasTipo5: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select cuenta from con_cuentas where empresa = :empresa '
      
        'and ejercicio = :ejercicio and canal = :canal and pgc = :pgc and' +
        ' tipo = 5')
    UniDirectional = False
    Left = 234
    Top = 257
  end
  object xPGCNCuentas: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from c_crea_cuentas_pgc(?empresa,?ejercicio,?canal,?pgc' +
        ')')
    UniDirectional = False
    Left = 232
    Top = 200
  end
  object xPGCNCuentasTipo5: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from c_crea_cuentas_tipo5(?empresa,?ejercicio,?canal,?p' +
        'gc)')
    UniDirectional = False
    Left = 352
    Top = 200
  end
end
