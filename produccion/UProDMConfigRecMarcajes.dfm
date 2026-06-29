object ProDMConfigRecMarcajes: TProDMConfigRecMarcajes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 359
  Top = 164
  Height = 329
  Width = 385
  object QMConfigCabMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_CONFIG_CAB_MARCA'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_CONFIG_CAB_MARCA'
      
        '  (FECHA,EMPRESA,RIG,DESCRIPCION,NOTES,RUTA,RUTAINC,RUTADEST,TIP' +
        'OMARCAJE,RUTACONFIG,TIPORECURSO)'
      'VALUES'
      
        '  (?FECHA,?EMPRESA,?RIG,?DESCRIPCION,?NOTES,?RUTA,?RUTAINC,?RUTA' +
        'DEST,?TIPOMARCAJE,?RUTACONFIG,?TIPORECURSO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_CONFIG_CAB_MARCA'
      'WHERE'
      '  RIG=?RIG AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_CONFIG_CAB_MARCA'
      'where empresa=?empresa')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_CONFIG_CAB_MARCA'
      'SET'
      '  FECHA=?FECHA '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,NOTES=?NOTES '
      '  ,RUTA=?RUTA'
      ' ,RUTAINC=?RUTAINC'
      ' ,RUTADEST=?RUTADEST'
      ' ,TIPOMARCAJE=?TIPOMARCAJE'
      ' ,RUTACONFIG=?RUTACONFIG'
      ' ,TIPORECURSO=?TIPORECURSO'
      'WHERE'
      '  RIG=?RIG AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMConfigCabMarcaAfterOpen
    AfterPost = Graba
    OnNewRecord = QMConfigCabMarcaNewRecord
    ClavesPrimarias.Strings = (
      'RIG '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_CONFIG_CAB_MARCA'
    UpdateTransaction = TLocal
    Left = 42
    Top = 20
    object QMConfigCabMarcaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfigCabMarcaRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMConfigCabMarcaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMConfigCabMarcaNOTES: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTES'
      BlobType = ftMemo
      Size = 8
    end
    object QMConfigCabMarcaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMConfigCabMarcaRUTA: TFIBStringField
      DisplayLabel = 'Ruta Origen'
      FieldName = 'RUTA'
      Size = 100
    end
    object QMConfigCabMarcaRUTAINC: TFIBStringField
      DisplayLabel = 'Ruta Incidencias'
      FieldName = 'RUTAINC'
      Size = 200
    end
    object QMConfigCabMarcaRUTADEST: TFIBStringField
      DisplayLabel = 'Ruta Destino'
      FieldName = 'RUTADEST'
      Size = 200
    end
    object QMConfigCabMarcaRUTACONFIG: TFIBStringField
      DisplayLabel = 'Ruta Configuraci'#243'n'
      FieldName = 'RUTACONFIG'
      Size = 200
    end
    object QMConfigCabMarcaTIPOMARCAJE: TIntegerField
      DisplayLabel = 'Tipo Marcaje'
      FieldName = 'TIPOMARCAJE'
    end
    object QMConfigCabMarcaTIPORECURSO: TFIBStringField
      DisplayLabel = 'Tipo Recurso'
      FieldName = 'TIPORECURSO'
      Size = 3
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 278
    Top = 20
  end
  object DSConfigCabMarca: TDataSource
    DataSet = QMConfigCabMarca
    Left = 154
    Top = 18
  end
  object QMTablasBDD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select relacion from dic_relaciones'
      'where tipo=0 and relacion not like '#39'RDB$%'#39
      'order by relacion asc')
    UniDirectional = False
    Left = 42
    Top = 130
    object QMTablasBDDRELACION: TFIBStringField
      DisplayLabel = 'Relacion'
      FieldName = 'RELACION'
      Size = 31
    end
  end
  object DSTablasBdd: TDataSource
    DataSet = QMTablasBDD
    Left = 154
    Top = 130
  end
  object DSCamposBdd: TDataSource
    DataSet = QMCamposBDD
    Left = 154
    Top = 183
  end
  object QMCamposBDD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select relacion, campo from dic_relaciones_campos'
      'where relacion=?taula')
    UniDirectional = False
    Left = 40
    Top = 183
    object QMCamposBDDRELACION: TFIBStringField
      DisplayLabel = 'Relacion'
      FieldName = 'RELACION'
      Size = 31
    end
    object QMCamposBDDCAMPO: TFIBStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Size = 31
    end
  end
  object QMConfigDetMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_CONFIG_DET_MARCA'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_CONFIG_DET_MARCA'
      
        '  (EMPRESA,RIG,LINEA,ORDEN,CAMPO,LONG_INI,LONG_FIN,TABLA_FISICA,' +
        'CAMPO_FISICO,TIPOMARC)'
      'VALUES'
      
        '  (?EMPRESA,?RIG,?LINEA,?ORDEN,?CAMPO,?LONG_INI,?LONG_FIN,?TABLA' +
        '_FISICA,?CAMPO_FISICO,?TIPOMARC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_CONFIG_DET_MARCA'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_CONFIG_DET_MARCA'
      'where empresa=?empresa and rig=?rig'
      'order by orden')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_CONFIG_DET_MARCA'
      'SET'
      '  ORDEN=?ORDEN '
      '  ,CAMPO=?CAMPO '
      '  ,LONG_INI=?LONG_INI '
      '  ,LONG_FIN=?LONG_FIN '
      '  ,TABLA_FISICA=?TABLA_FISICA '
      '  ,CAMPO_FISICO=?CAMPO_FISICO '
      '  ,TIPOMARC=?TIPOMARC'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSConfigCabMarca
    AfterDelete = Graba
    AfterPost = Graba
    AfterScroll = QMConfigDetMarcaAfterScroll
    BeforeInsert = QMConfigDetMarcaBeforeInsert
    OnNewRecord = QMConfigDetMarcaNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_CONFIG_DET_MARCA'
    UpdateTransaction = TLocal
    Left = 42
    Top = 80
    object QMConfigDetMarcaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfigDetMarcaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMConfigDetMarcaLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMConfigDetMarcaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMConfigDetMarcaCAMPO: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'CAMPO'
      Size = 60
    end
    object QMConfigDetMarcaLONG_INI: TIntegerField
      DisplayLabel = 'Long. Ini'
      FieldName = 'LONG_INI'
    end
    object QMConfigDetMarcaLONG_FIN: TIntegerField
      DisplayLabel = 'Long. Fin'
      FieldName = 'LONG_FIN'
    end
    object QMConfigDetMarcaTABLA_FISICA: TFIBStringField
      DisplayLabel = 'Tabla F'#237'sica'
      FieldName = 'TABLA_FISICA'
      OnChange = QMConfigDetMarcaTABLA_FISICAChange
      Size = 40
    end
    object QMConfigDetMarcaCAMPO_FISICO: TFIBStringField
      DisplayLabel = 'Campo F'#237'sico'
      FieldName = 'CAMPO_FISICO'
      Size = 40
    end
    object QMConfigDetMarcaTIPOMARC: TFIBStringField
      DisplayLabel = 'Tipo Marcaje'
      FieldName = 'TIPOMARC'
      Size = 15
    end
  end
  object DSConfigDetMarca: TDataSource
    DataSet = QMConfigDetMarca
    Left = 150
    Top = 78
  end
  object QLinea: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'Select Max(Linea) As NLinea'
      'From PRO_CONFIG_DET_MARCA'
      'Where ((EMPRESA=?EMPRESA) and (rig=?rig))')
    Transaction = TLocal
    AutoTrans = True
    Left = 38
    Top = 244
  end
  object QDicCampo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DIC_CAMPOS_TEXTOS'
      'WHERE'
      '  RELACION=?RELACION AND '
      '  CAMPO=?CAMPO AND IDIOMA=?IDIOMA')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DIC_CAMPOS_TEXTOS'
      'WHERE '
      'RELACION=?TABLA_FISICA '
      'AND CAMPO=?CAMPO_FISICO AND IDIOMA='#39'CAS'#39)
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DIC_CAMPOS_TEXTOS'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,TITULO=?TITULO '
      '  ,VISIBLE=?VISIBLE'
      '  ,ORDEN_BUSCADOR=?ORDEN_BUSCADOR'
      'WHERE'
      '  RELACION=?RELACION AND '
      '  CAMPO=?CAMPO AND IDIOMA=?IDIOMA')
    DataSource = DSConfigDetMarca
    OnCalcFields = QDicCampoCalcFields
    ClavesPrimarias.Strings = (
      'RELACION '
      'CAMPO '
      'IDIOMA'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DIC_CAMPOS_TEXTOS'
    UpdateTransaction = TLocal
    Left = 288
    Top = 96
    object QDicCampoRELACION: TFIBStringField
      DisplayLabel = 'Relacion'
      FieldName = 'RELACION'
      Size = 31
    end
    object QDicCampoCAMPO: TFIBStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Size = 31
    end
    object QDicCampoORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QDicCampoORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 31
    end
    object QDicCampoTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QDicCampoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QDicCampoDEFECTO: TBlobField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
      Size = 8
    end
    object QDicCampoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QDicCampoVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object QDicCampoIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QDicCampoTEXTO: TIntegerField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
    end
    object QDicCampoORDEN_BUSCADOR: TIntegerField
      DisplayLabel = 'Orden Buscador'
      FieldName = 'ORDEN_BUSCADOR'
    end
    object QDicCampoTIPO_TEXTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TIPO_TEXTO'
      Size = 30
      Calculated = True
    end
  end
  object DSQDicCampo: TDataSource
    DataSet = QDicCampo
    Left = 288
    Top = 148
  end
end
