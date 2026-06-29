object DMLstPunteoAsientos: TDMLstPunteoAsientos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 107
  Height = 358
  Width = 627
  object frPunteo: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frPunteoGetValue
    OnBeforePrint = frPunteoBeforePrint
    OnEnterRect = frPunteoBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 248
    Top = 8
    ReportForm = {19000000}
  end
  object frDBPunteos: TfrDBDataSet
    DataSource = DSQMPunteos
    Left = 248
    Top = 56
  end
  object frDBNorma43: TfrDBDataSet
    DataSource = DSQMNorma43
    Left = 248
    Top = 104
  end
  object QMPunteos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      'p.*'
      ',(select count(*) from con_norma_43_rel_kri r'
      '  where'
      '  p.empresa=r.empresa and'
      '  p.ejercicio=r.ejercicio and'
      '  p.canal=r.canal and'
      '  p.ric=r.ric and'
      '  p.linea=r.linea) as RELACIONES'
      'FROM VER_CUENTAS_PUNTEOS p'
      'WHERE'
      'p.EMPRESA=?EMPRESA AND'
      'p.EJERCICIO=?EJERCICIO AND'
      'p.CANAL=?CANAL AND'
      'p.CUENTA=?CUENTA AND'
      'p.FECHA between ?DFECHA and ?HFECHA'
      'ORDER BY p.FECHA, p.RIC, p.LINEA'
      '')
    UniDirectional = False
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_OFERTA_C CAB INDEX (GES_CABECERAS_S_ID)' +
        ','
      
        '           VER_CABECERAS_OFERTA_C OFC INDEX (GES_CABECERAS_S_OFC' +
        '_ID),'
      '           VER_CABECERAS_OFERTA_C TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMPunteosAfterOpen
    BeforeClose = QMPunteosBeforeClose
    Left = 40
    Top = 56
    object QMPunteosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPunteosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPunteosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPunteosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMPunteosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPunteosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMPunteosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMPunteosTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object QMPunteosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMPunteosDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object QMPunteosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMPunteosDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMPunteosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPunteosASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMPunteosPUNTEO: TIntegerField
      DisplayLabel = 'Punteo'
      FieldName = 'PUNTEO'
    end
    object QMPunteosFECHA_PUNTEO: TDateTimeField
      DisplayLabel = 'Fec. Punteo'
      FieldName = 'FECHA_PUNTEO'
    end
    object QMPunteosRELACIONES: TIntegerField
      DisplayLabel = 'Relaciones'
      FieldName = 'RELACIONES'
    end
  end
  object DSQMPunteos: TDataSource
    DataSet = QMPunteos
    Left = 144
    Top = 56
  end
  object QMNorma43: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT D.*, C.* FROM'
      'CON_NORMA_43_REL_KRI R'
      'JOIN CON_NORMA_43_DET_KRI D'
      'ON R.ID = D.ID'
      'JOIN CON_NORMA_43_CAB_KRI C'
      'ON D.ID_CAB = C.ID'
      'WHERE'
      'R.EMPRESA = ?EMPRESA AND'
      'R.EJERCICIO = ?EJERCICIO AND'
      'R.CANAL = ?CANAL AND'
      'R.RIC = ?RIC AND'
      'R.LINEA = ?LINEA')
    UniDirectional = False
    DataSource = DSQMPunteos
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_DETALLE_OFERTA_C DET INDEX (GES_DETALLES_S_' +
        'CAB_ID),'
      
        '                VER_DETALLE_OFERTA_C OFC INDEX (GES_DETALLES_S_O' +
        'FC_ID)))  '
      '')
    Left = 40
    Top = 104
    object QMNorma43ID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMNorma43ID_CAB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB'
    end
    object QMNorma43COD_DATO: TIntegerField
      DisplayLabel = 'Dato'
      FieldName = 'COD_DATO'
    end
    object QMNorma43CONCEPTO1: TFIBStringField
      DisplayLabel = 'Concepto 1'
      FieldName = 'CONCEPTO1'
      Size = 40
    end
    object QMNorma43CONCEPTO2: TFIBStringField
      DisplayLabel = 'Concepto 2'
      FieldName = 'CONCEPTO2'
      Size = 40
    end
    object QMNorma43LINEA_IMPORTADA: TFIBStringField
      DisplayLabel = 'Linea Importada'
      FieldName = 'LINEA_IMPORTADA'
      Size = 100
    end
    object QMNorma43ID1: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID1'
    end
    object QMNorma43EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNorma43OFICINA: TFIBStringField
      DisplayLabel = 'Oficina'
      FieldName = 'OFICINA'
      Size = 4
    end
    object QMNorma43FECHA_OPERACION: TDateTimeField
      DisplayLabel = 'Fec. Oper.'
      FieldName = 'FECHA_OPERACION'
    end
    object QMNorma43FECHA_VALOR: TDateTimeField
      DisplayLabel = 'Fec. Valor'
      FieldName = 'FECHA_VALOR'
    end
    object QMNorma43CONCEPTO_COMUN: TIntegerField
      DisplayLabel = 'Conc. Com.'
      FieldName = 'CONCEPTO_COMUN'
    end
    object QMNorma43CONCEPTO_PROPIO: TIntegerField
      DisplayLabel = 'Conc. Prop.'
      FieldName = 'CONCEPTO_PROPIO'
    end
    object QMNorma43SIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMNorma43IMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMNorma43DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object QMNorma43REFERENCIA1: TFIBStringField
      DisplayLabel = 'Ref. 1'
      FieldName = 'REFERENCIA1'
    end
    object QMNorma43REFERENCIA2: TFIBStringField
      DisplayLabel = 'Ref. 2'
      FieldName = 'REFERENCIA2'
    end
    object QMNorma43PUNTEO: TIntegerField
      DisplayLabel = 'Punteo'
      FieldName = 'PUNTEO'
    end
    object QMNorma43LINEA_IMPORTADA1: TFIBStringField
      DisplayLabel = 'Linea Importada'
      FieldName = 'LINEA_IMPORTADA1'
      Size = 100
    end
    object QMNorma43BANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
  end
  object DSQMNorma43: TDataSource
    DataSet = QMNorma43
    Left = 144
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 144
    Top = 8
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1991
    ValorGrupo = 38
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 66
    Opciones.Pagina.SaltoPagina = True
    Opciones.Pagina.ImprimePrimeraCabecera = True
    Opciones.Pagina.ImprimeUltimoPie = True
    Titulo = 'Oferta Matricial'
    ControlaLongitud = True
    OnEnterFields = HYReportEnterFields
    Left = 344
    Top = 8
  end
  object frxPunteo: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9719063426
    ReportOptions.LastChange = 38691.9719063426
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxPunteoBeforePrint
    OnGetValue = frxPunteoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 440
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
