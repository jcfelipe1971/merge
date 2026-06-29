object FMColadas: TFMColadas
  Left = 489
  Top = 233
  HelpContext = 192
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Coladas'
  ClientHeight = 485
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEDetallePMEdit
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLGeneral: TLFPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object TBMain: TLFToolBar
      Left = 3
      Top = 3
      Width = 638
      Height = 22
      AutoSize = True
      EdgeBorders = [ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavMain: THYMNavigator
        Left = 0
        Top = 0
        Width = 220
        Height = 22
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 1
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBEFMaterial
        InsertaControl = DBEFMaterial
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object TButtSep1: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object EPMain: THYMEditPanel
        Left = 228
        Top = 0
        Width = 46
        Height = 22
        DataSource = DMColadas.DSColadasC
        VisibleButtons = [neRango, neSalir]
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 2
        Flat = True
        Exclusivo = True
        ControlEdit = CEMain
        OnClickRango = EPMainClickRango
      end
      object TButtSep3: TToolButton
        Left = 274
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImprimeListado: TToolButton
        Left = 282
        Top = 0
        Action = AInformeColadas
        ParentShowHint = False
        ShowHint = True
      end
      object LSerie: TLFLabel
        Left = 305
        Top = 0
        Width = 50
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Serie'
        Layout = tlCenter
      end
      object EFSerie: TLFEditFind2000
        Left = 355
        Top = 0
        Width = 70
        Height = 22
        TabStop = False
        AutoSize = False
        TabOrder = 0
        OnChange = EFSerieChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CANALES_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object PNLTitiSerie: TLFPanel
        Left = 425
        Top = 0
        Width = 201
        Height = 22
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 3
        object ETitSerie: TLFEdit
          Left = 1
          Top = 0
          Width = 200
          Height = 22
          TabStop = False
          AutoSize = False
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
      end
    end
    object PCMain: TLFPageControl
      Left = 3
      Top = 25
      Width = 638
      Height = 197
      ActivePage = TSTabla
      Align = alClient
      MultiLine = True
      OwnerDraw = True
      TabIndex = 1
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFicha: TTabSheet
        Caption = '&Ficha'
        OnShow = TSFichaShow
        object PEdCabecera: TLFPanel
          Left = 0
          Top = 0
          Width = 630
          Height = 169
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LColada: TLFLabel
            Left = 49
            Top = 15
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Colada'
            FocusControl = DBEID_COLADA
          end
          object LFecha: TLFLabel
            Left = 310
            Top = 14
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LOrden: TLFLabel
            Left = 449
            Top = 13
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
            FocusControl = DBEOrden
          end
          object LBebederos: TLFLabel
            Left = 302
            Top = 58
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso Bebederos'
          end
          object LLingotes: TLFLabel
            Left = 15
            Top = 58
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso Lingotes'
          end
          object LMaterial: TLFLabel
            Left = 45
            Top = 35
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Material'
          end
          object LNotas: TLFLabel
            Left = 55
            Top = 77
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object DBEID_COLADA: TLFDbedit
            Left = 87
            Top = 10
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'ID_COLADA'
            DataSource = DMColadas.DSColadasC
            ReadOnly = True
            TabOrder = 0
          end
          object DBEOrden: TLFDbedit
            Left = 482
            Top = 10
            Width = 73
            Height = 21
            AutoSize = False
            DataField = 'ORDEN'
            DataSource = DMColadas.DSColadasC
            TabOrder = 2
          end
          object DBEBebederos: TLFDbedit
            Left = 384
            Top = 54
            Width = 171
            Height = 21
            AutoSize = False
            DataField = 'PESO_BEBEDEROS'
            DataSource = DMColadas.DSColadasC
            TabOrder = 6
          end
          object DBELingotes: TLFDbedit
            Left = 87
            Top = 54
            Width = 113
            Height = 21
            AutoSize = False
            DataField = 'PESO_LINGOTES'
            DataSource = DMColadas.DSColadasC
            TabOrder = 5
          end
          object DBEFMaterial: TLFDBEditFind2000
            Left = 87
            Top = 32
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'MATERIAL'
            DataSource = DMColadas.DSColadasC
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MATERIALES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMColadas.EntornoDoc
          end
          object DBEMaterial: TLFDbedit
            Left = 152
            Top = 32
            Width = 403
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMColadas.DSxMateriales
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 344
            Top = 10
            Width = 97
            Height = 21
            DataField = 'FECHA'
            DataSource = DMColadas.DSColadasC
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBNotas: TLFDBMemo
            Left = 87
            Top = 76
            Width = 468
            Height = 81
            DataField = 'NOTAS'
            DataSource = DMColadas.DSColadasC
            TabOrder = 7
          end
        end
      end
      object TSTabla: TTabSheet
        Caption = '&Tabla'
        ImageIndex = 1
        OnShow = TSTablaShow
        object DBGMain: THYTDBGrid
          Left = 0
          Top = 0
          Width = 630
          Height = 169
          Align = alClient
          Color = clInfoBk
          DataSource = DMColadas.DSColadasC
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
          AutoDeseleccionar = True
          TabFicha = TSFicha
          PermutaPaneles = True
          CamposAOrdenar.Strings = (
            'FECHA'
            'ID_COLADA'
            'MATERIAL'
            'ORDEN'
            'PESO_BEBEDEROS'
            'PESO_LINGOTES')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_COLADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MATERIAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTAS'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PESO_LINGOTES'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO_BEBEDEROS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTRADA'
              Visible = False
            end>
        end
      end
    end
  end
  object PNLDetalle: TLFPanel
    Left = 0
    Top = 225
    Width = 644
    Height = 236
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object TBNavDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 644
      Height = 22
      AutoSize = True
      EdgeBorders = []
      Flat = True
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 0
        Width = 220
        Height = 22
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = False
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object TButtSep8: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
    end
    object DBGFDetalle: TDBGridFind2000
      Left = 0
      Top = 22
      Width = 644
      Height = 214
      Align = alClient
      Ctl3D = True
      DataSource = DMColadas.DSColadasD
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 1
      UsaDicG2K = True
      Changed = False
      AutoCambiarColumna = False
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
      Campos.Strings = (
        'ID_ORDEN')
      CamposAMostrar.Strings = (
        'ID_ORDEN'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clBlack
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'LINEA')
      ColumnasCheckBoxes.Strings = (
        'DEFECTUOSO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      Numericos.Strings = (
        'ID_ORDEN')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'PRO_ORD')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'COMPUESTO')
      Posicion = tpCentrado
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        ''
        ''
        ''
        ''
        '')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POSICION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_ORDEN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO_CAJA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEFECTUOSO'
          Visible = True
        end>
    end
  end
  object TBActions: TLFToolBar
    Left = 0
    Top = 461
    Width = 644
    Height = 24
    Align = alBottom
    ButtonHeight = 21
    ButtonWidth = 51
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    List = True
    ParentColor = False
    ShowCaptions = True
    TabOrder = 0
    ActionList = ALMain
    Separators = True
  end
  object CEMain: TControlEdit
    EnlazadoA = CEDetalle
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PanelEdicion = PEdCabecera
    Complementario = TBNavDetalle
    SubComplementario = ALMain
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 455
    Top = 185
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 482
    Top = 217
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
      Visible = False
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
    object MISepEnlaces: TMenuItem
      Caption = '-'
    end
    object MIVerDatosCliente: TMenuItem
      Caption = 'Ver Datos Cliente'
      Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
      ShortCut = 49219
    end
    object MIVerDatosAgente: TMenuItem
      Caption = 'Ver Datos Agente'
      Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
      ShortCut = 49217
    end
  end
  object ALColadas: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 418
    Top = 228
    object ANotasDetalle: TAction
      Caption = 'Notas Detalle'
      Hint = 'Edita las notas de la linea seleccionada (CTRL+N)'
      ImageIndex = 18
      ShortCut = 16462
    end
  end
  object CEDetalle: TControlEdit
    Complementario = PNLGeneral
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 543
    Top = 185
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 490
    Top = 184
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
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 536
    Top = 242
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 590
    Top = 240
    object AInformeColadas: TAction
      Category = 'Listados'
      Caption = 'Informe Colada'
      Hint = 'Informe Colada'
      ImageIndex = 14
      OnExecute = AInformeColadasExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfColadas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Coladas'
      Hint = 'Listado de Coladas'
      ImageIndex = 77
      OnExecute = AConfColadasExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
  end
end
