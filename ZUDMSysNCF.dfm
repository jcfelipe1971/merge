object ZDMSysNCF: TZDMSysNCF
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 544
  Top = 287
  Height = 286
  Width = 338
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
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_NCF_CAB'
      'WHERE'
      '  TIPO_NCF=?old_TIPO_NCF AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_NCF_CAB'
      
        '  (CANAL,SERIE,EMPRESA,VERSION_XML,DEFECTO,TIPO_NCF,DESCRIPCION,' +
        'TIPO)'
      'VALUES'
      
        '  (?CANAL,?SERIE,?EMPRESA,?VERSION_XML,?DEFECTO,?TIPO_NCF,?DESCR' +
        'IPCION,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_NCF_CAB'
      'WHERE'
      '  TIPO_NCF=?TIPO_NCF AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_NCF_CAB'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL'
      'ORDER BY SERIE, TIPO, DEFECTO DESC, TIPO_NCF')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_NCF_CAB'
      'SET'
      '  VERSION_XML=?VERSION_XML '
      '  ,DEFECTO=?DEFECTO '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO_NCF=?TIPO_NCF AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMCabeceraAfterOpen
    AfterScroll = QMCabeceraAfterScroll
    BeforeClose = QMCabeceraBeforeClose
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'TIPO_NCF '
      'TIPO '
      'SERIE '
      'CANAL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_NCF_CAB'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      OnChange = QMCabeceraTIPOChange
      Size = 3
    end
    object QMCabeceraTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'TIPO_NCF'
    end
    object QMCabeceraDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMCabeceraDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QMCabeceraVERSION_XML: TFIBStringField
      DisplayLabel = 'Versio XML'
      FieldName = 'VERSION_XML'
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 144
    Top = 16
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_NCF_DET'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  TIPO_NCF=?old_TIPO_NCF AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_NCF_DET'
      
        '  (EMPRESA,FECHA_FIN,FECHA_INI,FOLIO_INI,FOLIO_FIN,NUM_APROBACIO' +
        'N,ANO_APROBACION,SERIE,CONTADOR_INI,CONTADOR_FIN,CONTADOR_ACTUAL' +
        ',FICHERO,SERIE_DIR,TIPO_NCF,LINEA,ORDEN,ACTIVO,CERTIFICADO,CLAVE' +
        ',VERSION_NCF,TIPO,PREFIJO,CANAL)'
      'VALUES'
      
        '  (?EMPRESA,?FECHA_FIN,?FECHA_INI,?FOLIO_INI,?FOLIO_FIN,?NUM_APR' +
        'OBACION,?ANO_APROBACION,?SERIE,?CONTADOR_INI,?CONTADOR_FIN,?CONT' +
        'ADOR_ACTUAL,?FICHERO,?SERIE_DIR,?TIPO_NCF,?LINEA,?ORDEN,?ACTIVO,' +
        '?CERTIFICADO,?CLAVE,?VERSION_NCF,?TIPO,?PREFIJO,?CANAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_NCF_DET'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  TIPO_NCF=?TIPO_NCF AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_NCF_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  TIPO_NCF=?TIPO_NCF'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_NCF_DET'
      'SET'
      '  FECHA_FIN=?FECHA_FIN '
      '  ,FECHA_INI=?FECHA_INI '
      '  ,FOLIO_INI=?FOLIO_INI '
      '  ,FOLIO_FIN=?FOLIO_FIN '
      '  ,NUM_APROBACION=?NUM_APROBACION '
      '  ,ANO_APROBACION=?ANO_APROBACION '
      '  ,CONTADOR_INI=?CONTADOR_INI '
      '  ,CONTADOR_FIN=?CONTADOR_FIN '
      '  ,CONTADOR_ACTUAL=?CONTADOR_ACTUAL '
      '  ,FICHERO=?FICHERO '
      '  ,SERIE_DIR=?SERIE_DIR '
      '  ,ORDEN=?ORDEN '
      '  ,ACTIVO=?ACTIVO '
      '  ,CERTIFICADO=?CERTIFICADO '
      '  ,CLAVE=?CLAVE '
      '  ,VERSION_NCF=?VERSION_NCF '
      '  ,PREFIJO=?PREFIJO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  TIPO_NCF=?TIPO_NCF AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCabecera
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'TIPO_NCF '
      'TIPO '
      'SERIE '
      'CANAL '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_NCF_DET'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 64
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
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
    object QMDetalleTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'TIPO_NCF'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetallePREFIJO: TFIBStringField
      DisplayLabel = 'Prefijo'
      FieldName = 'PREFIJO'
      Size = 11
    end
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetalleFECHA_INI: TDateTimeField
      DisplayLabel = 'Fecha Ini.'
      FieldName = 'FECHA_INI'
    end
    object QMDetalleCONTADOR_INI: TIntegerField
      DisplayLabel = 'Contador Ini.'
      FieldName = 'CONTADOR_INI'
    end
    object QMDetalleCONTADOR_FIN: TIntegerField
      DisplayLabel = 'Contador Fin.'
      FieldName = 'CONTADOR_FIN'
    end
    object QMDetalleCONTADOR_ACTUAL: TIntegerField
      DisplayLabel = 'Cont. Actual'
      FieldName = 'CONTADOR_ACTUAL'
    end
    object QMDetalleACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMDetalleFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMDetalleFOLIO_INI: TIntegerField
      DisplayLabel = 'Folio Ini.'
      FieldName = 'FOLIO_INI'
    end
    object QMDetalleFOLIO_FIN: TIntegerField
      DisplayLabel = 'Folio Fin'
      FieldName = 'FOLIO_FIN'
    end
    object QMDetalleNUM_APROBACION: TIntegerField
      DisplayLabel = 'Num. Aprobacion'
      FieldName = 'NUM_APROBACION'
    end
    object QMDetalleANO_APROBACION: TIntegerField
      DisplayLabel = 'A'#241'o Aprobacion'
      FieldName = 'ANO_APROBACION'
    end
    object QMDetalleSERIE_DIR: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_DIR'
      Size = 100
    end
    object QMDetalleVERSION_NCF: TFIBStringField
      DisplayLabel = 'Version'
      FieldName = 'VERSION_NCF'
      Size = 15
    end
    object QMDetalleFICHERO: TFIBStringField
      DisplayLabel = 'Fichero'
      FieldName = 'FICHERO'
      Size = 100
    end
    object QMDetalleCLAVE: TFIBStringField
      DisplayLabel = 'Password'
      FieldName = 'CLAVE'
      Size = 25
    end
    object QMDetalleCERTIFICADO: TFIBStringField
      DisplayLabel = 'Num. Certificado'
      FieldName = 'CERTIFICADO'
      Size = 60
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 144
    Top = 64
  end
  object xTipoNCF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select * from z_sys_tipo_ncf'
      'where tipo_ncf=?tipo_ncf')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPO_NCF'
      'ORDER BY TIPO_NCF')
    UniDirectional = False
    Left = 48
    Top = 112
    object xTipoNCFTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'TIPO_NCF'
    end
    object xTipoNCFTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTipoNCF: TDataSource
    DataSet = xTipoNCF
    Left = 144
    Top = 112
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 64
  end
end
