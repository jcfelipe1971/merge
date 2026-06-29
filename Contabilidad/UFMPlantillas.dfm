inherited FMPlantillas: TFMPlantillas
  Left = 400
  Top = 255
  Width = 600
  Height = 370
  HelpContext = 242
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Plantillas de Asientos Contables'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 153
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = DMPlantillas.DSQMPlantillas
        Hints.Strings = ()
        EditaControl = DBENombre
        InsertaControl = DBENombre
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 52
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 280
      end
      inherited TbuttComp: TToolButton
        Left = 288
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 123
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 95
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMPlantillas.DSQMPlantillas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_PLANTILLAS_CON'
            CampoNum = 'PLANTILLA'
            CampoStr = 'NOMBRE'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'PLANTILLA')
          end
          object LPlantilla: TLFLabel
            Left = 12
            Top = 9
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Plantilla'
          end
          object LTipo: TLFLabel
            Left = 27
            Top = 31
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LMoneda: TLFLabel
            Left = 288
            Top = 31
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LTitulo: TLFLabel
            Left = 22
            Top = 53
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LBancoKri: TLFLabel
            Left = 19
            Top = 75
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LConceptoComunKri: TLFLabel
            Left = 284
            Top = 75
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'C. Com'#250'n'
          end
          object LCOnceptoPropioKri: TLFLabel
            Left = 396
            Top = 75
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'C. Prop.'
          end
          object DBEPlantilla: TLFDbedit
            Left = 52
            Top = 5
            Width = 55
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'PLANTILLA'
            DataSource = DMPlantillas.DSQMPlantillas
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
          object DBENombre: TLFDbedit
            Left = 108
            Top = 5
            Width = 464
            Height = 21
            DataField = 'NOMBRE'
            DataSource = DMPlantillas.DSQMPlantillas
            TabOrder = 1
          end
          object DBETitTipo: TLFDbedit
            Left = 108
            Top = 27
            Width = 175
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPlantillas.DSxTipo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBETitulo: TLFDbedit
            Left = 52
            Top = 49
            Width = 520
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPlantillas.DSQMPlantillas
            TabOrder = 6
          end
          object DBETitMoneda: TLFDbedit
            Left = 380
            Top = 27
            Width = 192
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPlantillas.DSxMoneda
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBEFTipo: TLFDBEditFind2000
            Left = 52
            Top = 27
            Width = 55
            Height = 21
            DataField = 'TIPO'
            DataSource = DMPlantillas.DSQMPlantillas
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_ASIENTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'visible=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFTipoBusqueda
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 333
            Top = 27
            Width = 46
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMPlantillas.DSQMPlantillas
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MONEDAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'MONEDA')
            Filtros = []
          end
          object DBEFBancoKri: TLFDBEditFind2000
            Left = 52
            Top = 71
            Width = 55
            Height = 21
            DataField = 'BANCO'
            DataSource = DMPlantillas.DSQMPlantillas
            TabOrder = 7
            OnChange = DBEFBancoKriChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_BANCOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'BANCO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'empresa=empresa'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'BANCO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EBanco: TLFEdit
            Left = 108
            Top = 71
            Width = 175
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object DBEConceptoComunKri: TLFDBEditFind2000
            Left = 333
            Top = 71
            Width = 46
            Height = 21
            DataField = 'CONCEPTO_COMUN'
            DataSource = DMPlantillas.DSQMPlantillas
            TabOrder = 9
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_NORMA43'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CONCEPTO_COMUN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEConceptoComunKriBusqueda
            OrdenadoPor.Strings = (
              'CONCEPTO_COMUN')
            Filtros = []
          end
          object DBEConceptoPropioKri: TLFDBEditFind2000
            Left = 438
            Top = 71
            Width = 46
            Height = 21
            DataField = 'CONCEPTO_PROPIO'
            DataSource = DMPlantillas.DSQMPlantillas
            TabOrder = 10
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_NORMA43'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CONCEPTO_PROPIO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEConceptoPropioKriBusqueda
            OrdenadoPor.Strings = (
              'CONCEPTO_PROPIO')
            Filtros = []
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 95
          DataSource = DMPlantillas.DSQMPlantillas
          CamposAOrdenar.Strings = (
            'BANCO'
            'CONCEPTO_COMUN'
            'CONCEPTO_PROPIO'
            'MONEDA'
            'NOMBRE'
            'PLANTILLA'
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PLANTILLA'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 235
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 160
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'MONEDA'
              Title.Alignment = taCenter
              Width = 54
              Visible = True
            end>
        end
      end
    end
  end
  object PEdDetalle: TLFPanel [1]
    Left = 0
    Top = 153
    Width = 590
    Height = 164
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 590
      Height = 24
      AutoSize = True
      EdgeBorders = []
      TabOrder = 0
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 2
        Width = 220
        Height = 22
        DataSource = DMPlantillas.DSQMDetalle
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
    object DBGFDetalle: TDBGridFind2000
      Left = 0
      Top = 24
      Width = 590
      Height = 140
      Align = alClient
      DataSource = DMPlantillas.DSQMDetalle
      TabOrder = 1
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
      AutoCambiarColumna = True
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      BuscarNums = True
      Campos.Strings = (
        'ABONO'
        'CARGO')
      CamposAMostrar.Strings = (
        'ABONO'
        '0'
        'CARGO'
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
      MensajeNoExiste = False
      Numericos.Strings = (
        'CUENTA'
        'CUENTA')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'CON_CUENTAS'
        'CON_CUENTAS')
      Titulos.Strings = (
        'TITULO'
        'TITULO')
      BeforeColExit = DBGFDetalleBeforeColExit
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'CARGO'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ABONO'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEXTO'
          Width = 248
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Alignment = taRightJustify
          Width = 88
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 317
    Width = 590
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 380
    Top = 65534
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 410
    Top = 0
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 366
    Top = 130
    object ACentroCoste: TAction
      Caption = 'Inroduce Centro de Coste'
      Hint = 'Inroduce Centro de Coste'
      ImageIndex = 30
      ShortCut = 49231
      OnExecute = ACentroCosteExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 406
    Top = 128
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    Complementario = PMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 462
    Top = 65534
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 492
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
