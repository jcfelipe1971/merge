object DMRestriccion: TDMRestriccion
  OldCreateOrder = False
  OnCreate = DMRestriccionCreate
  Left = 560
  Top = 258
  Height = 300
  Width = 498
  object QMRestriccion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_USUARIOS_PERFIL'
      'WHERE'
      '  PERFIL=?old_PERFIL ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_USUARIOS_PERFIL'
      
        '  (AGENTE,PERFIL,PERFIL_DE_AGENTE,SUPERIOR,CONTABILIDAD_ANALITIC' +
        'A,TACTIL,PUEDE_ABRIR_FACTURA_VENTA,TITULO)'
      'VALUES'
      
        '  (?AGENTE,?PERFIL,?PERFIL_DE_AGENTE,?SUPERIOR,?CONTABILIDAD_ANA' +
        'LITICA,?TACTIL,?PUEDE_ABRIR_FACTURA_VENTA,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_USUARIOS_PERFIL'
      'WHERE'
      '  PERFIL=?PERFIL ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_USUARIOS_PERFIL'
      'ORDER BY PERFIL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_USUARIOS_PERFIL'
      'SET'
      '  AGENTE=?AGENTE '
      '  ,PERFIL_DE_AGENTE=?PERFIL_DE_AGENTE '
      '  ,SUPERIOR=?SUPERIOR '
      '  ,CONTABILIDAD_ANALITICA=?CONTABILIDAD_ANALITICA '
      '  ,TACTIL=?TACTIL '
      '  ,PUEDE_ABRIR_FACTURA_VENTA=?PUEDE_ABRIR_FACTURA_VENTA '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  PERFIL=?PERFIL ')
    AfterOpen = QMRestriccionAfterOpen
    BeforeClose = QMRestriccionBeforeClose
    BeforePost = QMRestriccionBeforePost
    OnNewRecord = QMRestriccionNewRecord
    ClavesPrimarias.Strings = (
      'PERFIL ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_USUARIOS_PERFIL'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 16
    object QMRestriccionPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
    end
    object QMRestriccionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
    object QMRestriccionPROTECCION: TMemoField
      DisplayLabel = 'Proteccion'
      FieldName = 'PROTECCION'
      BlobType = ftMemo
      Size = 8
    end
    object QMRestriccionPERFIL_DE_AGENTE: TIntegerField
      DisplayLabel = 'Perf. Agente'
      FieldName = 'PERFIL_DE_AGENTE'
    end
    object QMRestriccionAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMRestriccionSUPERIOR: TIntegerField
      DisplayLabel = 'Superior'
      FieldName = 'SUPERIOR'
    end
    object QMRestriccionCONTABILIDAD_ANALITICA: TIntegerField
      DisplayLabel = 'Contab. Analitica'
      FieldName = 'CONTABILIDAD_ANALITICA'
    end
    object QMRestriccionTACTIL: TIntegerField
      DisplayLabel = 'Tactil'
      FieldName = 'TACTIL'
    end
    object QMRestriccionULT_MODIFICACION: TDateTimeField
      DisplayLabel = 'Ult. Modificacion'
      FieldName = 'ULT_MODIFICACION'
    end
    object QMRestriccionPUEDE_ABRIR_FACTURA_VENTA: TIntegerField
      DisplayLabel = 'Puede Abrir Fact. Venta'
      FieldName = 'PUEDE_ABRIR_FACTURA_VENTA'
    end
  end
  object DSRestriccion: TDataSource
    DataSet = QMRestriccion
    Left = 168
    Top = 16
  end
  object QMRestriccionEEC: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_USUARIOS_PERFIL_EEC'
      'WHERE'
      '  PERFIL=?old_PERFIL AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_USUARIOS_PERFIL_EEC'
      '  (CANAL,EJERCICIO,EMPRESA,LINEA,PERFIL,SERIE)'
      'VALUES'
      '  (?CANAL,?EJERCICIO,?EMPRESA,?LINEA,?PERFIL,?SERIE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_USUARIOS_PERFIL_EEC'
      'WHERE'
      '  PERFIL=?PERFIL AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_USUARIOS_PERFIL_EEC'
      'WHERE'
      '  PERFIL=?PERFIL'
      'ORDER BY EMPRESA, EJERCICIO, CANAL, SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_USUARIOS_PERFIL_EEC'
      'SET'
      '  CANAL=?CANAL '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,EMPRESA=?EMPRESA'
      '  ,SERIE=?SERIE'
      'WHERE'
      '  PERFIL=?PERFIL AND '
      '  LINEA=?LINEA ')
    DataSource = DSRestriccion
    BeforeInsert = QMRestriccionEECBeforeInsert
    OnNewRecord = QMRestriccionEECNewRecord
    ClavesPrimarias.Strings = (
      'PERFIL '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_USUARIOS_PERFIL_EEC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 64
    object QMRestriccionEECPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
    end
    object QMRestriccionEECLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMRestriccionEECEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRestriccionEECEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
      OnValidate = QMRestriccionEECEJERCICIOValidate
    end
    object QMRestriccionEECCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
      OnValidate = QMRestriccionEECCANALValidate
    end
    object QMRestriccionEECSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      DisplayWidth = 10
      FieldName = 'SERIE'
      Size = 10
    end
  end
  object DSQMRestriccionEEC: TDataSource
    DataSet = QMRestriccionEEC
    Left = 168
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 272
    Top = 16
  end
  object xRestriccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CLIENTES'
      'WHERE empresa=?empresa '
      'and ejercicio=?ejercicio'
      'and canal=?canal'
      'and cliente=?cliente'
      '')
    SelectSQL.Strings = (
      'select titulo from sys_usuarios_perfil'
      'where perfil=?perfil')
    UniDirectional = False
    Left = 56
    Top = 112
    object xRestriccionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
  end
  object DSxRestriccion: TDataSource
    DataSet = xRestriccion
    Left = 168
    Top = 112
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 344
    Top = 16
  end
end
