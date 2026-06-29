object ZDMTroqueles: TZDMTroqueles
  OldCreateOrder = False
  OnCreate = ZDMTroquelesCreate
  Left = 642
  Top = 243
  Height = 288
  Width = 482
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 400
    Top = 8
  end
  object DSQMTroqueles: TDataSource
    DataSet = QMTroqueles
    Left = 136
    Top = 8
  end
  object QMTroqueles: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_TROQUELES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  TROQUEL=?old_TROQUEL ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_TROQUELES'
      
        '  (UTILLAJE,OBSERVACIONES,RESULTADO_POS,ANCHO,AVANCE,SH_ANCHO,SV' +
        '_AVANCE,FIGURAS_ANCHO,FIGURAS_AVANCE,BANDA,FECHA_ALTA,TROQUEL,ID' +
        '_IMAGEN,EMPRESA,POS_ANCHO,POS_AVANCE,POS_Z,TROQUEL_ESPECIAL,TROQ' +
        'UEL_OVALADO,MAQUINA,TREPADO,ARTICULO,FORMA)'
      'VALUES'
      
        '  (?UTILLAJE,?OBSERVACIONES,?RESULTADO_POS,?ANCHO,?AVANCE,?SH_AN' +
        'CHO,?SV_AVANCE,?FIGURAS_ANCHO,?FIGURAS_AVANCE,?BANDA,?FECHA_ALTA' +
        ',?TROQUEL,?ID_IMAGEN,?EMPRESA,?POS_ANCHO,?POS_AVANCE,?POS_Z,?TRO' +
        'QUEL_ESPECIAL,?TROQUEL_OVALADO,?MAQUINA,?TREPADO,?ARTICULO,?FORM' +
        'A)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_TROQUELES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TROQUEL=?TROQUEL ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_TROQUELES'
      'WHERE'
      'EMPRESA=?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_TROQUELES'
      'SET'
      '  UTILLAJE=?UTILLAJE '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,RESULTADO_POS=?RESULTADO_POS '
      '  ,ANCHO=?ANCHO '
      '  ,AVANCE=?AVANCE '
      '  ,SH_ANCHO=?SH_ANCHO '
      '  ,SV_AVANCE=?SV_AVANCE '
      '  ,FIGURAS_ANCHO=?FIGURAS_ANCHO '
      '  ,FIGURAS_AVANCE=?FIGURAS_AVANCE '
      '  ,BANDA=?BANDA '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,POS_ANCHO=?POS_ANCHO '
      '  ,POS_AVANCE=?POS_AVANCE '
      '  ,POS_Z=?POS_Z '
      '  ,TROQUEL_ESPECIAL=?TROQUEL_ESPECIAL '
      '  ,TROQUEL_OVALADO=?TROQUEL_OVALADO '
      '  ,MAQUINA=?MAQUINA '
      '  ,TREPADO=?TREPADO '
      '  ,ARTICULO=?ARTICULO '
      '  ,FORMA=?FORMA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TROQUEL=?TROQUEL ')
    BeforePost = QMTroquelesBeforePost
    OnNewRecord = QMTroquelesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'TROQUEL ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_TROQUELES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMTroquelesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTroquelesTROQUEL: TIntegerField
      DisplayLabel = 'Troquel'
      FieldName = 'TROQUEL'
    end
    object QMTroquelesANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMTroquelesAVANCE: TFloatField
      DisplayLabel = 'Avance'
      FieldName = 'AVANCE'
    end
    object QMTroquelesOBSERVACIONES: TBlobField
      DisplayLabel = 'Observ.'
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object QMTroquelesPOS_Z: TIntegerField
      DisplayLabel = 'Pos. Z'
      FieldName = 'POS_Z'
    end
    object QMTroquelesID_IMAGEN: TIntegerField
      DisplayLabel = 'Id Img.'
      FieldName = 'ID_IMAGEN'
    end
    object QMTroquelesTROQUEL_ESPECIAL: TIntegerField
      DisplayLabel = 'Troquel Esp.'
      FieldName = 'TROQUEL_ESPECIAL'
    end
    object QMTroquelesTROQUEL_OVALADO: TIntegerField
      DisplayLabel = 'Troquel Oval.'
      FieldName = 'TROQUEL_OVALADO'
    end
    object QMTroquelesSH_ANCHO: TFloatField
      DisplayLabel = 'SH Ancho'
      FieldName = 'SH_ANCHO'
    end
    object QMTroquelesSV_AVANCE: TFloatField
      DisplayLabel = 'SV Avance'
      FieldName = 'SV_AVANCE'
    end
    object QMTroquelesFIGURAS_ANCHO: TFloatField
      DisplayLabel = 'Figuras Ancho'
      FieldName = 'FIGURAS_ANCHO'
    end
    object QMTroquelesFIGURAS_AVANCE: TFloatField
      DisplayLabel = 'Figuras Avance'
      FieldName = 'FIGURAS_AVANCE'
    end
    object QMTroquelesBANDA: TFloatField
      DisplayLabel = 'Banda'
      FieldName = 'BANDA'
    end
    object QMTroquelesMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object QMTroquelesFORMA: TFIBStringField
      DisplayLabel = 'Forma'
      FieldName = 'FORMA'
      Size = 3
    end
    object QMTroquelesTREPADO: TIntegerField
      DisplayLabel = 'Trepado'
      FieldName = 'TREPADO'
    end
    object QMTroquelesFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMTroquelesARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMTroquelesUTILLAJE: TFIBStringField
      FieldName = 'UTILLAJE'
      Size = 10
    end
  end
  object frDBDSOrdProd: TfrDBDataSet
    DataSource = DSxLstTroqueles
    Left = 232
    Top = 56
  end
  object frTroqueles: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 320
    Top = 8
    ReportForm = {19000000}
  end
  object DSxLstTroqueles: TDataSource
    DataSet = QMTroqueles
    Left = 232
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 400
    Top = 56
  end
  object QMConstantes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_ETI_CONSTANTES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_ETI_CONSTANTES'
      
        '  (LONGITUD_BOBINA,ML_CAMBIO_BOBINA,ID,EMPRESA,HORAS_CAMBIO_BOBI' +
        'NA,TAREA_PREPARACION,TAREA_IMPRESION,TAREA_POLIMEROS,TAREA_BOBIN' +
        'AS,PATH_DOCUMENTOS)'
      'VALUES'
      
        '  (?LONGITUD_BOBINA,?ML_CAMBIO_BOBINA,?ID,?EMPRESA,?HORAS_CAMBIO' +
        '_BOBINA,?TAREA_PREPARACION,?TAREA_IMPRESION,?TAREA_POLIMEROS,?TA' +
        'REA_BOBINAS,?PATH_DOCUMENTOS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_ETI_CONSTANTES'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT PATH_DOCUMENTOS FROM Z_ETI_CONSTANTES '
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_ETI_CONSTANTES'
      'SET'
      '  LONGITUD_BOBINA=?LONGITUD_BOBINA '
      '  ,ML_CAMBIO_BOBINA=?ML_CAMBIO_BOBINA '
      '  ,ID=?ID '
      '  ,HORAS_CAMBIO_BOBINA=?HORAS_CAMBIO_BOBINA'
      '  ,TAREA_PREPARACION=?TAREA_PREPARACON'
      '  ,TAREA_IMPRESION=?TAREA_IMPRESION'
      '  ,TAREA_POLIMEROS=?TAREA_POLIMEROS'
      '  ,TAREA_BOBINAS=?TAREA_BOBINAS'
      '  ,PATH_DOCUMENTOS=?PATH_DOCUMENTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    ClavesPrimarias.Strings = (
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_ETI_CONSTANTES'
    UpdateTransaction = TLocal
    Left = 40
    Top = 56
    object QMConstantesPATH_DOCUMENTOS: TFIBStringField
      DisplayLabel = 'Carpeta Docs.'
      FieldName = 'PATH_DOCUMENTOS'
      Size = 200
    end
  end
  object DSConstantes: TDataSource
    DataSet = QMConstantes
    Left = 136
    Top = 56
  end
end
