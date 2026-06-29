object DMColadas: TDMColadas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 377
  Top = 132
  Height = 449
  Width = 445
  object QMColadasD: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_COLADA_DETALLE'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ID_COLADA=?old_ID_COLADA AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_COLADA_DETALLE'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,ID_COLADA,POSICION,ID_ORDEN,ART' +
        'ICULO_CAJA,DEFECTUOSO,LINEA,ENTRADA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?ID_COLADA,?POSICION,?ID_OR' +
        'DEN,?ARTICULO_CAJA,?DEFECTUOSO,?LINEA,?ENTRADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_COLADA_DETALLE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_COLADA=?ID_COLADA AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_COLADA_DETALLE'
      'WHERE ID_COLADA=?ID_COLADA'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_COLADA_DETALLE'
      'SET'
      '  POSICION=?POSICION '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,ARTICULO_CAJA=?ARTICULO_CAJA '
      '  ,DEFECTUOSO=?DEFECTUOSO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_COLADA=?ID_COLADA AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSColadasC
    AfterDelete = QMColadasDAfterDelete
    AfterPost = QMColadasDAfterPost
    BeforeEdit = AntesDeEditar
    BeforePost = QMColadasDBeforePost
    OnNewRecord = QMColadasDNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ID_COLADA '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_COLADA_DETALLE'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_S'
      'GES_DETALLES_S_OFC')
    CamposBloqueo.Strings = (
      'ID_DETALLES_S'
      'ID_DETALLES_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object QMColadasDEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMColadasDEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMColadasDCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMColadasDSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMColadasDID_COLADA: TIntegerField
      DisplayLabel = 'ID Colada'
      FieldName = 'ID_COLADA'
    end
    object QMColadasDLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMColadasDPOSICION: TIntegerField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
    end
    object QMColadasDID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMColadasDARTICULO_CAJA: TFIBStringField
      DisplayLabel = 'Articulo Caja'
      FieldName = 'ARTICULO_CAJA'
      Size = 15
    end
    object QMColadasDDEFECTUOSO: TIntegerField
      DisplayLabel = 'Defectuoso'
      FieldName = 'DEFECTUOSO'
    end
    object QMColadasDENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
  end
  object DSColadasD: TDataSource
    DataSet = QMColadasD
    Left = 128
    Top = 112
  end
  object QMColadasC: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_COLADA_CABECERA'
      'WHERE'
      '  ID_COLADA=?old_ID_COLADA AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_COLADA_CABECERA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,ID_COLADA,FECHA,ORDEN,MATERIAL,' +
        'NOTAS,PESO_LINGOTES,PESO_BEBEDEROS,ENTRADA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?ID_COLADA,?FECHA,?ORDEN,?M' +
        'ATERIAL,?NOTAS,?PESO_LINGOTES,?PESO_BEBEDEROS,?ENTRADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_COLADA_CABECERA'
      'WHERE'
      '  ID_COLADA=?ID_COLADA AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_COLADA_CABECERA'
      'WHERE EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      'SERIE=?SERIE '
      'order by id_colada,fecha,orden')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_COLADA_CABECERA'
      'SET'
      '  FECHA=?FECHA '
      '  ,ORDEN=?ORDEN '
      '  ,MATERIAL=?MATERIAL '
      '  ,NOTAS=?NOTAS '
      '  ,PESO_LINGOTES=?PESO_LINGOTES '
      '  ,PESO_BEBEDEROS=?PESO_BEBEDEROS '
      'WHERE'
      '  ID_COLADA=?ID_COLADA AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMColadasCAfterOpen
    AfterPost = QMColadasCAfterPost
    BeforeClose = QMColadasCBeforeClose
    BeforeEdit = AntesDeEditar
    BeforeInsert = QMColadasCBeforeInsert
    BeforePost = QMColadasCBeforePost
    OnNewRecord = QMColadasCNewRecord
    OnPostError = QMColadasCPostError
    ClavesPrimarias.Strings = (
      'ID_COLADA '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_COLADA_CABECERA'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 42
    Top = 64
    object QMColadasCEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMColadasCEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMColadasCCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMColadasCSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMColadasCID_COLADA: TIntegerField
      DisplayLabel = 'ID Colada'
      FieldName = 'ID_COLADA'
    end
    object QMColadasCFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMColadasCORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMColadasCMATERIAL: TFIBStringField
      DisplayLabel = 'Material'
      FieldName = 'MATERIAL'
      OnChange = QMColadasCMATERIALChange
      Size = 10
    end
    object QMColadasCNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMColadasCPESO_LINGOTES: TFloatField
      DisplayLabel = 'Peso Lingotes'
      FieldName = 'PESO_LINGOTES'
    end
    object QMColadasCPESO_BEBEDEROS: TFloatField
      DisplayLabel = 'Peso Bebederos'
      FieldName = 'PESO_BEBEDEROS'
    end
    object QMColadasCENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
  end
  object DSColadasC: TDataSource
    DataSet = QMColadasC
    Left = 128
    Top = 64
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CANALES_SERIES'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL AND SERIE=?SERIE'
      '')
    UniDirectional = False
    Left = 40
    Top = 16
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 128
    Top = 16
  end
  object SPLineaSiguiente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea) as linea from emp_colada_detalle'
      'where (empresa=?empresa and ejercicio=?ejercicio and '
      'canal=?canal and serie=?serie and id_colada=?id_colada)')
    Transaction = TLocal
    AutoTrans = True
    Left = 216
    Top = 208
  end
  object EntornoDoc: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 272
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 216
    Top = 16
  end
  object SPRefrescaDetalle: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure ut_refresca_detalle_s (?empresa,?ejercicio,?ca' +
        'nal,'
      '?serie,?tipo,?rig,?cliente,?tarifa,?fecha,?moneda)')
    Transaction = TLocal
    AutoTrans = True
    Left = 216
    Top = 160
  end
  object xMateriales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_MATERIALES '
      'WHERE CODIGO=?MATERIAL')
    UniDirectional = False
    DataSource = DSColadasC
    Left = 40
    Top = 160
    object xMaterialesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxMateriales: TDataSource
    DataSet = xMateriales
    Left = 128
    Top = 160
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 218
    Top = 256
  end
  object QSerieHabil: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select count(*) as n_serie from sys_usuarios_perfil_eec'
      
        'where serie = ?serie and empresa=?empresa and ejercicio=?ejercic' +
        'io and '
      '          canal=?canal')
    Transaction = TLocal
    AutoTrans = True
    Left = 218
    Top = 111
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 215
    Top = 64
  end
end
