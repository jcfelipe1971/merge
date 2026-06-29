inherited FMCondicionesAgeCliArt: TFMCondicionesAgeCliArt
  Left = 412
  Top = 344
  HelpContext = 97
  Caption = 'Condiciones de Agentes / Clientes (Comisiones)'
  ClientHeight = 341
  ClientWidth = 590
  OldCreateOrder = True
  PopupMenu = CEFamiliaPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 317
    inherited TBMain: TLFToolBar
      Width = 586
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 1
      object PNLAgente: TLFPanel [0]
        Left = 0
        Top = 0
        Width = 438
        Height = 22
        AutoSize = True
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
          DataSource = DMCondicionesAgecliArt.DSxAgentes
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
      Top = 49
      Width = 586
      Height = 266
      ActivePage = TSArticulos
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSArticulos: TTabSheet
        Caption = 'A&rt'#237'culos'
        OnShow = TSArticulosShow
        object TBArticulos: TLFToolBar
          Left = 0
          Top = 0
          Width = 578
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
          object NavArticulos: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesAgecliArt.DSQMCondArticulos
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEComision_Art
            InsertaControl = EFArticulo
            OnClickBefore = NavArticulosClickBefore
            Exclusivo = True
            ControlEdit = CEMain
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PCArticulos: TLFPageControl
          Left = 0
          Top = 22
          Width = 578
          Height = 216
          ActivePage = TSArt_Ficha
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSArt_Ficha: TTabSheet
            Caption = '&Ficha'
            object PNLArt_Ficha: TLFPanel
              Left = 0
              Top = 0
              Width = 570
              Height = 190
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LBLArticulo: TLFLabel
                Left = 53
                Top = 72
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Art'#237'culo'
              end
              object LBLComision_Cli: TLFLabel
                Left = 48
                Top = 94
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Comisi'#243'n'
              end
              object LComisionLinealArticulos: TLFLabel
                Left = 17
                Top = 116
                Width = 73
                Height = 13
                Alignment = taRightJustify
                Caption = 'Comisi'#243'n Lineal'
              end
              object EFArticulo: TLFDBEditFind2000
                Left = 95
                Top = 68
                Width = 92
                Height = 21
                Color = clInfoBk
                DataField = 'ARTICULO'
                DataSource = DMCondicionesAgecliArt.DSQMCondArticulos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'ART_ARTICULOS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'ARTICULO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnBusqueda = EFArticuloBusqueda
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBENom_Articulo: TLFDbedit
                Left = 188
                Top = 68
                Width = 385
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMCondicionesAgecliArt.DSXArticulos
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
              object DBEComision_Art: TLFDbedit
                Left = 95
                Top = 90
                Width = 92
                Height = 21
                DataField = 'P_COMISION'
                DataSource = DMCondicionesAgecliArt.DSQMCondArticulos
                TabOrder = 1
              end
              object DBCHKActivo_Art: TLFDBCheckBox
                Left = 95
                Top = 140
                Width = 97
                Height = 17
                Caption = 'Activo'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 3
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ACTIVO'
                DataSource = DMCondicionesAgecliArt.DSQMCondArticulos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEComisionLinealArt: TLFDbedit
                Left = 95
                Top = 112
                Width = 92
                Height = 21
                DataField = 'COMISION_LINEAL'
                DataSource = DMCondicionesAgecliArt.DSQMCondArticulos
                TabOrder = 2
              end
            end
          end
          object TSArt_Tabla: TTabSheet
            Caption = '&Tabla'
            ImageIndex = 1
            OnShow = TSArt_TablaShow
            object DBGArticulos: THYTDBGrid
              Left = 0
              Top = 0
              Width = 570
              Height = 190
              Align = alClient
              Color = clInfoBk
              DataSource = DMCondicionesAgecliArt.DSQMCondArticulos
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
              OnDblClick = DBGArticulosDblClick
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
                  FieldName = 'ARTICULO'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_ARTICULO'
                  Width = 378
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'P_COMISION'
                  Width = 60
                  Visible = True
                end>
            end
          end
        end
      end
      object TSFamilias: TTabSheet
        Caption = '&Familias'
        ImageIndex = 1
        OnShow = TSFamiliasShow
        object TBFamilia: TLFToolBar
          Left = 0
          Top = 0
          Width = 578
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
          object NavFamilia: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesAgecliArt.DSQMCondFamilias
            Flat = True
            ParentShowHint = False
            PopupMenu = CEFamiliaPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEComision_Fam
            InsertaControl = EFFamilia
            OnClickBefore = NavFamiliaClickBefore
            Exclusivo = True
            ControlEdit = CEFamilia
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PCFamilia: TLFPageControl
          Left = 0
          Top = 22
          Width = 578
          Height = 216
          ActivePage = TSFam_Ficha
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSFam_Ficha: TTabSheet
            Caption = '&Ficha'
            object PNLFam_Ficha: TLFPanel
              Left = 0
              Top = 0
              Width = 570
              Height = 190
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LBLFamilia: TLFLabel
                Left = 58
                Top = 72
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Caption = 'Familia'
              end
              object LBLComision_Agrup: TLFLabel
                Left = 48
                Top = 94
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Comisi'#243'n'
              end
              object LComisionLineal: TLFLabel
                Left = 17
                Top = 116
                Width = 73
                Height = 13
                Alignment = taRightJustify
                Caption = 'Comisi'#243'n Lineal'
              end
              object EFFamilia: TLFDBEditFind2000
                Left = 95
                Top = 68
                Width = 92
                Height = 21
                Color = clInfoBk
                DataField = 'FAMILIA'
                DataSource = DMCondicionesAgecliArt.DSQMCondFamilias
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'ART_FAMILIAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'FAMILIA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnBusqueda = EFFamiliaBusqueda
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBENom_Familia: TLFDbedit
                Left = 188
                Top = 68
                Width = 385
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMCondicionesAgecliArt.DSxFamilias
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
              object DBEComision_Fam: TLFDbedit
                Left = 95
                Top = 90
                Width = 92
                Height = 21
                DataField = 'P_COMISION'
                DataSource = DMCondicionesAgecliArt.DSQMCondFamilias
                TabOrder = 1
              end
              object DBCHKActivo_Fam: TLFDBCheckBox
                Left = 95
                Top = 140
                Width = 57
                Height = 17
                Caption = 'Activo'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 3
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ACTIVO'
                DataSource = DMCondicionesAgecliArt.DSQMCondFamilias
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEComisionLinealFam: TLFDbedit
                Left = 95
                Top = 112
                Width = 92
                Height = 21
                DataField = 'COMISION_LINEAL'
                DataSource = DMCondicionesAgecliArt.DSQMCondFamilias
                TabOrder = 2
              end
            end
          end
          object TSFam_Tabla: TTabSheet
            Caption = '&Tabla'
            ImageIndex = 1
            OnShow = TSFam_TablaShow
            object DBGFamilia: THYTDBGrid
              Left = 0
              Top = 0
              Width = 570
              Height = 190
              Align = alClient
              Color = clInfoBk
              DataSource = DMCondicionesAgecliArt.DSQMCondFamilias
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
              OnDblClick = DBGFamiliaDblClick
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
                  FieldName = 'FAMILIA'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_FAMILIA'
                  Width = 378
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'P_COMISION'
                  Width = 60
                  Visible = True
                end>
            end
          end
        end
      end
    end
    object TBSecond: TLFToolBar
      Left = 2
      Top = 28
      Width = 586
      Height = 21
      AutoSize = True
      ButtonHeight = 21
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Separators = True
      object PNLCliente: TLFPanel
        Left = 0
        Top = 0
        Width = 438
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object LBLCliente: TLFLabel
          Left = 0
          Top = 0
          Width = 75
          Height = 21
          Alignment = taCenter
          AutoSize = False
          Caption = '&Cliente'
          FocusControl = EFCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFCliente: TLFEditFind2000
          Left = 75
          Top = 0
          Width = 65
          Height = 21
          TabOrder = 0
          OnChange = EFClienteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBENom_Cliente: TLFDbedit
          Left = 141
          Top = 0
          Width = 297
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMCondicionesAgecliArt.DSxClientes
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
    end
  end
  inherited TBActions: TLFToolBar
    Top = 317
    Width = 590
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEFamilia
    FichaEdicion = TSArt_Ficha
    FichaExclusiva = TSArticulos
    PanelEdicion = PNLArt_Ficha
    Left = 352
    Top = 118
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 404
    Top = 118
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
  inherited FSMain: TLFFibFormStorage
    Left = 326
    Top = 300
  end
  object CEFamilia: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSFam_Ficha
    FichaExclusiva = TSFamilias
    PanelEdicion = PNLFam_Ficha
    PopUpMenu = CEFamiliaPMEdit
    Teclas = DMMain.Teclas
    Left = 353
    Top = 169
  end
  object CEFamiliaPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 405
    Top = 173
    object CEFamiliaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEFamiliaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEFamiliaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEFamiliaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEFamiliaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEFamiliaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEFamiliaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEFamiliaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEFamiliaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEFamiliarefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
