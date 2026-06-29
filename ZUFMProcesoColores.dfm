object ZFMProcesoColores: TZFMProcesoColores
  Left = 388
  Top = 295
  ActiveControl = LFCBEliminar
  BorderStyle = bsDialog
  Caption = 'Proceso creaci'#243'n colores'
  ClientHeight = 153
  ClientWidth = 362
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
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 362
    Height = 153
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LDescripcion: TLFLabel
      Left = 13
      Top = 33
      Width = 176
      Height = 13
      Caption = 'Indique las fechas de creaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LFechaInicio: TLFLabel
      Left = 35
      Top = 62
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Inicio'
    end
    object LFechaFin: TLFLabel
      Left = 46
      Top = 85
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Fin'
    end
    object LFDateIni: TLFDateEdit
      Left = 96
      Top = 58
      Width = 93
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 0
    end
    object LFDateFin: TLFDateEdit
      Left = 96
      Top = 81
      Width = 93
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
    object LFCBEliminar: TLFCheckBox
      Left = 13
      Top = 115
      Width = 257
      Height = 17
      Caption = 'Eliminar registros de a'#241'os anteriores'
      ClicksDisabled = False
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 362
      Height = 26
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = DMMain.ILMain_Ac
      TabOrder = 3
      Separators = True
      object TBEjecutar: TToolButton
        Left = 0
        Top = 0
        Action = AProcesoColores
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton1: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object HYMEditPanel1: THYMEditPanel
        Left = 31
        Top = 0
        Width = 20
        Height = 22
        VisibleButtons = [neSalir]
        ParentShowHint = False
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 0
        Flat = True
        Exclusivo = True
      end
    end
  end
  object ZLFAProceso: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 280
    Top = 72
    object AProcesoColores: TAction
      Caption = 'AProcesoColores'
      Hint = 'Ejecutar proceso'
      ImageIndex = 25
      OnExecute = AProcesoColoresExecute
    end
  end
end
