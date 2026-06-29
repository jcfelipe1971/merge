object DMAsistenteEmpresa: TDMAsistenteEmpresa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 381
  Top = 190
  Height = 402
  Width = 556
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 32
    Top = 16
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      '  NOMBRE_R_SOCIAL'
      'FROM SYS_TERCEROS'
      'WHERE TERCERO=?TERCERO')
    UniDirectional = False
    Left = 32
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
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 32
    Top = 112
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
    Left = 32
    Top = 160
  end
  object DSxModosIVA: TDataSource
    DataSet = xModosIVA
    Left = 128
    Top = 160
  end
  object DSxMoneda: TDataSource
    DataSet = xMoneda
    Left = 128
    Top = 112
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 128
    Top = 64
  end
  object QTreeEmpresas: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select  empresa,titulo from sys_empresas order by empresa')
    Transaction = TLocal
    Left = 232
    Top = 112
  end
  object QTreeEjercicios: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select * from emp_ejercicios '
      'where empresa=?empresa and activo=1 order by ejercicio')
    Transaction = TLocal
    Left = 328
    Top = 112
  end
  object QTreeSeries: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select  serie,titulo from ver_canales_series '
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' '
      'order by serie')
    Transaction = TLocal
    Left = 232
    Top = 160
  end
  object QTreeCanales: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select * from ver_canales_activos'
      'where empresa=?empresa and ejercicio=?ejercicio order by canal')
    Transaction = TLocal
    Left = 408
    Top = 112
  end
  object xDatosEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_EMPRESAS'
      'WHERE EMPRESA = ?EMPRESA')
    UniDirectional = False
    Left = 32
    Top = 208
    object xDatosEmpresaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDatosEmpresaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDatosEmpresaTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDatosEmpresaFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object xDatosEmpresaAPERTURA: TDateTimeField
      DisplayLabel = 'Fec. Apertura'
      FieldName = 'APERTURA'
    end
    object xDatosEmpresaDURACION: TIntegerField
      DisplayLabel = 'Duracion'
      FieldName = 'DURACION'
    end
    object xDatosEmpresaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xDatosEmpresaABIERTA: TIntegerField
      DisplayLabel = 'Abierta'
      FieldName = 'ABIERTA'
    end
    object xDatosEmpresaMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object xDatosEmpresaIMPRIME_CABECERA: TIntegerField
      DisplayLabel = 'Imprime Cab.'
      FieldName = 'IMPRIME_CABECERA'
    end
    object xDatosEmpresaCLIENTE_AUT: TIntegerField
      DisplayLabel = 'Cliente Auto'
      FieldName = 'CLIENTE_AUT'
    end
    object xDatosEmpresaPMP_CERO: TIntegerField
      DisplayLabel = 'P.M.P. Cero'
      FieldName = 'PMP_CERO'
    end
    object xDatosEmpresaFECHA_CONTABILIZACION_COMPRAS: TIntegerField
      DisplayLabel = 'Fec. Contab. Compras'
      FieldName = 'FECHA_CONTABILIZACION_COMPRAS'
    end
    object xDatosEmpresaCIERRE_CONTABLE: TIntegerField
      DisplayLabel = 'Cierre Cont.'
      FieldName = 'CIERRE_CONTABLE'
    end
    object xDatosEmpresaFECHA_VENTAS: TIntegerField
      DisplayLabel = 'Fec. Ventas'
      FieldName = 'FECHA_VENTAS'
    end
    object xDatosEmpresaLISTAR_PEDIDOS: TIntegerField
      DisplayLabel = 'Listar Ped.'
      FieldName = 'LISTAR_PEDIDOS'
    end
    object xDatosEmpresaSERIE_AUTOFAC: TFIBStringField
      DisplayLabel = 'Serie Autof.'
      FieldName = 'SERIE_AUTOFAC'
      Size = 10
    end
    object xDatosEmpresaE_IMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'E_IMAGEN'
    end
    object xDatosEmpresaCIERRA_DOC_CERO: TIntegerField
      DisplayLabel = 'Cierra Doc. Cero'
      FieldName = 'CIERRA_DOC_CERO'
    end
    object xDatosEmpresaREG_MERCANTIL: TBlobField
      DisplayLabel = 'Reg. Mercantil'
      FieldName = 'REG_MERCANTIL'
      Size = 8
    end
    object xDatosEmpresaE_MAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'E_MAIL'
      Size = 40
    end
    object xDatosEmpresaPROVEEDOR_AUT: TIntegerField
      DisplayLabel = 'Proveedor Auto'
      FieldName = 'PROVEEDOR_AUT'
    end
    object xDatosEmpresaACREEDOR_AUT: TIntegerField
      DisplayLabel = 'Acreedor Auto'
      FieldName = 'ACREEDOR_AUT'
    end
  end
  object DSxDatosEmpresa: TDataSource
    DataSet = xDatosEmpresa
    Left = 128
    Top = 208
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
    Left = 328
    Top = 16
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
    Left = 232
    Top = 16
  end
  object QMinSerie: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(SERIE) AS SERIE FROM SYS_SERIES')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 232
    Top = 64
  end
  object DSQMCreaEmpresa: TDataSource
    DataSet = QMCreaEmpresa
    Left = 128
    Top = 256
  end
  object SPCreaNiveles: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure c_cuentas_niveles_ab'
      '?empresa,?ejercicio,?canal,?nivel,?digitos')
    Transaction = TLocal
    AutoTrans = True
    Left = 232
    Top = 208
  end
  object QEjerCan: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT FIRST(1) EJERCICIO ,CANAL FROM '
      'EMP_CANALES'
      'WHERE EMPRESA = ?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 328
    Top = 160
  end
  object SPAltas: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure c_cuentas_alta ?empresa,?ejercicio,?canal')
    Transaction = TLocal
    AutoTrans = True
    Left = 328
    Top = 64
  end
  object SPAltas2: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure c_cuentas_alta_2'
      '?empresa,?ejercicio,?canal,?nivel,?cadena,?entrada')
    Transaction = TLocal
    AutoTrans = True
    Left = 408
    Top = 64
  end
  object SPNivCont: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure c_cuentas_niveles_contables '
      '?empresa,?ejercicio,?canal')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 328
    Top = 304
  end
  object QCopiaCanalSerie: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE  E_COPIA_ACTIVA_CAN_SER (?ORIGEN,?DESTINO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 328
    Top = 256
  end
  object QPropaga: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE  E_PROPAGA (?EMPRESA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 408
    Top = 16
  end
  object QCopiaCreaNiveles: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'EXECUTE PROCEDURE E_COPIA_CREA_NIVELES (?ORIGEN,?DESTINO,?EJERCI' +
        'CIO)'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 232
    Top = 256
  end
  object QCopiaCreaEstructura: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE E_COPIA_CREA_ESTRUCTURA (?EMPRESA,?ENTRADA)'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 232
    Top = 304
  end
  object QCopiaGenericos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE E_COPIA_GENERICOS (?ORIGEN,?DESTINO,?ENTRADA)'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 328
    Top = 208
  end
  object ILDefecto: TImageList
    AllocBy = 1
    Height = 1
    Width = 1
    Left = 488
    Top = 16
    Bitmap = {
      494C010101000400040001000100FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000040000000100000001002000000000001000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E00000028000000040000000100000001000100
      00000000040000000000000000000000000000000000000000000000FFFFFF00
      8000000000000000000000000000000000000000000000000000}
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
      'WHERE SERIE = ?SERIE')
    UniDirectional = False
    Left = 32
    Top = 304
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 128
    Top = 304
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 128
    Top = 16
  end
  object QMCreaEmpresa: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'select * from sys_empresas'
      'where empresa = 1')
    InsertSQL.Strings = (
      'INSERT INTO SYS_EMPRESAS ('
      
        'EMPRESA, TITULO, E_IMAGEN, TERCERO, FECHA_ALTA, APERTURA, DURACI' +
        'ON, MONEDA, MODO_IVA, CLIENTE_AUT, PROVEEDOR_AUT,'
      
        ' ACREEDOR_AUT, PMP_CERO, FECHA_CONTABILIZACION_COMPRAS, CIERRE_C' +
        'ONTABLE, FECHA_VENTAS, LISTAR_PEDIDOS, SERIE_AUTOFAC,'
      ' ABIERTA, CIERRA_DOC_CERO, REG_MERCANTIL, E_MAIL)'
      'VALUES ('
      
        '?EMPRESA, ?TITULO, ?E_IMAGEN, ?TERCERO, ?FECHA_ALTA, ?APERTURA, ' +
        '?DURACION, ?MONEDA, ?MODO_IVA, ?CLIENTE_AUT,'
      
        ' ?PROVEEDOR_AUT, ?ACREEDOR_AUT, ?PMP_CERO, ?FECHA_CONTABILIZACIO' +
        'N_COMPRAS, ?CIERRE_CONTABLE, ?FECHA_VENTAS,'
      
        ' ?LISTAR_PEDIDOS, ?SERIE_AUTOFAC, 1, ?CIERRA_DOC_CERO, ?REG_MERC' +
        'ANTIL, ?E_MAIL)')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_EMPRESAS'
      'WHERE'
      'EMPRESA = 0')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'SELECT *'
      'FROM SYS_EMPRESAS'
      'WHERE'
      'EMPRESA = 0')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_EMPRESAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 256
    object QMCreaEmpresaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCreaEmpresaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCreaEmpresaTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCreaEmpresaFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMCreaEmpresaAPERTURA: TDateTimeField
      DisplayLabel = 'Fec. Apertura'
      FieldName = 'APERTURA'
    end
    object QMCreaEmpresaDURACION: TIntegerField
      DisplayLabel = 'Duracion'
      FieldName = 'DURACION'
    end
    object QMCreaEmpresaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCreaEmpresaABIERTA: TIntegerField
      DisplayLabel = 'Abierta'
      FieldName = 'ABIERTA'
    end
    object QMCreaEmpresaMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMCreaEmpresaIMPRIME_CABECERA: TIntegerField
      DisplayLabel = 'Imprime Cab.'
      FieldName = 'IMPRIME_CABECERA'
    end
    object QMCreaEmpresaCLIENTE_AUT: TIntegerField
      DisplayLabel = 'Cliente Auto'
      FieldName = 'CLIENTE_AUT'
    end
    object QMCreaEmpresaPMP_CERO: TIntegerField
      DisplayLabel = 'P.M.P. Cero'
      FieldName = 'PMP_CERO'
    end
    object QMCreaEmpresaFECHA_CONTABILIZACION_COMPRAS: TIntegerField
      DisplayLabel = 'Fec. Contab. Compras'
      FieldName = 'FECHA_CONTABILIZACION_COMPRAS'
    end
    object QMCreaEmpresaCIERRE_CONTABLE: TIntegerField
      DisplayLabel = 'Cierre Cont.'
      FieldName = 'CIERRE_CONTABLE'
    end
    object QMCreaEmpresaFECHA_VENTAS: TIntegerField
      DisplayLabel = 'Fec. Ventas'
      FieldName = 'FECHA_VENTAS'
    end
    object QMCreaEmpresaLISTAR_PEDIDOS: TIntegerField
      DisplayLabel = 'Listar Ped.'
      FieldName = 'LISTAR_PEDIDOS'
    end
    object QMCreaEmpresaSERIE_AUTOFAC: TFIBStringField
      DisplayLabel = 'Serie Autof.'
      FieldName = 'SERIE_AUTOFAC'
      Size = 10
    end
    object QMCreaEmpresaE_IMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'E_IMAGEN'
    end
    object QMCreaEmpresaCIERRA_DOC_CERO: TIntegerField
      DisplayLabel = 'Cierra Doc. Cero'
      FieldName = 'CIERRA_DOC_CERO'
    end
    object QMCreaEmpresaREG_MERCANTIL: TBlobField
      DisplayLabel = 'Reg. Mercantil'
      FieldName = 'REG_MERCANTIL'
      Size = 8
    end
    object QMCreaEmpresaE_MAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'E_MAIL'
      Size = 40
    end
    object QMCreaEmpresaSERIALIZADO_AUTO: TIntegerField
      DisplayLabel = 'Serializado Auto.'
      FieldName = 'SERIALIZADO_AUTO'
    end
    object QMCreaEmpresaMOV_STOCK_ANULA_VENTAS: TIntegerField
      DisplayLabel = 'Mov. Stock Anula Ventas'
      FieldName = 'MOV_STOCK_ANULA_VENTAS'
    end
    object QMCreaEmpresaMOV_STOCK_ANULA_COMPRAS: TIntegerField
      DisplayLabel = 'Mov. Stock Anula Compras'
      FieldName = 'MOV_STOCK_ANULA_COMPRAS'
    end
    object QMCreaEmpresaPORTES_VENTAS: TIntegerField
      DisplayLabel = 'Portes Ventas'
      FieldName = 'PORTES_VENTAS'
    end
    object QMCreaEmpresaPORTES_COMPRAS: TIntegerField
      DisplayLabel = 'Portes Compras'
      FieldName = 'PORTES_COMPRAS'
    end
    object QMCreaEmpresaSEPARAR_APUNTES_REMESAS: TIntegerField
      DisplayLabel = 'Separa Apuntes Remesas'
      FieldName = 'SEPARAR_APUNTES_REMESAS'
    end
    object QMCreaEmpresaSEPARAR_PEDIDOS_RECEPCION: TIntegerField
      DisplayLabel = 'Separa Ped. Recep.'
      FieldName = 'SEPARAR_PEDIDOS_RECEPCION'
    end
    object QMCreaEmpresaCONTROL_STOCK_NEG: TIntegerField
      DisplayLabel = 'Ctrol. Stock Neg.'
      FieldName = 'CONTROL_STOCK_NEG'
    end
    object QMCreaEmpresaCONTROL_ASIENTO_NEG: TIntegerField
      DisplayLabel = 'Ctrol. Asi. Neg.'
      FieldName = 'CONTROL_ASIENTO_NEG'
    end
    object QMCreaEmpresaPROVEEDOR_AUT: TIntegerField
      DisplayLabel = 'Proveedor Auto'
      FieldName = 'PROVEEDOR_AUT'
    end
    object QMCreaEmpresaACREEDOR_AUT: TIntegerField
      DisplayLabel = 'Acreedor Auto'
      FieldName = 'ACREEDOR_AUT'
    end
  end
end
