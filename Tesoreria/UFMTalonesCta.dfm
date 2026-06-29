inherited FMTalonesCta: TFMTalonesCta
  Left = 568
  Top = 232
  Width = 600
  Height = 451
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Talones por Cuentas Contables'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 398
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = DMTalonesCta.DSQMTalones
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEFBanco
      end
      inherited EPMain: THYMEditPanel
        Width = 40
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
        Hint = 'Listado de Talones'
        ImageIndex = 14
        ParentShowHint = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 216
      Align = alTop
      inherited TSFicha: TTabSheet
        object SBVerAsientos: TSpeedButton [0]
          Left = 208
          Top = 112
          Width = 65
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
          GroupIndex = -1
          Down = True
          OnDblClick = SBVerAsientosDblClick
        end
        inherited PEdit: TLFPanel
          Width = 578
          Height = 188
          inherited G2KTableLoc: TG2KTBLoc
            Left = 63
            Top = 52
          end
          object LBLFecha: TLFLabel
            Left = 43
            Top = 92
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LBLLugar: TLFLabel
            Left = 195
            Top = 92
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lugar'
          end
          object LImporte: TLFLabel
            Left = 370
            Top = 113
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
          end
          object LBanco: TLFLabel
            Left = 42
            Top = 4
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LBLDescripcion: TLFLabel
            Left = 17
            Top = 71
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LBLTalon: TLFLabel
            Left = 46
            Top = 49
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tal'#243'n'
          end
          object LBLCuenta: TLFLabel
            Left = 39
            Top = 25
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object LFLContador: TLFLabel
            Left = 239
            Top = 113
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contador'
          end
          object LComentario: TLFLabel
            Left = 20
            Top = 137
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 77
            Top = 88
            Width = 87
            Height = 21
            DataField = 'FECHA_LIBRAMIENTO'
            DataSource = DMTalonesCta.DSQMTalones
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DBELugar: TLFDbedit
            Left = 229
            Top = 88
            Width = 282
            Height = 21
            DataField = 'LUGAR_LIBRAMIENTO'
            DataSource = DMTalonesCta.DSQMTalones
            TabOrder = 5
          end
          object DBEImporte: TLFDbedit
            Left = 411
            Top = 110
            Width = 100
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'IMPORTE'
            DataSource = DMTalonesCta.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBCHKCerrada: TLFDBCheckBox
            Left = 77
            Top = 112
            Width = 87
            Height = 17
            Caption = '&Contabilizado'
            ClicksDisabled = False
            Color = clBtnFace
            ColorCheck = 57088
            ParentColor = False
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKCerradaChange
            DataField = 'PAGADO'
            DataSource = DMTalonesCta.DSxInfoActualizada
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFBanco: TLFDBEditFind2000
            Left = 77
            Top = 0
            Width = 50
            Height = 21
            DataField = 'BANCO'
            DataSource = DMTalonesCta.DSQMTalones
            TabOrder = 0
            OnChange = DBEFBancoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'BANCO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'BANCO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloBanco: TLFEdit
            Left = 128
            Top = 0
            Width = 383
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object DBEDescripcion: TLFDbedit
            Left = 77
            Top = 66
            Width = 434
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMTalonesCta.DSQMTalones
            TabOrder = 3
          end
          object DBETalon: TLFDbedit
            Left = 77
            Top = 44
            Width = 434
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'TALON'
            DataSource = DMTalonesCta.DSQMTalones
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEFCuenta: TLFDBEditFind2000
            Left = 77
            Top = 22
            Width = 96
            Height = 21
            DataField = 'CUENTA'
            DataSource = DMTalonesCta.DSQMTalones
            TabOrder = 1
            OnChange = DBEFCuentaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = DBEFCuentaExit
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCuenta: TLFEdit
            Left = 174
            Top = 22
            Width = 337
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object DBEAsiento: TLFDbedit
            Left = 165
            Top = 110
            Width = 71
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'ASIENTO'
            DataSource = DMTalonesCta.DSQMTalones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object LFDContador: TLFDbedit
            Left = 285
            Top = 110
            Width = 65
            Height = 21
            DataField = 'Z_CONTADOR'
            DataSource = DMTalonesCta.DSQMTalones
            TabOrder = 8
          end
          object LFDBComentario: TLFDBMemo
            Left = 77
            Top = 132
            Width = 434
            Height = 56
            DataField = 'Z_NOTASTALONCC'
            DataSource = DMTalonesCta.DSQMTalones
            TabOrder = 10
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 188
          DataSource = DMTalonesCta.DSQMTalones
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'FECHA_LIBRAMIENTO'
            'IMPORTE'
            'TALON')
          Columns = <
            item
              Expanded = False
              FieldName = 'TALON'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 305
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Title.Alignment = taRightJustify
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_LIBRAMIENTO'
              Width = 62
              Visible = True
            end>
        end
      end
    end
    object PNDetalle: TLFPanel
      Left = 2
      Top = 244
      Width = 586
      Height = 152
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 586
        Height = 130
        Align = alClient
        DataSource = DMTalonesCta.DSQMDetalle
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGFDetalleColEnter
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoCambiarColumna = False
        AutoPostEnCheckBox = True
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = True
        Campos.Strings = (
          'C_CONTRAPARTIDA')
        CamposAMostrar.Strings = (
          'C_CONTRAPARTIDA'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0')
        CamposADevolver.Strings = (
          'CUENTA')
        CamposDesplegar.Strings = (
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'C_CONTRAPARTIDA'
          'TITULO'
          'IMPORTE')
        CamposNoAccesibles.Strings = (
          'TITULO'
          'LINEA')
        CondicionBusqueda = 'tipo=5'
        MensajeNoExiste = False
        Numericos.Strings = (
          'CUENTA')
        SalirSiVacio = False
        SalirSiNoExiste = True
        Tablas.Strings = (
          'CON_CUENTAS')
        Acciones.Strings = (
          '')
        Titulos.Strings = (
          'TITULO')
        BeforeColExit = DBGFDetalleBeforeColExit
        Posicion = tpCentrado
        OnBusqueda = DBGFDetalleBusqueda
        Planes.Strings = (
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'CUENTA')
        Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            ReadOnly = True
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'C_CONTRAPARTIDA'
            Width = 106
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 330
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE'
            Title.Alignment = taRightJustify
            Width = 73
            Visible = True
          end>
      end
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 586
        Height = 22
        AutoSize = True
        EdgeBorders = []
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 0
          Width = 220
          Height = 22
          DataSource = DMTalonesCta.DSQMDetalle
          Flat = True
          ParentShowHint = False
          PopupMenu = CEDetallePMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFDetalle
          InsertaControl = DBGFDetalle
          Exclusivo = True
          ControlEdit = CEDetalle
          OrdenAscendente = True
          InsertaUltimo = False
          OnClickAfterAdjust = NavDetalleClickAfterAdjust
        end
        object ToolButton1: TToolButton
          Left = 220
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object TButtContabilizaTalon: TToolButton
          Left = 228
          Top = 0
          Hint = 'Contabilizar Tal'#243'n'
          ImageIndex = 68
          OnClick = TButtContabilizaTalonClick
        end
        object TButtDescotabiliartalon: TToolButton
          Left = 251
          Top = 0
          Hint = 'Descontabilizar Tal'#243'n'
          ImageIndex = 67
          OnClick = TButtDescotabiliartalonClick
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 590
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 328
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 366
    Top = 12
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 436
    Top = 12
    object ALstTalones: TAction
      Category = 'Listados'
      Caption = 'Listado de Talones'
      Hint = 'Listado de Talones'
      ImageIndex = 14
      OnExecute = ALstTalonesExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AAsientoTalon: TAction
      Category = 'Listados'
      Caption = 'Ver asiento generado'
      Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
      ShortCut = 49235
      OnExecute = AAsientoTalonCta
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 478
    Top = 14
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 327
    Top = 55
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 370
    Top = 56
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
