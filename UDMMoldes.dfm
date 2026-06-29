object DMMoldes: TDMMoldes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 298
  Top = 150
  Height = 345
  Width = 496
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 432
    Top = 8
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_MOLDES'
      'WHERE'
      '  NUM_MOLDE=?old_NUM_MOLDE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_MOLDES'
      
        '  (EMPRESA,NUM_MOLDE,PROPIETARIO,ALTO,LARGO,ANCHO,TIPO_BOQUILLA,' +
        'DIAMETRO_EXPULSOR,TIPO_INYECCION,NUM_CAVIDADES,FECHA_LLEGADA,FEC' +
        'HA_SALIDA,ACTIVO,DESCRIPCION,ID_UBICACION,IMAGEN,ARO_CENTRADOR,C' +
        'ORREDERAS,NOYOS,TIPO_NOYO,FABRICADO,FABRICANTE,NOTAS)'
      'VALUES'
      
        '  (?EMPRESA,?NUM_MOLDE,?PROPIETARIO,?ALTO,?LARGO,?ANCHO,?TIPO_BO' +
        'QUILLA,?DIAMETRO_EXPULSOR,?TIPO_INYECCION,?NUM_CAVIDADES,?FECHA_' +
        'LLEGADA,?FECHA_SALIDA,?ACTIVO,?DESCRIPCION,?ID_UBICACION,?IMAGEN' +
        ',?ARO_CENTRADOR,?CORREDERAS,?NOYOS,?TIPO_NOYO,?FABRICADO,?FABRIC' +
        'ANTE,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MOLDES'
      'WHERE'
      '  NUM_MOLDE=?NUM_MOLDE AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_MOLDES'
      'WHERE EMPRESA = ?empresa'
      'order by cast(num_molde as integer) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_MOLDES'
      'SET'
      '  PROPIETARIO=?PROPIETARIO '
      '  ,ALTO=?ALTO '
      '  ,LARGO=?LARGO '
      '  ,ANCHO=?ANCHO '
      '  ,TIPO_BOQUILLA=?TIPO_BOQUILLA '
      '  ,DIAMETRO_EXPULSOR=?DIAMETRO_EXPULSOR '
      '  ,TIPO_INYECCION=?TIPO_INYECCION '
      '  ,NUM_CAVIDADES=?NUM_CAVIDADES '
      '  ,FECHA_LLEGADA=?FECHA_LLEGADA '
      '  ,FECHA_SALIDA=?FECHA_SALIDA '
      '  ,ACTIVO=?ACTIVO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,IMAGEN=?IMAGEN '
      '  ,ARO_CENTRADOR=?ARO_CENTRADOR '
      '  ,CORREDERAS=?CORREDERAS '
      '  ,NOYOS=?NOYOS '
      '  ,TIPO_NOYO=?TIPO_NOYO '
      '  ,FABRICADO=?FABRICADO'
      '  ,FABRICANTE=?FABRICANTE'
      '  ,NOTAS=?NOTAS'
      'WHERE'
      '  NUM_MOLDE=?NUM_MOLDE AND '
      '  EMPRESA=?EMPRESA '
      '')
    AfterDelete = Graba
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = Graba
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'NUM_MOLDE '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_MOLDES'
    UpdateTransaction = TLocal
    Left = 40
    Top = 8
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraNUM_MOLDE: TFIBStringField
      DisplayLabel = 'N'#250'm. Molde'
      FieldName = 'NUM_MOLDE'
      Size = 10
    end
    object QMCabeceraPROPIETARIO: TIntegerField
      DisplayLabel = 'Propietario'
      FieldName = 'PROPIETARIO'
    end
    object QMCabeceraALTO: TIntegerField
      DisplayLabel = 'Alto'
      FieldName = 'ALTO'
    end
    object QMCabeceraLARGO: TIntegerField
      DisplayLabel = 'Largo'
      FieldName = 'LARGO'
    end
    object QMCabeceraANCHO: TIntegerField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMCabeceraTIPO_BOQUILLA: TIntegerField
      DisplayLabel = 'Tipo Boquilla'
      FieldName = 'TIPO_BOQUILLA'
    end
    object QMCabeceraDIAMETRO_EXPULSOR: TIntegerField
      DisplayLabel = 'Di'#225'metro Expulsor'
      FieldName = 'DIAMETRO_EXPULSOR'
    end
    object QMCabeceraTIPO_INYECCION: TIntegerField
      DisplayLabel = 'Tipo Inyecci'#243'n'
      FieldName = 'TIPO_INYECCION'
    end
    object QMCabeceraNUM_CAVIDADES: TIntegerField
      DisplayLabel = 'N'#250'm. Cavidades'
      FieldName = 'NUM_CAVIDADES'
    end
    object QMCabeceraFECHA_LLEGADA: TDateTimeField
      DisplayLabel = 'Fecha Llegada'
      FieldName = 'FECHA_LLEGADA'
    end
    object QMCabeceraFECHA_SALIDA: TDateTimeField
      DisplayLabel = 'Fecha Salida'
      FieldName = 'FECHA_SALIDA'
    end
    object QMCabeceraACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCabeceraDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMCabeceraID_UBICACION: TIntegerField
      DisplayLabel = 'Id. Ubicaci'#243'n'
      FieldName = 'ID_UBICACION'
    end
    object QMCabeceraARO_CENTRADOR: TIntegerField
      FieldName = 'ARO_CENTRADOR'
    end
    object QMCabeceraIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMCabeceraCORREDERAS: TIntegerField
      DisplayLabel = 'Correderas'
      FieldName = 'CORREDERAS'
    end
    object QMCabeceraNOYOS: TIntegerField
      DisplayLabel = 'Noyos'
      FieldName = 'NOYOS'
    end
    object QMCabeceraTIPO_NOYO: TIntegerField
      DisplayLabel = 'Tipo Noyo'
      FieldName = 'TIPO_NOYO'
    end
    object QMCabeceraFABRICADO: TIntegerField
      DisplayLabel = 'Fabricado'
      FieldName = 'FABRICADO'
    end
    object QMCabeceraFABRICANTE: TIntegerField
      FieldName = 'FABRICANTE'
    end
  end
  object QMArticuloPostizo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_MOLDE_ART_POSTIZ'
      'WHERE'
      '  ARTICULO=?old_ARTICULO AND '
      '  NUM_MOLDE=?old_NUM_MOLDE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_MOLDE_ART_POSTIZ'
      '  (EMPRESA,NUM_MOLDE,ARTICULO,NUM_POSTIZO)'
      'VALUES'
      '  (?EMPRESA,?NUM_MOLDE,?ARTICULO,?NUM_POSTIZO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MOLDE_ART_POSTIZ'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  NUM_MOLDE=?NUM_MOLDE AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_MOLDE_ART_POSTIZ'
      'where empresa=?empresa and num_molde=?num_molde')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_MOLDE_ART_POSTIZ'
      'SET'
      '  NUM_POSTIZO=?NUM_POSTIZO '
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  NUM_MOLDE=?NUM_MOLDE AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCabecera
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMArticuloPostizoNewRecord
    ClavesPrimarias.Strings = (
      'ARTICULO '
      'NUM_MOLDE '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_MOLDE_ART_POSTIZ'
    UpdateTransaction = TLocal
    Left = 40
    Top = 56
    object QMArticuloPostizoEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMArticuloPostizoNUM_MOLDE: TFIBStringField
      FieldName = 'NUM_MOLDE'
      Size = 10
    end
    object QMArticuloPostizoARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticuloPostizoDescArticulo: TStringField
      DisplayLabel = 'Desc. Art'#237'culo'
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = QMArticuloPostizoDescArticuloGetText
      Size = 60
      Calculated = True
    end
    object QMArticuloPostizoNUM_POSTIZO: TIntegerField
      DisplayLabel = 'Postizo'
      FieldName = 'NUM_POSTIZO'
    end
    object QMArticuloPostizoDescPostizo: TStringField
      DisplayLabel = 'Desc. Postizo'
      FieldKind = fkCalculated
      FieldName = 'DescPostizo'
      OnGetText = QMArticuloPostizoDescPostizoGetText
      Size = 25
      Calculated = True
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 144
    Top = 8
  end
  object DSQMArticuloPostizo: TDataSource
    DataSet = QMArticuloPostizo
    Left = 144
    Top = 56
  end
  object QMMaquinas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_MOLDES_MAQUINA'
      'WHERE'
      '  MAQUINA=?old_MAQUINA AND '
      '  NUM_MOLDE=?old_NUM_MOLDE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_MOLDES_MAQUINA'
      '  (EMPRESA,NUM_MOLDE,MAQUINA)'
      'VALUES'
      '  (?EMPRESA,?NUM_MOLDE,?MAQUINA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MOLDES_MAQUINA'
      'WHERE'
      '  MAQUINA=?MAQUINA AND '
      '  NUM_MOLDE=?NUM_MOLDE AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_MOLDES_MAQUINA'
      'where empresa=?empresa and num_molde=?num_molde')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_MOLDES_MAQUINA'
      'WHERE'
      '  MAQUINA=?MAQUINA AND '
      '  NUM_MOLDE=?NUM_MOLDE AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCabecera
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMMaquinasNewRecord
    ClavesPrimarias.Strings = (
      'MAQUINA '
      'NUM_MOLDE '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_MOLDES_MAQUINA'
    UpdateTransaction = TLocal
    Left = 40
    Top = 104
    object QMMaquinasEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMMaquinasNUM_MOLDE: TFIBStringField
      FieldName = 'NUM_MOLDE'
      Size = 10
    end
    object QMMaquinasMAQUINA: TIntegerField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'MAQUINA'
    end
    object QMMaquinasDescMaquina: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescMaquina'
      OnGetText = QMMaquinasDescMaquinaGetText
      Size = 40
      Calculated = True
    end
  end
  object DSQMMaquinas: TDataSource
    DataSet = QMMaquinas
    Left = 144
    Top = 104
  end
  object QMRevisiones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_MOLDES_REV'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  NUM_MOLDE=?old_NUM_MOLDE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_MOLDES_REV'
      
        '  (EMPRESA,NUM_MOLDE,LINEA,FECHA_REVISION,FECHA_PROXIMA,RESULTAD' +
        'O,LABORATORIO,REVISADO)'
      'VALUES'
      
        '  (?EMPRESA,?NUM_MOLDE,?LINEA,?FECHA_REVISION,?FECHA_PROXIMA,?RE' +
        'SULTADO,?LABORATORIO,?REVISADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MOLDES_REV'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  NUM_MOLDE=?NUM_MOLDE AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_MOLDES_REV'
      'where empresa=?empresa and num_molde=?num_molde'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_MOLDES_REV'
      'SET'
      '  FECHA_REVISION=?FECHA_REVISION '
      '  ,FECHA_PROXIMA=?FECHA_PROXIMA '
      '  ,RESULTADO=?RESULTADO '
      '  ,LABORATORIO=?LABORATORIO '
      '  ,REVISADO=?REVISADO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  NUM_MOLDE=?NUM_MOLDE AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCabecera
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMRevisionesNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'NUM_MOLDE '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_MOLDES_REV'
    UpdateTransaction = TLocal
    Left = 40
    Top = 152
    object QMRevisionesEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMRevisionesNUM_MOLDE: TFIBStringField
      FieldName = 'NUM_MOLDE'
      Size = 10
    end
    object QMRevisionesLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMRevisionesFECHA_REVISION: TDateTimeField
      DisplayLabel = 'Fecha Revisi'#243'n'
      FieldName = 'FECHA_REVISION'
    end
    object QMRevisionesFECHA_PROXIMA: TDateTimeField
      DisplayLabel = 'Fecha Pr'#243'xima'
      FieldName = 'FECHA_PROXIMA'
    end
    object QMRevisionesRESULTADO: TFIBStringField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
      Size = 25
    end
    object QMRevisionesLABORATORIO: TFIBStringField
      DisplayLabel = 'Laboratorio'
      FieldName = 'LABORATORIO'
      Size = 25
    end
    object QMRevisionesREVISADO: TIntegerField
      DisplayLabel = 'Revisado'
      FieldName = 'REVISADO'
    end
  end
  object QMDSRevisiones: TDataSource
    DataSet = QMRevisiones
    Left = 144
    Top = 152
  end
  object QMReparaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_MOLDES_REPARACIONES'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  NUM_MOLDE=?old_NUM_MOLDE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_MOLDES_REPARACIONES'
      
        '  (EMPRESA,NUM_MOLDE,LINEA,FECHA_DETECCION,FECHA_REPARACION,DESC' +
        'RIPCION,COMENTARIO,LABORATORIO,COSTE_REP,TALLER,NOTAS)'
      'VALUES'
      
        '  (?EMPRESA,?NUM_MOLDE,?LINEA,?FECHA_DETECCION,?FECHA_REPARACION' +
        ',?DESCRIPCION,?COMENTARIO,?LABORATORIO,?COSTE_REP,?TALLER,?NOTAS' +
        ')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MOLDES_REPARACIONES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  NUM_MOLDE=?NUM_MOLDE AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_MOLDES_REPARACIONES'
      'where empresa=?empresa and num_molde=?num_molde'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_MOLDES_REPARACIONES'
      'SET'
      '  FECHA_DETECCION=?FECHA_DETECCION '
      '  ,FECHA_REPARACION=?FECHA_REPARACION '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,LABORATORIO=?LABORATORIO '
      '  ,COSTE_REP=?COSTE_REP '
      '  ,TALLER=?TALLER'
      '  ,NOTAS=?NOTAS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  NUM_MOLDE=?NUM_MOLDE AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCabecera
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMReparacionesNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'NUM_MOLDE '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_MOLDES_REPARACIONES'
    UpdateTransaction = TLocal
    Left = 40
    Top = 200
    object QMReparacionesEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMReparacionesNUM_MOLDE: TFIBStringField
      FieldName = 'NUM_MOLDE'
      Size = 10
    end
    object QMReparacionesLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMReparacionesFECHA_DETECCION: TDateTimeField
      DisplayLabel = 'Fecha Detecci'#243'n'
      FieldName = 'FECHA_DETECCION'
    end
    object QMReparacionesFECHA_REPARACION: TDateTimeField
      DisplayLabel = 'Fecha Reparaci'#243'n'
      FieldName = 'FECHA_REPARACION'
    end
    object QMReparacionesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMReparacionesCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object QMReparacionesLABORATORIO: TFIBStringField
      DisplayLabel = 'Laboratorio'
      FieldName = 'LABORATORIO'
      Size = 25
    end
    object QMReparacionesCOSTE_REP: TFloatField
      DisplayLabel = 'Coste Reparaci'#243'n'
      FieldName = 'COSTE_REP'
    end
    object QMReparacionesTALLER: TIntegerField
      DisplayLabel = 'Taller'
      FieldName = 'TALLER'
    end
    object QMReparacionesDescTaller: TStringField
      DisplayLabel = 'Desc. Taller'
      FieldKind = fkCalculated
      FieldName = 'DescTaller'
      OnGetText = QMReparacionesDescTallerGetText
      Size = 60
      Calculated = True
    end
    object QMReparacionesNOTAS: TBlobField
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object QMDSReparaciones: TDataSource
    DataSet = QMReparaciones
    Left = 144
    Top = 200
  end
  object xDescMaquina: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from pro_maquinas_c '
      'where codmaq=?MAQUINA and empresa=?EMPRESA')
    UniDirectional = False
    DataSource = DSQMMaquinas
    Left = 304
    Top = 104
    object xDescMaquinaDESCRIPCION: TFIBStringField
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object xDescArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo_largo as titulo from art_articulos'
      'where empresa=?EMPRESA and articulo=?articulo')
    UniDirectional = False
    DataSource = DSQMArticuloPostizo
    Left = 304
    Top = 8
    object xDescArticuloTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object xDescPostizo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from emp_postizos'
      'where empresa=?EMPRESA and num_postizo=?num_postizo')
    UniDirectional = False
    DataSource = DSQMArticuloPostizo
    Left = 304
    Top = 56
    object xDescPostizoDESCRIPCION: TFIBStringField
      FieldName = 'DESCRIPCION'
      Size = 25
    end
  end
  object xDescTaller: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_acreedores_empresa'
      'where empresa=?EMPRESA and acreedor=?taller')
    UniDirectional = False
    DataSource = QMDSReparaciones
    Left = 304
    Top = 152
    object xDescTallerTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
  end
end
