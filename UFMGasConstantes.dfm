object FMGasConstantes: TFMGasConstantes
  Left = 562
  Top = 182
  Width = 560
  Height = 403
  Caption = 'Configuraci'#243'n Gas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEConfigPMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 552
    Height = 25
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
      Width = 80
      Height = 22
      DataSource = DMGasConstantes.DSGasConstantes
      VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEConfigPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      ControlEdit = CEConfig
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object ToolButton1: TToolButton
      Left = 80
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TBSalir: TToolButton
      Left = 88
      Top = 0
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TBSalirClick
    end
  end
  object PCMain: TLFPanel
    Left = 0
    Top = 25
    Width = 552
    Height = 351
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object LFPCMain: TLFPageControl
      Left = 0
      Top = 0
      Width = 552
      Height = 351
      ActivePage = TSCuentaSerie
      Align = alClient
      OwnerDraw = True
      TabIndex = 1
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSGeneral: TTabSheet
        Caption = 'General'
        object PNLGeneral: TLFPanel
          Left = 0
          Top = 0
          Width = 541
          Height = 321
          Align = alCustom
          BevelOuter = bvNone
          TabOrder = 0
          object LFLArticulo: TLFLabel
            Left = 16
            Top = 36
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object LFDBEArticulo: TLFDBEditFind2000
            Left = 56
            Top = 32
            Width = 113
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMGasConstantes.DSGasConstantes
            TabOrder = 0
            OnChange = LFDBEArticuloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CampoADevolver = 'ARTICULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescripArticulo: TLFEdit
            Left = 170
            Top = 32
            Width = 292
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 1
          end
        end
      end
      object TSCuentaSerie: TTabSheet
        Caption = 'Cuenta/Serie'
        ImageIndex = 1
        object PCCuentaSeries: TLFPageControl
          Left = 0
          Top = 0
          Width = 545
          Height = 313
          ActivePage = TSSerie
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSSerie: TTabSheet
            Caption = 'Serie'
            object TBCuentaSerie: TLFToolBar
              Left = 0
              Top = 258
              Width = 537
              Height = 29
              Align = alBottom
              Caption = 'TBCuentaSerie'
              EdgeInner = esNone
              EdgeOuter = esNone
              TabOrder = 0
              Separators = True
              object NavSeries: THYMNavigator
                Left = 0
                Top = 2
                Width = 240
                Height = 22
                DataSource = DMGasConstantes.DSGasCuentaSeries
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
            end
            object PNLCuentaSerie: TLFPanel
              Left = 0
              Top = 0
              Width = 537
              Height = 258
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object LSucursal: TLFLabel
                Left = 58
                Top = 56
                Width = 41
                Height = 13
                Alignment = taRightJustify
                Caption = 'Sucursal'
              end
              object LCuentaCaja: TLFLabel
                Left = 41
                Top = 118
                Width = 58
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cuenta Caja'
              end
              object LCuentaFaltante: TLFLabel
                Left = 24
                Top = 162
                Width = 75
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cuenta Faltante'
              end
              object LCuentaSobrante: TLFLabel
                Left = 19
                Top = 140
                Width = 80
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cuenta Sobrante'
              end
              object LCuentaVenta: TLFLabel
                Left = 34
                Top = 96
                Width = 65
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cuenta Venta'
              end
              object LCuentaCostoSucursal: TLFLabel
                Left = 96
                Top = 206
                Width = 3
                Height = 13
                Alignment = taRightJustify
              end
              object LCuentaDistribucion: TLFLabel
                Left = 96
                Top = 184
                Width = 3
                Height = 13
                Alignment = taRightJustify
              end
              object LFLabel1: TLFLabel
                Left = 4
                Top = 185
                Width = 95
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cuenta Distribuidora'
              end
              object LFLabel2: TLFLabel
                Left = 10
                Top = 206
                Width = 89
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cuenta Costo Suc.'
              end
              object DBECtaCaja: TLFDBEditFind2000
                Left = 104
                Top = 114
                Width = 113
                Height = 21
                DataField = 'CUENTA_CAJA'
                DataSource = DMGasConstantes.DSGasCuentaSeries
                TabOrder = 2
                OnChange = DBECtaCajaChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                CampoADevolver = 'CUENTA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBECtaFaltante: TLFDBEditFind2000
                Left = 104
                Top = 158
                Width = 113
                Height = 21
                DataField = 'CUENTA_FALTANTE'
                DataSource = DMGasConstantes.DSGasCuentaSeries
                TabOrder = 4
                OnChange = DBECtaFaltanteChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                CampoADevolver = 'CUENTA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBECtaSobrante: TLFDBEditFind2000
                Left = 104
                Top = 136
                Width = 113
                Height = 21
                DataField = 'CUENTA_SOBRANTE'
                DataSource = DMGasConstantes.DSGasCuentaSeries
                TabOrder = 3
                OnChange = DBECtaSobranteChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                CampoADevolver = 'CUENTA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBECtaVenta: TLFDBEditFind2000
                Left = 104
                Top = 92
                Width = 113
                Height = 21
                DataField = 'CUENTA_VENTA'
                DataSource = DMGasConstantes.DSGasCuentaSeries
                TabOrder = 1
                OnChange = DBECtaVentaChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                CampoADevolver = 'CUENTA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBESerie: TLFDBEditFind2000
                Left = 104
                Top = 52
                Width = 113
                Height = 21
                DataField = 'SERIE'
                DataSource = DMGasConstantes.DSGasCuentaSeries
                TabOrder = 0
                OnChange = DBESerieChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_CANALES_SERIES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'SERIE'
                CampoStr = 'TITULO'
                CampoADevolver = 'SERIE'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'SERIE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object EDescripcionCtaCaja: TLFEdit
                Left = 218
                Top = 114
                Width = 292
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 9
              end
              object EDescripcionCtaFaltante: TLFEdit
                Left = 218
                Top = 158
                Width = 292
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 11
              end
              object EDescripcionCtaSobrante: TLFEdit
                Left = 218
                Top = 136
                Width = 292
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 10
              end
              object EDescripcionCtaVenta: TLFEdit
                Left = 218
                Top = 92
                Width = 292
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 8
              end
              object EDescripcionSerie: TLFEdit
                Left = 218
                Top = 52
                Width = 292
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 7
              end
              object DBECtaCostoSucursal: TLFDBEditFind2000
                Left = 104
                Top = 202
                Width = 113
                Height = 21
                DataField = 'CUENTA_COSTO_SUCURSAL'
                DataSource = DMGasConstantes.DSGasCuentaSeries
                TabOrder = 6
                OnChange = DBECtaCostoSucursalChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                CampoADevolver = 'CUENTA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object EDescripcionCtaCostoSucursal: TLFEdit
                Left = 218
                Top = 202
                Width = 292
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 13
              end
              object EDescripcionCtaDistribucion: TLFEdit
                Left = 218
                Top = 180
                Width = 292
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 12
              end
              object DBECtaDistribucion: TLFDBEditFind2000
                Left = 104
                Top = 180
                Width = 113
                Height = 21
                DataField = 'CUENTA_DISTRIBUCION'
                DataSource = DMGasConstantes.DSGasCuentaSeries
                TabOrder = 5
                OnChange = DBECtaDistribucionChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CUENTA'
                CampoStr = 'TITULO'
                CampoADevolver = 'CUENTA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CUENTA')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
            end
          end
          object TSTabla: TTabSheet
            Caption = 'Tabla'
            ImageIndex = 1
            object DBGSeries: THYTDBGrid
              Left = 0
              Top = 0
              Width = 537
              Height = 287
              Align = alClient
              Color = clInfoBk
              DataSource = DMGasConstantes.DSGasCuentaSeries
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
              UsaDicG2K = False
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = True
              CamposAOrdenar.Strings = (
                'CANAL'
                'CTA_ABONO_COMPRAS'
                'CTA_ABONO_VENTAS'
                'CTA_COMPRAS'
                'CTA_DEVOLUCION_COMPRAS'
                'CTA_DEVOLUCION_VENTAS'
                'CTA_VENTAS'
                'EJERCICIO'
                'EMPRESA'
                'FAMILIA'
                'SERIE')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SERIE'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CUENTA_VENTA'
                  Width = 105
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CUENTA_CAJA'
                  Width = 105
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CUENTA_FALTANTE'
                  Width = 105
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CUENTA_SOBRANTE'
                  Width = 105
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CUENTA_DISTRIBUCION'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CUENTA_COSTO_SUCURSAL'
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  object CEContadores: TControlEdit
    PopUpMenu = CEContadoresPMEdit
    Teclas = DMMain.Teclas
    Left = 432
    Top = 8
  end
  object CEContadoresPMEdit: TPopUpTeclas
    Left = 464
    Top = 8
    object CEContadoresMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEContadoresMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEContadoresMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEContadoresMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEContadoresMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEContadoresMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEContadoresMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEContadoresMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEContadoresMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEContadoresMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEConfig: TControlEdit
    DataSource = DMGasConstantes.DSGasConstantes
    PopUpMenu = CEConfigPMEdit
    Teclas = DMMain.Teclas
    Left = 436
    Top = 80
  end
  object CEConfigPMEdit: TPopUpTeclas
    Left = 468
    Top = 80
    object CEConfigMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEConfigMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEConfigMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEConfigMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEConfigMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEConfigMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEConfigMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEConfigMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEConfigMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEConfigMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
