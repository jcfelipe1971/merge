inherited FMEtiqCli: TFMEtiqCli
  Left = 707
  Top = 200
  Caption = 'Mantenimiento de Etiquetas de Clientes'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 121
    Align = alTop
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMEtiqCli.DSQMEtiqCliCab
        Hints.Strings = ()
        EditaControl = EdEtiqVacias
        InsertaControl = EdEtiqVacias
      end
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 251
      end
      inherited TbuttComp: TToolButton
        Left = 259
      end
    end
    inherited PCMain: TLFPageControl
      Height = 91
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 65
          Align = alTop
          object LBLNRegistro: TLFLabel
            Left = 44
            Top = 12
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LBLNombreFicha: TLFLabel
            Left = 40
            Top = 34
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LNroEtiquetasVacias: TLFLabel
            Left = 162
            Top = 12
            Width = 96
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Etiquetas Vac'#237'as'
          end
          object DBECodigo: TLFDbedit
            Left = 81
            Top = 8
            Width = 59
            Height = 21
            Color = clInfoBk
            DataField = 'NUMERO'
            DataSource = DMEtiqCli.DSQMEtiqCliCab
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 81
            Top = 30
            Width = 362
            Height = 21
            DataField = 'TITULO'
            DataSource = DMEtiqCli.DSQMEtiqCliCab
            TabOrder = 2
          end
          object EdEtiqVacias: TLFEdit
            Left = 262
            Top = 8
            Width = 50
            Height = 21
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 63
          DataSource = DMEtiqCli.DSQMEtiqCliCab
          Columns = <
            item
              Expanded = False
              FieldName = 'NUMERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 386
              Visible = True
            end>
        end
      end
    end
  end
  object PNLDetalle: TLFPanel [1]
    Left = 0
    Top = 121
    Width = 502
    Height = 211
    Align = alClient
    TabOrder = 2
    object DBGFClientes: TDBGridFind2000
      Left = 1
      Top = 26
      Width = 500
      Height = 184
      Align = alClient
      DataSource = DMEtiqCli.DSQMEtiqCliDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = DBGFClientesColEnter
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      Transaction = DMEtiqCli.TLocal
      BuscarNums = False
      Campos.Strings = (
        'CLIENTE'
        'DIRECC')
      CamposAMostrar.Strings = (
        'CLIENTE'
        '0'
        'DIRECC'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      MensajeNoExiste = False
      Numericos.Strings = (
        'CLIENTE'
        'DIRECCION')
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_CLIENTES'
        'SYS_TERCEROS_DIRECCIONES')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'DIR_COMPLETA')
      Posicion = tpCentrado
      OnBusqueda = DBGFClientesBusqueda
      OrdenMultiple = True
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 285
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIRECC'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_COPIAS'
          Width = 60
          Visible = True
        end>
    end
    object TBDetalle: TLFToolBar
      Left = 1
      Top = 1
      Width = 500
      Height = 25
      EdgeBorders = []
      TabOrder = 1
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 2
        Width = 220
        Height = 22
        DataSource = DMEtiqCli.DSQMEtiqCliDetalle
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGFClientes
        InsertaControl = DBGFClientes
        Exclusivo = True
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 332
    Top = 32
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 378
    Top = 32
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
    Left = 328
    Top = 128
    object AVisualizarEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Visualizar Etiquetas'
      Hint = 'Visualizar Etiquetas'
      ImageIndex = 95
      OnExecute = AVisualizarEtiquetasExecute
    end
    object AImprimirEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Etiquetas'
      Hint = 'Imprimir Etiquetas'
      ImageIndex = 95
      OnExecute = AImprimirEtiquetasExecute
    end
    object AListConf: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AListConfExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AAgrupCli: TAction
      Category = 'Procesos'
      Caption = 'Creaci'#243'n Autom'#225'tica por Agrupaci'#243'n de Clientes'
      Hint = 'Creaci'#243'n Autom'#225'tica por Agrupaci'#243'n de Clientes'
      ImageIndex = 104
      OnExecute = AAgrupCliExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 444
    Top = 26
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    Complementario = PMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 330
    Top = 78
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 380
    Top = 76
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
