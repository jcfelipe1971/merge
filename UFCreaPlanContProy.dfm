object FCreaPlanContProy: TFCreaPlanContProy
  Left = 473
  Top = 369
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Crear Plan Contable Anal'#237'tico para el Proyecto'
  ClientHeight = 186
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 24
    Width = 480
    Height = 162
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 0
    object LFLSufCont: TLFLabel
      Left = 21
      Top = 110
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sufijo Contable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LFLIndFuf: TLFLabel
      Left = 243
      Top = 110
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = #205'ndice del Sufijo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object GBPlanContOrigen: TGroupBox
      Left = 10
      Top = 15
      Width = 444
      Height = 71
      Caption = ' Plan Cont. Anal'#237'tico de Origen '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object LFLPlanCont: TLFLabel
        Left = 16
        Top = 23
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Plan Contable'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LFLSufContOrigen: TLFLabel
        Left = 11
        Top = 45
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sufijo Contable'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LFLIndiceSufOrigen: TLFLabel
        Left = 236
        Top = 45
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = #205'ndice del Sufijo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBESufijoContOrigen: TLFDbedit
        Left = 86
        Top = 41
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'SUFIJO_CONTABLE'
        DataSource = DMCreaPlanContProy.DSxPlanContableOrigen
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEIndiceSufOrigen: TLFDbedit
        Left = 315
        Top = 41
        Width = 56
        Height = 21
        Color = clInfoBk
        DataField = 'INDICE_SUFIJO'
        DataSource = DMCreaPlanContProy.DSxPlanContableOrigen
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEFPlanContable: TLFEditFind2000
        Left = 86
        Top = 19
        Width = 87
        Height = 21
        TabOrder = 0
        OnChange = DBEFPlanContableChange
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PLAN_CONTABLE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ANA_PLAN_CONTABLE'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PLAN_CONTABLE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETitPlanContable: TLFDbedit
        Left = 174
        Top = 19
        Width = 236
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMCreaPlanContProy.DSxPlanContableOrigen
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object LFESufijoCont: TLFEdit
      Left = 96
      Top = 107
      Width = 87
      Height = 21
      TabOrder = 1
    end
    object LFEIndiceSuf: THYGRightEdit
      Left = 324
      Top = 107
      Width = 56
      Height = 21
      TabOrder = 2
    end
  end
  object FPMain: TLFPanel
    Left = 0
    Top = 0
    Width = 480
    Height = 24
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 1
    object LFLProyecto: TLFLabel
      Left = 9
      Top = 4
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proyecto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEFProyecto: TLFDBEditFind2000
      Left = 55
      Top = 1
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      DataField = 'PROYECTO'
      DataSource = DMArticulos.DSQMProyectosSeries
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = True
      Tabla_a_buscar = 'EMP_PROYECTOS'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'PROYECTO'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      OrdenadoPor.Strings = (
        'proyecto')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DBETitProyecto: TLFDbedit
      Left = 136
      Top = 1
      Width = 284
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object TBMain: TLFToolBar
      Left = 425
      Top = 1
      Width = 54
      Height = 22
      Align = alRight
      AutoSize = True
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 2
      Separators = True
      object TButtCrearPlan: TToolButton
        Left = 0
        Top = 0
        Hint = 'Crear Plan Contable'
        Action = ACrearPlan
        AllowAllUp = True
        ParentShowHint = False
        ShowHint = True
      end
      object TBSeparador: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtSalir: TToolButton
        Left = 31
        Top = 0
        Action = ASalir
        ParentShowHint = False
        ShowHint = False
      end
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 446
    Top = 119
    object ACrearPlan: TAction
      Caption = 'Crear Plan Contable'
      Hint = 'Marcar Todos'
      ImageIndex = 146
      OnExecute = ACrearPlanExecute
    end
    object ASalir: TAction
      Caption = 'ASalir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
  end
end
