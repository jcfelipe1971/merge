object ProDMLstMarcajes: TProDMLstMarcajes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 443
  Top = 78
  Height = 389
  Width = 522
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 448
    Top = 24
  end
  object QMGenerarLst: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from pro_lst_marcajes(?EMPRESA,?EJERCICIO,?CANAL,?SERIE' +
        ',?TIPO_FILTRO,?RIGD,?RIGH,?OPERARIOD,?OPERARIOH,?MAQUINAD,?MAQUI' +
        'NAH,?PROVEEDORD,?PROVEEDORH,?VARIOSD,?VARIOSH,?TIPOFASED,?TIPOFA' +
        'SEH,?TIPOTAREAD,?TIPOTAREAH,?FECHAD,?FECHAH,?T_IDTAREA,?IDTAREAD' +
        ',?IDTAREAH,?IDORDEN_D,?IDORDEN_H,?COMPUESTOD,?COMPUESTOH)'
      '/*s'#39'actualitza el order al formulari*/')
    UniDirectional = False
    Left = 32
    Top = 24
  end
  object DSGenerar: TDataSource
    DataSet = QMGenerarLst
    Left = 112
    Top = 24
  end
  object frDBMarcajes: TfrDBDataSet
    DataSource = DSGenerar
    Left = 200
    Top = 24
  end
  object frMarcajes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Marcajes'
    RebuildPrinter = False
    OnGetValue = frMarcajesGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 448
    Top = 72
    ReportForm = {19000000}
  end
  object xMaquinaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DESCRIPCION FROM PRO_MAQUINAS_C'
      'WHERE EMPRESA=?EMPRESA AND CODMAQ=?CODMAQ')
    UniDirectional = False
    Left = 32
    Top = 120
    object xMaquinaDDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxMaquinaD: TDataSource
    DataSet = xMaquinaD
    Left = 112
    Top = 120
  end
  object xMaquinaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DESCRIPCION FROM PRO_MAQUINAS_C'
      'WHERE EMPRESA=?EMPRESA AND CODMAQ=?CODMAQ')
    UniDirectional = False
    Left = 32
    Top = 168
    object xMaquinaHDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxMaquinaH: TDataSource
    DataSet = xMaquinaH
    Left = 112
    Top = 168
  end
  object xProveedorD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_PROVEEDORES'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    Left = 280
    Top = 24
    object xProveedorDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxProveedorD: TDataSource
    DataSet = xProveedorD
    Left = 360
    Top = 24
  end
  object xProveedorH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_PROVEEDORES'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    Left = 280
    Top = 72
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxProveedorH: TDataSource
    DataSet = xProveedorH
    Left = 360
    Top = 72
  end
  object xRecursoD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM PRO_RECURSOS'
      'WHERE EMPRESA=?EMPRESA AND RECURSO=?RECURSO')
    UniDirectional = False
    Left = 280
    Top = 120
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxRecursoD: TDataSource
    DataSet = xRecursoD
    Left = 360
    Top = 120
  end
  object xRecursoH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM PRO_RECURSOS'
      'WHERE EMPRESA=?EMPRESA AND RECURSO=?RECURSO')
    UniDirectional = False
    Left = 280
    Top = 168
    object FIBStringField3: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxRecursoH: TDataSource
    DataSet = xRecursoH
    Left = 360
    Top = 168
  end
  object QMRecargar: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 216
  end
  object QIdTarea: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT T.RIG_OF AS ORDEN, T.TIPOTAREA AS TIPOTAREA, F.TIPOFASE A' +
        'S TIPOFASE'
      'FROM PRO_ORD_TAREA T'
      'JOIN PRO_ORD_FASES F '
      'ON '
      'F.EMPRESA = T.EMPRESA AND '
      'F.EJERCICIO = T.EJERCICIO AND '
      'F.CANAL = T.CANAL AND '
      'F.SERIES = T.SERIE AND '
      'F.RIG_OF = T.RIG_OF AND '
      'F.SUBORDEN = T.SUBORDEN AND '
      'F.LINEA_FASE = T.LINEA_FASE'
      'WHERE'
      'IDENTIFICADOR = :IDTAREA')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 264
  end
  object QMGenOpeFas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        '/*select V_CAB_RIG,V_OPERARIO,V_DET_RIG_OF,V_DET_NOMBRE_FASE,v_d' +
        'et_tipofase,sum(v_tiempo_dec) ,V_CAB_NOMBREEMPLEADO,V_COMPUESTO'
      
        'from pro_lst_marcajes(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FI' +
        'LTRO,?RIGD,?RIGH,?OPERARIOD,?OPERARIOH,?MAQUINAD,?MAQUINAH,?PROV' +
        'EEDORD,?PROVEEDORH,?VARIOSD,?VARIOSH,?TIPOFASED,?TIPOFASEH,?TIPO' +
        'TAREAD,?TIPOTAREAH,?FECHAD,?FECHAH,?T_IDTAREA,?IDTAREAD,?IDTAREA' +
        'H)'
      
        'group by V_CAB_RIG,V_OPERARIO,V_DET_RIG_OF,v_det_tipofase,V_DET_' +
        'NOMBRE_FASE,V_DET_NOMBRE_FASE,V_CAB_NOMBREEMPLEADO,V_COMPUESTO'
      '*/'
      ''
      
        'select V_OPERARIO,V_DET_RIG_OF,V_DET_NOMBRE_FASE,v_det_tipofase,' +
        'sum(v_tiempo_dec) ,V_CAB_NOMBREEMPLEADO,V_COMPUESTO,V_CAB_RIG'
      
        'from pro_lst_marcajes(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FI' +
        'LTRO,?RIGD,?RIGH,?OPERARIOD,?OPERARIOH,?MAQUINAD,?MAQUINAH,?PROV' +
        'EEDORD,?PROVEEDORH,?VARIOSD,?VARIOSH,?TIPOFASED,?TIPOFASEH,?TIPO' +
        'TAREAD,?TIPOTAREAH,?FECHAD,?FECHAH,?T_IDTAREA,?IDTAREAD,?IDTAREA' +
        'H,?IDORDEN_D,?IDORDEN_H,?COMPUESTOD,?COMPUESTOH)'
      
        'group by V_OPERARIO,V_DET_RIG_OF,v_det_tipofase,V_DET_NOMBRE_FAS' +
        'E,V_DET_NOMBRE_FASE,V_CAB_NOMBREEMPLEADO,V_COMPUESTO,V_CAB_RIG')
    UniDirectional = False
    Left = 32
    Top = 72
  end
  object DSGenOpeFas: TDataSource
    DataSet = QMGenOpeFas
    Left = 112
    Top = 72
  end
  object frDBMarcaOpeFas: TfrDBDataSet
    DataSource = DSGenOpeFas
    Left = 200
    Top = 72
  end
end
