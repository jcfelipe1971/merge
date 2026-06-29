object ZDMLonas: TZDMLonas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 734
  Top = 167
  Height = 208
  Width = 261
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 200
    Top = 24
  end
  object QMLonas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_SYS_LONAS'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO Z_SYS_LONAS'
      
        '  (DESCRIPCION,IMAGEN,CODIGO,MULTIPLO,MULTIPLO_SALIDA,TIPO, SECC' +
        'ION)'
      'VALUES'
      
        '  (?DESCRIPCION,?IMAGEN,?CODIGO,?MULTIPLO,?MULTIPLO_SALIDA,?TIPO' +
        ', ?SECCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_SYS_LONAS'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_LONAS'
      'order by codigo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_SYS_LONAS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,IMAGEN=?IMAGEN '
      '  ,MULTIPLO=?MULTIPLO'
      '  ,MULTIPLO_SALIDA=?MULTIPLO_SALIDA'
      '  ,TIPO=?TIPO'
      '  ,SECCION=?SECCION'
      'WHERE'
      '  CODIGO=?CODIGO ')
    AfterOpen = QMLonasAfterOpen
    BeforeClose = QMLonasBeforeClose
    OnNewRecord = QMLonasNewRecord
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_SYS_LONAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMLonasCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 1
    end
    object QMLonasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMLonasIMAGEN: TIntegerField
      DisplayLabel = 'N'#250'm. Imagen'
      FieldName = 'IMAGEN'
    end
    object QMLonasMULTIPLO: TIntegerField
      DisplayLabel = 'M'#250'ltiplo'
      FieldName = 'MULTIPLO'
    end
    object QMLonasMULTIPLO_SALIDA: TIntegerField
      DisplayLabel = 'Mult. Salida'
      FieldName = 'MULTIPLO_SALIDA'
    end
    object QMLonasTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMLonasSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
  end
  object DSQMLonas: TDataSource
    DataSet = QMLonas
    Left = 116
    Top = 24
  end
  object QMLonaTareas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_LONAS_TAREA'
      'WHERE'
      '  TAREA=?TAREA AND '
      '  CODIGO_LONA=?CODIGO AND '
      '  EMPRESA=?EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_LONAS_TAREA'
      '  (EMPRESA,CODIGO_LONA,TAREA,SECCION,ORDEN,RECURSO)'
      'VALUES'
      '  (?EMPRESA,?CODIGO_LONA,?TAREA,?SECCION,?ORDEN,?RECURSO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_LONAS_TAREA'
      'WHERE'
      '  TAREA=?TAREA AND '
      '  CODIGO_LONA=?CODIGO_LONA AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_LONAS_TAREA'
      'WHERE'
      '  CODIGO_LONA=?CODIGO'
      'ORDER BY ORDEN ASC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_LONAS_TAREA'
      'SET'
      '  SECCION=?SECCION '
      '  ,ORDEN=?ORDEN'
      '  ,RECURSO=?RECURSO '
      'WHERE'
      '  TAREA=?TAREA AND '
      '  CODIGO_LONA=?CODIGO_LONA AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMLonas
    OnNewRecord = QMLonaTareasNewRecord
    ClavesPrimarias.Strings = (
      'TAREA '
      'CODIGO_LONA '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_LONAS_TAREA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 80
    object QMLonaTareasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMLonaTareasCODIGO_LONA: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_LONA'
      Size = 3
    end
    object QMLonaTareasTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 3
    end
    object QMLonaTareasSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMLonaTareasORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMLonaTareasRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
  end
  object DSLonaTareas: TDataSource
    DataSet = QMLonaTareas
    Left = 116
    Top = 80
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 200
    Top = 80
  end
end
