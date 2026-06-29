inherited FCHerenciaProv: TFCHerenciaProv
  Left = 439
  Top = 395
  Caption = 'Herencia de Documentos'
  ClientHeight = 343
  ClientWidth = 690
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 690
    Height = 319
    inherited TBMain: TLFToolBar
      Width = 686
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = DMHerenciaProv.DSxOrigenes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel [1]
        Left = 110
        Width = 46
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton [2]
        Left = 156
      end
      inherited TSepTerc: TToolButton
        Left = 164
      end
      inherited TbuttComp: TToolButton
        Left = 172
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 686
      Height = 289
      ActivePage = TSOrigen
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      OnChange = PCMainChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSOrigen: TTabSheet
        Caption = 'Origen'
        object PNLDocumentoOrg: TLFPanel
          Left = 0
          Top = 0
          Width = 678
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            678
            25)
          object LBRigOrg: TLFLabel
            Left = 45
            Top = 6
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
          object LBTituloOrg: TLFLabel
            Left = 122
            Top = 6
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
          object LBProveedorOrg: TLFLabel
            Left = 322
            Top = 6
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EDRigOrg: TLFEdit
            Left = 70
            Top = 2
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
          object EDTituloOrg: TLFEdit
            Left = 162
            Top = 2
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
          object EDProveedorOrg: TLFEdit
            Left = 384
            Top = 2
            Width = 294
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
        object DBGOrigen: THYTDBGrid
          Left = 0
          Top = 25
          Width = 678
          Height = 236
          Align = alClient
          Color = clInfoBk
          DataSource = DMHerenciaProv.DSxOrigenes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 1
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
      object TSDestino: TTabSheet
        Caption = 'Destino'
        ImageIndex = 1
        object PNLDocumentoDest: TLFPanel
          Left = 0
          Top = 0
          Width = 678
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            678
            25)
          object LBRig: TLFLabel
            Left = 45
            Top = 6
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
          object LBReferencia: TLFLabel
            Left = 122
            Top = 6
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
          object LBProveedor: TLFLabel
            Left = 322
            Top = 6
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EDRig: TLFEdit
            Left = 70
            Top = 2
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
          object EDTitulo: TLFEdit
            Left = 162
            Top = 2
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
          object EDProveedor: TLFEdit
            Left = 384
            Top = 2
            Width = 294
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
        object DBGDestino: THYTDBGrid
          Left = 0
          Top = 25
          Width = 678
          Height = 236
          Align = alClient
          Color = clInfoBk
          DataSource = DMHerenciaProv.DSxDestinos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 1
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
