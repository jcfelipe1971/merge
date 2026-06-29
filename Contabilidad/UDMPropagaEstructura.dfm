object DMPropagaEstructura: TDMPropagaEstructura
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 415
  Top = 264
  Height = 345
  Width = 467
  object DSQMPropagacion: TDataSource
    DataSet = QMPropagacion
    Left = 152
    Top = 72
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 152
    Top = 16
  end
  object QMPropagacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ANA_PROPAGACION'
      'WHERE'
      '  EMPRESA_O=?old_EMPRESA_O AND '
      '  EJERCICIO_O=?old_EJERCICIO_O AND '
      '  CANAL_O=?old_CANAL_O AND '
      '  EMPRESA_D=?old_EMPRESA_D AND '
      '  EJERCICIO_D=?old_EJERCICIO_D AND '
      '  CANAL_D=?old_CANAL_D AND '
      '  PLAN_CONTABLE=?old_PLAN_CONTABLE ')
    InsertSQL.Strings = (
      'INSERT INTO ANA_PROPAGACION'
      
        '  (PLAN_CONTABLE,PLANTILLAS,CANAL_D,EJERCICIO_D,EMPRESA_D,CANAL_' +
        'O,EJERCICIO_O,EMPRESA_O,CUENTAS)'
      'VALUES'
      
        '  (?PLAN_CONTABLE,?PLANTILLAS,?CANAL_D,?EJERCICIO_D,?EMPRESA_D,?' +
        'CANAL_O,?EJERCICIO_O,?EMPRESA_O,?CUENTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANA_PROPAGACION'
      'WHERE'
      '  EMPRESA_O=?EMPRESA_O AND '
      '  EJERCICIO_O=?EJERCICIO_O AND '
      '  CANAL_O=?CANAL_O AND '
      '  EMPRESA_D=?EMPRESA_D AND '
      '  EJERCICIO_D=?old_EJERCICIO_D AND '
      '  CANAL_D=?old_CANAL_D AND '
      '  PLAN_CONTABLE=?old_PLAN_CONTABLE ')
    SelectSQL.Strings = (
      'SELECT * FROM ANA_PROPAGACION'
      'WHERE EMPRESA_O=?EMPRESA_O AND'
      '               EJERCICIO_O=?EJERCICIO_O AND'
      '               CANAL_O=?CANAL_O'
      'order by empresa_o,ejercicio_o,canal_o,plan_contable')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ANA_PROPAGACION'
      'SET'
      '  PLANTILLAS=?PLANTILLAS '
      '  ,CUENTAS=?CUENTAS '
      'WHERE'
      '  EMPRESA_O=?EMPRESA_O AND '
      '  EJERCICIO_O=?EJERCICIO_O AND '
      '  CANAL_O=?CANAL_O AND '
      '  EMPRESA_D=?EMPRESA_D AND '
      '  EJERCICIO_D=?old_EJERCICIO_D AND '
      '  CANAL_D=?old_CANAL_D AND '
      '  PLAN_CONTABLE=?old_PLAN_CONTABLE ')
    AfterCancel = QMPropagacionAfterCancel
    AfterDelete = Graba
    AfterInsert = QMPropagacionAfterInsert
    AfterOpen = QMPropagacionAfterOpen
    AfterPost = QMPropagacionAfterPost
    OnNewRecord = QMPropagacionNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA_O '
      'EJERCICIO_O '
      'CANAL_O '
      'EMPRESA_D '
      'EJERCICIO_D '
      'CANAL_D '
      'PLAN_CONTABLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ANA_PROPAGACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 74
    object QMPropagacionEMPRESA_O: TIntegerField
      DisplayLabel = 'Emp. Origen'
      FieldName = 'EMPRESA_O'
    end
    object QMPropagacionEJERCICIO_O: TIntegerField
      DisplayLabel = 'Ejercicio O.'
      FieldName = 'EJERCICIO_O'
    end
    object QMPropagacionCANAL_O: TIntegerField
      DisplayLabel = 'Canal Orig.'
      FieldName = 'CANAL_O'
    end
    object QMPropagacionEMPRESA_D: TIntegerField
      DisplayLabel = 'Emp. Destino'
      FieldName = 'EMPRESA_D'
    end
    object QMPropagacionEJERCICIO_D: TIntegerField
      DisplayLabel = 'Ejercicio D.'
      FieldName = 'EJERCICIO_D'
    end
    object QMPropagacionCANAL_D: TIntegerField
      DisplayLabel = 'Can. Destino'
      FieldName = 'CANAL_D'
      OnChange = QMPropagacionCANAL_DChange
    end
    object QMPropagacionPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      OnChange = QMPropagacionPLAN_CONTABLEChange
      Size = 10
    end
    object QMPropagacionPLANTILLAS: TIntegerField
      DisplayLabel = 'Plantillas'
      FieldName = 'PLANTILLAS'
    end
    object QMPropagacionCUENTAS: TIntegerField
      DisplayLabel = 'Cuentas'
      FieldName = 'CUENTAS'
    end
  end
  object xEmpresaO: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from sys_empresas where empresa=?empresa_o')
    UniDirectional = False
    DataSource = DSQMPropagacion
    Left = 304
    Top = 24
  end
  object DSxEmpresaO: TDataSource
    DataSet = xEmpresaO
    Left = 376
    Top = 24
  end
  object xEmpresaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from sys_empresas where empresa=?empresa_d')
    UniDirectional = False
    DataSource = DSQMPropagacion
    Left = 304
    Top = 80
  end
  object DSxEmpresaD: TDataSource
    DataSet = xEmpresaD
    Left = 376
    Top = 80
  end
  object xCanalO: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from sys_canales'
      'where canal=?canal_o')
    UniDirectional = False
    DataSource = DSQMPropagacion
    Left = 304
    Top = 136
  end
  object DSxCanalO: TDataSource
    DataSet = xCanalO
    Left = 376
    Top = 136
  end
  object xCanalD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from sys_canales'
      'where canal=?canal_d')
    UniDirectional = False
    DataSource = DSQMPropagacion
    Left = 304
    Top = 192
  end
  object DSxCanalD: TDataSource
    DataSet = xCanalD
    Left = 376
    Top = 192
  end
  object xPlan: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ana_plan_contable'
      'where empresa=?empresa_o and ejercicio=?ejercicio_o and'
      'canal=?canal_o and plan_contable=?plan_contable')
    UniDirectional = False
    DataSource = DSQMPropagacion
    Left = 304
    Top = 248
  end
  object DSxPlan: TDataSource
    DataSet = xPlan
    Left = 376
    Top = 248
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 160
    Top = 128
  end
end
