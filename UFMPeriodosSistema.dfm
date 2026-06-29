object FMPeriodosSistema: TFMPeriodosSistema
  Left = 556
  Top = 390
  HelpContext = 309
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Per'#237'odos General'
  ClientHeight = 220
  ClientWidth = 392
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
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 392
    Height = 22
    AutoSize = True
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 220
      Height = 22
      DataSource = DMPeriodosSistema.DSQMPeriodos
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      EditaControl = DBETitulo
      InsertaControl = DBEPeriodo
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TSepNav1: TToolButton
      Left = 220
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPMain: THYMEditPanel
      Left = 228
      Top = 0
      Width = 69
      Height = 22
      VisibleButtons = [neImprime, neRango, neSalir]
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
      ControlEdit = CEMain
      OnClickRango = EPMainClickRango
    end
  end
  object PCMain: TLFPageControl
    Left = 0
    Top = 22
    Width = 392
    Height = 198
    ActivePage = TSFicha
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 1
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSFicha: TTabSheet
      Caption = '&Ficha'
      object PEdit: TLFPanel
        Left = 0
        Top = 0
        Width = 384
        Height = 170
        Align = alClient
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object Label1: TLFLabel
          Left = 24
          Top = 40
          Width = 38
          Height = 13
          Caption = 'Per'#237'odo'
          FocusControl = DBEPeriodo
        end
        object Label3: TLFLabel
          Left = 41
          Top = 104
          Width = 21
          Height = 13
          Caption = 'Tipo'
        end
        object Label4: TLFLabel
          Left = 31
          Top = 61
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object Label5: TLFLabel
          Left = 34
          Top = 83
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object DBEPeriodo: TLFDbedit
          Left = 68
          Top = 36
          Width = 53
          Height = 21
          DataField = 'PERIODO'
          DataSource = DMPeriodosSistema.DSQMPeriodos
          TabOrder = 0
        end
        object DBETitulo: TLFDbedit
          Left = 122
          Top = 36
          Width = 244
          Height = 21
          DataField = 'TITULO'
          DataSource = DMPeriodosSistema.DSQMPeriodos
          TabOrder = 1
        end
        object DBETituloDesde: TLFDbedit
          Left = 122
          Top = 58
          Width = 244
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMPeriodosSistema.DSxPeriodoDesde
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBETituloHasta: TLFDbedit
          Left = 122
          Top = 80
          Width = 244
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMPeriodosSistema.DSxPeriodoHasta
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEFHasta: TLFDBEditFind2000
          Left = 68
          Top = 80
          Width = 53
          Height = 21
          DataField = 'HASTA'
          DataSource = DMPeriodosSistema.DSQMPeriodos
          TabOrder = 4
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'SYS_PERIODOS'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'PERIODO BETWEEN '#39'01'#39' AND '#39'12'#39
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = False
          Filtros = []
        end
        object DBEFDesde: TLFDBEditFind2000
          Left = 68
          Top = 58
          Width = 53
          Height = 21
          DataField = 'DESDE'
          DataSource = DMPeriodosSistema.DSQMPeriodos
          TabOrder = 2
          AutoCambiarFoco = False
          Base_de_datos = DMMain.DataBase
          BuscarNums = False
          Tabla_a_buscar = 'SYS_PERIODOS'
          Tabla_asociada.DesplegarBusqueda = False
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'PERIODO BETWEEN '#39'01'#39' AND '#39'12'#39
          ReemplazarCaracter = True
          SalirSiNoExiste = False
          SalirSiVacio = False
          Filtros = []
        end
        object DBETipoPeriodo: TLFDbedit
          Left = 68
          Top = 102
          Width = 298
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMPeriodosSistema.DSxTipoPeriodo
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
      end
    end
    object TSTabla: TTabSheet
      Caption = '&Tabla'
      ImageIndex = 1
      object DBGMain: THYTDBGrid
        Left = 0
        Top = 0
        Width = 384
        Height = 166
        Align = alClient
        Color = clInfoBk
        DataSource = DMPeriodosSistema.DSQMPeriodos
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
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        TabFicha = TSFicha
        PermutaPaneles = True
        CamposAOrdenar.Strings = (
          'PERIODO'
          'TIPO'
          'TITULO')
        CamposAOrdenarImgs = DMMain.ILOrdGrid
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'PERIODO'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Width = 49
            Visible = True
          end>
      end
    end
  end
  object CEMain: TControlEdit
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PanelEdicion = PEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 264
    Top = 4
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 328
    Top = 8
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CEMainMiSep: TMenuItem
      Caption = '-'
    end
    object CEMainMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
      Visible = False
    end
    object CEMainMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEMainMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEMainMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
    end
    object CEMainMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEMainMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CEMainMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEMainMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEMainMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEMainMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
end
