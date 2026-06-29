inherited FMJornada: TFMJornada
  Left = 400
  Top = 132
  Caption = 'Mantenimiento Jornadas, Horas, Centros de Costos'
  ClientHeight = 753
  ClientWidth = 1378
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1378
    Height = 729
    object SplitterJornada: TSplitter [0]
      Left = 339
      Top = 28
      Width = 7
      Height = 699
      Cursor = crHSplit
    end
    object SplitterTipoJornada: TSplitter [1]
      Left = 683
      Top = 28
      Width = 7
      Height = 699
      Cursor = crHSplit
    end
    object Splitter1: TSplitter [2]
      Left = 1027
      Top = 28
      Width = 7
      Height = 699
      Cursor = crHSplit
    end
    inherited TBMain: TLFToolBar
      Width = 1374
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object GBCcostos: TGroupBox
      Left = 1034
      Top = 28
      Width = 337
      Height = 699
      Align = alLeft
      Caption = 'Centros de Costos'
      TabOrder = 1
      object PNLIncapacidad: TLFPanel
        Left = 2
        Top = 15
        Width = 391
        Height = 682
        Align = alLeft
        TabOrder = 0
        object TBCCostos: TLFToolBar
          Left = 1
          Top = 1
          Width = 389
          Height = 29
          ButtonHeight = 25
          Caption = 'TBCCostos'
          TabOrder = 0
          Separators = True
          object NavCCostos: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 25
            DataSource = DMJornada.DSQMCCostos
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGCCostos: THYTDBGrid
          Left = 1
          Top = 30
          Width = 389
          Height = 651
          Align = alClient
          DataSource = DMJornada.DSQMCCostos
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
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
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 254
              Visible = True
            end>
        end
      end
    end
    object GBJornada: TGroupBox
      Left = 2
      Top = 28
      Width = 337
      Height = 699
      Align = alLeft
      Caption = 'Jornada'
      TabOrder = 2
      object LFPanel1: TLFPanel
        Left = 2
        Top = 15
        Width = 391
        Height = 682
        Align = alLeft
        TabOrder = 0
        object TBJornada: TLFToolBar
          Left = 1
          Top = 1
          Width = 389
          Height = 29
          ButtonHeight = 25
          Caption = 'TBIncapacidad'
          TabOrder = 0
          Separators = True
          object NavJornada: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 25
            DataSource = DMJornada.DSQMJornada
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGJornada: THYTDBGrid
          Left = 1
          Top = 30
          Width = 389
          Height = 651
          Align = alClient
          DataSource = DMJornada.DSQMJornada
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
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
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 254
              Visible = True
            end>
        end
      end
    end
    object GBTipoJornada: TGroupBox
      Left = 346
      Top = 28
      Width = 337
      Height = 699
      Align = alLeft
      Caption = 'Tipo de Jornada'
      TabOrder = 3
      object LFPanel2: TLFPanel
        Left = 2
        Top = 15
        Width = 391
        Height = 682
        Align = alLeft
        TabOrder = 0
        object TBTipoJornada: TLFToolBar
          Left = 1
          Top = 1
          Width = 389
          Height = 29
          ButtonHeight = 25
          Caption = 'TBIncapacidad'
          TabOrder = 0
          Separators = True
          object NavTipoJornada: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 25
            DataSource = DMJornada.DSQMTipoJornada
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGTipoJornada: THYTDBGrid
          Left = 1
          Top = 30
          Width = 389
          Height = 651
          Align = alClient
          DataSource = DMJornada.DSQMTipoJornada
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
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
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 254
              Visible = True
            end>
        end
      end
    end
    object GBAreas: TGroupBox
      Left = 690
      Top = 28
      Width = 337
      Height = 699
      Align = alLeft
      Caption = 'Areas'
      TabOrder = 4
      object LFPanel3: TLFPanel
        Left = 2
        Top = 15
        Width = 391
        Height = 682
        Align = alLeft
        TabOrder = 0
        object TBAreas: TLFToolBar
          Left = 1
          Top = 1
          Width = 389
          Height = 29
          ButtonHeight = 25
          Caption = 'TBIncapacidad'
          TabOrder = 0
          Separators = True
          object NavAreas: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 25
            DataSource = DMJornada.DSQMAreas
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGAreas: THYTDBGrid
          Left = 1
          Top = 30
          Width = 389
          Height = 651
          Align = alClient
          DataSource = DMJornada.DSQMAreas
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
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
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 254
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 729
    Width = 1378
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
