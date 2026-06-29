object IsoFMConfiguracion: TIsoFMConfiguracion
  Left = 317
  Top = 210
  Width = 512
  Height = 385
  Caption = 'Configuraci'#243'n Iso'
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
  object LFToolBar1: TLFToolBar
    Left = 0
    Top = 0
    Width = 504
    Height = 29
    Caption = ''
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 2
      Width = 120
      Height = 22
      DataSource = IsoDMConfiguracion.DSConfig
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      EditaControl = CBValor_Inc_Ped
      InsertaControl = CBValor_Inc_Ped
      Exclusivo = True
      OrdenAscendente = True
      OnChangeState = NavMainChangeState
      InsertaUltimo = False
    end
    object ToolButton1: TToolButton
      Left = 120
      Top = 2
      Width = 8
      Style = tbsSeparator
    end
    object HYMEditPanel1: THYMEditPanel
      Left = 128
      Top = 2
      Width = 20
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
    end
  end
  object LFPanelMain: TLFPanel
    Left = 0
    Top = 29
    Width = 504
    Height = 322
    Align = alClient
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
    object LFLabel1: TLFLabel
      Left = 204
      Top = 19
      Width = 42
      Height = 13
      Caption = 'Valor A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LFLabel2: TLFLabel
      Left = 260
      Top = 19
      Width = 42
      Height = 13
      Caption = 'Valor B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LFLabel3: TLFLabel
      Left = 311
      Top = 19
      Width = 42
      Height = 13
      Caption = 'Valor C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CBValor_Manual: TLFDBCheckBox
      Left = 24
      Top = 106
      Width = 112
      Height = 17
      Caption = 'Valoraci'#243'n Manual'
      DataField = 'VALORACION_MANUAL'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 0
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = CBValor_ManualClick
    end
    object CBValor_Inc_Ped: TLFDBCheckBox
      Left = 24
      Top = 40
      Width = 136
      Height = 17
      Caption = 'Valoraci'#243'n INC/Pedidos'
      DataField = 'VALORACION_INC_PED'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = CBValor_Inc_PedClick
    end
    object CBValor_Coste: TLFDBCheckBox
      Left = 24
      Top = 63
      Width = 102
      Height = 17
      Caption = 'Valoraci'#243'n Coste'
      DataField = 'VALORACION_COSTE'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = CBValor_CosteClick
    end
    object CBValor_Entrega: TLFDBCheckBox
      Left = 24
      Top = 84
      Width = 124
      Height = 17
      Caption = 'Valoraci'#243'n Entregas'
      DataField = 'VALORACION_ENTREGAS'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = CBValor_EntregaClick
    end
    object LFDBInc_A: TLFDbedit
      Left = 205
      Top = 36
      Width = 45
      Height = 21
      DataField = 'VALOR_INC_PED_A'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 4
    end
    object LFDBInc_B: TLFDbedit
      Left = 258
      Top = 36
      Width = 45
      Height = 21
      DataField = 'VALOR_INC_PED_B'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 5
    end
    object LFDBInc_C: TLFDbedit
      Left = 311
      Top = 36
      Width = 45
      Height = 21
      DataField = 'VALOR_INC_PED_C'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 6
    end
    object LFDBCoste_A: TLFDbedit
      Left = 205
      Top = 59
      Width = 45
      Height = 21
      DataField = 'VALOR_COSTE_A'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 7
    end
    object LFDBCoste_B: TLFDbedit
      Left = 258
      Top = 59
      Width = 45
      Height = 21
      DataField = 'VALOR_COSTE_B'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 8
    end
    object LFDBCoste_C: TLFDbedit
      Left = 311
      Top = 59
      Width = 45
      Height = 21
      DataField = 'VALOR_COSTE_C'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 9
    end
    object LFDBEntrega_A: TLFDbedit
      Left = 205
      Top = 82
      Width = 45
      Height = 21
      DataField = 'VALOR_ENTREGAS_A'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 10
    end
    object LFDBEntrega_B: TLFDbedit
      Left = 258
      Top = 82
      Width = 45
      Height = 21
      DataField = 'VALOR_ENTREGAS_B'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 11
    end
    object LFDBEntrega_C: TLFDbedit
      Left = 311
      Top = 82
      Width = 45
      Height = 21
      DataField = 'VALOR_ENTREGAS_C'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 12
    end
    object LFDBManual_A: TLFDbedit
      Left = 205
      Top = 105
      Width = 45
      Height = 21
      DataField = 'VALOR_MANUAL_A'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 13
    end
    object LFDBManual_B: TLFDbedit
      Left = 258
      Top = 105
      Width = 45
      Height = 21
      DataField = 'VALOR_MANUAL_B'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 14
    end
    object LFDBManual_C: TLFDbedit
      Left = 311
      Top = 105
      Width = 45
      Height = 21
      DataField = 'VALOR_MANUAL_C'
      DataSource = IsoDMConfiguracion.DSConfig
      TabOrder = 15
    end
  end
end
