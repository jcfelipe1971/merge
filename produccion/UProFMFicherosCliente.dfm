inherited ProFMFicherosCliente: TProFMFicherosCliente
  Left = 341
  Top = 179
  Width = 614
  Height = 483
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Ficheros de Pedidos de Clientes'
  Constraints.MinWidth = 600
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 604
    Height = 430
    inherited TBMain: TLFToolBar
      Width = 600
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = ProDMFicherosCliente.DSFicheros
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
        ImageIndex = 40
      end
      object BGuardar: TToolButton
        Left = 299
        Top = 0
        Hint = 'Guardar Como ...'
        Caption = 'BGuardar'
        ImageIndex = 41
        OnClick = BGuardarClick
      end
      object PNLVerArchivo: TLFPanel
        Left = 322
        Top = 0
        Width = 95
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LFVerFichero: TLFDBCheckBox
          Left = 9
          Top = 2
          Width = 79
          Height = 17
          Caption = 'Ver Fichero'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          OnChange = LFVerFicheroChange
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 600
      Height = 400
      Constraints.MinHeight = 400
      Constraints.MinWidth = 600
      inherited TSFicha: TTabSheet
        ParentShowHint = False
        ShowHint = True
        inherited PEdit: TLFPanel
          Width = 592
          Height = 372
          Enabled = True
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = ProDMFicherosCliente.DSFicheros
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_FICHEROS_PEDIDOS'
            CampoNum = 'ID'
            CampoStr = 'NOMBRE'
          end
          object LRutaFicheros: TLabel
            Left = 0
            Top = 359
            Width = 592
            Height = 13
            Align = alBottom
            Caption = 'Ruta Ficheros'
          end
          object DBGridFicheros: TDBGridFind2000
            Left = 0
            Top = 28
            Width = 592
            Height = 331
            Align = alClient
            DataSource = ProDMFicherosCliente.DSFicheros
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 1
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = True
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            BuscarChars = False
            CamposAMostrarAnchos.Strings = (
              '0'
              '0'
              '0'
              '0')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'FECHA'
              'EXTENSION')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              ''
              ''
              ''
              '')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ID'
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMBRE'
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EXTENSION'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRIPCION'
                Width = 262
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA'
                Width = 97
                Visible = True
              end>
          end
          object PNLSeleccion: TLFPanel
            Left = 0
            Top = 0
            Width = 592
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              592
              28)
            object SBImagen: TSpeedButton
              Left = 564
              Top = 1
              Width = 24
              Height = 24
              Hint = 'Cargar Imagen desde Archivo'
              Anchors = [akTop, akRight]
              OnClick = SBImagenClick
            end
            object LFFichero: TLFEdit
              Left = 4
              Top = 2
              Width = 555
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
          end
        end
        object PNLNavegador: TLFPanel
          Left = 592
          Top = 0
          Width = 0
          Height = 372
          Align = alRight
          BevelOuter = bvNone
          BorderWidth = 3
          TabOrder = 1
          object Navegador: TWebBrowser
            Left = 3
            Top = 3
            Width = 600
            Height = 366
            Align = alClient
            TabOrder = 0
            ControlData = {
              4C000000033E0000D42500000000000000000000000000000000000000000000
              000000004C000000000000000000000001000000E0D057007335CF11AE690800
              2B2E12620B000000000000004C0000000114020000000000C000000000000046
              8000000000000000000000000000000000000000000000000000000000000000
              00000000000000000100000000000000000000000000000000000000}
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 592
          Height = 372
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 430
    Width = 604
  end
  inherited CEMain: TControlEdit
    FichaEdicion = nil
    FichaExclusiva = nil
    PanelEdicion = nil
    SubComplementario = nil
    Teclas = nil
    Left = 132
    Top = 56
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 164
    Top = 56
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 528
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 620
    Top = 8
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 396
    Top = 120
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 400
    Top = 88
  end
end
