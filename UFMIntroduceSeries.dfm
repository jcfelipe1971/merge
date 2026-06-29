inherited FMIntroduceSeries: TFMIntroduceSeries
  Left = 443
  Top = 223
  Width = 621
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Introducci'#243'n de Series'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 611
    inherited TBMain: TLFToolBar
      Width = 607
      inherited NavMain: THYMNavigator
        Width = 160
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 160
      end
      inherited EPMain: THYMEditPanel
        Left = 168
        Width = 21
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 189
      end
      inherited TbuttComp: TToolButton
        Left = 197
      end
      object TButtAsignar: TToolButton
        Left = 220
        Top = 0
        Hint = 'Asignar series'
        Enabled = False
        ImageIndex = 25
        OnClick = TButtAsignarClick
      end
      object TButtSep1: TToolButton
        Left = 243
        Top = 0
        Width = 8
        ImageIndex = 26
        Style = tbsSeparator
      end
      object TButtAnterior: TToolButton
        Left = 251
        Top = 0
        Caption = 'TButtAnterior'
        ImageIndex = 51
        OnClick = TButtAnteriorClick
      end
      object TButtSiguiente: TToolButton
        Left = 274
        Top = 0
        Caption = 'TButtSiguiente'
        ImageIndex = 25
        OnClick = TButtSiguienteClick
      end
      object PNLArticulo: TLFPanel
        Left = 297
        Top = 0
        Width = 302
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LArticulo: TLFLabel
          Left = 15
          Top = 3
          Width = 16
          Height = 13
          Alignment = taRightJustify
          Caption = 'Art.'
        end
        object DBEArticulo: TLFDbedit
          Left = 34
          Top = 1
          Width = 97
          Height = 21
          Color = clInfoBk
          DataField = 'ARTICULO'
          DataSource = DMIntroduceSeries.DSArticulos
          Enabled = False
          TabOrder = 0
          OnChange = DBEArticuloChange
        end
        object ETituloArticulo: TLFEdit
          Left = 132
          Top = 1
          Width = 168
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
          Text = 'ETituloArticulo'
        end
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 607
      Height = 302
      ActivePage = TSFicha
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFicha: TTabSheet
        Caption = 'Por Asignar'
        object DBGMain: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 414
          Height = 274
          Align = alClient
          DataSource = DMIntroduceSeries.DSQMTmpAsignar
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnKeyPress = DBGMainKeyPress
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = True
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 0
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 0
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          BuscarChars = False
          Campos.Strings = (
            'NSERIE')
          CamposAMostrar.Strings = (
            'NSERIE'
            '2'
            'FECHA_GARANTIA_PROVEEDOR'
            'FECHA_GARANTIA_CLIENTE')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CamposNoAccesibles.Strings = (
            'LINEA'
            'ARTICULO'
            'UNIDADES')
          MensajeNoExiste = False
          Numericos.Strings = (
            'NSERIE')
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tablas.Strings = (
            'ART_ARTICULOS_SERIALIZACION')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'FECHA_CADUCIDAD')
          Posicion = tpCentrado
          OnBusqueda = DBGMainBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'NSERIE')
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              ReadOnly = True
              Width = 35
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              ReadOnly = True
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSERIE'
              Width = 150
              Visible = True
            end>
        end
        object PNLImportacionNrosSerie: TLFPanel
          Left = 414
          Top = 0
          Width = 185
          Height = 274
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object TBImportacionNrosSerie: TLFToolBar
            Left = 0
            Top = 0
            Width = 185
            Height = 24
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Separators = True
            object TButtImportar: TToolButton
              Left = 0
              Top = 2
              Hint = 'Importar N'#250'meros de Serie'
              Caption = 'Importar'
              ImageIndex = 92
              OnClick = TButtImportarClick
            end
          end
          object MImportacionNrosSerie: TLFMemo
            Left = 0
            Top = 24
            Width = 185
            Height = 250
            Align = alClient
            TabOrder = 1
          end
        end
      end
      object TSTabla: TTabSheet
        Caption = 'Asignados'
        ImageIndex = 1
        object DBGTabla: THYTDBGrid
          Left = 0
          Top = 0
          Width = 599
          Height = 274
          Align = alClient
          Color = clInfoBk
          DataSource = DMIntroduceSeries.DSxAsignados
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
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          TabFicha = TSFicha
          PermutaPaneles = True
          CamposAOrdenar.Strings = (
            'COMPUESTO'
            'ESCANDALLO'
            'FECHA_CREAC'
            'TITULO')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSERIE'
              Width = 150
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Width = 611
  end
  inherited CEMain: TControlEdit
    Left = 332
    Top = 28
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 368
    Top = 28
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
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
  inherited ALMain: TLFActionList
    Left = 416
    Top = 28
  end
  inherited FSMain: TLFFibFormStorage
    Left = 456
    Top = 24
  end
end
