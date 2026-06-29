object FMHistoricoSerializacion: TFMHistoricoSerializacion
  Left = 341
  Top = 277
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Hist'#243'rico de N'#250'meros de Serie'
  ClientHeight = 447
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 447
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 760
      Height = 24
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavMain: THYMNavigator
        Left = 0
        Top = 0
        Width = 88
        Height = 22
        DataSource = DMHistoricoSerializacion.DSxHistorico
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
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
      object PNLSerie: TLFPanel
        Left = 88
        Top = 0
        Width = 188
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LBLNSerie: TLFLabel
          Left = -2
          Top = 0
          Width = 65
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'N'#186' Serie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFNSerie: TLFEditFind2000
          Left = 67
          Top = 0
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyDown = EFNSerieKeyDown
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'NSERIE'
          CampoStr = 'NSERIE'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ARTICULOS_SERIALIZACION_EF'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object ToolButton3: TToolButton
        Left = 276
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object HYMEPNumSerie: THYMEditPanel
        Left = 284
        Top = 0
        Width = 25
        Height = 22
        VisibleButtons = [neSalir]
        ParentShowHint = False
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 1
        Flat = True
        Exclusivo = True
      end
    end
    object DBGHistorico: THYTDBGrid
      Left = 0
      Top = 24
      Width = 760
      Height = 423
      Align = alClient
      Color = clInfoBk
      DataSource = DMHistoricoSerializacion.DSxHistorico
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
      OnDblClick = DBGHistoricoDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoDeseleccionar = True
      ControlEdit = CEMain
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'ALMACEN'
        'ARTICULO'
        'CANAL'
        'FECHA'
        'LINEA'
        'RIG'
        'SERIE'
        'TIPO')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANAL'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALMACEN'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 270
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGNO'
          Visible = True
        end>
    end
  end
  object CEMain: TControlEdit
    PanelEdicion = PMain
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 152
    Top = 132
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 200
    Top = 132
  end
end
