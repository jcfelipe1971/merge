object FCalculadora: TFCalculadora
  Left = 629
  Top = 316
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Calculadora'
  ClientHeight = 242
  ClientWidth = 209
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnClose = Salida
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PNLBotones: TLFPanel
    Left = 0
    Top = 58
    Width = 209
    Height = 184
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PNL1: TLFPanel
      Left = 8
      Top = 16
      Width = 25
      Height = 25
      BevelOuter = bvNone
      TabOrder = 0
    end
    object BBMStore: TBitBtn
      Left = 8
      Top = 112
      Width = 25
      Height = 25
      Caption = 'MG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BBMStoreClick
    end
    object BBMResult: TBitBtn
      Left = 8
      Top = 80
      Width = 25
      Height = 25
      Caption = 'MR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BBMResultClick
    end
    object BBMCero: TBitBtn
      Left = 8
      Top = 48
      Width = 25
      Height = 25
      Caption = 'MC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BBMCeroClick
    end
    object BBDiv: TBitBtn
      Left = 144
      Top = 48
      Width = 25
      Height = 25
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BBDivClick
    end
    object BB6: TBitBtn
      Left = 112
      Top = 80
      Width = 25
      Height = 25
      Caption = '6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = PulsaNumero
    end
    object BBBorradoParcial: TBitBtn
      Left = 104
      Top = 16
      Width = 49
      Height = 25
      Caption = 'CE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = B
    end
    object BB8: TBitBtn
      Left = 80
      Top = 48
      Width = 25
      Height = 25
      Caption = '8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = PulsaNumero
    end
    object BB9: TBitBtn
      Left = 112
      Top = 48
      Width = 25
      Height = 25
      Caption = '9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = PulsaNumero
    end
    object BBPor: TBitBtn
      Left = 144
      Top = 80
      Width = 25
      Height = 25
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = BBPorClick
    end
    object BBMMas: TBitBtn
      Left = 8
      Top = 144
      Width = 25
      Height = 25
      Caption = 'M+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = BBMMasClick
    end
    object BBBorradoTotal: TBitBtn
      Left = 160
      Top = 16
      Width = 41
      Height = 25
      Caption = 'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = BBBorradoTotalClick
    end
    object BBBackSpace: TBitBtn
      Left = 48
      Top = 16
      Width = 49
      Height = 25
      Caption = '<-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = BBBackSpaceClick
    end
    object BBSqr: TBitBtn
      Left = 176
      Top = 48
      Width = 25
      Height = 25
      Caption = 'sqrt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      OnClick = BBSqrClick
    end
    object BB3: TBitBtn
      Left = 112
      Top = 112
      Width = 25
      Height = 25
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      OnClick = PulsaNumero
    end
    object BB2: TBitBtn
      Left = 80
      Top = 112
      Width = 25
      Height = 25
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      OnClick = PulsaNumero
    end
    object BB5: TBitBtn
      Left = 80
      Top = 80
      Width = 25
      Height = 25
      Caption = '5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      OnClick = PulsaNumero
    end
    object BB7: TBitBtn
      Left = 48
      Top = 48
      Width = 25
      Height = 25
      Caption = '7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      OnClick = PulsaNumero
    end
    object BB4: TBitBtn
      Left = 48
      Top = 80
      Width = 25
      Height = 25
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
      OnClick = PulsaNumero
    end
    object BB1: TBitBtn
      Left = 48
      Top = 112
      Width = 25
      Height = 25
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
      OnClick = PulsaNumero
    end
    object BBPCien: TBitBtn
      Left = 176
      Top = 80
      Width = 25
      Height = 25
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 20
      OnClick = BBPCienClick
    end
    object BBInv: TBitBtn
      Left = 176
      Top = 112
      Width = 25
      Height = 25
      Caption = '1/x'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 21
      OnClick = BBInvClick
    end
    object BBResta: TBitBtn
      Left = 144
      Top = 112
      Width = 25
      Height = 25
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 22
      OnClick = BBRestaClick
    end
    object BBDec: TBitBtn
      Left = 112
      Top = 144
      Width = 25
      Height = 25
      Caption = ','
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 23
      OnClick = BBDecClick
    end
    object BBMm: TBitBtn
      Left = 80
      Top = 144
      Width = 25
      Height = 25
      Caption = '+/-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 24
      OnClick = BBMmClick
    end
    object BB0: TBitBtn
      Left = 48
      Top = 144
      Width = 25
      Height = 25
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 25
      OnClick = PulsaNumero
    end
    object BBigual: TBitBtn
      Left = 176
      Top = 144
      Width = 25
      Height = 25
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 26
      OnClick = BBigualClick
    end
    object BBSuma: TBitBtn
      Left = 144
      Top = 144
      Width = 25
      Height = 25
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 27
      OnClick = BBSumaClick
    end
  end
  object PNLResult: TLFPanel
    Left = 0
    Top = 30
    Width = 209
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object MMPantalla: TLFMemo
      Left = 0
      Top = 0
      Width = 209
      Height = 28
      Align = alClient
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        '')
      MaxLength = 40
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object MMPantallaVisible: TLFMemo
      Left = 0
      Top = 0
      Width = 209
      Height = 28
      Align = alClient
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '')
      MaxLength = 40
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object TBCalc: TLFToolBar
    Left = 0
    Top = 0
    Width = 209
    Height = 30
    ButtonHeight = 30
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    TabOrder = 2
    Separators = True
    object BBOK: TBitBtn
      Left = 0
      Top = 0
      Width = 73
      Height = 30
      Caption = 'Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = BBOKClick
    end
    object TButt1: TToolButton
      Left = 73
      Top = 0
      Width = 56
      Style = tbsSeparator
    end
    object BBCancel: TBitBtn
      Left = 129
      Top = 0
      Width = 75
      Height = 30
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = BBCancelClick
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 224
    Top = 16
  end
end
