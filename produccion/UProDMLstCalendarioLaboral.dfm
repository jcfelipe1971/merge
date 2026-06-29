object ProDMLstCalendarioLaboral: TProDMLstCalendarioLaboral
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 366
  Top = 248
  Height = 480
  Width = 643
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 464
    Top = 16
  end
  object frCalendarioLaboral: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    Title = 'Listado de Presencia'
    RebuildPrinter = False
    OnGetValue = CalendarioLaboralGetValue
    OnBeforePrint = CalendarioLaboralBeforePrint
    OnEnterRect = CalendarioLaboralBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 464
    Top = 64
    ReportForm = {
      190000005E00000019000000001D004D6963726F736F66742058505320446F63
      756D656E742057726974657200FEFEFF000000000000000000000000FDFF0100
      000000FC00000000000000000000000000000000580024412E3D1758E340682F
      C83B5878E640}
  end
  object QMLstCalendarioLaboral: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT * FROM OPE_LST_HORARIO_CALEN(:EMPRESA, :OPERARIO_DESDE, :' +
        'OPERARIO_HASTA, :FECHA_DESDE, :FECHA_HASTA) ')
    UniDirectional = False
    BeforeClose = QMLstCalendarioLaboralBeforeClose
    BeforeOpen = QMLstCalendarioLaboralBeforeOpen
    Left = 56
    Top = 16
  end
  object DSQMLstCalendarioLaboral: TDataSource
    DataSet = QMLstCalendarioLaboral
    Left = 192
    Top = 16
  end
  object frDBCalendarioLaboral: TfrDBDataSet
    DataSource = DSQMLstCalendarioLaboral
    Left = 328
    Top = 16
  end
  object frxCalendarioLaboral: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 43733.6622443981
    ReportOptions.LastChange = 43733.6622443981
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = CalendarioLaboralGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 464
    Top = 112
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDBMarcajePresencia: TfrDBDataSet
    DataSource = DSMarcajePresencia
    Left = 328
    Top = 64
  end
  object DSMarcajePresencia: TDataSource
    DataSet = xMarcajePresencia
    Left = 192
    Top = 64
  end
  object xMarcajePresencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM OPE_LST_HORARIO_CALEN_PRESENCIA (:EMPRESA, :OPERAR' +
        'IO, :FECHA)'
      '/*'
      
        'SELECT C.*, D.LINEA, D.TIPO_PRE, D.ID_INCIDENCIA, D.NOTAS NOTAS_DET' +
        ', D.ESTADO ESTADO_DET, D.HORA_ENTRADA, D.HORA_SALIDA,'
      
        '       D.TIEMPO, D.TIEMPO_DEC, D.ID_DET_PRESENCIA, I.TIPO TIPO_I' +
        'NCID, I.DESCRIPCION DESCRIPCION_TIPO_INCID,'
      '       T.DESCRIPCION DESCRIPCION_TIPO_PRES, I.REMUNERACION'
      'FROM PRO_CAB_PRESENCIA C'
      
        'JOIN PRO_DET_PRESENCIA D ON C.ID_CAB_PRESENCIA = D.ID_CAB_PRESEN' +
        'CIA'
      'JOIN PRO_SYS_TIPO_INCIDENCIA I ON D.ID_INCIDENCIA = I.ID_INCIDENCIA'
      'JOIN PRO_SYS_TIPO_PRESENCIA T ON D.TIPO_PRE = T.TIPO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.OPERARIO = :OPERARIO AND'
      'C.FECHA = :FECHA'
      'ORDER BY D.LINEA'
      '*/ ')
    UniDirectional = False
    DataSource = DSQMLstCalendarioLaboral
    Left = 56
    Top = 64
  end
  object frDBResumenIncidencia: TfrDBDataSet
    DataSource = DSResumenIncidencia
    Left = 328
    Top = 112
  end
  object DSResumenIncidencia: TDataSource
    DataSet = QMResumenIncidencia
    Left = 192
    Top = 112
  end
  object QMResumenIncidencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT * FROM OPE_LST_HORARIO_CALEN_PRE_INCI(:EMPRESA, :OPERARIO' +
        ', :FECHA_DESDE, :FECHA_HASTA)')
    UniDirectional = False
    Left = 56
    Top = 112
  end
end
