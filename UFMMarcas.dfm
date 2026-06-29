inherited FMMarcas: TFMMarcas
  Left = 413
  Top = 252
  Width = 400
  Height = 348
  HelpContext = 283
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Marcas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 295
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = DMMarcas.DSQMMarcas
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEMarca
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEMarca
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
      Width = 386
      Height = 265
      ActivePage = TSModelos
      TabIndex = 1
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 89
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMMarcas.DSQMMarcas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_MARCA'
            CampoNum = 'MARCA'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'MARCA')
          end
          object LMarca: TLFLabel
            Left = 56
            Top = 18
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Marca'
            FocusControl = DBEMarca
          end
          object LTitulo: TLFLabel
            Left = 58
            Top = 40
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LImagen: TLFLabel
            Left = 51
            Top = 62
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object DBEMarca: TLFDbedit
            Left = 91
            Top = 14
            Width = 49
            Height = 21
            CharCase = ecUpperCase
            DataField = 'MARCA'
            DataSource = DMMarcas.DSQMMarcas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 91
            Top = 36
            Width = 259
            Height = 21
            DataField = 'TITULO'
            DataSource = DMMarcas.DSQMMarcas
            TabOrder = 1
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 91
            Top = 58
            Width = 49
            Height = 21
            DataField = 'ID_IMAGEN'
            DataSource = DMMarcas.DSQMMarcas
            TabOrder = 2
            OnChange = DBEFImagenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IMAGENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object ETituloImagen: TLFEdit
            Left = 141
            Top = 58
            Width = 209
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object BCargarImagen: TButton
            Left = 302
            Top = 60
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 4
            Visible = False
            OnClick = BCargarImagenClick
          end
          object BClipboard: TButton
            Left = 325
            Top = 60
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 5
            Visible = False
            OnClick = BClipboardClick
          end
        end
        object ScrBImagen: TScrollBox
          Left = 0
          Top = 89
          Width = 378
          Height = 148
          HorzScrollBar.Visible = False
          VertScrollBar.Visible = False
          Align = alClient
          AutoScroll = False
          BevelEdges = []
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 1
          object Imagen: TImage
            Left = 0
            Top = 0
            Width = 378
            Height = 148
            Align = alClient
            AutoSize = True
            Center = True
            IncrementalDisplay = True
            Proportional = True
            Stretch = True
          end
        end
      end
      object TSModelos: TTabSheet [1]
        Caption = 'Modelos'
        ImageIndex = 2
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 378
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavDetalle: THYMNavigator
            Left = 0
            Top = 0
            Width = 200
            Height = 22
            DataSource = DMMarcas.DSxModelos
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGModelos
            InsertaControl = DBGModelos
            Exclusivo = False
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLModelos: TLFPanel
          Left = 0
          Top = 22
          Width = 378
          Height = 215
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGModelos: THYTDBGrid
            Left = 0
            Top = 0
            Width = 378
            Height = 215
            Align = alClient
            DataSource = DMMarcas.DSxModelos
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
                Expanded = False
                FieldName = 'MODELO'
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Width = 294
                Visible = True
              end>
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 237
          DataSource = DMMarcas.DSQMMarcas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'NATURALEZA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'MARCA'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 272
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 295
    Width = 390
  end
  inherited CEMain: TControlEdit
    Left = 208
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 244
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 152
    Top = 32
  end
  inherited FSMain: TLFFibFormStorage
    Left = 112
    Top = 32
  end
end
