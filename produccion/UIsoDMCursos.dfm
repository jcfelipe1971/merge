object IsoDMCursos: TIsoDMCursos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 486
  Top = 276
  Height = 324
  Width = 362
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 8
  end
  object QMCursos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_CURSOS'
      'WHERE'
      '  ID_CURSO=?old_ID_CURSO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_CURSOS'
      '  (EMPRESA,ID_CURSO,DESCRIPCION,HORAS,NOTAS,PROFESOR)'
      'VALUES'
      '  (?EMPRESA,?ID_CURSO,?DESCRIPCION,?HORAS,?NOTAS,?PROFESOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_CURSOS'
      'WHERE'
      '  ID_CURSO=?ID_CURSO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_CURSOS'
      'where empresa=?empresa'
      'order by empresa, id_curso')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_CURSOS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,HORAS=?HORAS '
      '  ,NOTAS=?NOTAS'
      '  ,PROFESOR=?PROFESOR'
      'WHERE'
      '  ID_CURSO=?ID_CURSO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMCursosAfterOpen
    AfterPost = Graba
    OnNewRecord = QMCursosNewRecord
    ClavesPrimarias.Strings = (
      'ID_CURSO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_CURSOS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMCursosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCursosID_CURSO: TIntegerField
      DisplayLabel = 'ID Curso'
      FieldName = 'ID_CURSO'
    end
    object QMCursosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
    object QMCursosHORAS: TIntegerField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
    object QMCursosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCursosPROFESOR: TFIBStringField
      DisplayLabel = 'Profesor'
      FieldName = 'PROFESOR'
      Size = 100
    end
  end
  object DSCursos: TDataSource
    DataSet = QMCursos
    Left = 120
    Top = 16
  end
  object SPLineaCursos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(id_curso) id_curso from iso_cursos'
      'where empresa=?empresa'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 118
    Top = 73
  end
  object frCertificado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de certificado de formaci'#243'n'
    RebuildPrinter = False
    OnGetValue = frCertificadoGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 250
    Top = 65
    ReportForm = {19000000}
  end
  object frDBCertificado: TfrDBDataSet
    DataSet = QMAsistents
    Left = 256
    Top = 120
  end
  object QMAsistents: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select v_ope.*,cat.* from ope_empleado_formacion forma'
        'join VER_EMPLEADOS_EF v_ope on(forma.empresa=v_ope.empresa and ' +
        'forma.empleado=v_ope.empleado)'
        'join ope_empleado ope on(forma.empresa=ope.empresa and forma.emp' +
        'leado=ope.empleado)'
      'join ope_sys_empleado_cat cat on (ope.categoria=cat.categoria)'
      'where forma.empresa=?empresa and forma.curso=?id_curso and v_ope.ACTIVO=1')
    UniDirectional = False
    DataSource = DSCursos
    Left = 40
    Top = 80
    object QMAsistentsEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAsistentsEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMAsistentsTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMAsistentsTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAsistentsNIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'NIF'
    end
    object QMAsistentsCATEGORIA: TFIBStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 3
    end
    object QMAsistentsDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
end
