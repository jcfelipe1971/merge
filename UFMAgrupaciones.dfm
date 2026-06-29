inherited FMAgrupaciones: TFMAgrupaciones
  Left = 488
  Top = 175
  HelpContext = 291
  Caption = 'Mantenimiento de Agrupaciones'
  ClientHeight = 297
  ClientWidth = 544
  PopupMenu = CENotasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 544
    Height = 273
    inherited TBMain: TLFToolBar
      Width = 540
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEAgrupacion
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEAgrupacion
        Busca02 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Width = 540
      Height = 243
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 532
          Height = 215
          inherited G2KTableLoc: TG2KTBLoc
            Left = 42
            Top = 64
            DataSource = DMAgrupaciones.DSQMAgrupaciones
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_AGRUPACIONES'
            CampoNum = 'AGRUPACION'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'AGRUPACION')
          end
          object LAgrupacion: TLFLabel
            Left = 19
            Top = 39
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agrupaci'#243'n'
          end
          object LTitulo: TLFLabel
            Left = 44
            Top = 61
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLTituloWeb: TLFLabel
            Left = 18
            Top = 109
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo Web'
          end
          object DBEAgrupacion: TLFDbedit
            Left = 78
            Top = 35
            Width = 41
            Height = 21
            DataField = 'AGRUPACION'
            DataSource = DMAgrupaciones.DSQMAgrupaciones
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 78
            Top = 57
            Width = 301
            Height = 21
            DataField = 'TITULO'
            DataSource = DMAgrupaciones.DSQMAgrupaciones
            TabOrder = 1
          end
          object DBRGAgrupa: TDBRadioGroup
            Left = 392
            Top = 24
            Width = 133
            Height = 134
            Caption = 'Tipo de agrupaci'#243'n'
            DataField = 'TIPO'
            DataSource = DMAgrupaciones.DSQMAgrupaciones
            Items.Strings = (
              'Acreedores'
              'Art'#237'culos'
              'Modelos (TyC)'
              'Clientes'
              'Proveedores'
              'Representantes')
            TabOrder = 4
            Values.Strings = (
              'A'
              'T'
              'M'
              'C'
              'P'
              'R')
          end
          object DBTituloWeb: TLFDbedit
            Left = 78
            Top = 106
            Width = 301
            Height = 21
            DataField = 'TITULO_WEB'
            DataSource = DMAgrupaciones.DSQMAgrupaciones
            TabOrder = 2
          end
          object LFDBChkWeb: TLFDBCheckBox
            Left = 78
            Top = 84
            Width = 45
            Height = 17
            Caption = 'Web'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'WEB'
            DataSource = DMAgrupaciones.DSQMAgrupaciones
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 532
          Height = 24
          AutoSize = True
          EdgeBorders = []
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLNotas: TLFPanel
            Left = 0
            Top = 2
            Width = 321
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBECodNotas: TLFDbedit
              Left = 0
              Top = 0
              Width = 41
              Height = 21
              Color = clInfoBk
              DataField = 'AGRUPACION'
              DataSource = DMAgrupaciones.DSQMAgrupaciones
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEDesNotas: TLFDbedit
              Left = 42
              Top = 0
              Width = 279
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAgrupaciones.DSQMAgrupaciones
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton1: TToolButton
            Left = 321
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 329
            Top = 2
            Width = 88
            Height = 22
            DataSource = DMAgrupaciones.DSQMAgrupaciones
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            BeforeAction = NavNotasBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = False
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLENotas: TLFPanel
          Left = 0
          Top = 24
          Width = 532
          Height = 191
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 532
            Height = 191
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMAgrupaciones.DSQMAgrupaciones
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 532
          Height = 215
          DataSource = DMAgrupaciones.DSQMAgrupaciones
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'AGRUPACION'
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'AGRUPACION'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 356
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 36
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 273
    Width = 544
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Left = 405
    Top = 2
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 446
    Top = 2
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 332
    Top = 2
  end
  inherited FSMain: TLFFibFormStorage
    Left = 364
    Top = 2
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLENotas
    Complementario = TBMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 405
    Top = 36
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 446
    Top = 36
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
