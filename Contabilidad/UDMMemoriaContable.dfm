object DMMemoriaContable: TDMMemoriaContable
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 707
  Top = 231
  Height = 370
  Width = 631
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 448
    Top = 8
  end
  object frMemoriaContable: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frMemoriaContableGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 8
    ReportForm = {19000000}
  end
  object HYRMemoriaContable: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 0
    ValorGrupo = 0
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 66
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    ControlaLongitud = True
    Left = 248
    Top = 8
  end
  object HYMMemoriaContable: THYReportMail
    ValorCodigo = 0
    ValorGrupo = 0
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 66
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    ControlaLongitud = True
    Left = 352
    Top = 8
  end
  object frxMemoriaContable: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 42109.4387734954
    ReportOptions.LastChange = 42109.4387734954
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frxMemoriaContableGetValue
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 144
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDBEmpresa: TfrDBDataSet
    DataSource = DSQMEmpresa
    Left = 248
    Top = 56
  end
  object QMEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.APERTURA, C.CIERRE, C.' +
        'MODO_IVA, C.PAIS, C.PGC, C.MONEDA, E.TITULO, E.TERCERO,'
      
        '       E.REG_MERCANTIL, E.E_MAIL, E.RECC, P.PERIODO, P.TITULO TI' +
        'TULO_PERIODO, P.DESDE, P.HASTA'
      'FROM SYS_EMPRESAS E'
      'JOIN EMP_CANALES C ON C.EMPRESA = E.EMPRESA'
      
        'JOIN EMP_PERIODOS P ON P.EMPRESA = C.EMPRESA AND P.EJERCICIO = C' +
        '.EJERCICIO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND '
      'P.PERIODO = :PERIODO AND'
      'P.TIPO = 1')
    UniDirectional = False
    Left = 40
    Top = 56
  end
  object DSQMEmpresa: TDataSource
    DataSet = QMEmpresa
    Left = 144
    Top = 56
  end
  object HYRSEmpresa: THYReportSource
    DataSet = QMEmpresa
    CloseDataset = True
    Left = 352
    Top = 56
  end
  object frxDBEmpresa: TfrxDBDataset
    UserName = 'frxDBEmpresa'
    CloseDataSource = False
    DataSource = DSQMEmpresa
    Left = 448
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 544
    Top = 8
  end
  object DSQMVarCab: TDataSource
    DataSet = QMVarCab
    Left = 144
    Top = 104
  end
  object DSQMVarCTA: TDataSource
    DataSet = QMVarCTA
    Left = 144
    Top = 152
  end
  object QMVarCTA: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_MEMORIA_CONTABLE_VAR_CTA'
      'WHERE'
      '  CUENTA=?old_CUENTA AND '
      '  VAR=?old_VAR AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_MEMORIA_CONTABLE_VAR_CTA'
      '  (EMPRESA,EJERCICIO,CANAL,CUENTA,VAR)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?CUENTA,?VAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_MEMORIA_CONTABLE_VAR_CTA'
      'WHERE'
      '  CUENTA=?old_CUENTA AND '
      '  VAR=?VAR AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_MEMORIA_CONTABLE_VAR_CTA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'VAR = :VAR'
      'ORDER BY CUENTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_MEMORIA_CONTABLE_VAR_CTA'
      'SET CUENTA = ?new_CUENTA'
      'WHERE'
      '  CUENTA=?old_CUENTA AND '
      '  VAR=?VAR AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMVarCab
    OnCalcFields = QMVarCTACalcFields
    OnNewRecord = QMVarCTANewRecord
    ClavesPrimarias.Strings = (
      'CUENTA '
      'VAR '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_MEMORIA_CONTABLE_VAR_CTA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 152
    object QMVarCTAEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMVarCTAEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMVarCTACANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMVarCTACUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMVarCTAVAR: TFIBStringField
      DisplayLabel = 'Variable'
      FieldName = 'VAR'
      Size = 15
    end
    object QMVarCTASALDO: TCurrencyField
      DisplayLabel = 'Saldo'
      FieldKind = fkCalculated
      FieldName = 'SALDO'
      Calculated = True
    end
  end
  object QMVarCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_MEMORIA_CONTABLE_VAR'
      'WHERE'
      '  VAR=?old_VAR AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_MEMORIA_CONTABLE_VAR'
      '  (EMPRESA,EJERCICIO,CANAL,VAR,TITULO)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?VAR,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_MEMORIA_CONTABLE_VAR'
      'WHERE'
      '  VAR=?VAR AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_MEMORIA_CONTABLE_VAR'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL'
      'ORDER BY VAR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_MEMORIA_CONTABLE_VAR'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  VAR=?VAR AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMVarCabAfterOpen
    BeforeClose = QMVarCabBeforeClose
    OnNewRecord = QMVarCabNewRecord
    ClavesPrimarias.Strings = (
      'VAR '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_MEMORIA_CONTABLE_VAR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object QMVarCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMVarCabEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMVarCabCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMVarCabVAR: TFIBStringField
      DisplayLabel = 'Variable'
      FieldName = 'VAR'
      Size = 15
    end
    object QMVarCabTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
end
