inherited FMUnidadesExtGesST: TFMUnidadesExtGesST
  Left = 598
  Top = 390
  Caption = 'Unidades'
  ClientHeight = 171
  ClientWidth = 312
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 312
    Height = 147
    inherited TBMain: TLFToolBar
      Width = 308
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 44
        DataSource = DMUnidadesExtGesST.DSQMUnidadesExt
        VisibleButtons = [nbPost, nbCancel]
        Hints.Strings = ()
        OnClick = NavMainClick
        Exclusivo = False
      end
      inherited TSepNav: TToolButton
        Left = 44
      end
      inherited EPMain: THYMEditPanel
        Left = 52
        Width = 29
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickSalir = EPMainClickSalir
      end
      inherited TSepTerc: TToolButton
        Left = 81
      end
      inherited TbuttComp: TToolButton
        Left = 89
      end
    end
    object PNLUnidades: TLFPanel
      Left = 2
      Top = 28
      Width = 308
      Height = 117
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object LPrecio: TLFLabel
        Left = 31
        Top = 74
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Precio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEPrecio: TLFDbedit
        Left = 73
        Top = 70
        Width = 98
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        BevelWidth = 2
        BorderStyle = bsNone
        DataField = 'PRECIO'
        DataSource = DMUnidadesExtGesST.DSQMUnidadesExt
        TabOrder = 0
        OnExit = DBEPrecioExit
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 147
    Width = 312
  end
  inherited CEMain: TControlEdit
    Left = 182
    Top = 10
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 220
    Top = 12
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMirefresh: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
