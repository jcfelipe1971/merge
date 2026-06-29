inherited FPregModelo300: TFPregModelo300
  Left = 439
  Top = 280
  HelpContext = 260
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Modelo 300'
  ClientHeight = 289
  ClientWidth = 520
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 520
    Height = 289
    inherited TBMain: TLFToolBar
      Width = 520
      ButtonWidth = 74
      inherited TButtImprimir: TToolButton
        Left = 74
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 148
      end
      inherited TButtSalir: TToolButton
        Left = 222
      end
      object TButtConfigurar: TToolButton
        Left = 296
        Top = 0
        Action = AConfigurar
      end
      object TButtModeloOficial: TToolButton
        Left = 370
        Top = 0
        Action = AModeloOficial
      end
      object TButtInstrucciones: TToolButton
        Left = 444
        Top = 0
        Action = AInstrucciones
      end
    end
    inherited PBListado: TProgressBar
      Top = 273
      Width = 520
      TabOrder = 2
    end
    object PNMain: TLFPanel
      Left = 0
      Top = 36
      Width = 520
      Height = 237
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LTitulo: TLFLabel
        Left = 0
        Top = 0
        Width = 520
        Height = 24
        Align = alTop
        Alignment = taCenter
        Caption = 'MODELO 300. IVA TRIMESTRAL'
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
        Width = 520
        Height = 213
        Align = alClient
        DataSource = DMRModelosHacienda.DSxModelo300
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
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
            Width = 69
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
            Title.Alignment = taRightJustify
            Width = 99
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'C27'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taRightJustify
            Width = 99
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'C28'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taRightJustify
            Width = 99
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'C34'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taRightJustify
            Width = 99
            Visible = True
          end>
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 370
    Top = 60
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AModeloOficial: TAction
      Caption = 'Modelo Oficial'
      Hint = 'Modelo Oficial'
      ImageIndex = 136
      OnExecute = AModeloOficialExecute
    end
    object AInstrucciones: TAction
      Caption = 'Instrucciones'
      Hint = 'Instrucciones'
      ImageIndex = 1
      OnExecute = AInstruccionesExecute
    end
  end
end
