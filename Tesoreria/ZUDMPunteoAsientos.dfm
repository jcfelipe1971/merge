object ZDMPunteoAsientos: TZDMPunteoAsientos
  OldCreateOrder = False
  OnCreate = DMPunteoAsientosCreate
  OnDestroy = DMPunteoAsientosDestroy
  Left = 619
  Top = 198
  Height = 369
  Width = 343
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 192
    Top = 24
  end
  object QMPunteos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'SELECT * FROM VER_CUENTAS_PUNTEOS'
      'WHERE (empresa=?empresa) AND (ejercicio=?ejercicio)'
      ' AND (canal=?canal)')
    InsertSQL.Strings = (
      'SELECT * FROM VER_CUENTAS_PUNTEOS'
      'WHERE (empresa=?empresa) AND (ejercicio=?ejercicio)'
      ' AND (canal=?canal)')
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CUENTAS_PUNTEOS'
      'WHERE '
      '  EMPRESA = ?OLD_EMPRESA AND'
      '  CANAL = ?OLD_CANAL AND'
      '  EJERCICIO = ?OLD_EJERCICIO AND'
      '  RIC = ?OLD_RIC AND'
      '  LINEA = ?OLD_LINEA')
    SelectSQL.Strings = (
      'SELECT'
      'p.*'
      'FROM VER_CUENTAS_PUNTEOS p'
      'WHERE'
      'p.EMPRESA=?EMPRESA AND'
      'p.EJERCICIO=?EJERCICIO AND'
      'p.CANAL=?CANAL AND'
      'p.CUENTA=?CUENTA AND'
      'p.FECHA between ?DFECHA and ?HFECHA'
      'ORDER BY p.FECHA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CUENTAS_PUNTEOS'
      'SET'
      '  PUNTEO = ?PUNTEO,'
      '  FECHA_PUNTEO = ?FECHA_PUNTEO'
      'WHERE'
      '  EMPRESA = ?OLD_EMPRESA AND'
      '  EJERCICIO = ?OLD_EJERCICIO AND'
      '  CANAL = ?OLD_CANAL AND'
      '  RIC = ?OLD_RIC AND'
      '  LINEA = ?OLD_LINEA')
    AfterPost = QMPunteosAfterPost
    AfterScroll = QMPunteosAfterScroll
    BeforePost = QMPunteosBeforePost
    OnNewRecord = QMPunteosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'EJERCICIO '
      'RIC '
      'LINEA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CUENTAS_PUNTEOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMPunteosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPunteosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPunteosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPunteosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMPunteosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPunteosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMPunteosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMPunteosTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object QMPunteosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMPunteosDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMPunteosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMPunteosDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMPunteosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPunteosASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMPunteosPUNTEO: TIntegerField
      DisplayLabel = 'Punteo'
      FieldName = 'PUNTEO'
      OnChange = QMPunteosPUNTEOChange
    end
    object QMPunteosFECHA_PUNTEO: TDateTimeField
      DisplayLabel = 'Fec. Conciliaci'#243'n'
      FieldName = 'FECHA_PUNTEO'
      OnGetText = QMPunteosFECHA_PUNTEOGetText
    end
  end
  object DSQMPunteos: TDataSource
    DataSet = QMPunteos
    Left = 112
    Top = 24
  end
  object QMNorma43: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_NORMA_43_CAB_KRI'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO CON_NORMA_43_CAB_KRI'
      
        '  (ID,OFICINA,FECHA_OPERACION,FECHA_VALOR,SIGNO,IMPORTE,DOC_NUME' +
        'RO,REFERENCIA1,REFERENCIA2,LINEA_IMPORTADA,EMPRESA,CONCEPTO_COMU' +
        'N,CONCEPTO_PROPIO)'
      'VALUES'
      
        '  (?ID,?OFICINA,?FECHA_OPERACION,?FECHA_VALOR,?SIGNO,?IMPORTE,?D' +
        'OC_NUMERO,?REFERENCIA1,?REFERENCIA2,?LINEA_IMPORTADA,?EMPRESA,?C' +
        'ONCEPTO_COMUN,?CONCEPTO_PROPIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_NORMA_43_CAB_KRI'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT'
      'c.*, r.ric, r.linea'
      'FROM CON_NORMA_43_CAB_KRI c'
      'LEFT JOIN CON_NORMA_43_REL_KRI r'
      'ON c.id=r.id'
      'WHERE'
      'c.EMPRESA=?EMPRESA AND'
      'c.BANCO=?BANCO AND '
      'c.FECHA_OPERACION between ?DFECHA and ?HFECHA '
      'ORDER BY c.IMPORTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_NORMA_43_CAB_KRI'
      'SET'
      '  OFICINA=?OFICINA '
      '  ,FECHA_OPERACION=?FECHA_OPERACION '
      '  ,FECHA_VALOR=?FECHA_VALOR '
      '  ,SIGNO=?SIGNO '
      '  ,IMPORTE=?IMPORTE '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,REFERENCIA1=?REFERENCIA1 '
      '  ,REFERENCIA2=?REFERENCIA2 '
      '  ,LINEA_IMPORTADA=?LINEA_IMPORTADA '
      '  ,EMPRESA=?EMPRESA '
      '  ,CONCEPTO_COMUN=?CONCEPTO_COMUN '
      '  ,CONCEPTO_PROPIO=?CONCEPTO_PROPIO '
      '  ,PUNTEO=?PUNTEO'
      'WHERE'
      '  ID=?ID ')
    AfterPost = Graba
    AfterScroll = QMNorma43AfterScroll
    OnNewRecord = QMPunteosNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_NORMA_43_CAB_KRI'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 72
    object QMNorma43ID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNorma43EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNorma43OFICINA: TFIBStringField
      DisplayLabel = 'Oficina'
      FieldName = 'OFICINA'
      Size = 4
    end
    object QMNorma43FECHA_OPERACION: TDateTimeField
      DisplayLabel = 'Fec. Oper.'
      FieldName = 'FECHA_OPERACION'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMNorma43FECHA_VALOR: TDateTimeField
      DisplayLabel = 'Vec. Valor'
      FieldName = 'FECHA_VALOR'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMNorma43CONCEPTO_COMUN: TIntegerField
      DisplayLabel = 'Conc. Com.'
      FieldName = 'CONCEPTO_COMUN'
    end
    object QMNorma43CONCEPTO_PROPIO: TIntegerField
      DisplayLabel = 'Conc. Prop.'
      FieldName = 'CONCEPTO_PROPIO'
    end
    object QMNorma43SIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMNorma43IMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
      DisplayFormat = ',0.00'
    end
    object QMNorma43DOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMNorma43REFERENCIA1: TFIBStringField
      DisplayLabel = 'Ref. 1'
      FieldName = 'REFERENCIA1'
    end
    object QMNorma43REFERENCIA2: TFIBStringField
      DisplayLabel = 'Ref. 2'
      FieldName = 'REFERENCIA2'
    end
    object QMNorma43LINEA_IMPORTADA: TFIBStringField
      DisplayLabel = 'Linea Importada'
      FieldName = 'LINEA_IMPORTADA'
      Size = 100
    end
    object QMNorma43TIT_CONC_COMUN: TStringField
      DisplayLabel = 'Conc. Comun'
      FieldKind = fkCalculated
      FieldName = 'TIT_CONC_COMUN'
      OnGetText = QMNorma43TIT_CONC_COMUNGetText
      Size = 60
      Calculated = True
    end
    object QMNorma43TIT_CONC_PROPIO: TStringField
      DisplayLabel = 'Titulo Conc. Propio'
      FieldKind = fkCalculated
      FieldName = 'TIT_CONC_PROPIO'
      OnGetText = QMNorma43TIT_CONC_PROPIOGetText
      Size = 60
      Calculated = True
    end
    object QMNorma43PUNTEO: TIntegerField
      DisplayLabel = 'Punteo'
      FieldName = 'PUNTEO'
      OnChange = QMNorma43PUNTEOChange
    end
    object QMNorma43BANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMNorma43RIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMNorma43LINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
  end
  object DSQMNorma43: TDataSource
    DataSet = QMNorma43
    Left = 112
    Top = 72
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 24
  end
end
