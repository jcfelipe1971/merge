object FMAsientosPorImputar: TFMAsientosPorImputar
  Left = 355
  Top = 234
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Asientos por imputar'
  ClientHeight = 459
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEApuntesPMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 212
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 753
      Height = 22
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object PTipoAsientos: TLFPanel
        Left = 0
        Top = 0
        Width = 274
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LBLTipoAsiento: TLFLabel
          Left = 4
          Top = 4
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de Asiento'
        end
        object CBTipoAsiento: TLFComboBox
          Left = 82
          Top = 0
          Width = 190
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object PFechas: TLFPanel
        Left = 274
        Top = 0
        Width = 335
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LBLDesde: TLFLabel
          Left = 25
          Top = 3
          Width = 48
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Desde'
        end
        object LBLHasta: TLFLabel
          Left = 191
          Top = 3
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object DEDesde: TLFDateEdit
          Left = 77
          Top = 0
          Width = 88
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DEHasta: TLFDateEdit
          Left = 224
          Top = 0
          Width = 89
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object TButtRefrescar: TToolButton
        Left = 609
        Top = 0
        Hint = 'Refrescar'
        Caption = 'Refrescar'
        ImageIndex = 39
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtRefrescarClick
      end
      object TSep2: TToolButton
        Left = 632
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtConfirmar: TToolButton
        Left = 640
        Top = 0
        Hint = 'Confirmar'
        Caption = 'Confirmar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtConfirmarClick
      end
      object TButtSalir: TToolButton
        Left = 663
        Top = 0
        Hint = 'Cerrar la ventana'
        Caption = 'Salir'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtSalirClick
      end
    end
    object TBAsientos: TLFToolBar
      Left = 0
      Top = 48
      Width = 753
      Height = 24
      EdgeBorders = []
      Flat = True
      TabOrder = 1
      Separators = True
      object NavAsientos: THYMNavigator
        Left = 0
        Top = 0
        Width = 104
        Height = 22
        DataSource = DMAsientosPorImputar.DSxAsientos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEAsientosPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEAsientos
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
    object DBGAsientos: THYTDBGrid
      Left = 0
      Top = 72
      Width = 753
      Height = 137
      Align = alTop
      Color = clInfoBk
      DataSource = DMAsientosPorImputar.DSxAsientos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = DBGAsientosColEnter
      OnDblClick = DBGAsientosDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoDeseleccionar = True
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'AGRUPACION_GENERAL'
        'ASIENTO'
        'CANAL'
        'DEBE'
        'EJERCICIO'
        'EMPRESA'
        'ENTRADA'
        'FECHA'
        'FIRME'
        'HABER'
        'IMPUTACION'
        'LINEAS'
        'RIC'
        'SALDO'
        'TIPO'
        'TITULO')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'RIC'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 35
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
          FieldName = 'DEBE'
          Title.Alignment = taRightJustify
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HABER'
          Title.Alignment = taRightJustify
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 355
          Visible = True
        end>
    end
    object LFPFiltroProyectos: TLFPanel
      Left = 0
      Top = 22
      Width = 753
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LProyecto: TLFLabel
        Left = 36
        Top = 3
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Proyecto'
      end
      object DBEProyecto: TLFEditFind2000
        Left = 82
        Top = 0
        Width = 68
        Height = 21
        TabOrder = 1
        OnChange = DBEProyectoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMAsientosPorImputar.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PROYECTO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_PROYECTOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = DBEProyectoBusqueda
        OrdenadoPor.Strings = (
          'PROYECTO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETitProyecto: TLFDbedit
        Left = 151
        Top = 0
        Width = 227
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMAsientosPorImputar.DSxProyectos
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object PDetalle: TLFPanel
    Left = 0
    Top = 212
    Width = 753
    Height = 247
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object TBApuntes: TLFToolBar
      Left = 0
      Top = 0
      Width = 753
      Height = 24
      EdgeBorders = []
      Flat = True
      TabOrder = 0
      Separators = True
      object NavApuntes: THYMNavigator
        Left = 0
        Top = 0
        Width = 104
        Height = 22
        DataSource = DMAsientosPorImputar.DSxApuntes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEApuntesPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEApuntes
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
    object DBGApuntes: THYTDBGrid
      Left = 0
      Top = 24
      Width = 753
      Height = 223
      Align = alClient
      Color = clInfoBk
      DataSource = DMAsientosPorImputar.DSxApuntes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = DBGApuntesColEnter
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoDeseleccionar = True
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'CANAL'
        'CUENTA'
        'DOC_FECHA'
        'DOC_NUMERO'
        'DOC_SERIE'
        'EJERCICIO'
        'EMPRESA'
        'ENTRADA'
        'IMPORTE'
        'LINEA'
        'PROYECTO'
        'PUNTEO'
        'RIC'
        'SIGNO'
        'TEXTO'
        'TIPO')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'Cargo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Abono'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEXTO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Alignment = taRightJustify
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_SERIE'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_NUMERO'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_FECHA'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROYECTO'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_PROYECTO'
          Width = 200
          Visible = True
        end>
    end
  end
  object CEAsientos: TControlEdit
    EnlazadoA = CEApuntes
    PopUpMenu = CEAsientosPMEdit
    Teclas = DMMain.Teclas
    Left = 408
    Top = 80
  end
  object CEAsientosPMEdit: TPopUpTeclas
    Left = 448
    Top = 80
    object CEAsientosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAsientosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAsientosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAsientosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAsientosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAsientosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAsientosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEAsientosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEAsientosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEAsientosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEApuntes: TControlEdit
    EnlazadoA = CEAsientos
    PopUpMenu = CEApuntesPMEdit
    Teclas = DMMain.Teclas
    Left = 409
    Top = 118
  end
  object CEApuntesPMEdit: TPopUpTeclas
    Left = 448
    Top = 118
    object CEApuntesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEApuntesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEApuntesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEApuntesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEApuntesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEApuntesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEApuntesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEApuntesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEApuntesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEApuntesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
