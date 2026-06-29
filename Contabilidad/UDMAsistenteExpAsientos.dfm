object DMAsistenteExpAsientos: TDMAsistenteExpAsientos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 317
  Top = 201
  Height = 414
  Width = 572
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 16
  end
  object XLApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = True
    Left = 128
    Top = 17
  end
  object DSQMAsientosExp: TDataSource
    DataSet = QMAsientosExp
    Left = 137
    Top = 88
  end
  object QMAsientosExp: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_EXPORTAR_ASIENTOS'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ASIENTO=?old_ASIENTO AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_EXPORTAR_ASIENTOS'
      
        '  (ENTRADA,ASIENTO,LINEA,CUENTA,TITULO,TIPO,IMPORTE,MARCADO,TEXT' +
        'O)'
      'VALUES'
      
        '  (?ENTRADA,?ASIENTO,?LINEA,?CUENTA,?TITULO,?TIPO,?IMPORTE,?MARC' +
        'ADO,?TEXTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_EXPORTAR_ASIENTOS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ASIENTO=?ASIENTO AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_EXPORTAR_ASIENTOS'
      'WHERE ENTRADA=?ENTRADA'
      'ORDER BY ASIENTO,LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_EXPORTAR_ASIENTOS'
      'SET'
      '  MARCADO=?MARCADO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ASIENTO=?ASIENTO AND '
      '  ENTRADA=?ENTRADA ')
    OnNewRecord = QMAsientosExpNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ASIENTO '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_EXPORTAR_ASIENTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 88
    object QMAsientosExpENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMAsientosExpASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMAsientosExpLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMAsientosExpCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMAsientosExpTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      DisplayWidth = 150
      FieldName = 'TITULO'
      Size = 150
    end
    object QMAsientosExpTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object QMAsientosExpTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object QMAsientosExpIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMAsientosExpMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
    object QMAsientosExpDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object QMAsientosExpHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object QMAsientosExpFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSQMColumnas: TDataSource
    DataSet = QMColumnas
    Left = 137
    Top = 152
  end
  object QMColumnas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_COLUMNAS_EXPORTAR'
      'WHERE'
      '  NOMBRE_CAMPO=?old_NOMBRE_CAMPO AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_COLUMNAS_EXPORTAR'
      '  (ENTRADA,NOMBRE_CAMPO,NOMBRE_ENCAB,MARCADO)'
      'VALUES'
      '  (?ENTRADA,?NOMBRE_CAMPO,?NOMBRE_ENCAB,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_COLUMNAS_EXPORTAR'
      'WHERE'
      '  NOMBRE_CAMPO=?NOMBRE_CAMPO AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_COLUMNAS_EXPORTAR'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_COLUMNAS_EXPORTAR'
      'SET'
      '  NOMBRE_ENCAB=?NOMBRE_ENCAB '
      '  ,MARCADO=?MARCADO '
      'WHERE'
      '  NOMBRE_CAMPO=?NOMBRE_CAMPO AND '
      '  ENTRADA=?ENTRADA ')
    ClavesPrimarias.Strings = (
      'NOMBRE_CAMPO '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_COLUMNAS_EXPORTAR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 152
    object QMColumnasENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMColumnasNOMBRE_CAMPO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_CAMPO'
      Size = 40
    end
    object QMColumnasNOMBRE_ENCAB: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_ENCAB'
      Size = 40
    end
    object QMColumnasMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
  end
  object xColExportar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select nombre_campo, nombre_encab from tmp_columnas_exportar'
      'where entrada=?entrada and marcado=1')
    UniDirectional = False
    Left = 238
    Top = 94
    object xColExportarNOMBRE_CAMPO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_CAMPO'
      Size = 40
    end
    object xColExportarNOMBRE_ENCAB: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_ENCAB'
      Size = 40
    end
  end
  object DSxColExportar: TDataSource
    DataSet = xColExportar
    Left = 330
    Top = 96
  end
  object xDatosTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select st.tercero,st.nombre_r_social as nombre,st.nif,td.dir_com' +
        'pleta as direccion,'
      
        '       td.dir_localidad as localidad,sl.codigo_postal,sl.provinc' +
        'ia'
      'from tmp_exportar_asientos ea'
      'join con_cuentas_terceros ct'
      'on (ct.cuenta = ea.cuenta)'
      'join sys_terceros st'
      'on (st.tercero = ct.tercero)'
      'join sys_terceros_direcciones td'
      'on (td.tercero = st.tercero and td.direccion=1)'
      'join sys_localidades sl'
      'on (sl.localidad = td.dir_localidad)'
      'where ea.entrada=?entrada and'
      '      ea.cuenta=?cuenta and'
      '      ct.empresa=?empresa and'
      '      ct.ejercicio=?ejercicio and'
      '      ct.canal=?canal ')
    UniDirectional = False
    DataSource = DSxSelAsientos
    Left = 238
    Top = 158
    object xDatosTerceroTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDatosTerceroNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xDatosTerceroNIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'NIF'
    end
    object xDatosTerceroDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 69
    end
    object xDatosTerceroLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 8
    end
    object xDatosTerceroCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xDatosTerceroPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 2
    end
  end
  object DSxDatosTercero: TDataSource
    DataSet = xDatosTercero
    Left = 330
    Top = 160
  end
  object xAsiento: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select ca.titulo'
      'from con_cuentas_asientos ca'
      'where ca.empresa=?empresa and'
      '      ca.ejercicio=?ejercicio and'
      '      ca.canal=?canal and'
      '      ca.ric=?asiento ')
    UniDirectional = False
    DataSource = DSxSelAsientos
    Left = 238
    Top = 222
    object xAsientoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 100
    end
  end
  object xSelAsientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM TMP_EXPORTAR_ASIENTOS'
      'WHERE ENTRADA=?ENTRADA AND MARCADO=1'
      'ORDER BY ASIENTO,LINEA')
    UniDirectional = False
    Left = 38
    Top = 222
    object xSelAsientosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xSelAsientosASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xSelAsientosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xSelAsientosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xSelAsientosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      DisplayWidth = 150
      FieldName = 'TITULO'
      Size = 150
    end
    object xSelAsientosTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object xSelAsientosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object xSelAsientosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xSelAsientosMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
    object xSelAsientosDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xSelAsientosHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xSelAsientosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxSelAsientos: TDataSource
    DataSet = xSelAsientos
    Left = 138
    Top = 224
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 232
    Top = 16
  end
end
