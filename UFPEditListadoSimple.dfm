object FPEditListadoSimple: TFPEditListadoSimple
  Left = 487
  Top = 244
  BorderStyle = bsSingle
  ClientHeight = 218
  ClientWidth = 369
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
    Top = 0
    Width = 369
    Height = 218
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 369
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 72
      DisabledImages = DMMain.ILMain_In
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
      Separators = True
      object TButtRecargar: TToolButton
        Left = 0
        Top = 0
        Action = ARecargar
      end
      object TButtImprimir: TToolButton
        Left = 72
        Top = 0
        Action = AImprimir
        ParentShowHint = False
        ShowHint = True
      end
      object TButtPrevisualizar: TToolButton
        Left = 144
        Top = 0
        Action = APrev
        ParentShowHint = False
        ShowHint = True
      end
      object TButtSalir: TToolButton
        Left = 216
        Top = 0
        Action = ASalir
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PBListado: TProgressBar
      Left = 0
      Top = 202
      Width = 369
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 1
      Visible = False
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 140
    Top = 48
    object AImprimir: TAction
      Tag = 1
      Caption = '&Imprimir'
      Hint = 'Imprimir el informe'
      ImageIndex = 14
      OnExecute = AImprimirExecute
    end
    object APrev: TAction
      Caption = '&Previsualizar'
      Hint = 'Previsualizar el informe'
      ImageIndex = 125
      OnExecute = APrevisualizarExecute
    end
    object ASalir: TAction
      Caption = '&Salir'
      Hint = 'Cerrar esta ventana'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object ARecargar: TAction
      Caption = '&Recargar'
      Hint = 'Recargar rango de listado'
      ImageIndex = 26
    end
    object AConfigurar: TAction
      Caption = '&Configurar'
      Hint = 'Configuraci'#243'n de listado'
      ImageIndex = 77
      OnExecute = AConfigurarExecute
    end
    object AExportar: TAction
      Tag = 2
      Caption = '&Exportar'
      Hint = 'Exportar datos'
      ImageIndex = 36
      OnExecute = AExportarExecute
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 108
    Top = 48
  end
end
