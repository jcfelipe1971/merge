object ProDMMaquinas: TProDMMaquinas
  OldCreateOrder = False
  OnCreate = DMProMaquinasCreate
  Left = 438
  Top = 176
  Height = 548
  Width = 555
  object QMMaquinasC: TFIBTableSet
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
      
        '  (FECHA_COMPRA,NSERIE,OBSERVACION,FECHA_CERT,ID_MAQUINA,ID_IMAG' +
        'EN,EMPRESA,CODMAQ,DESCRIPCION,FRECUENCIA,CERTIFICACION,CALENDARI' +
        'O,VIRTUAL,WEB,TIPO,CODIDE,FABRICANTE,RECURSO,HORARIO,SECCION,CEN' +
        'TRO)'
      'VALUES'
      
        '  (?FECHA_COMPRA,?NSERIE,?OBSERVACION,?FECHA_CERT,?ID_MAQUINA,?I' +
        'D_IMAGEN,?EMPRESA,?CODMAQ,?DESCRIPCION,?FRECUENCIA,?CERTIFICACIO' +
        'N,?CALENDARIO,?VIRTUAL,?WEB,?TIPO,?CODIDE,?FABRICANTE,?RECURSO,?' +
        'HORARIO,?SECCION,?CENTRO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MAQUINAS_C'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODMAQ=?CODMAQ ')
    SelectSQL.Strings = (
      '/* Cambia dinamicamente */'
      'SELECT * FROM PRO_MAQUINAS_C'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'ORDER BY CODMAQ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MAQUINAS_C'
      'SET'
      '  FECHA_COMPRA=?FECHA_COMPRA '
      '  ,NSERIE=?NSERIE '
      '  ,OBSERVACION=?OBSERVACION '
      '  ,FECHA_CERT=?FECHA_CERT '
      '  ,ID_MAQUINA=?ID_MAQUINA '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,CERTIFICACION=?CERTIFICACION '
      '  ,CALENDARIO=?CALENDARIO '
      '  ,VIRTUAL=?VIRTUAL '
      '  ,WEB=?WEB '
      '  ,TIPO=?TIPO '
      '  ,CODIDE=?CODIDE '
      '  ,FABRICANTE=?FABRICANTE '
      '  ,RECURSO=?RECURSO '
      '  ,HORARIO=?HORARIO '
      '  ,SECCION=?SECCION '
      '  ,CENTRO=?CENTRO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODMAQ=?CODMAQ ')
    AfterOpen = QMMaquinasCAfterOpen
    BeforeClose = QMMaquinasCBeforeClose
    BeforePost = QMMaquinasCBeforePost
    OnNewRecord = QMMaquinasCNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'CODMAQ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MAQUINAS_C'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMMaquinasCCODMAQ: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODMAQ'
    end
    object QMMaquinasCTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object QMMaquinasCDescTipo: TStringField
      DisplayLabel = 'Desc. Tipo'
      FieldKind = fkCalculated
      FieldName = 'DescTipo'
      OnGetText = QMMaquinasCDescTipoGetText
      Size = 40
      Calculated = True
    end
    object QMMaquinasCCODIDE: TFIBStringField
      DisplayLabel = 'Cod. Ident.'
      FieldName = 'CODIDE'
      Size = 25
    end
    object QMMaquinasCFECHA_COMPRA: TDateTimeField
      DisplayLabel = 'Fecha Compra'
      FieldName = 'FECHA_COMPRA'
    end
    object QMMaquinasCFABRICANTE: TFIBStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
      Size = 25
    end
    object QMMaquinasCNSERIE: TFIBStringField
      DisplayLabel = 'N'#186' Serie'
      FieldName = 'NSERIE'
      Size = 10
    end
    object QMMaquinasCDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMMaquinasCSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMMaquinasCDescSECCION: TStringField
      DisplayLabel = 'Desc. Seccion'
      FieldKind = fkCalculated
      FieldName = 'DescSECCION'
      OnGetText = QMMaquinasCDescSECCIONGetText
      Size = 40
      Calculated = True
    end
    object QMMaquinasCOBSERVACION: TBlobField
      DisplayLabel = 'Observaci'#243'n'
      FieldName = 'OBSERVACION'
      Size = 8
    end
    object QMMaquinasCEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMaquinasCFRECUENCIA: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
    object QMMaquinasCCERTIFICACION: TIntegerField
      DisplayLabel = 'Certificaci'#243'n'
      FieldName = 'CERTIFICACION'
    end
    object QMMaquinasCFECHA_CERT: TDateTimeField
      DisplayLabel = 'Fecha Certificaci'#243'n'
      FieldName = 'FECHA_CERT'
    end
    object QMMaquinasCRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object QMMaquinasCCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object QMMaquinasCHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object QMMaquinasCID_IMAGEN: TIntegerField
      DisplayLabel = 'Id Imagen'
      FieldName = 'ID_IMAGEN'
    end
    object QMMaquinasCID_MAQUINA: TIntegerField
      DisplayLabel = 'Id M'#225'q.'
      FieldName = 'ID_MAQUINA'
    end
    object QMMaquinasCVIRTUAL: TIntegerField
      DisplayLabel = 'Virtual'
      FieldName = 'VIRTUAL'
    end
    object QMMaquinasCWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
    object QMMaquinasCCENTRO: TFIBStringField
      DisplayLabel = 'Centro Trabajo'
      FieldName = 'CENTRO'
      Size = 3
    end
  end
  object DSQMMaquinasC: TDataSource
    DataSet = QMMaquinasC
    Left = 152
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 384
    Top = 8
  end
  object QMMaquinasD: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MAQUINAS_D'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CODMAQ=?old_CODMAQ AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MAQUINAS_D'
      
        '  (FECHA_PREVISTA_REVISION,NOTAS,FECHA_REVISION,FECHA_PROXIMA,ID' +
        '_REVISION,FRECUENCIA,DENOMINACION,EMPRESA,CODMAQ,LINEA,REVISADO,' +
        'RESULTADO,LABORATORIO,COSTE_REV)'
      'VALUES'
      
        '  (?FECHA_PREVISTA_REVISION,?NOTAS,?FECHA_REVISION,?FECHA_PROXIM' +
        'A,?ID_REVISION,?FRECUENCIA,?DENOMINACION,?EMPRESA,?CODMAQ,?LINEA' +
        ',?REVISADO,?RESULTADO,?LABORATORIO,?COSTE_REV)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MAQUINAS_D'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODMAQ=?CODMAQ AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_MAQUINAS_D'
      'where empresa=?empresa and codmaq=?codmaq'
      'order by empresa,codmaq,fecha_prevista_revision')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MAQUINAS_D'
      'SET'
      '  FECHA_PREVISTA_REVISION=?FECHA_PREVISTA_REVISION '
      '  ,NOTAS=?NOTAS '
      '  ,FECHA_REVISION=?FECHA_REVISION '
      '  ,FECHA_PROXIMA=?FECHA_PROXIMA '
      '  ,ID_REVISION=?ID_REVISION '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,DENOMINACION=?DENOMINACION '
      '  ,REVISADO=?REVISADO '
      '  ,RESULTADO=?RESULTADO '
      '  ,LABORATORIO=?LABORATORIO '
      ' ,COSTE_REV=?COSTE_REV'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODMAQ=?CODMAQ AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMMaquinasC
    OnNewRecord = QMMaquinasDNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CODMAQ '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MAQUINAS_D'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
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
    object QMMaquinasDFECHA_PREVISTA_REVISION: TDateTimeField
      DisplayLabel = 'Fec. Prev. Rev.'
      FieldName = 'FECHA_PREVISTA_REVISION'
    end
    object QMMaquinasDFECHA_REVISION: TDateTimeField
      DisplayLabel = 'Fecha Revision'
      FieldName = 'FECHA_REVISION'
    end
    object QMMaquinasDFECHA_PROXIMA: TDateTimeField
      DisplayLabel = 'Fecha Proxima'
      FieldName = 'FECHA_PROXIMA'
    end
    object QMMaquinasDRESULTADO: TFIBStringField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
      Size = 25
    end
    object QMMaquinasDLABORATORIO: TFIBStringField
      DisplayLabel = 'Laboratorio'
      FieldName = 'LABORATORIO'
      Size = 25
    end
    object QMMaquinasDREVISADO: TIntegerField
      DisplayLabel = 'Revisado'
      FieldName = 'REVISADO'
    end
    object QMMaquinasDDENOMINACION: TFIBStringField
      DisplayLabel = 'Denominaci'#243'n'
      FieldName = 'DENOMINACION'
    end
    object QMMaquinasDFRECUENCIA: TIntegerField
      DisplayLabel = 'Freq.'
      FieldName = 'FRECUENCIA'
    end
    object QMMaquinasDNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMMaquinasDID_REVISION: TIntegerField
      DisplayLabel = 'Tipo Rev.'
      FieldName = 'ID_REVISION'
    end
    object QMMaquinasDCOSTE_REV: TFloatField
      DisplayLabel = 'Coste Rev.'
      FieldName = 'COSTE_REV'
    end
  end
  object DSQMMaquinasD: TDataSource
    DataSet = QMMaquinasD
    Left = 152
    Top = 56
  end
  object QMMaquinasRep: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MAQUINAS_REPARACIONES'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  CODMAQ=?old_CODMAQ ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MAQUINAS_REPARACIONES'
      
        '  (CODMAQ,LINEA,FECHA_DETECCION,FECHA_REPARACION,DESCRIPCION,COM' +
        'ENTARIO,LABORATORIO,COSTE_REP,EMPRESA,NOTAS)'
      'VALUES'
      
        '  (?CODMAQ,?LINEA,?FECHA_DETECCION,?FECHA_REPARACION,?DESCRIPCIO' +
        'N,?COMENTARIO,?LABORATORIO,?COSTE_REP,?EMPRESA,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MAQUINAS_REPARACIONES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  EMPRESA=?EMPRESA AND '
      '  CODMAQ=?CODMAQ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_MAQUINAS_REPARACIONES'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'CODMAQ=?CODMAQ'
      'ORDER BY LINEA'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MAQUINAS_REPARACIONES'
      'SET'
      '  FECHA_DETECCION=?FECHA_DETECCION '
      '  ,FECHA_REPARACION=?FECHA_REPARACION '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,LABORATORIO=?LABORATORIO '
      '  ,COSTE_REP=?COSTE_REP '
      '  ,NOTAS=?NOTAS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  EMPRESA=?EMPRESA AND '
      '  CODMAQ=?CODMAQ')
    DataSource = DSQMMaquinasC
    OnNewRecord = QMMaquinasRepNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'EMPRESA '
      'CODMAQ'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MAQUINAS_REPARACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 104
    object QMMaquinasRepCODMAQ: TIntegerField
      DisplayLabel = 'Cod. Maquina'
      FieldName = 'CODMAQ'
    end
    object QMMaquinasRepLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMMaquinasRepFECHA_DETECCION: TDateTimeField
      DisplayLabel = 'Fec. Detecci'#243'n'
      FieldName = 'FECHA_DETECCION'
    end
    object QMMaquinasRepFECHA_REPARACION: TDateTimeField
      DisplayLabel = 'Fec. Reparaci'#243'n'
      FieldName = 'FECHA_REPARACION'
    end
    object QMMaquinasRepDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descrip.'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMMaquinasRepCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object QMMaquinasRepLABORATORIO: TFIBStringField
      DisplayLabel = 'Laboratorio'
      FieldName = 'LABORATORIO'
      Size = 25
    end
    object QMMaquinasRepCOSTE_REP: TFloatField
      DisplayLabel = 'Coste Rep.'
      FieldName = 'COSTE_REP'
    end
    object QMMaquinasRepEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMaquinasRepNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSQMMaquinasRep: TDataSource
    DataSet = QMMaquinasRep
    Left = 152
    Top = 104
  end
  object frHYMaquinas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de M'#225'quinas'
    RebuildPrinter = False
    OnGetValue = frHYMaquinasGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 384
    Top = 56
    ReportForm = {19000000}
  end
  object frDBQMMaquinasD: TfrDBDataSet
    DataSource = DSQMMaquinasD
    Left = 272
    Top = 56
  end
  object xTipo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TIPO_MAQUINAS'
      'where empresa=?empresa and tipo=?tipo')
    UniDirectional = False
    DataSource = DSQMMaquinasC
    Left = 48
    Top = 297
    object xTipoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTipoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object xTipoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object xSeccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM OPE_SECCIONES'
      'where empresa=?empresa and seccion=?SECCION')
    UniDirectional = False
    DataSource = DSQMMaquinasC
    Left = 48
    Top = 345
    object xSeccionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSeccionSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object xSeccionDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object frLstMaqRevision: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de M'#225'quinas'
    RebuildPrinter = False
    OnGetValue = frHYMaquinasGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 384
    Top = 104
    ReportForm = {19000000}
  end
  object frDBMaqRevision: TfrDBDataSet
    DataSource = DSxLstMaqRevision
    Left = 272
    Top = 152
  end
  object xLstMaqRevision: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select cab.codmaq,det.*,rev.* from pro_maquinas_c cab'
      
        'left join pro_maquinas_d det on (cab.empresa=det.empresa and cab' +
        '.codmaq=det.codmaq)'
      
        'left join pro_tipo_maquinas_revisiones rev on (cab.empresa=rev.e' +
        'mpresa and det.id_revision=rev.id)'
      'order by empresa,fecha_prevista_revision,codmaq')
    UniDirectional = False
    Left = 48
    Top = 249
    object xLstMaqRevisionCODMAQ: TIntegerField
      DisplayLabel = 'Cod. Maquina'
      FieldName = 'CODMAQ'
    end
    object xLstMaqRevisionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLstMaqRevisionCODMAQ1: TIntegerField
      DisplayLabel = 'Cod. Maquina'
      FieldName = 'CODMAQ1'
    end
    object xLstMaqRevisionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xLstMaqRevisionFECHA_REVISION: TDateTimeField
      DisplayLabel = 'Fec. Prevision'
      FieldName = 'FECHA_REVISION'
    end
    object xLstMaqRevisionFECHA_PROXIMA: TDateTimeField
      DisplayLabel = 'Fec. Prox.'
      FieldName = 'FECHA_PROXIMA'
    end
    object xLstMaqRevisionRESULTADO: TFIBStringField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
      Size = 25
    end
    object xLstMaqRevisionLABORATORIO: TFIBStringField
      DisplayLabel = 'Laboratorio'
      FieldName = 'LABORATORIO'
      Size = 25
    end
    object xLstMaqRevisionREVISADO: TIntegerField
      DisplayLabel = 'Revisado'
      FieldName = 'REVISADO'
    end
    object xLstMaqRevisionDENOMINACION: TFIBStringField
      DisplayLabel = 'Denominacion'
      FieldName = 'DENOMINACION'
    end
    object xLstMaqRevisionFRECUENCIA: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
    object xLstMaqRevisionNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xLstMaqRevisionFECHA_PREVISTA_REVISION: TDateTimeField
      DisplayLabel = 'Fec. Prev. Revision'
      FieldName = 'FECHA_PREVISTA_REVISION'
    end
    object xLstMaqRevisionID_REVISION: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_REVISION'
    end
    object xLstMaqRevisionEMPRESA1: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA1'
    end
    object xLstMaqRevisionID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xLstMaqRevisionDENOMINACION1: TFIBStringField
      DisplayLabel = 'Denominacion'
      FieldName = 'DENOMINACION1'
      Size = 60
    end
    object xLstMaqRevisionTIPO_REVISION: TFIBStringField
      DisplayLabel = 'Tipo Rev.'
      FieldName = 'TIPO_REVISION'
      Size = 3
    end
    object xLstMaqRevisionFRECUENCIA1: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA1'
    end
    object xLstMaqRevisionNOTAS1: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS1'
      Size = 8
    end
    object xLstMaqRevisionRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
  end
  object DSxLstMaqRevision: TDataSource
    DataSet = xLstMaqRevision
    Left = 152
    Top = 249
  end
  object frDBMaquinasRep: TfrDBDataSet
    DataSource = DSQMMaquinasRep
    Left = 272
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 448
    Top = 8
  end
  object xCola: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_MAQUINAS_COLA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  MAQUINA=?old_MAQUINA AND '
      '  LINEA_FASE=?old_LINEA_FASE AND '
      '  LINEA_TAREA=?old_LINEA_TAREA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_MAQUINAS_COLA'
      
        '  (EMPRESA,MAQUINA,ORDEN_COLA_MAQUINA,PRODUCIENDO,ID_ORDEN,EJERC' +
        'ICIO,CANAL,SERIE,RIG_OF,LINEA_FASE,LINEA_TAREA,TAREA,TIPOTAREA,C' +
        'OMENTARIO,RECURSO,CANTIDAD,ESTADO,ID_UTILLAJE,DESC_UTILLAJE,SECC' +
        'ION,SITUACION)'
      'VALUES'
      
        '  (?EMPRESA,?MAQUINA,?ORDEN_COLA_MAQUINA,?PRODUCIENDO,?ID_ORDEN,' +
        '?EJERCICIO,?CANAL,?SERIE,?RIG_OF,?LINEA_FASE,?LINEA_TAREA,?TAREA' +
        ',?TIPOTAREA,?COMENTARIO,?RECURSO,?CANTIDAD,?ESTADO,?ID_UTILLAJE,' +
        '?DESC_UTILLAJE,?SECCION,?SITUACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_MAQUINAS_COLA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MAQUINA=?MAQUINA AND '
      '  ID_ORDEN=?ID_ORDEN AND'
      '  LINEA_FASE=?LINEA_FASE AND '
      '  LINEA_TAREA=?LINEA_TAREA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_MAQUINAS_COLA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MAQUINA=?CODMAQ AND'
      '  SITUACION IN (1, 2, 3) '
      'ORDER BY ORDEN_COLA_MAQUINA, SITUACION DESC, FECHA_ENTREGA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_MAQUINAS_COLA'
      'SET'
      '  ORDEN_COLA_MAQUINA=?ORDEN_COLA_MAQUINA '
      '  ,PRODUCIENDO=?PRODUCIENDO '
      '  ,MAQUINA=?new_MAQUINA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  MAQUINA=?old_MAQUINA AND '
      '  ID_ORDEN=?ID_ORDEN AND'
      '  LINEA_FASE=?LINEA_FASE AND '
      '  LINEA_TAREA=?LINEA_TAREA ')
    DataSource = DSQMMaquinasC
    AfterPost = xColaAfterPost
    OnNewRecord = QMMaquinasRepNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'MAQUINA '
      'ID_ORDEN '
      'LINEA_FASE '
      'LINEA_TAREA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_MAQUINAS_COLA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 201
    object xColaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xColaMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object xColaORDEN_COLA_MAQUINA: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN_COLA_MAQUINA'
    end
    object xColaPRODUCIENDO: TIntegerField
      DisplayLabel = 'Produciendo'
      FieldName = 'PRODUCIENDO'
      ReadOnly = True
    end
    object xColaID_ORDEN: TIntegerField
      DisplayLabel = 'Id Orden'
      FieldName = 'ID_ORDEN'
    end
    object xColaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object xColaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xColaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xColaRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.F.'
      FieldName = 'RIG_OF'
    end
    object xColaLINEA_FASE: TIntegerField
      DisplayLabel = 'Lin. Fase'
      FieldName = 'LINEA_FASE'
    end
    object xColaLINEA_TAREA: TIntegerField
      DisplayLabel = 'Lin. Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xColaTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object xColaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object xColaCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object xColaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xColaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xColaESTADO: TIntegerField
      DisplayLabel = 'Estado Tarea'
      FieldName = 'ESTADO'
    end
    object xColaID_UTILLAJE: TFIBStringField
      DisplayLabel = 'Id Utillaje'
      FieldName = 'ID_UTILLAJE'
      Size = 10
    end
    object xColaDESC_UTILLAJE: TFIBStringField
      DisplayLabel = 'Desc. Utillaje'
      FieldName = 'DESC_UTILLAJE'
      Size = 40
    end
    object xColaSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object xColaSITUACION: TIntegerField
      DisplayLabel = 'Situacion Orden'
      FieldName = 'SITUACION'
    end
    object xColaFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object xColaIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identif.'
      FieldName = 'IDENTIFICADOR'
    end
    object xColaCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object xColaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xColaUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xColaUNIDADES_PEND: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNIDADES_PEND'
    end
    object xColaID_HOJA_TRABAJO: TIntegerField
      DisplayLabel = 'Id Hoja Trab.'
      FieldName = 'ID_HOJA_TRABAJO'
    end
    object xColaHOJA_TRABAJO_VISIBLE: TIntegerField
      DisplayLabel = 'Hoja Trab. Visible'
      FieldName = 'HOJA_TRABAJO_VISIBLE'
    end
    object xColaHOJA_TRABAJO_FINALIZADO: TIntegerField
      DisplayLabel = 'Hoja Trab.Finalizado'
      FieldName = 'HOJA_TRABAJO_FINALIZADO'
    end
    object xColaHOJA_TRABAJO_FECHA_INI: TDateTimeField
      DisplayLabel = 'Hoja Trab.Fec. Inicio'
      FieldName = 'HOJA_TRABAJO_FECHA_INI'
    end
    object xColaHOJA_TRABAJO_PAUSA_INICIO: TDateTimeField
      DisplayLabel = 'Hoja Trab. Pausa Inicio'
      FieldName = 'HOJA_TRABAJO_PAUSA_INICIO'
    end
    object xColaHOJA_TRABAJO_PAUSA_FINAL: TDateTimeField
      DisplayLabel = 'Hoja Trab. Pausa Final'
      FieldName = 'HOJA_TRABAJO_PAUSA_FINAL'
    end
    object xColaESTADO_HOJA_TRABAJO: TStringField
      DisplayLabel = 'Estado H. Trab.'
      FieldKind = fkCalculated
      FieldName = 'ESTADO_HOJA_TRABAJO'
      OnGetText = xColaESTADO_HOJA_TRABAJOGetText
      Calculated = True
    end
  end
  object DSxCola: TDataSource
    DataSet = xCola
    Left = 152
    Top = 201
  end
  object QMMaquinasEti: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MAQUINAS_ETI'
      'WHERE'
      '  CODMAQ=?old_CODMAQ AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MAQUINAS_ETI'
      
        '  (EMPRESA,CODMAQ,MINUTOS_PREPARACION,ML_PREPARACION,VELOCIDAD,A' +
        'NCHO_MINIMO,ANCHO_MAXIMO_1,ANCHO_MAXIMO_2,ANCHO_MAXIMO_3,FASE)'
      'VALUES'
      
        '  (?EMPRESA,?CODMAQ,?MINUTOS_PREPARACION,?ML_PREPARACION,?VELOCI' +
        'DAD,?ANCHO_MINIMO,?ANCHO_MAXIMO_1,?ANCHO_MAXIMO_2,?ANCHO_MAXIMO_' +
        '3,?FASE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MAQUINAS_ETI'
      'WHERE'
      '  CODMAQ=?CODMAQ AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MAQUINAS_ETI'
      'WHERE'
      '  CODMAQ=?CODMAQ AND '
      '  EMPRESA=?EMPRESA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MAQUINAS_ETI'
      'SET'
      '  MINUTOS_PREPARACION=?MINUTOS_PREPARACION '
      '  ,ML_PREPARACION=?ML_PREPARACION '
      '  ,VELOCIDAD=?VELOCIDAD '
      '  ,ANCHO_MINIMO=?ANCHO_MINIMO '
      '  ,ANCHO_MAXIMO_1=?ANCHO_MAXIMO_1 '
      '  ,ANCHO_MAXIMO_2=?ANCHO_MAXIMO_2 '
      '  ,ANCHO_MAXIMO_3=?ANCHO_MAXIMO_3 '
      '  ,FASE=?FASE'
      'WHERE'
      '  CODMAQ=?CODMAQ AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMMaquinasC
    OnNewRecord = QMMaquinasEtiNewRecord
    ClavesPrimarias.Strings = (
      'CODMAQ '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MAQUINAS_ETI'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 152
    object QMMaquinasEtiEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMaquinasEtiCODMAQ: TIntegerField
      DisplayLabel = 'Cod. Maq.'
      FieldName = 'CODMAQ'
    end
    object QMMaquinasEtiMINUTOS_PREPARACION: TFloatField
      DisplayLabel = 'Min. Preparacion'
      FieldName = 'MINUTOS_PREPARACION'
    end
    object QMMaquinasEtiML_PREPARACION: TFloatField
      DisplayLabel = 'ML Preparacion'
      FieldName = 'ML_PREPARACION'
    end
    object QMMaquinasEtiVELOCIDAD: TFloatField
      DisplayLabel = 'Velocidad'
      FieldName = 'VELOCIDAD'
    end
    object QMMaquinasEtiANCHO_MINIMO: TFloatField
      DisplayLabel = 'Ancho Min.'
      FieldName = 'ANCHO_MINIMO'
    end
    object QMMaquinasEtiANCHO_MAXIMO_1: TFloatField
      DisplayLabel = 'Ancho Max. 1'
      FieldName = 'ANCHO_MAXIMO_1'
    end
    object QMMaquinasEtiANCHO_MAXIMO_2: TFloatField
      DisplayLabel = 'Ancho Max. 2'
      FieldName = 'ANCHO_MAXIMO_2'
    end
    object QMMaquinasEtiANCHO_MAXIMO_3: TFloatField
      DisplayLabel = 'Ancho Max. 3'
      FieldName = 'ANCHO_MAXIMO_3'
    end
    object QMMaquinasEtiFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 3
    end
  end
  object DSQMMaquinasEti: TDataSource
    DataSet = QMMaquinasEti
    Left = 152
    Top = 152
  end
end
