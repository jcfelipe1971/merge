object FFondo: TFFondo
  Left = 572
  Top = 169
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FFondo'
  ClientHeight = 579
  ClientWidth = 880
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClick = FormClick
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  OnShow = FormShow
  DesignSize = (
    880
    579)
  PixelsPerInch = 96
  TextHeight = 13
  object IFondo: TImage
    Left = 4
    Top = 4
    Width = 875
    Height = 573
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = True
    Proportional = True
    Visible = False
  end
  object ALFondo: TActionList
    Images = DMMain.ToolbarImages
    Left = 104
    Top = 24
    object AEliminarAD: TAction
      Caption = 'Eliminar Acceso Directo'
      OnExecute = AEliminarADExecute
    end
    object ACambiaColorFondoAD: TAction
      Caption = 'Cambiar Color de Fondo'
      OnExecute = ACambiaColorFondoADExecute
    end
    object ACambiaColorLetraAD: TAction
      Caption = 'Cambia Color de Letra'
      OnExecute = ACambiaColorLetraADExecute
    end
  end
  object PMAD: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 24
    Top = 24
    object MIEliminaAccesoDirecto: TMenuItem
      Action = AEliminarAD
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MICambiaColor: TMenuItem
      Action = ACambiaColorFondoAD
    end
    object MICambiaColordeLetra: TMenuItem
      Action = ACambiaColorLetraAD
    end
    object MIMosrarBorde: TMenuItem
      Caption = 'Mostrar Borde'
      OnClick = MIMosrarBordeClick
    end
    object MIOcultarBorde: TMenuItem
      Caption = 'Ocultar Borde'
      OnClick = MIOcultarBordeClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 64
    Top = 24
  end
end
