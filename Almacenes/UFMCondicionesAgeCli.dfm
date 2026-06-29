inherited FMCondicionesAgeCli: TFMCondicionesAgeCli
  Left = 413
  Top = 299
  HelpContext = 70
  Caption = 'Condiciones de Agentes (Comisiones)'
  ClientHeight = 341
  ClientWidth = 679
  OldCreateOrder = True
  PopupMenu = CEAgrupacionPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 679
    Height = 317
    inherited TBMain: TLFToolBar
      Width = 675
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 1
      object PNLAgente: TLFPanel [0]
        Left = 0
        Top = 0
        Width = 438
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LBLAgente: TLFLabel
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'A&gente'
          FocusControl = EFAgente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFAgente: TLFEditFind2000
          Left = 75
          Top = 0
          Width = 65
          Height = 21
          TabOrder = 0
          OnChange = EFAgenteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'AGENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'AGENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBENom_Agente: TLFDbedit
          Left = 141
          Top = 0
          Width = 297
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMCondicionesAgecli.DSxAgentes
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object TSep1: TToolButton [1]
        Left = 438
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 446
        Width = 46
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 675
      Height = 287
      ActivePage = TSClientes
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSClientes: TTabSheet
        Caption = '&Clientes'
        OnShow = TSClientesShow
        object TBClientes: TLFToolBar
          Left = 0
          Top = 0
          Width = 667
          Height = 22
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object NavClientes: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesAgecli.DSQMCondClientes
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = EFCliente
            InsertaControl = EFCliente
            Exclusivo = True
            ControlEdit = CEMain
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PCClientes: TLFPageControl
          Left = 0
          Top = 22
          Width = 667
          Height = 237
          ActivePage = TSCli_Ficha
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSCli_Ficha: TTabSheet
            Caption = '&Ficha'
            object PNLCli_Ficha: TLFPanel
              Left = 0
              Top = 0
              Width = 659
              Height = 211
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LBLCliente: TLFLabel
                Left = 42
                Top = 81
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cliente'
              end
              object LBLComision_Cli: TLFLabel
                Left = 32
                Top = 103
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Comisi'#243'n'
              end
              object EFCliente: TLFDBEditFind2000
                Left = 78
                Top = 77
                Width = 65
                Height = 21
                DataField = 'CLIENTE'
                DataSource = DMCondicionesAgecli.DSQMCondClientes
                TabOrder = 0
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_CLIENTES_EF'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CLIENTE'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CLIENTE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBENom_Cliente: TLFDbedit
                Left = 144
                Top = 77
                Width = 385
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMCondicionesAgecli.DSxClientes
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
              object DBEComision_Cli: TLFDbedit
                Left = 78
                Top = 99
                Width = 65
                Height = 21
                DataField = 'P_COMISION'
                DataSource = DMCondicionesAgecli.DSQMCondClientes
                TabOrder = 1
              end
              object DBCHKActivo_Cli: TLFDBCheckBox
                Left = 78
                Top = 124
                Width = 61
                Height = 17
                Caption = 'Activo'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 2
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ACTIVO'
                DataSource = DMCondicionesAgecli.DSQMCondClientes
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
          end
          object TSCli_Tabla: TTabSheet
            Caption = '&Tabla'
            ImageIndex = 1
            OnShow = TSCli_TablaShow
            object DBGClientes: THYTDBGrid
              Left = 0
              Top = 0
              Width = 659
              Height = 211
              Align = alClient
              Color = clInfoBk
              DataSource = DMCondicionesAgecli.DSQMCondClientes
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
              OnDblClick = DBGClientesDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CamposAOrdenar.Strings = (
                'ARTICULO'
                'DESCUENTO'
                'PRECIO'
                'TITULO')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CLIENTE'
                  Width = 78
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_CLIENTE'
                  Width = 388
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'P_COMISION'
                  Width = 72
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_ALTA'
                  Width = 80
                  Visible = True
                end>
            end
          end
        end
      end
      object TSAgrupaciones: TTabSheet
        Caption = '&Agrupaci'#243'n de Clientes'
        ImageIndex = 1
        OnShow = TSAgrupacionesShow
        object TBAgrupacion: TLFToolBar
          Left = 0
          Top = 0
          Width = 667
          Height = 22
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object NavAgrupacion: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesAgecli.DSQMCondAgrupacion
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrupacionPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = EFAgrupacion
            InsertaControl = EFAgrupacion
            Exclusivo = True
            ControlEdit = CEAgrupacion
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PCAgrupacion: TLFPageControl
          Left = 0
          Top = 22
          Width = 667
          Height = 237
          ActivePage = TSAgrup_Ficha
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSAgrup_Ficha: TTabSheet
            Caption = '&Ficha'
            object PNLAgrup_Ficha: TLFPanel
              Left = 0
              Top = 0
              Width = 659
              Height = 211
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LBLAgrupacion: TLFLabel
                Left = 20
                Top = 81
                Width = 54
                Height = 13
                Alignment = taRightJustify
                Caption = 'Agrupaci'#243'n'
              end
              object LBLComision_Agrup: TLFLabel
                Left = 32
                Top = 103
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Comisi'#243'n'
              end
              object EFAgrupacion: TLFDBEditFind2000
                Left = 78
                Top = 77
                Width = 65
                Height = 21
                DataField = 'AGRUPACION'
                DataSource = DMCondicionesAgecli.DSQMCondAgrupacion
                TabOrder = 0
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_EMP_AGRUPACIONES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'AGRUPACION'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'AGRUPACION')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBENom_Agrupacion: TLFDbedit
                Left = 144
                Top = 77
                Width = 385
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMCondicionesAgecli.DSxAgrupacion
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
              object DBEComision_Agrup: TLFDbedit
                Left = 78
                Top = 99
                Width = 65
                Height = 21
                DataField = 'P_COMISION'
                DataSource = DMCondicionesAgecli.DSQMCondAgrupacion
                TabOrder = 1
              end
              object DBCHKActivo_Agrup: TLFDBCheckBox
                Left = 78
                Top = 124
                Width = 57
                Height = 17
                Caption = 'Activo'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 2
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ACTIVO'
                DataSource = DMCondicionesAgecli.DSQMCondAgrupacion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
          end
          object TSAgrup_Tabla: TTabSheet
            Caption = '&Tabla'
            ImageIndex = 1
            OnShow = TSAgrup_TablaShow
            object DBGAgrupacion: THYTDBGrid
              Left = 0
              Top = 0
              Width = 659
              Height = 211
              Align = alClient
              Color = clInfoBk
              DataSource = DMCondicionesAgecli.DSQMCondAgrupacion
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
              OnDblClick = DBGAgrupacionDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CamposAOrdenar.Strings = (
                'DESCUENTO'
                'FAMILIA'
                'TITULO')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'AGRUPACION'
                  Width = 78
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_AGRUPACION'
                  Width = 388
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'P_COMISION'
                  Width = 72
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 317
    Width = 679
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEAgrupacion
    FichaEdicion = TSCli_Ficha
    FichaExclusiva = TSClientes
    PanelEdicion = PNLCli_Ficha
    Left = 360
    Top = 42
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 408
    Top = 44
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
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
    Left = 448
  end
  inherited FSMain: TLFFibFormStorage
    Left = 446
    Top = 106
  end
  object CEAgrupacion: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSAgrup_Ficha
    FichaExclusiva = TSAgrupaciones
    PanelEdicion = PNLAgrup_Ficha
    PopUpMenu = CEAgrupacionPMEdit
    Teclas = DMMain.Teclas
    Left = 361
    Top = 105
  end
  object CEAgrupacionPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 401
    Top = 105
    object CEAgrupacionMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrupacionMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrupacionMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrupacionMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrupacionMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEAgrupacionMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEAgrupacionMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEAgrupacionMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEAgrupacionMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEAgrupacionrefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
