object DMTalonesCta: TDMTalonesCta
  OldCreateOrder = False
  OnCreate = DMTalonesCtaCreate
  Left = 338
  Top = 209
  Height = 352
  Width = 408
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 328
    Top = 24
  end
  object QMTalones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_TALONES_CTA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TALON=?old_TALON ')
    InsertSQL.Strings = (
      'INSERT INTO VER_TALONES_CTA'
      
        '  (EMPRESA,EJERCICIO,CANAL,TALON,CUENTA,DESCRIPCION,LUGAR_LIBRAM' +
        'IENTO,FECHA_LIBRAMIENTO,BANCO,IMPORTE,PAGADO,RIC,ASIENTO,Z_CONTA' +
        'DOR,Z_NOTASTALONCC)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TALON,?CUENTA,?DESCRIPCION,?LUGAR' +
        '_LIBRAMIENTO,?FECHA_LIBRAMIENTO,?BANCO,?IMPORTE,?PAGADO,?RIC,?AS' +
        'IENTO,?Z_CONTADOR,?Z_NOTASTALONCC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_TALONES_CTA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND'
      '  TALON=?TALON')
    SelectSQL.Strings = (
      'SELECT * FROM VER_TALONES_CTA'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL'
      'ORDER BY EMPRESA, EJERCICIO, CANAL, TALON')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_TALONES_CTA'
      'SET'
      '  CUENTA=?CUENTA '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,LUGAR_LIBRAMIENTO=?LUGAR_LIBRAMIENTO '
      '  ,FECHA_LIBRAMIENTO=?FECHA_LIBRAMIENTO '
      '  ,BANCO=?BANCO '
      '  ,IMPORTE=?IMPORTE '
      '  ,PAGADO=?PAGADO '
      '  ,RIC=?RIC '
      '  ,ASIENTO=?ASIENTO '
      '  ,TALON=?TALON'
      '  ,Z_CONTADOR=?Z_CONTADOR'
      '  ,Z_NOTASTALONCC=?Z_NOTASTALONCC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TALON=?old_TALON ')
    AfterOpen = QMTalonesAfterOpen
    AfterPost = Graba
    BeforeClose = QMTalonesBeforeClose
    OnNewRecord = QMTalonesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TALON'#13)
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_TALONES_CTA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMTalonesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTalonesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTalonesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTalonesTALON: TFIBStringField
      DisplayLabel = 'Tal'#243'n'
      FieldName = 'TALON'
      Size = 15
    end
    object QMTalonesCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMTalonesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMTalonesLUGAR_LIBRAMIENTO: TFIBStringField
      DisplayLabel = 'Lugar Libramiento'
      FieldName = 'LUGAR_LIBRAMIENTO'
      Size = 60
    end
    object QMTalonesFECHA_LIBRAMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Libr.'
      FieldName = 'FECHA_LIBRAMIENTO'
    end
    object QMTalonesBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMTalonesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMTalonesPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMTalonesRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMTalonesASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMTalonesZ_NOTASTALONCC: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'Z_NOTASTALONCC'
      Size = 8
    end
    object QMTalonesZ_CONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'Z_CONTADOR'
    end
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT TALON, IMPORTE, PAGADO FROM EMP_CARTERA_TAL_CTA'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON=?TALON')
    SelectSQL.Strings = (
      'SELECT TALON, IMPORTE, PAGADO FROM EMP_CARTERA_TAL_CTA'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON=?TALON')
    UniDirectional = False
    DataSource = DSQMTalones
    Left = 32
    Top = 72
    object xInfoActualizadaTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 15
    end
    object xInfoActualizadaIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xInfoActualizadaPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_TALONES_CTA_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TALON=?old_TALON AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_TALONES_CTA_DETALLE'
      
        '  (EMPRESA,EJERCICIO,CANAL,TALON,LINEA,C_CONTRAPARTIDA,TITULO,IM' +
        'PORTE,C_CONTRAPARTIDA_PGC)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TALON,?LINEA,?C_CONTRAPARTIDA,?TI' +
        'TULO,?IMPORTE,?C_CONTRAPARTIDA_PGC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_TALONES_CTA_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TALON=?TALON AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_TALONES_CTA_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON=?TALON'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_TALONES_CTA_DETALLE'
      'SET'
      '  C_CONTRAPARTIDA=?C_CONTRAPARTIDA '
      '  ,TITULO=?TITULO '
      '  ,IMPORTE=?IMPORTE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TALON=?TALON AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMTalones
    AfterDelete = QMDetalleAfterDelete
    AfterPost = QMDetalleAfterPost
    BeforeEdit = QMDetalleBeforeEdit
    BeforeInsert = QMDetalleBeforeInsert
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TALON '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_TALONES_CTA_DETALLE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 120
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
    object QMDetalleTALON: TFIBStringField
      DisplayLabel = 'Tal'#243'n'
      FieldName = 'TALON'
      Size = 15
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleC_CONTRAPARTIDA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'C_CONTRAPARTIDA'
      OnChange = QMDetalleC_CONTRAPARTIDAChange
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMDetalleIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMDetalleC_CONTRAPARTIDA_PGC: TIntegerField
      DisplayLabel = 'Cta. PGC'
      FieldName = 'C_CONTRAPARTIDA_PGC'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 120
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 128
    Top = 72
  end
  object DSQMTalones: TDataSource
    DataSet = QMTalones
    Left = 128
    Top = 24
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
    Top = 24
  end
end
