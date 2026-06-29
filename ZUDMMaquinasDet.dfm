object ZDMMaquinasDet: TZDMMaquinasDet
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 1041
  Top = 99
  Height = 407
  Width = 383
  object QMMaquinasC: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_MAQUINAS_CAB'
      'WHERE'
      '  CODMAQ=?old_CODMAQ AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_MAQUINAS_CAB'
      
        '  (EMPRESA,CODMAQ,OBSERVACIONES, ML_CAMBIO_PLANCHA,TIEMPO_CAMBIO' +
        '_PLANCHA)'
      'VALUES'
      
        '  (?EMPRESA,?CODMAQ,?OBSERVACIONES,?ML_CAMBIO_PLANCHA,?TIEMPO_CA' +
        'MBIO_PLANCHA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_MAQUINAS_CAB'
      'WHERE'
      '  CODMAQ=?CODMAQ AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_MAQUINAS_CAB'
      'where empresa=?empresa')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_MAQUINAS_CAB'
      'SET'
      '  OBSERVACIONES=?OBSERVACIONES'
      '  ,ML_CAMBIO_PLANCHA=?ML_CAMBIO_PLANCHA'
      '  ,TIEMPO_CAMBIO_PLANCHA=?TIEMPO_CAMBIO_PLANCHA'
      '  WHERE'
      '  CODMAQ=?CODMAQ AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMMaquinasCAfterOpen
    AfterPost = Graba
    BeforeClose = QMMaquinasCBeforeClose
    OnNewRecord = QMMaquinasCNewRecord
    ClavesPrimarias.Strings = (
      'CODMAQ '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_MAQUINAS_CAB'
    UpdateTransaction = TLocal
    Left = 40
    Top = 32
    object QMMaquinasCEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMaquinasCCODMAQ: TIntegerField
      DisplayLabel = 'Cod. Maquina'
      FieldName = 'CODMAQ'
    end
    object QMMaquinasCOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 60
    end
    object QMMaquinasCDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripciones'
      FieldName = 'DESCRIPCION'
      Size = 35
    end
    object QMMaquinasCML_CAMBIO_PLANCHA: TFloatField
      DisplayLabel = 'ML Cambio Plancha'
      FieldName = 'ML_CAMBIO_PLANCHA'
    end
    object QMMaquinasCTIEMPO_CAMBIO_PLANCHA: TFloatField
      DisplayLabel = 'Tiempo Cambio Plancha'
      FieldName = 'TIEMPO_CAMBIO_PLANCHA'
    end
  end
  object DSQMMaquinasC: TDataSource
    DataSet = QMMaquinasC
    Left = 152
    Top = 32
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 244
    Top = 34
  end
  object QMMaquinasD: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_MAQUINAS_DET'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  CODMAQ=?old_CODMAQ AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_MAQUINAS_DET'
      
        '  (EMPRESA,CODMAQ,LINEA,TINTA,VELOCIDAD,GRAMOS_TINTA,GRAMOS_BARN' +
        'IZ,POLIMEROS,CAMBIO_COLOR,HORAS_PREPARACION)'
      'VALUES'
      
        '  (?EMPRESA,?CODMAQ,?LINEA,?TINTA,?VELOCIDAD,?GRAMOS_TINTA,?GRAM' +
        'OS_BARNIZ,?POLIMEROS,?CAMBIO_COLOR,?HORAS_PREPARACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_MAQUINAS_DET'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CODMAQ=?CODMAQ AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_MAQUINAS_DET '
      'where empresa=?empresa and codmaq=?codmaq'
      'order by empresa,codmaq,linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_MAQUINAS_DET'
      'SET'
      '  TINTA=?TINTA '
      '  ,VELOCIDAD=?VELOCIDAD '
      '  ,GRAMOS_TINTA=?GRAMOS_TINTA '
      '  ,GRAMOS_BARNIZ=?GRAMOS_BARNIZ '
      '  ,POLIMEROS=?POLIMEROS '
      '  ,CAMBIO_COLOR=?CAMBIO_COLOR'
      '  ,HORAS_PREPARACION=?HORAS_PREPARACION'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CODMAQ=?CODMAQ AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMMaquinasC
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMMaquinasDNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'CODMAQ '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_MAQUINAS_det'
    UpdateTransaction = TLocal
    Left = 40
    Top = 160
    object QMMaquinasDEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMaquinasDCODMAQ: TIntegerField
      DisplayLabel = 'Cod. Maquina'
      FieldName = 'CODMAQ'
    end
    object QMMaquinasDLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMMaquinasDTINTA: TIntegerField
      DisplayLabel = 'Tinta'
      FieldName = 'TINTA'
    end
    object QMMaquinasDVELOCIDAD: TFloatField
      DisplayLabel = 'Velocidad'
      FieldName = 'VELOCIDAD'
    end
    object QMMaquinasDGRAMOS_TINTA: TFloatField
      DisplayLabel = 'Gramos Tinta'
      FieldName = 'GRAMOS_TINTA'
    end
    object QMMaquinasDGRAMOS_BARNIZ: TFloatField
      DisplayLabel = 'Gramos Barniz'
      FieldName = 'GRAMOS_BARNIZ'
    end
    object QMMaquinasDPOLIMEROS: TFloatField
      DisplayLabel = 'Polimeros'
      FieldName = 'POLIMEROS'
    end
    object QMMaquinasDCAMBIO_COLOR: TFloatField
      DisplayLabel = 'Cambio Color'
      FieldName = 'CAMBIO_COLOR'
    end
    object QMMaquinasDHORAS_PREPARACION: TFloatField
      DisplayLabel = 'Horas Reparacion'
      FieldName = 'HORAS_PREPARACION'
    end
  end
  object DSQMMaquinasD: TDataSource
    DataSet = QMMaquinasD
    Left = 152
    Top = 160
  end
  object SPLineaSegDet: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea) linea from z_maquinas_det'
      'where (empresa=?empresa and codmaq=?codmaq)')
    Transaction = TLocal
    AutoTrans = True
    Left = 256
    Top = 168
  end
  object xDescMaquina: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MAQUINAS_C'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CODMAQ=?old_CODMAQ ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MAQUINAS_C'
      
        '  (FECHA_COMPRA,OBSERVACION,FECHA_CERT,NSERIE,ID_MAQUINA,CALENDA' +
        'RIO,EMPRESA,CODMAQ,DESCRIPCION,FRECUENCIA,CERTIFICACION,HORARIO,' +
        'RECURSO,TIPO,CODIDE,FABRICANTE,UBICACION)'
      'VALUES'
      
        '  (?FECHA_COMPRA,?OBSERVACION,?FECHA_CERT,?NSERIE,?ID_MAQUINA,?C' +
        'ALENDARIO,?EMPRESA,?CODMAQ,?DESCRIPCION,?FRECUENCIA,?CERTIFICACI' +
        'ON,?HORARIO,?RECURSO,?TIPO,?CODIDE,?FABRICANTE,?UBICACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MAQUINAS_C'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODMAQ=?CODMAQ ')
    SelectSQL.Strings = (
      'SELECT DESCRIPCION FROM PRO_MAQUINAS_C '
      'WHERE CODMAQ=?CODMAQ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MAQUINAS_C'
      'SET'
      '  FECHA_COMPRA=?FECHA_COMPRA '
      '  ,OBSERVACION=?OBSERVACION '
      '  ,FECHA_CERT=?FECHA_CERT '
      '  ,NSERIE=?NSERIE '
      '  ,ID_MAQUINA=?ID_MAQUINA '
      '  ,CALENDARIO=?CALENDARIO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,CERTIFICACION=?CERTIFICACION '
      '  ,HORARIO=?HORARIO '
      '  ,RECURSO=?RECURSO '
      '  ,TIPO=?TIPO '
      '  ,CODIDE=?CODIDE '
      '  ,FABRICANTE=?FABRICANTE '
      '  ,UBICACION=?UBICACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODMAQ=?CODMAQ ')
    DataSource = DSQMMaquinasC
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMMaquinasDNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CODMAQ ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MAQUINAS_C'
    UpdateTransaction = TLocal
    Left = 40
    Top = 220
    object xDescMaquinaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxDescMaquina: TDataSource
    DataSet = xDescMaquina
    Left = 152
    Top = 220
  end
end
