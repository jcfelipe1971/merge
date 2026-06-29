inherited FCHerencia: TFCHerencia
  Left = 583
  Top = 294
  Width = 700
  Height = 372
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Herencia de Documentos'
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 690
    Height = 319
    OnResize = PMainResize
    inherited TBMain: TLFToolBar
      Width = 686
      EdgeBorders = [ebBottom]
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
      end
      object PNLDocumento: TLFPanel
        Left = 46
        Top = 0
        Width = 635
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          635
          22)
        object LRig: TLFLabel
          Left = 41
          Top = 4
          Width = 20
          Height = 13
          Alignment = taRightJustify
          Caption = 'Rig'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LTitulo: TLFLabel
          Left = 117
          Top = 4
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'T'#237'tulo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LBCliente: TLFLabel
          Left = 317
          Top = 4
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ERig: TLFEdit
          Left = 65
          Top = 1
          Width = 43
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object ETitulo: TLFEdit
          Left = 157
          Top = 1
          Width = 155
          Height = 21
          Color = clInfoBk
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
        object ECliente: TLFEdit
          Left = 363
          Top = 1
          Width = 270
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
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
      end
    end
    object PNLOrigen: TLFPanel
      Left = 2
      Top = 28
      Width = 686
      Height = 145
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LOrigen: TLFLabel
        Left = 0
        Top = 0
        Width = 686
        Height = 13
        Align = alTop
        Caption = 'Origen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGOrigen: THYTDBGrid
        Left = 0
        Top = 13
        Width = 686
        Height = 132
        Align = alClient
        Color = clInfoBk
        DataSource = DMHerencia.DSxOrigenes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGOrigenDblClick
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        PermutaPaneles = False
        CamposAOrdenar.Strings = (
          'RCANAL'
          'REJERCICIO'
          'REMPRESA'
          'RRIG'
          'RSERIE'
          'RTIPO'
          'RTITULO')
        CamposAOrdenarImgs = DMMain.ILOrdGrid
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'REJERCICIO'
            Title.Caption = 'Ejer.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RCANAL'
            Title.Caption = 'Canal'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RSERIE'
            Title.Caption = 'Serie'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RTIPO'
            Title.Caption = 'Tipo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RRIG'
            Title.Caption = 'RIG'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RTITULO'
            Title.Caption = 'Titulo'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Title.Caption = 'Fecha'
            Width = 112
            Visible = True
          end>
      end
    end
    object PNLDestino: TLFPanel
      Left = 2
      Top = 173
      Width = 686
      Height = 144
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LDestino: TLFLabel
        Left = 0
        Top = 0
        Width = 686
        Height = 13
        Align = alTop
        Caption = 'Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGDestino: THYTDBGrid
        Left = 0
        Top = 13
        Width = 686
        Height = 131
        Align = alClient
        Color = clInfoBk
        DataSource = DMHerencia.DSxDestinos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGDestinoDblClick
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        PermutaPaneles = False
        CamposAOrdenar.Strings = (
          'RCANAL'
          'REJERCICIO'
          'REMPRESA'
          'RRIG'
          'RSERIE'
          'RTIPO'
          'RTITULO')
        CamposAOrdenarImgs = DMMain.ILOrdGrid
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'REJERCICIO'
            Title.Caption = 'Ejer.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RCANAL'
            Title.Caption = 'Canal'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RSERIE'
            Title.Caption = 'Serie'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RTIPO'
            Title.Caption = 'Tipo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RRIG'
            Title.Caption = 'RIG'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RTITULO'
            Title.Caption = 'Titulo'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Title.Caption = 'Fecha'
            Width = 112
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 319
    Width = 690
  end
  inherited CEMain: TControlEdit
    Left = 296
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMirefresh: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
