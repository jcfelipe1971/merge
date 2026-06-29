inherited FPregModelo330: TFPregModelo330
  Left = 398
  Top = 214
  HelpContext = 260
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Modelo 330'
  ClientHeight = 343
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 343
    inherited TBMain: TLFToolBar
      Width = 592
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object PNMain: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 307
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LTituloModelo: TLFLabel
        Left = 0
        Top = 0
        Width = 592
        Height = 24
        Align = alTop
        Alignment = taCenter
        Caption = 'MODELO 330. IVA MENSUAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGFModelo300: THYTDBGrid
        Left = 0
        Top = 24
        Width = 592
        Height = 283
        Align = alClient
        DataSource = DMRModelosHacienda.DSxModelo330
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = APrevExecute
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        PermutaPaneles = False
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DESCRIPCION'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'C21'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 96
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'C30'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 96
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'C41'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 96
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'C42'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 96
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'C43'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 96
            Visible = True
          end>
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 498
    Top = 44
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
