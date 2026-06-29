object DMLstEtiArticulosKri: TDMLstEtiArticulosKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 354
  Top = 219
  Height = 296
  Width = 327
  object frCodBarras: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frCodBarrasGetValue
    OnBeforePrint = frCodBarrasEnterRect
    OnEnterRect = frCodBarrasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 38
    Top = 24
    ReportForm = {19000000}
  end
  object frUserDSCodBarras: TfrUserDataset
    RangeEnd = reCount
    Left = 144
    Top = 146
  end
  object frDBxDetalleDoc: TfrDBDataSet
    DataSource = DSxDetalleDoc
    OnFirst = frDBxDetalleDocFirst
    OnNext = frDBxDetalleDocNext
    Left = 236
    Top = 83
  end
  object xDetalleDoc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_BARRAS BAR'
      'LEFT JOIN CON_CUENTAS_GES_ART CCGA ON'
      ' BAR.EMPRESA = CCGA.EMPRESA AND'
      ' BAR.ARTICULO = CCGA.ARTICULO AND'
      ' CCGA.CANAL = ?CANAL AND'
      ' CCGA.EJERCICIO = ?EJERCICIO'
      'JOIN ART_ARTICULOS ART ON'
      ' ART.EMPRESA = BAR.EMPRESA AND'
      ' ART.ARTICULO = BAR.ARTICULO '
      'WHERE '
      '(BAR.EMPRESA=?EMPRESA AND'
      ' BAR.BARRAS BETWEEN ?DARTICULO AND ?HARTICULO AND'
      ' ART.FAMILIA BETWEEN ?DFAMILIA AND ?HFAMILIA  '
      ')'
      'ORDER BY BAR.BARRAS'
      ''
      '')
    UniDirectional = False
    Left = 50
    Top = 96
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 141
    Top = 24
  end
  object DSxDetalleDoc: TDataSource
    DataSet = xDetalleDoc
    Left = 142
    Top = 82
  end
  object CodBarras: TCodeBar
    Alto = 100
    OrigenY = 0
    OrigenX = 0
    Modulo = 1
    Ratio = 2
    ChequearDigito = False
    TipoChequeo = csmModulo10
    Porcentaje = 20
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'MS Sans Serif'
    Fuente.Style = []
    DigitoControl = ' '
    Left = 236
    Top = 22
  end
  object xArtBarras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_BARRAS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 42
    Top = 146
    object xArtBarrasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArtBarrasBARRAS: TFIBStringField
      DisplayLabel = 'Barras'
      FieldName = 'BARRAS'
      Size = 25
    end
    object xArtBarrasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArtBarrasTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xArtBarrasFUNCION: TIntegerField
      DisplayLabel = 'Funcion'
      FieldName = 'FUNCION'
    end
  end
  object xArtTyC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT  '
      
        ' art.empresa,art.articulo,art.titulo_largo as titulo,art.familia,fam.titulo as t' +
        'it_familia,bar.barras,bar.tipo,'
      ' amc.s_color,amc.titulo as tit_color,artt.cod_talla,artt.talla '
      'FROM ART_ARTICULOS ART'
      'left join art_articulos_barras bar'
      'on art.empresa=bar.empresa and art.articulo=bar.articulo'
      'join art_articulos_m_c_tallas amct'
      'on art.id_a_m_c_t = amct.id_a_m_c_t'
      'join art_articulos_mod_color amc'
      'on amct.id_a_m_c = amc.id_a_m_c'
      'join art_tallas artt'
      'on artt.id_a_t = amct.id_a_t'
      'join art_familias fam'
      'on art.empresa = fam.empresa and art.familia=fam.familia'
      'WHERE art.empresa=?empresa and art.articulo = ?articulo')
    UniDirectional = False
    DataSource = DSxDetalleDoc
    Left = 42
    Top = 202
  end
  object DSxArtTyC: TDataSource
    DataSet = xArtTyC
    Left = 142
    Top = 202
  end
  object frxCodBarras: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 39672.5478611343
    ReportOptions.LastChange = 39672.5478611343
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frxCodBarrasGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 88
    Top = 40
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBxDetalleDoc: TfrxDBDataset
    UserName = 'frxDBxDetalleDoc'
    OnFirst = frDBxDetalleDocFirst
    OnNext = frDBxDetalleDocNext
    CloseDataSource = False
    DataSource = DSxDetalleDoc
    Left = 232
    Top = 136
  end
  object frxUserDSCodBarras: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'frxUserDSCodBarras'
    Left = 224
    Top = 184
  end
end
