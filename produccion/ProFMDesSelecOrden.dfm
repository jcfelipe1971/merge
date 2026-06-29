object ProFMDesSelecOF: TProFMDesSelecOF
  Left = 392
  Top = 261
  ActiveControl = LFEOrden
  BorderStyle = bsDialog
  Caption = 'Seleccionar Orden Fabricaci'#243'n'
  ClientHeight = 168
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 289
    Height = 168
    Align = alClient
    TabOrder = 0
    object LHint: TLFLabel
      Left = 7
      Top = 43
      Width = 271
      Height = 38
      AutoSize = False
      Caption = 
        'Seleccione la OF padre para generar la suborden del despiece act' +
        'ual:'
      WordWrap = True
    end
    object LOrden: TLFLabel
      Left = 10
      Top = 92
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Orden'
    end
    object LFEOrden: TLFEditFind2000
      Left = 43
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 0
      Base_de_datos = DMMain.DataBase
      Transaction = ProDMDesDespiece.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ID_ORDEN'
      CampoStr = 'COMPUESTO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'PRO_ORD'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ID_ORDEN')
      Filtros = []
    end
    object TBMain: TLFToolBar
      Left = 1
      Top = 1
      Width = 287
      Height = 26
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object TBGenerar: TToolButton
        Left = 0
        Top = 0
        ImageIndex = 94
        OnClick = TBGenerarClick
      end
      object ToolButton3: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBSalir: TToolButton
        Left = 31
        Top = 0
        Caption = 'Salir'
        ImageIndex = 0
      end
    end
  end
end
