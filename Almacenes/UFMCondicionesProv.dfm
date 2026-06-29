inherited FMCondicionesProv: TFMCondicionesProv
  Left = 457
  Top = 324
  HelpContext = 130
  Caption = 'Condiciones de Proveedores'
  ClientHeight = 341
  ClientWidth = 590
  OldCreateOrder = True
  PopupMenu = CEFamiliasPMEdit
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
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
      end
      object TSep1: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLProveedor: TLFPanel
        Left = 54
        Top = 0
        Width = 438
        Height = 22
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object LBLProveedor: TLFLabel
          Left = 0
          Top = 0
          Width = 75
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'Proveedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFProveedor: TLFEditFind2000
          Left = 75
          Top = 0
          Width = 65
          Height = 22
          AutoSize = False
          TabOrder = 0
          OnChange = EFProveedorChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PROVEEDOR'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PROVEEDOR')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBENom_Prov: TLFDbedit
          Left = 141
          Top = 0
          Width = 297
          Height = 22
          TabStop = False
          AutoSize = False
          Color = clInfoBk
          DataField = 'NOMBRE_R_SOCIAL'
          DataSource = DMCondicionesProv.DSxProveedores
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
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 586
      Height = 287
      ActivePage = TSArticulos
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSArticulos: TTabSheet
        Caption = '&Art'#237'culos'
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
            DataSource = DMCondicionesProv.DSQMCondArticulos
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEPrecio_Art
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
          Height = 237
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
              Height = 211
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LBLArticulo: TLFLabel
                Left = 40
                Top = 56
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Art'#237'culo'
              end
              object LBLPrecio: TLFLabel
                Left = 47
                Top = 78
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Precio'
              end
              object LBLDescuento_1: TLFLabel
                Left = 20
                Top = 100
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'Descuentos'
              end
              object LBLFAlta: TLFLabel
                Left = 26
                Top = 122
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Alta'
              end
              object LBLFBaja: TLFLabel
                Left = 23
                Top = 144
                Width = 54
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Baja'
              end
              object EFArticulo: TLFDBEditFind2000
                Left = 82
                Top = 52
                Width = 92
                Height = 21
                Color = clInfoBk
                DataField = 'ARTICULO'
                DataSource = DMCondicionesProv.DSQMCondArticulos
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
                Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
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
                Left = 175
                Top = 52
                Width = 380
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMCondicionesProv.DSxArticulos
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
              object DBEPrecio_Art: TLFDbedit
                Left = 82
                Top = 74
                Width = 92
                Height = 21
                DataField = 'PRECIO'
                DataSource = DMCondicionesProv.DSQMCondArticulos
                TabOrder = 1
              end
              object DBEDescuento_Art: TLFDbedit
                Left = 82
                Top = 96
                Width = 92
                Height = 21
                DataField = 'DESCUENTO_1'
                DataSource = DMCondicionesProv.DSQMCondArticulos
                TabOrder = 2
              end
              object DBDTPF_Alta_Art: TLFDBDateEdit
                Left = 82
                Top = 118
                Width = 92
                Height = 21
                DataField = 'ALTA'
                DataSource = DMCondicionesProv.DSQMCondArticulos
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 5
              end
              object DBDTPF_Baja_Art: TLFDBDateEdit
                Left = 82
                Top = 140
                Width = 92
                Height = 21
                DataField = 'BAJA'
                DataSource = DMCondicionesProv.DSQMCondArticulos
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 6
              end
              object DBCHKActivo_Art: TLFDBCheckBox
                Left = 82
                Top = 166
                Width = 56
                Height = 17
                Caption = 'Activo'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 7
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ACTIVO'
                DataSource = DMCondicionesProv.DSQMCondArticulos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCBBloqueado: TLFDBCheckBox
                Left = 149
                Top = 166
                Width = 75
                Height = 17
                Caption = 'Bloqueado'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 8
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'BLOQUEADO'
                DataSource = DMCondicionesProv.DSQMCondArticulos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEDescuento_2: TLFDbedit
                Left = 175
                Top = 96
                Width = 92
                Height = 21
                DataField = 'DESCUENTO_2'
                DataSource = DMCondicionesProv.DSQMCondArticulos
                TabOrder = 3
              end
              object DBEDescuento_3: TLFDbedit
                Left = 268
                Top = 96
                Width = 92
                Height = 21
                DataField = 'DESCUENTO_3'
                DataSource = DMCondicionesProv.DSQMCondArticulos
                TabOrder = 4
              end
            end
          end
          object TSArt_Tabla: TTabSheet
            Caption = '&Tabla'
            ImageIndex = 1
            OnShow = TSArt_TablaShow
            object HYTDBGArticulos: THYTDBGrid
              Left = 0
              Top = 0
              Width = 574
              Height = 235
              Align = alClient
              Color = clInfoBk
              DataSource = DMCondicionesProv.DSQMCondArticulos
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
              OnDblClick = HYTDBGArticulosDblClick
              OnKeyUp = HYTDBGArticulosKeyUp
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
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 398
                  Visible = True
                end>
            end
          end
        end
      end
      object TSFamilias: TTabSheet
        Caption = 'Fa&milias'
        ImageIndex = 1
        OnShow = TSFamiliasShow
        object TBFamilias: TLFToolBar
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
          object NavFamilias: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCondicionesProv.DSQMCondFamilias
            Flat = True
            ParentShowHint = False
            PopupMenu = CEFamiliasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEDescuento_Fam
            InsertaControl = EFFamilia
            OnClickBefore = NavFamiliasClickBefore
            Exclusivo = True
            ControlEdit = CEFamilias
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PCFamilias: TLFPageControl
          Left = 0
          Top = 22
          Width = 578
          Height = 237
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
              Height = 211
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LBLFamilia: TLFLabel
                Left = 44
                Top = 56
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Caption = 'Familia'
              end
              object LBLDescuentoFam: TLFLabel
                Left = 19
                Top = 78
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'Descuentos'
              end
              object LBLFAltaFam: TLFLabel
                Left = 25
                Top = 100
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Alta'
              end
              object LFechaBajaFamilia: TLFLabel
                Left = 22
                Top = 122
                Width = 54
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Baja'
              end
              object EFFamilia: TLFDBEditFind2000
                Left = 82
                Top = 52
                Width = 92
                Height = 21
                Color = clInfoBk
                DataField = 'FAMILIA'
                DataSource = DMCondicionesProv.DSQMCondFamilias
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
                Left = 175
                Top = 52
                Width = 380
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMCondicionesProv.DSxFamilias
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 8
              end
              object DBEDescuento_Fam: TLFDbedit
                Left = 82
                Top = 74
                Width = 92
                Height = 21
                DataField = 'DESCUENTO_1'
                DataSource = DMCondicionesProv.DSQMCondFamilias
                TabOrder = 1
              end
              object DBDTPF_Alta_Fam: TLFDBDateEdit
                Left = 82
                Top = 96
                Width = 92
                Height = 21
                DataField = 'ALTA'
                DataSource = DMCondicionesProv.DSQMCondFamilias
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 4
              end
              object DBDTPF_Baja_Fam: TLFDBDateEdit
                Left = 82
                Top = 118
                Width = 92
                Height = 21
                DataField = 'BAJA'
                DataSource = DMCondicionesProv.DSQMCondFamilias
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 5
              end
              object DBCHKActivo_Fam: TLFDBCheckBox
                Left = 82
                Top = 144
                Width = 62
                Height = 17
                Caption = 'Activo'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 6
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ACTIVO'
                DataSource = DMCondicionesProv.DSQMCondFamilias
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCHKBloqueado: TLFDBCheckBox
                Left = 149
                Top = 144
                Width = 73
                Height = 17
                Caption = 'Bloqueado'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 7
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'BLOQUEADO'
                DataSource = DMCondicionesProv.DSQMCondFamilias
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEDescuentoFam_2: TLFDbedit
                Left = 175
                Top = 74
                Width = 92
                Height = 21
                DataField = 'DESCUENTO_2'
                DataSource = DMCondicionesProv.DSQMCondFamilias
                TabOrder = 2
              end
              object DBEDescuentoFam_3: TLFDbedit
                Left = 268
                Top = 74
                Width = 92
                Height = 21
                DataField = 'DESCUENTO_3'
                DataSource = DMCondicionesProv.DSQMCondFamilias
                TabOrder = 3
              end
            end
          end
          object TSFam_Tabla: TTabSheet
            Caption = '&Tabla'
            ImageIndex = 1
            OnShow = TSFam_TablaShow
            object HYTDBGFamilias: THYTDBGrid
              Left = 0
              Top = 0
              Width = 574
              Height = 235
              Align = alClient
              Color = clInfoBk
              DataSource = DMCondicionesProv.DSQMCondFamilias
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
              OnDblClick = HYTDBGFamiliasDblClick
              OnKeyUp = HYTDBGFamiliasKeyUp
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
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 398
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
    Width = 590
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEFamilias
    FichaEdicion = TSArt_Ficha
    FichaExclusiva = TSArticulos
    PanelEdicion = PNLArt_Ficha
    Left = 344
    Top = 26
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 400
    Top = 24
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
    Left = 448
    Top = 72
  end
  object CEFamilias: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSFam_Ficha
    FichaExclusiva = TSFamilias
    PanelEdicion = PNLFam_Ficha
    PopUpMenu = CEFamiliasPMEdit
    Teclas = DMMain.Teclas
    Left = 345
    Top = 71
  end
  object CEFamiliasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 401
    Top = 73
    object CEFamiliasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEFamiliasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEFamiliasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEFamiliasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEFamiliasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEFamiliasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEFamiliasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEFamiliasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEFamiliasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEFamiliasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
