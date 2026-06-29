inherited FMTerceros2: TFMTerceros2
  Left = 388
  Top = 109
  Width = 740
  Height = 578
  HelpContext = 35
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Terceros'
  Constraints.MinHeight = 564
  Constraints.MinWidth = 740
  FormStyle = fsNormal
  PopupMenu = CEImagenesPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 730
    Height = 525
    inherited TBMain: TLFToolBar
      Width = 726
      ButtonWidth = 26
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETipoRazon
        InsertaControl = DBETipoRazon
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object SBCli: TSpeedButton
        Left = 342
        Top = 0
        Width = 30
        Height = 22
        Hint = 'Filtrar Clientes'
        Caption = 'CLI'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = SBCliClick
      end
      object SBPro: TSpeedButton
        Left = 372
        Top = 0
        Width = 30
        Height = 22
        Hint = 'Filtrar Proveedores'
        Caption = 'PRO'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = SBProClick
      end
      object SBAcr: TSpeedButton
        Left = 402
        Top = 0
        Width = 30
        Height = 22
        Hint = 'Filtrar Acreedores'
        Caption = 'ACR'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = SBAcrClick
      end
      object SBAge: TSpeedButton
        Left = 432
        Top = 0
        Width = 31
        Height = 22
        Hint = 'Filtrar Agentes'
        Caption = 'AGE'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = SBAgeClick
      end
      object SBPot: TSpeedButton
        Left = 463
        Top = 0
        Width = 30
        Height = 22
        Hint = 'Filtrar Clientes Potenciales'
        Caption = 'POT'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = SBPotClick
      end
      object SBEmpleado: TSpeedButton
        Left = 493
        Top = 0
        Width = 30
        Height = 22
        Hint = 'Filtrar Empleado'
        Caption = 'EMP'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = SBEmpleadoClick
      end
      object SBCrm: TSpeedButton
        Left = 523
        Top = 0
        Width = 30
        Height = 22
        Hint = 'Filtrar Contactos CRM'
        Caption = 'CRM'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = SBCrmClick
      end
      object TBSep2: TToolButton
        Left = 553
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLBusqueda: TLFPanel
        Left = 561
        Top = 0
        Width = 82
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LNombreCom_Soc: TLFLabel
          Left = 0
          Top = 0
          Width = 32
          Height = 20
          Alignment = taCenter
          AutoSize = False
          Caption = 'Com'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          OnClick = LNombreCom_SocClick
        end
        object EFTercero: TLFEditFind2000
          Left = 33
          Top = 0
          Width = 48
          Height = 21
          TabOrder = 0
          OnChange = EFTerceroChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TELEFONO01'
            'NIF')
          CampoNum = 'TERCERO'
          CampoStr = 'NOMBRE_COMERCIAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_TERCEROS_EDICION'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'tercero')
          Filtros = []
        end
      end
      object TBSepEmpresasChile: TToolButton
        Left = 643
        Top = 0
        Width = 8
        ImageIndex = 0
        Style = tbsSeparator
      end
      object TBEmpresasChile: TToolButton
        Left = 651
        Top = 0
        Action = AEmpresasChile
      end
    end
    inherited PCMain: TLFPageControl
      Width = 726
      Height = 495
      ActivePage = TSImagenes
      TabIndex = 5
      OnChange = PCMainChange
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        PopupMenu = CEMainPMEdit
        object SBADireccion2: TSpeedButton [0]
          Left = 83
          Top = 146
          Width = 410
          Height = 22
          GroupIndex = -1
          OnDblClick = SBADireccion2DblClick
        end
        object SBAEmail: TSpeedButton [1]
          Left = 10
          Top = 245
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAEmailDblClick
        end
        object SBADireccion: TSpeedButton [2]
          Left = 83
          Top = 146
          Width = 410
          Height = 22
          GroupIndex = -1
          OnDblClick = SBADireccionDblClick
        end
        object SBAWeb: TSpeedButton [3]
          Left = 10
          Top = 267
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAWebDblClick
        end
        inherited PEdit: TLFPanel
          Width = 718
          Height = 439
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'NOMBRE_R_SOCIAL'
              'TELEFONO01'
              'NIF')
            Tabla_a_buscar = 'VER_TERCEROS_EDICION'
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_COMERCIAL'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'tercero')
          end
          object LTercero: TLFLabel
            Left = 68
            Top = 18
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
            FocusControl = DBETercero
          end
          object LNombre: TLFLabel
            Left = 42
            Top = 62
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Raz'#243'n Social'
            FocusControl = DBENombre
          end
          object LDireccion2: TLFLabel
            Left = 60
            Top = 130
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object LLocalidad: TLFLabel
            Left = 59
            Top = 193
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Localidad'
          end
          object LTelefonos: TLFLabel
            Left = 58
            Top = 259
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tel'#233'fonos'
            FocusControl = DBETelefono1
          end
          object LEmail: TLFLabel
            Left = 78
            Top = 281
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'e-mail'
            FocusControl = DBEEmail
          end
          object LWeb: TLFLabel
            Left = 82
            Top = 303
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Web'
            FocusControl = DBEWeb
          end
          object LProvincia: TLFLabel
            Left = 61
            Top = 215
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Provincia'
          end
          object LFax: TLFLabel
            Left = 363
            Top = 259
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fax'
            FocusControl = DBETelefono1
          end
          object LNumero: TLFLabel
            Left = 329
            Top = 151
            Width = 44
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'N'#250'm.'
          end
          object LBLoqueEscalera: TLFLabel
            Left = 374
            Top = 151
            Width = 51
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bloq./Esc.'
          end
          object LPiso: TLFLabel
            Left = 426
            Top = 151
            Width = 34
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Piso'
          end
          object LFechaAlta: TLFLabel
            Left = 555
            Top = 40
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Alta'
            FocusControl = DBEWeb
          end
          object DBT_TipDir_T: TDBText
            Left = 140
            Top = 151
            Width = 188
            Height = 13
            Color = clBtnFace
            DataField = 'TITULO'
            DataSource = DMTerceros2.DSxTipDir_T
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object LPuerta: TLFLabel
            Left = 461
            Top = 151
            Width = 44
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Puerta'
          end
          object LNombreComercial: TLFLabel
            Left = 45
            Top = 40
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'N. Comercial'
            FocusControl = DBENombre
          end
          object LBLRazonSocial: TLFLabel
            Left = 204
            Top = 17
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Raz'#243'n Social'
            FocusControl = DBETercero
          end
          object LEAN13: TLFLabel
            Left = 509
            Top = 84
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'EAN 13'
            FocusControl = DBEEAN13
          end
          object LColonia: TLFLabel
            Left = 70
            Top = 237
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Colonia'
            FocusControl = DBEColonia
          end
          object LFechaNacimiento: TLFLabel
            Left = 520
            Top = 62
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Nacimiento'
          end
          object LCarnetAplicador: TLFLabel
            Left = 27
            Top = 347
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Carnet Aplicador'
            FocusControl = DBECarnetAplicador
          end
          object LRegistroMercantil: TLFLabel
            Left = 20
            Top = 325
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'Registro Mercantil'
            FocusControl = DBERegistroMercantil
          end
          object LFechaValidezCarnet: TLFLabel
            Left = 514
            Top = 347
            Width = 92
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Validez Carnet'
          end
          object LTipoDocumento: TLFLabel
            Left = 50
            Top = 84
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Documento'
          end
          object SBNuevaLocalidadFicha: TSpeedButton
            Left = 54
            Top = 189
            Width = 56
            Height = 21
            Hint = 'Crea una nueva localidad'
            Caption = 'Nueva'
            ParentShowHint = False
            ShowHint = True
            Visible = False
            OnClick = SBNuevaLocalidadFichaClick
          end
          object LDBLCComoNosConocieron: TLFLabel
            Left = -1
            Top = 368
            Width = 106
            Height = 13
            Alignment = taRightJustify
            Caption = 'Como Nos Conocieron'
            FocusControl = DBECarnetAplicador
          end
          object DBTValidacionResultado: TDBText
            Left = 110
            Top = 102
            Width = 331
            Height = 12
            DataField = 'RESULTADO'
            DataSource = DMTerceros2.DSxValidacionDoc
            ParentShowHint = False
            ShowHint = True
          end
          object DBTValidacionNombre: TDBText
            Left = 110
            Top = 114
            Width = 395
            Height = 12
            DataField = 'RESULTADO_NOMBRE'
            DataSource = DMTerceros2.DSxValidacionDoc
            ParentShowHint = False
            ShowHint = True
          end
          object DBTValidacionFechaCombrobacion: TDBText
            Left = 440
            Top = 102
            Width = 65
            Height = 12
            DataField = 'FECHA_COMPROBACION'
            DataSource = DMTerceros2.DSxValidacionDoc
          end
          object LValidacionDocumento: TLFLabel
            Left = 56
            Top = 101
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Validacion'
          end
          object DBETercero: TLFDbedit
            Left = 110
            Top = 14
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TERCERO'
            DataSource = DMTerceros2.DSQMTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = DBETerceroChange
          end
          object DBENombre: TLFDbedit
            Left = 110
            Top = 58
            Width = 395
            Height = 21
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 4
            OnExit = DBENombreExit
          end
          object DBECif: TLFDbedit
            Left = 374
            Top = 80
            Width = 131
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NIF'
            DataSource = DMTerceros2.DSQMTerceros
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnChange = DBECifChange
            OnExit = DBECifExit
          end
          object DBETelefono1: TLFDbedit
            Left = 110
            Top = 255
            Width = 121
            Height = 21
            DataField = 'TELEFONO01'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 22
          end
          object DBETelefono2: TLFDbedit
            Left = 232
            Top = 255
            Width = 121
            Height = 21
            DataField = 'TELEFONO02'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 23
          end
          object DBETelefax: TLFDbedit
            Left = 384
            Top = 255
            Width = 121
            Height = 21
            DataField = 'TELEFAX'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 24
          end
          object DBEEmail: TLFDbedit
            Left = 110
            Top = 277
            Width = 395
            Height = 21
            DataField = 'EMAIL'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 25
          end
          object DBEWeb: TLFDbedit
            Left = 110
            Top = 299
            Width = 395
            Height = 21
            DataField = 'WEB'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 26
          end
          object DBELocalidadNombre: TLFDbedit
            Left = 188
            Top = 189
            Width = 185
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMTerceros2.DSxLoc_T
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
          end
          object DBECpostal: TLFDbedit
            Left = 374
            Top = 189
            Width = 131
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CODPOSTAL'
            DataSource = DMTerceros2.DSxLoc_T
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
          end
          object DBEProvincia: TLFDbedit
            Left = 110
            Top = 211
            Width = 149
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'PROVINCIA'
            DataSource = DMTerceros2.DSxLoc_T
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
          end
          object DBEPais: TLFDbedit
            Left = 260
            Top = 211
            Width = 245
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'PAIS'
            DataSource = DMTerceros2.DSxLoc_T
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 20
          end
          object EFLocalidad: TLFDBEditFind2000
            Left = 110
            Top = 189
            Width = 77
            Height = 21
            DataField = 'DIR_LOCALIDAD'
            DataSource = DMTerceros2.DSQMTerceros
            ParentShowHint = False
            PopupMenu = CEContactosPMEdit
            ShowHint = False
            TabOrder = 16
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_LOCALIDADES'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'provincia'
              'c_pais')
            CampoNum = 'CODPOSTAL'
            CampoStr = 'TITULO'
            CampoADevolver = 'LOCALIDAD'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = EFLocalidadBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBE_TitRazones: TLFDbedit
            Left = 354
            Top = 14
            Width = 151
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMTerceros2.DSxRazones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEDirNombre: TLFDbedit
            Left = 140
            Top = 167
            Width = 188
            Height = 21
            DataField = 'DIR_NOMBRE'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 11
          end
          object DBEDirBloqEsc: TLFDbedit
            Left = 374
            Top = 167
            Width = 51
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIR_BLOQUE_ESCALERA'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 13
          end
          object DBEDirPiso: TLFDbedit
            Left = 426
            Top = 167
            Width = 34
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIR_PISO'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 14
          end
          object DBEDirNumero: TLFDbedit
            Left = 329
            Top = 167
            Width = 44
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIR_NUMERO'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 12
          end
          object DBEInfoAlta: TLFDbedit
            Left = 610
            Top = 36
            Width = 95
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FECHA_ALTA'
            DataSource = DMTerceros2.DSQMTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 31
          end
          object DBETipoDir: TLFDBEditFind2000
            Left = 110
            Top = 167
            Width = 29
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIR_TIPO'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 10
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_DIRECCION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CampoADevolver = 'TIPO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEDirPuerta: TLFDbedit
            Left = 461
            Top = 167
            Width = 44
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIR_PUERTA'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 15
          end
          object DBEDireccion2: TLFDbedit
            Left = 110
            Top = 126
            Width = 395
            Height = 21
            DataField = 'DIR_NOMBRE_2'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 9
          end
          object DBENombreComercial: TLFDbedit
            Left = 110
            Top = 36
            Width = 395
            Height = 21
            DataField = 'NOMBRE_COMERCIAL'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 3
            OnExit = DBENombreExit
          end
          object DBETipoRazon: TLFDBEditFind2000
            Left = 296
            Top = 14
            Width = 57
            Height = 21
            DataField = 'TIPO_RAZON'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS_RAZONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RAZON'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBCBCLientePotencialKRI: TLFDBCheckBox
            Left = 546
            Top = 16
            Width = 169
            Height = 17
            Caption = '&Cliente Potencial No Prioritario'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 30
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CLIENTE_POTENCIAL'
            DataSource = DMTerceros2.DSQMTerceros
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEEAN13: TLFDbedit
            Left = 551
            Top = 80
            Width = 154
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO_EDI'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 33
          end
          object DBEColonia: TLFDbedit
            Left = 110
            Top = 233
            Width = 395
            Height = 21
            DataField = 'COLONIA'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 21
          end
          object DBEFechaNacimiento: TLFDBDateEdit
            Left = 610
            Top = 58
            Width = 95
            Height = 21
            DataField = 'FECHA_NACIMIENTO'
            DataSource = DMTerceros2.DSQMTerceros
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 32
          end
          object DBECarnetAplicador: TLFDbedit
            Left = 110
            Top = 343
            Width = 395
            Height = 21
            DataField = 'CARNET_APLICADOR'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 28
          end
          object DBERegistroMercantil: TLFDbedit
            Left = 110
            Top = 321
            Width = 395
            Height = 21
            DataField = 'REGISTRO_MERCANTIL'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 27
          end
          object DBDTPFechaValidezCarnet: TLFDBDateEdit
            Left = 610
            Top = 343
            Width = 95
            Height = 21
            DataField = 'FECHA_VALIDEZ_CARNET_APLICADOR'
            DataSource = DMTerceros2.DSQMTerceros
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 34
          end
          object DBETipoDocumento: TLFDBEditFind2000
            Left = 158
            Top = 80
            Width = 47
            Height = 21
            DataField = 'TIPO_DOC_IDENT'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 6
            OnChange = DBETipoDocumentoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_DOC_IDENT_PAIS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO_DOC_IDENT'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBETipoDocumentoBusqueda
            Filtros = []
          end
          object ETipoDocumentoTitulo: TLFEdit
            Left = 206
            Top = 80
            Width = 167
            Height = 21
            TabStop = False
            Color = clInfoBk
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
          object DBEPaisTercero: TLFDBEditFind2000
            Left = 110
            Top = 80
            Width = 47
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PAIS_TERCERO'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 5
            OnChange = DBEPaisTerceroChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PAISES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PAIS'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBLCComoNosConocieron: TRxDBLookupCombo
            Left = 110
            Top = 365
            Width = 395
            Height = 21
            DropDownCount = 12
            DataField = 'COMO_NOS_CONOCIERON'
            DataSource = DMTerceros2.DSQMTerceros
            LookupField = 'MODO'
            LookupDisplay = 'TITULO'
            LookupSource = DMTerceros2.DSQMComoNosConocieron
            TabOrder = 29
          end
        end
        object PNLCreacionAutomaticaMaestros: TLFPanel
          Left = 0
          Top = 439
          Width = 718
          Height = 28
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object LBCreacionAutomatica: TLFLabel
            Left = 52
            Top = 7
            Width = 283
            Height = 13
            Alignment = taRightJustify
            Caption = 'Creaci'#243'n Autom'#225'tica con los siguientes Maestros:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object PBtnMaestros: TLFPanel
            Left = 338
            Top = 0
            Width = 226
            Height = 28
            BevelOuter = bvNone
            TabOrder = 0
            object FBHaciaCliente: TFlatButton
              Left = 0
              Top = 3
              Width = 30
              Height = 22
              ColorFocused = clBtnFace
              ColorDown = clBtnFace
              ColorBorder = clWhite
              ColorShadow = clWhite
              Caption = 'CLI'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = AClienteExecute
            end
            object FBHaciaProveedor: TFlatButton
              Left = 32
              Top = 3
              Width = 30
              Height = 22
              ColorFocused = clBtnFace
              ColorDown = clBtnFace
              ColorBorder = clWhite
              ColorShadow = clWhite
              Caption = 'PRO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = AProveedorExecute
            end
            object FBHaciaAcreedor: TFlatButton
              Left = 64
              Top = 3
              Width = 30
              Height = 22
              ColorFocused = clBtnFace
              ColorDown = clBtnFace
              ColorBorder = clWhite
              ColorShadow = clWhite
              Caption = 'ACR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = AAcreedorExecute
            end
            object FBHaciaAgente: TFlatButton
              Left = 96
              Top = 3
              Width = 30
              Height = 22
              ColorFocused = clBtnFace
              ColorDown = clBtnFace
              ColorBorder = clWhite
              ColorShadow = clWhite
              Caption = 'AGE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              OnClick = AAgenteExecute
            end
            object FBHaciaClientePotencial: TFlatButton
              Left = 128
              Top = 3
              Width = 30
              Height = 22
              ColorFocused = clBtnFace
              ColorDown = clBtnFace
              ColorBorder = clWhite
              ColorShadow = clWhite
              Caption = 'POT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              OnClick = FBHaciaClientePotencialClick
            end
            object FBHaciaCRM: TFlatButton
              Left = 160
              Top = 3
              Width = 30
              Height = 22
              ColorFocused = clBtnFace
              ColorDown = clBtnFace
              ColorBorder = clWhite
              ColorShadow = clWhite
              Caption = 'CRM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              OnClick = FBHaciaCRMClick
            end
            object FBHaciaEmpleado: TFlatButton
              Left = 192
              Top = 3
              Width = 30
              Height = 22
              ColorFocused = clBtnFace
              ColorDown = clBtnFace
              ColorBorder = clWhite
              ColorShadow = clWhite
              Caption = 'EMP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
              OnClick = FBHaciaEmpleadoClick
            end
          end
        end
      end
      object TSDireccion: TTabSheet [1]
        Caption = '&Direcciones'
        ImageIndex = 2
        OnShow = TSDireccionesShow
        object P_Info_Cb: TLFPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LDireccionesTercero: TLFLabel
            Left = 7
            Top = 4
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object DBE_U_InfoCod: TLFDbedit
            Left = 48
            Top = 0
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TERCERO'
            DataSource = DMTerceros2.DSQMTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = DBEFBancoDireccionChange
          end
          object DBE_U_InfoTit: TLFDbedit
            Left = 113
            Top = 0
            Width = 340
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMTerceros2.DSQMTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object PCDirecciones: TLFPageControl
          Left = 0
          Top = 22
          Width = 718
          Height = 423
          ActivePage = TSDi_Ficha
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSDi_Ficha: TTabSheet
            Caption = 'F&icha'
            OnShow = TSDireccionesShow
            object PEditDirecciones: TLFPanel
              Left = 0
              Top = 0
              Width = 710
              Height = 397
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              DesignSize = (
                710
                397)
              object Lbl_Tipo: TLFLabel
                Left = 54
                Top = 93
                Width = 21
                Height = 13
                Caption = 'Tipo'
              end
              object Lbl_Num: TLFLabel
                Left = 299
                Top = 118
                Width = 61
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'N'#250'm.'
              end
              object Lbl_Blq: TLFLabel
                Left = 361
                Top = 118
                Width = 62
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Bloq./Esc.'
              end
              object Lbl_Piso: TLFLabel
                Left = 424
                Top = 96
                Width = 30
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Piso'
              end
              object LDireccionesLocalidad: TLFLabel
                Left = 56
                Top = 160
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'Localidad'
              end
              object LDireccionesProvincia: TLFLabel
                Left = 58
                Top = 182
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Provincia'
              end
              object LDireccionesDireccion: TLFLabel
                Left = 57
                Top = 8
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Direcci'#243'n'
              end
              object DBT_TipDir_D: TDBText
                Left = 106
                Top = 118
                Width = 70
                Height = 13
                AutoSize = True
                Color = clBtnFace
                DataField = 'TITULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Puertas: TLFLabel
                Left = 455
                Top = 98
                Width = 46
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Puerta'
              end
              object LDireccionesDireccion2: TLFLabel
                Left = 56
                Top = 75
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cabecera'
              end
              object LDireccionesTelefonos: TLFLabel
                Left = 55
                Top = 226
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tel'#233'fonos'
                FocusControl = DBETel01
              end
              object LDireccionesFAX: TLFLabel
                Left = 358
                Top = 228
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fax'
                FocusControl = DBETel01
              end
              object LClaseDireccion: TLFLabel
                Left = 248
                Top = 8
                Width = 26
                Height = 13
                Alignment = taRightJustify
                Caption = 'Clase'
              end
              object LNotasKri: TLFLabel
                Left = 506
                Top = 8
                Width = 28
                Height = 13
                Alignment = taRightJustify
                Caption = 'Notas'
              end
              object LDireccionesEAN13: TLFLabel
                Left = 64
                Top = 52
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'EAN 13'
                FocusControl = DBECodigoEdiDireccion
              end
              object LTransportista: TLFLabel
                Left = 41
                Top = 248
                Width = 61
                Height = 13
                Alignment = taRightJustify
                Caption = 'Transportista'
              end
              object LDireccionesColonia: TLFLabel
                Left = 66
                Top = 204
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Colonia'
                FocusControl = DBEDireccionesColonia
              end
              object LIdForceManagerDrieccion: TLFLabel
                Left = 20
                Top = 270
                Width = 81
                Height = 13
                Alignment = taRightJustify
                Caption = 'Id ForceManager'
                FocusControl = DBEIdForceManagerDrieccion
              end
              object LBancoDireccion: TLFLabel
                Left = 71
                Top = 292
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Banco'
              end
              object SBNuevaLocalidadDireccion: TSpeedButton
                Left = 49
                Top = 156
                Width = 56
                Height = 21
                Hint = 'Crea una nueva localidad'
                Caption = 'Nueva'
                ParentShowHint = False
                ShowHint = True
                Visible = False
                OnClick = SBNuevaLocalidadDireccionClick
              end
              object LHorario: TLFLabel
                Left = 67
                Top = 313
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Horario'
                FocusControl = DBEHorario
              end
              object LMedios: TLFLabel
                Left = 67
                Top = 335
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Medios'
                FocusControl = DBEMedios
              end
              object LDirCorreo: TLFLabel
                Left = 72
                Top = 357
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Correo'
                FocusControl = DBEDirCorreo
              end
              object LDirContacto: TLFLabel
                Left = 60
                Top = 379
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Contacto'
                FocusControl = DBEDirContacto
              end
              object DBE_D_Calle: TLFDbedit
                Left = 106
                Top = 134
                Width = 192
                Height = 21
                DataField = 'DIR_NOMBRE'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 9
              end
              object DBE_D_Num: TLFDbedit
                Left = 299
                Top = 134
                Width = 61
                Height = 21
                DataField = 'DIR_NUMERO'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 10
              end
              object DBE_D_BloqEsc: TLFDbedit
                Left = 361
                Top = 134
                Width = 62
                Height = 21
                DataField = 'DIR_BLOQUE_ESCALERA'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 11
              end
              object DBE_D_Piso: TLFDbedit
                Left = 424
                Top = 134
                Width = 30
                Height = 21
                DataField = 'DIR_PISO'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 12
              end
              object DBE_D_TituloLocalidad: TLFDbedit
                Left = 186
                Top = 156
                Width = 174
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMTerceros2.DSxLoc_D
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 15
              end
              object DBE_D_CPLocalidad: TLFDbedit
                Left = 361
                Top = 156
                Width = 140
                Height = 21
                Color = clInfoBk
                DataField = 'CODPOSTAL'
                DataSource = DMTerceros2.DSxLoc_D
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 16
              end
              object DBE_D_Pais: TLFDbedit
                Left = 256
                Top = 178
                Width = 245
                Height = 21
                Color = clInfoBk
                DataField = 'PAIS'
                DataSource = DMTerceros2.DSxLoc_D
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 18
              end
              object DBE_D_Provincia: TLFDbedit
                Left = 106
                Top = 178
                Width = 149
                Height = 21
                Color = clInfoBk
                DataField = 'PROVINCIA'
                DataSource = DMTerceros2.DSxLoc_D
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 17
              end
              object DBE_D_Direccion: TLFDbedit
                Left = 106
                Top = 5
                Width = 64
                Height = 21
                Color = clInfoBk
                DataField = 'DIRECCION'
                DataSource = DMTerceros2.DSQMDirecciones
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBE_D_CodLocalidad: TLFDBEditFind2000
                Left = 106
                Top = 156
                Width = 79
                Height = 21
                DataField = 'DIR_LOCALIDAD'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 14
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_LOCALIDADES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO_POSTAL'
                CampoStr = 'TITULO'
                CampoADevolver = 'LOCALIDAD'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                Filtros = []
              end
              object DBE_D_Tipo: TLFDBEditFind2000
                Left = 55
                Top = 134
                Width = 50
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DIR_TIPO'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 8
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_TIPO_DIRECCION'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'TIPO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                Filtros = []
              end
              object DBE_D_Puerta: TLFDbedit
                Left = 455
                Top = 134
                Width = 46
                Height = 21
                DataField = 'DIR_PUERTA'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 13
              end
              object DBE_D_Direccion2: TLFDbedit
                Left = 106
                Top = 71
                Width = 395
                Height = 21
                DataField = 'DIR_NOMBRE_2'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 6
              end
              object DBETel01: TLFDbedit
                Left = 106
                Top = 222
                Width = 121
                Height = 21
                DataField = 'DIR_TELEFONO01'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 20
              end
              object DBETel02: TLFDbedit
                Left = 228
                Top = 222
                Width = 121
                Height = 21
                DataField = 'DIR_TELEFONO02'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 21
              end
              object DBEFax: TLFDbedit
                Left = 380
                Top = 224
                Width = 121
                Height = 21
                DataField = 'DIR_TELEFAX'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 22
              end
              object DBEFClaseDireccion: TLFDBEditFind2000
                Left = 278
                Top = 5
                Width = 49
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DIR_CLASE'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 1
                OnChange = DBEFClaseDireccionChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_CLASE_DIRECCION'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CLASE'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CLASE')
                Filtros = []
              end
              object DBNotasDireccionKri: TLFDBMemo
                Left = 504
                Top = 27
                Width = 205
                Height = 278
                Anchors = [akLeft, akTop, akRight]
                DataField = 'NOTAS'
                DataSource = DMTerceros2.DSQMDirecciones
                ScrollBars = ssVertical
                TabOrder = 33
              end
              object DBECodigoEdiDireccion: TLFDbedit
                Left = 106
                Top = 49
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CODIGO_EDI'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 5
              end
              object DBCBDefecto: TLFDBCheckBox
                Left = 106
                Top = 30
                Width = 87
                Height = 17
                Hint = 'Es la direcci'#243'n por defecto'
                Caption = 'Principal'
                ClicksDisabled = False
                Color = clBtnFace
                ColorCheck = 57088
                Enabled = False
                ParentColor = False
                ShowHint = True
                TabOrder = 3
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'DIR_DEFECTO'
                DataSource = DMTerceros2.DSQMDirecciones
                ParentShowHint = False
                ReadOnly = True
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEFTransportista: TLFDBEditFind2000
                Left = 106
                Top = 244
                Width = 55
                Height = 21
                DataField = 'DIR_TRANSPORTISTA'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 23
                OnChange = DBEFTransportistaChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_TRANSPORTISTAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'TRANSPORTISTA'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = True
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'TRANSPORTISTA')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object ETransportista: TLFEdit
                Left = 162
                Top = 244
                Width = 339
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 24
              end
              object DBEDireccionesColonia: TLFDbedit
                Left = 106
                Top = 200
                Width = 395
                Height = 21
                DataField = 'COLONIA'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 19
              end
              object DBE_D_Direccion3: TLFDbedit
                Left = 106
                Top = 93
                Width = 395
                Height = 21
                DataField = 'DIR_NOMBRE_3'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 7
              end
              object DBCBDirActiva: TLFDBCheckBox
                Left = 278
                Top = 30
                Width = 109
                Height = 17
                Hint = 'Esta la direcci'#243'n esta activa'
                Caption = 'Direcci'#243'n activa'
                AllowGrayed = True
                ClicksDisabled = False
                Color = clBtnFace
                ColorCheck = 57088
                ParentColor = False
                ShowHint = True
                TabOrder = 4
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ACTIVO'
                DataSource = DMTerceros2.DSQMDirecciones
                ParentShowHint = False
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEIdForceManagerDrieccion: TLFDbedit
                Left = 106
                Top = 266
                Width = 121
                Height = 21
                DataField = 'ID_FORCEMANAGER'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 26
              end
              object EClaseDireccion: TLFEdit
                Left = 328
                Top = 5
                Width = 173
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 2
              end
              object DBEFBancoDireccion: TLFDBEditFind2000
                Left = 106
                Top = 288
                Width = 55
                Height = 21
                DataField = 'BANCO'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 27
                OnChange = DBEFBancoDireccionChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_TERCEROS_BANCOS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'BANCO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = True
                SalirSiVacio = True
                OnBusqueda = DBEFBancoDireccionBusqueda
                OrdenadoPor.Strings = (
                  'BANCO')
                Filtros = []
                Entorno = DMMain.EntornoBusqueda
              end
              object EBancoDireccion: TLFEdit
                Left = 162
                Top = 288
                Width = 339
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 28
              end
              object TButtTransportistaSegunCP: TButton
                Left = 476
                Top = 246
                Width = 23
                Height = 18
                Hint = 'Selecciona transportista segun codigo postal'
                Caption = '...'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 25
                Visible = False
                OnClick = TButtTransportistaSegunCPClick
              end
              object DBEHorario: TLFDbedit
                Left = 106
                Top = 310
                Width = 603
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'HORARIO'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 29
              end
              object DBEMedios: TLFDbedit
                Left = 106
                Top = 332
                Width = 603
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'MEDIOS'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 30
              end
              object DBEDirCorreo: TLFDbedit
                Left = 106
                Top = 354
                Width = 603
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'DIR_CORREO'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 31
              end
              object DBEDirContacto: TLFDbedit
                Left = 106
                Top = 376
                Width = 603
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'DIR_CONTACTO'
                DataSource = DMTerceros2.DSQMDirecciones
                TabOrder = 32
              end
            end
          end
          object TSDi_Tabla: TTabSheet
            Caption = 'T&abla'
            ImageIndex = 1
            OnShow = TSDi_TablaShow
            object DBG_Direcciones: THYTDBGrid
              Left = 0
              Top = 0
              Width = 710
              Height = 383
              Align = alClient
              Color = clInfoBk
              DataSource = DMTerceros2.DSQMDirecciones
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
              IniStorage = FSMain
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = False
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              TabFicha = TSDi_Ficha
              PermutaPaneles = True
              CamposAMarcar.Strings = (
                'ACTIVO'
                'DIR_DEFECTO')
              CamposChecked.Strings = (
                '1'
                '1')
              CamposNoChecked.Strings = (
                '0'
                '0')
              CamposAOrdenar.Strings = (
                'ACTIVO'
                'CODIGO_EDI'
                'COLONIA'
                'DIR_CLASE'
                'DIR_COMPLETA'
                'DIR_COMPLETA_N'
                'DIR_DEFECTO'
                'DIR_LOCALIDAD'
                'DIR_NOMBRE'
                'DIR_NOMBRE_2'
                'DIR_NOMBRE_3'
                'DIR_NUMERO'
                'DIR_PISO'
                'DIR_PUERTA'
                'DIR_TELEFAX'
                'DIR_TELEFONO01'
                'DIR_TELEFONO02'
                'DIR_TIPO'
                'DIR_TRANSPORTISTA'
                'DIRECCION'
                'ID_FORCEMANAGER'
                'PAIS_DIRECCION')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'DIRECCION'
                  Width = 43
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIR_NOMBRE'
                  Width = 229
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIR_NUMERO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIR_BLOQUE_ESCALERA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIR_PISO'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIR_LOCALIDAD'
                  Width = 56
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIT_PROVINCIA_LOC'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIT_LOCALIDAD'
                  Width = 150
                  Visible = True
                end>
            end
          end
        end
        object TBDirecciones: TLFToolBar
          Left = 0
          Top = 445
          Width = 718
          Height = 22
          Align = alBottom
          AutoSize = True
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Separators = True
          object NavDirecciones: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMTerceros2.DSQMDirecciones
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDireccionesPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEFClaseDireccion
            InsertaControl = DBE_D_Direccion
            OnClickBefore = NavDireccionesClickBefore
            Exclusivo = True
            ControlEdit = CEDirecciones
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavDireccionesClickAfterAdjust
          end
          object LFiltraDireccionKri: TLFLabel
            Left = 220
            Top = 0
            Width = 95
            Height = 22
            Alignment = taRightJustify
            Caption = ' Filtra Direccion '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFDireccionTerceroKri: TLFEditFind2000
            Left = 315
            Top = 0
            Width = 50
            Height = 22
            TabOrder = 1
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO_LOCALIDAD')
            CampoNum = 'DIRECCION'
            CampoStr = 'DIR_COMPLETA'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_TERCEROS_DIRECCION_TODAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFDireccionTerceroKriBusqueda
            OnExiste = EFDireccionTerceroKriExiste
            OrdenadoPor.Strings = (
              'DIRECCION')
            Filtros = []
          end
          object ToolButton4: TToolButton
            Left = 365
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object SBFiltraContactos: TSpeedButton
            Left = 373
            Top = 0
            Width = 76
            Height = 22
            Hint = 'Filtrar Clientes'
            Caption = 'Contacto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            OnClick = SBFiltraContactosClick
          end
          object SBIncidenciasKri: TSpeedButton
            Left = 449
            Top = 0
            Width = 74
            Height = 22
            Hint = 'Filtra las incidencias de este tercero y esta direcci'#243'n'
            Caption = 'Incidencias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            OnClick = SBIncidenciasKriClick
          end
        end
      end
      object TSNotas: TTabSheet [2]
        Caption = '&Notas'
        ImageIndex = 3
        OnShow = TSNotasShow
        object TBInfo: TLFToolBar
          Left = 0
          Top = 0
          Width = 718
          Height = 22
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object P_I_Info: TLFPanel
            Left = 0
            Top = 0
            Width = 452
            Height = 21
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object LNotasTercero: TLFLabel
              Left = 7
              Top = 4
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tercero'
            end
            object DBE_I_cod: TLFDbedit
              Left = 48
              Top = 0
              Width = 64
              Height = 21
              Color = clInfoBk
              DataField = 'TERCERO'
              DataSource = DMTerceros2.DSQMTerceros
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBE_I_Nom: TLFDbedit
              Left = 113
              Top = 0
              Width = 340
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMTerceros2.DSQMTerceros
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton2: TToolButton
            Left = 452
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavInfo: THYMNavigator
            Left = 460
            Top = 0
            Width = 84
            Height = 22
            DataSource = DMTerceros2.DSQMTerceros
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEInfoPMEdit
            ShowHint = True
            TabOrder = 0
            BeforeAction = NavInfoBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMINfo
            InsertaControl = DBMINfo
            Exclusivo = False
            ControlEdit = CEInfo
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavInfoClickAfterAdjust
          end
          object ToolButton5: TToolButton
            Left = 544
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtImprimirNotas: TToolButton
            Left = 552
            Top = 0
            Action = AImprimirNotas
          end
        end
        object PEditInfo: TLFPanel
          Left = 0
          Top = 22
          Width = 718
          Height = 445
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMINfo: TLFDBMemo
            Left = 0
            Top = 0
            Width = 718
            Height = 445
            Align = alClient
            BevelInner = bvNone
            DataField = 'NOTAS'
            DataSource = DMTerceros2.DSQMTerceros
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object TSContactos: TTabSheet [3]
        Caption = '&Contactos'
        ParentShowHint = False
        ShowHint = False
        OnShow = TSContactosShow
        object P_Info_con: TLFPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LContactoTercero: TLFLabel
            Left = 7
            Top = 4
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object DBE_C_InfoCod: TLFDbedit
            Left = 48
            Top = 0
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TERCERO'
            DataSource = DMTerceros2.DSQMTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBE_C_InfoTit: TLFDbedit
            Left = 113
            Top = 0
            Width = 340
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMTerceros2.DSQMTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object PCContactos: TLFPageControl
          Left = 0
          Top = 22
          Width = 718
          Height = 423
          ActivePage = TSCo_Ficha
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 1
          TabPosition = tpBottom
          OnChange = PCContactosChange
          OnChanging = PCContactosChanging
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSCo_Ficha: TTabSheet
            Caption = 'F&icha'
            object SABContactosEmail: TSpeedButton
              Left = 10
              Top = 134
              Width = 23
              Height = 22
              GroupIndex = -1
              OnDblClick = SABContactosEmailDblClick
            end
            object PEditContactos: TLFPanel
              Left = 0
              Top = 0
              Width = 710
              Height = 397
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LContactoNombre: TLFLabel
                Left = 64
                Top = 31
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Nombre'
                FocusControl = DBE_C_Nombre
              end
              object LContactoApellidos: TLFLabel
                Left = 59
                Top = 53
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Apellidos'
                FocusControl = DBE_C_Apellidos
              end
              object LContactoTelefono: TLFLabel
                Left = 59
                Top = 75
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tel'#233'fono'
                FocusControl = DBE_C_Telefono
              end
              object LContactoFAX: TLFLabel
                Left = 66
                Top = 119
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Telefax'
                FocusControl = DBE_C_TeleFax
              end
              object LContactoExtension: TLFLabel
                Left = 248
                Top = 75
                Width = 18
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ext.'
                FocusControl = DBE_C_Extension
              end
              object LContactoEmail: TLFLabel
                Left = 74
                Top = 141
                Width = 27
                Height = 13
                Alignment = taRightJustify
                Caption = 'e-mail'
                FocusControl = DBE_C_Email
              end
              object LContactoContacto: TLFLabel
                Left = 58
                Top = 9
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Contacto'
              end
              object LContactoMovil: TLFLabel
                Left = 76
                Top = 97
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'M'#243'vil'
                FocusControl = DBE_C_Telefono
              end
              object LFLAgenteKri: TLFLabel
                Left = 67
                Top = 163
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Agente'
              end
              object LContactoZona: TLFLabel
                Left = 76
                Top = 205
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Zona'
                FocusControl = LFDBEZona
              end
              object LContactoDireccion: TLFLabel
                Left = 56
                Top = 185
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Direccion'
              end
              object LContactoPadre: TLFLabel
                Left = 27
                Top = 229
                Width = 74
                Height = 13
                Alignment = taRightJustify
                Caption = 'Contacto Padre'
              end
              object LDepartamento: TLFLabel
                Left = 34
                Top = 251
                Width = 67
                Height = 13
                Alignment = taRightJustify
                Caption = 'Departamento'
              end
              object LIdForceManager: TLFLabel
                Left = 20
                Top = 273
                Width = 81
                Height = 13
                Alignment = taRightJustify
                Caption = 'Id ForceManager'
                FocusControl = DBEIdForceManager
              end
              object LIdUsuarioWeb: TLFLabel
                Left = 329
                Top = 273
                Width = 74
                Height = 13
                Alignment = taRightJustify
                Caption = 'Id Usuario Web'
                FocusControl = DBEIdUsuarioWeb
              end
              object DBE_C_Nombre: TLFDbedit
                Left = 106
                Top = 27
                Width = 214
                Height = 21
                DataField = 'NOMBRE'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 0
              end
              object DBE_C_Apellidos: TLFDbedit
                Left = 106
                Top = 49
                Width = 214
                Height = 21
                DataField = 'APELLIDOS'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 1
              end
              object DBE_C_Telefono: TLFDbedit
                Left = 106
                Top = 71
                Width = 121
                Height = 21
                DataField = 'TELEFONO'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 2
              end
              object DBE_C_TeleFax: TLFDbedit
                Left = 106
                Top = 115
                Width = 121
                Height = 21
                DataField = 'FAX'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 5
              end
              object DBE_C_Extension: TLFDbedit
                Left = 271
                Top = 71
                Width = 49
                Height = 21
                DataField = 'EXTENSION'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 3
              end
              object DBE_C_Email: TLFDbedit
                Left = 106
                Top = 137
                Width = 412
                Height = 21
                DataField = 'CORREO'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 6
              end
              object DBM_Co_Notas: TLFDBMemo
                Left = 321
                Top = 5
                Width = 197
                Height = 131
                DataField = 'NOTAS'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 14
              end
              object DBE_C_Contacto: TLFDbedit
                Left = 106
                Top = 5
                Width = 87
                Height = 21
                CharCase = ecUpperCase
                Color = clInfoBk
                DataField = 'CONTACTO'
                DataSource = DMTerceros2.DSQMContactos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 16
              end
              object DBE_C_Movil: TLFDbedit
                Left = 106
                Top = 93
                Width = 121
                Height = 21
                DataField = 'MOVIL'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 4
              end
              object LFDBEAgenteKri: TLFDBEditFind2000
                Left = 106
                Top = 159
                Width = 64
                Height = 21
                AutoSize = False
                DataField = 'AGENTE'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 7
                OnChange = LFDBEAgenteKriChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
                Tabla_asociada.DesplegarBusqueda = False
                Campos_Desplegar.Strings = (
                  '')
                CampoNum = 'AGENTE'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = True
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'agente')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object LFEAgente: TLFEdit
                Left = 171
                Top = 159
                Width = 347
                Height = 21
                TabStop = False
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 15
              end
              object LFDBEZona: TLFDbedit
                Left = 106
                Top = 203
                Width = 64
                Height = 21
                DataField = 'ZONA'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 9
              end
              object DBEFDireccion: TLFDBEditFind2000
                Left = 106
                Top = 181
                Width = 64
                Height = 21
                AutoSize = False
                DataField = 'DIRECCION'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 8
                OnChange = DBEFDireccionChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
                Tabla_asociada.DesplegarBusqueda = False
                Campos_Desplegar.Strings = (
                  '')
                CampoNum = 'DIRECCION'
                CampoStr = 'DIR_COMPLETA_N'
                ReemplazarCaracter = True
                SalirSiNoExiste = True
                SalirSiVacio = True
                OnBusqueda = DBEFDireccionBusqueda
                OrdenadoPor.Strings = (
                  'direccion')
                Filtros = []
                Entorno = DMMain.EntornoBusqueda
              end
              object EDireccion: TLFEdit
                Left = 171
                Top = 181
                Width = 347
                Height = 21
                TabStop = False
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 17
              end
              object EContactoPadre: TLFEdit
                Left = 171
                Top = 225
                Width = 347
                Height = 21
                TabStop = False
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 18
              end
              object DBEFContactoPadre: TLFDBEditFind2000
                Left = 106
                Top = 225
                Width = 64
                Height = 21
                AutoSize = False
                DataField = 'PADRE'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 10
                OnChange = DBEFContactoPadreChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_TERCEROS_CONTACTOS'
                Tabla_asociada.DesplegarBusqueda = False
                Campos_Desplegar.Strings = (
                  'NOMBRE')
                CampoNum = 'CONTACTO'
                CampoStr = 'APELLIDOS'
                ReemplazarCaracter = True
                SalirSiNoExiste = True
                SalirSiVacio = True
                OnBusqueda = DBEFContactoPadreBusqueda
                OrdenadoPor.Strings = (
                  'CONTACTO')
                Filtros = []
                Entorno = DMMain.EntornoBusqueda
              end
              object ETituloDepartamento: TLFEdit
                Left = 171
                Top = 247
                Width = 347
                Height = 21
                Color = clInfoBk
                Enabled = False
                ReadOnly = True
                TabOrder = 19
              end
              object DBEDepartamento: TLFDBEditFind2000
                Left = 106
                Top = 247
                Width = 64
                Height = 21
                DataField = 'DEPARTAMENTO'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 11
                OnChange = DBEDepartamentoChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_DEPARTAMENTOS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'DEPARTAMENTO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = True
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'DEPARTAMENTO')
                Filtros = []
              end
              object DBEIdForceManager: TLFDbedit
                Left = 106
                Top = 269
                Width = 111
                Height = 21
                DataField = 'ID_FORCEMANAGER'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 12
              end
              object GBEmailVentas: TGroupBox
                Left = 102
                Top = 292
                Width = 420
                Height = 40
                Hint = 'Utilizar el email de este contacto al enviar documentos de venta'
                BiDiMode = bdLeftToRight
                Caption = 'E-Mail Ventas'
                ParentBiDiMode = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 20
                object DBCBEmailOfeCli: TLFDBCheckBox
                  Left = 5
                  Top = 18
                  Width = 68
                  Height = 17
                  Caption = 'Oferta'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 0
                  TabStop = True
                  Alignment = taLeftJustify
                  DataField = 'EMAIL_OFC'
                  DataSource = DMTerceros2.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCBEmailPedCli: TLFDBCheckBox
                  Left = 75
                  Top = 18
                  Width = 68
                  Height = 17
                  Caption = 'Pedido'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 1
                  TabStop = True
                  Alignment = taLeftJustify
                  DataField = 'EMAIL_PEC'
                  DataSource = DMTerceros2.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCBEmailAlbCli: TLFDBCheckBox
                  Left = 145
                  Top = 18
                  Width = 68
                  Height = 17
                  Caption = 'Albar'#225'n'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 2
                  TabStop = True
                  Alignment = taLeftJustify
                  DataField = 'EMAIL_ALB'
                  DataSource = DMTerceros2.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCBEmailFacCli: TLFDBCheckBox
                  Left = 215
                  Top = 18
                  Width = 68
                  Height = 14
                  Caption = 'Factura'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 3
                  TabStop = True
                  Alignment = taLeftJustify
                  DataField = 'EMAIL_FAC'
                  DataSource = DMTerceros2.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
              object GBEmailCompras: TGroupBox
                Left = 102
                Top = 334
                Width = 420
                Height = 40
                Hint = 
                  'Utilizar el email de este contacto al enviar documentos de compr' +
                  'a'
                Caption = 'E-Mail Compras'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 21
                object DBCBEmailPedProv: TLFDBCheckBox
                  Left = 145
                  Top = 18
                  Width = 68
                  Height = 18
                  Caption = 'Pedido'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 2
                  TabStop = True
                  Alignment = taLeftJustify
                  DataField = 'EMAIL_PEP'
                  DataSource = DMTerceros2.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCBEmailAlbProv: TLFDBCheckBox
                  Left = 215
                  Top = 18
                  Width = 68
                  Height = 18
                  Caption = 'Albar'#225'n'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 3
                  TabStop = True
                  Alignment = taLeftJustify
                  DataField = 'EMAIL_ALP'
                  DataSource = DMTerceros2.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCBEmailFacProv: TLFDBCheckBox
                  Left = 285
                  Top = 18
                  Width = 68
                  Height = 18
                  Caption = 'Fac. Prov.'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 4
                  TabStop = True
                  Alignment = taLeftJustify
                  DataField = 'EMAIL_FAP'
                  DataSource = DMTerceros2.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCBEmailPropProv: TLFDBCheckBox
                  Left = 5
                  Top = 18
                  Width = 68
                  Height = 18
                  Caption = 'Propuesta'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 0
                  TabStop = True
                  Alignment = taLeftJustify
                  DataField = 'EMAIL_OFP'
                  DataSource = DMTerceros2.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCBEmailPropConf: TLFDBCheckBox
                  Left = 75
                  Top = 18
                  Width = 68
                  Height = 18
                  Caption = 'Prop.Conf.'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 1
                  TabStop = True
                  Alignment = taLeftJustify
                  DataField = 'EMAIL_OCP'
                  DataSource = DMTerceros2.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCBEmailFacAcr: TLFDBCheckBox
                  Left = 354
                  Top = 18
                  Width = 60
                  Height = 18
                  Caption = 'Fac Acr.'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 5
                  TabStop = True
                  Alignment = taLeftJustify
                  DataField = 'EMAIL_FCR'
                  DataSource = DMTerceros2.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
              object DBEIdUsuarioWeb: TLFDbedit
                Left = 407
                Top = 269
                Width = 111
                Height = 21
                DataField = 'ID_USUARIO_WEB'
                DataSource = DMTerceros2.DSQMContactos
                TabOrder = 13
              end
            end
          end
          object TSCo_Jerarquia: TTabSheet
            Caption = 'Jerarquia'
            ImageIndex = 97
            object TVContactos: TTreeView
              Left = 0
              Top = 0
              Width = 710
              Height = 397
              Align = alClient
              Color = clInfoBk
              Indent = 19
              ReadOnly = True
              TabOrder = 0
              OnDblClick = TVContactosDblClick
            end
          end
          object TSCo_Tabla: TTabSheet
            Caption = 'T&abla'
            ImageIndex = 1
            OnShow = TSCo_TablaShow
            object DBG_Contactos: THYTDBGrid
              Left = 0
              Top = 0
              Width = 574
              Height = 396
              Align = alClient
              Color = clInfoBk
              DataSource = DMTerceros2.DSQMContactos
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
              IniStorage = FSMain
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = False
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              TabFicha = TSCo_Ficha
              PermutaPaneles = True
              CamposAMarcar.Strings = (
                'EMAIL_ALB'
                'EMAIL_ALP'
                'EMAIL_FAC'
                'EMAIL_FAP'
                'EMAIL_FCR'
                'EMAIL_OCP'
                'EMAIL_OFC'
                'EMAIL_OFP'
                'EMAIL_PEC'
                'EMAIL_PEP')
              CamposChecked.Strings = (
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1')
              CamposNoChecked.Strings = (
                '0'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0')
              CamposAOrdenar.Strings = (
                'APELLIDOS'
                'CONTACTO'
                'NOMBRE')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CONTACTO'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMBRE'
                  Width = 164
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'APELLIDOS'
                  Width = 174
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TELEFONO'
                  Width = 117
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FAX'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EXTENSION'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CORREO'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'AGENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL_OFC'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL_PEC'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL_ALB'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL_FAC'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL_PEP'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL_ALP'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL_FAP'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL_FCR'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL_OCP'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL_OFP'
                  Width = 60
                  Visible = True
                end>
            end
          end
        end
        object TB_C_Main: TLFToolBar
          Left = 0
          Top = 445
          Width = 718
          Height = 22
          Align = alBottom
          AutoSize = True
          ButtonWidth = 24
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Separators = True
          object NavContactos: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMTerceros2.DSQMContactos
            Flat = True
            ParentShowHint = False
            PopupMenu = CEContactosPMEdit
            ShowHint = True
            TabOrder = 0
            BeforeAction = NavContactosBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBE_C_Nombre
            InsertaControl = DBE_C_Nombre
            Exclusivo = True
            ControlEdit = CEContactos
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavContactosClickAfterAdjust
          end
          object LFiltraContactoKri: TLFLabel
            Left = 220
            Top = 0
            Width = 92
            Height = 22
            Alignment = taRightJustify
            Caption = ' Filtra Contacto '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFContactoKri: TLFEditFind2000
            Left = 312
            Top = 0
            Width = 50
            Height = 22
            TabOrder = 1
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'NOMBRE')
            CampoNum = 'CONTACTO'
            CampoStr = 'APELLIDOS'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'SYS_TERCEROS_CONTACTOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFContactoKriBusqueda
            OnExiste = EFContactoKriExiste
            OrdenadoPor.Strings = (
              'CONTACTO')
            Filtros = []
          end
          object TBSep1: TToolButton
            Left = 362
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBCreaUsuarioWeb: TToolButton
            Left = 370
            Top = 0
            Hint = 'Crea Usuario Web'
            Caption = 'Crea Usuario Web'
            ImageIndex = 24
            OnClick = TBCreaUsuarioWebClick
          end
        end
      end
      object TSCuentas: TTabSheet [4]
        Caption = 'C&uentas Bancarias'
        OnShow = TSCuentasShow
        object TB_B_Main: TLFToolBar
          Left = 0
          Top = 444
          Width = 718
          Height = 23
          Align = alBottom
          AutoSize = True
          ButtonHeight = 23
          ButtonWidth = 24
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object NavCuentas: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 23
            DataSource = DMTerceros2.DSQMBancos
            Flat = True
            ParentShowHint = False
            PopupMenu = CECuentasPMEdit
            ShowHint = True
            TabOrder = 0
            BeforeAction = NavCuentasBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBE_B_Titulo
            InsertaControl = DBE_B_Titulo
            Exclusivo = True
            ControlEdit = CECuentas
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavCuentasClickAfterAdjust
          end
        end
        object PCCuentas: TLFPageControl
          Left = 0
          Top = 22
          Width = 718
          Height = 422
          ActivePage = TSCu_Ficha
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSCu_Ficha: TTabSheet
            Caption = 'F&icha'
            object PEditCuentas: TLFPanel
              Left = 0
              Top = 0
              Width = 710
              Height = 396
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LBancoCuenta: TLFLabel
                Left = 67
                Top = 72
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cuenta'
                FocusControl = DBE_B_Sucursal
              end
              object LBancoBanco: TLFLabel
                Left = 70
                Top = 6
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Banco'
              end
              object LBancoEntidad: TLFLabel
                Left = 65
                Top = 50
                Width = 36
                Height = 13
                Alignment = taRightJustify
                Caption = 'Entidad'
              end
              object LBancoOrden: TLFLabel
                Left = 432
                Top = 114
                Width = 29
                Height = 13
                Alignment = taRightJustify
                Caption = 'Orden'
                FocusControl = DBE_B_Sucursal
              end
              object LBancoTitular: TLFLabel
                Left = 157
                Top = 6
                Width = 29
                Height = 13
                Alignment = taRightJustify
                Caption = 'Titular'
              end
              object LBancoIBAN: TLFLabel
                Left = 76
                Top = 93
                Width = 25
                Height = 13
                Hint = 'International Bank Account Number'
                Alignment = taRightJustify
                Caption = 'IBAN'
              end
              object LBancoBIC: TLFLabel
                Left = 45
                Top = 115
                Width = 56
                Height = 13
                Hint = 
                  'Bank Identification Code'#13#10'Society for Worldwide Interbank Financ' +
                  'ial Telecommunication'
                Alignment = taRightJustify
                Caption = 'BIC/SWIFT'
              end
              object LFirmaSEPA: TLFLabel
                Left = 76
                Top = 250
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Firma'
              end
              object LFechaFirmaSEPA: TLFLabel
                Left = 325
                Top = 249
                Width = 58
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Firma'
              end
              object LTipoCuenta: TLFLabel
                Left = 27
                Top = 138
                Width = 73
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo de Cuenta'
              end
              object LPaisBanco: TLFLabel
                Left = 82
                Top = 28
                Width = 20
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pais'
              end
              object DBE_B_Titulo: TLFDbedit
                Left = 190
                Top = 2
                Width = 319
                Height = 21
                DataField = 'TITULO'
                DataSource = DMTerceros2.DSQMBancos
                TabOrder = 1
              end
              object DBE_B_Sucursal: TLFDbedit
                Tag = 4
                Left = 106
                Top = 68
                Width = 45
                Height = 21
                CharCase = ecUpperCase
                DataField = 'SUCURSAL'
                DataSource = DMTerceros2.DSQMBancos
                TabOrder = 6
                OnChange = DBEFEntidadChange
              end
              object DBE_B_Cuenta: TLFDbedit
                Tag = 10
                Left = 186
                Top = 68
                Width = 323
                Height = 21
                DataField = 'CUENTA'
                DataSource = DMTerceros2.DSQMBancos
                TabOrder = 8
                OnChange = DBEFEntidadChange
              end
              object DBM_B_Notas: TLFDBMemo
                Left = 236
                Top = 156
                Width = 273
                Height = 89
                DataField = 'NOTAS'
                DataSource = DMTerceros2.DSQMBancos
                TabOrder = 17
              end
              object DBE_B_TitEntidad: TLFDbedit
                Left = 152
                Top = 46
                Width = 357
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMTerceros2.DSxBancos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBEFEntidad: TLFDBEditFind2000
                Tag = 4
                Left = 106
                Top = 46
                Width = 45
                Height = 21
                DataField = 'ENTIDAD'
                DataSource = DMTerceros2.DSQMBancos
                TabOrder = 4
                OnChange = DBEFEntidadChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_BANCOS                     '
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'ENTIDAD'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OnBusqueda = DBEFEntidadBusqueda
                Filtros = []
              end
              object DBE_B_Banco: TLFDbedit
                Left = 106
                Top = 2
                Width = 45
                Height = 21
                Color = clInfoBk
                DataField = 'BANCO'
                DataSource = DMTerceros2.DSQMBancos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBE_B_DigCont: TLFDbedit
                Tag = 2
                Left = 152
                Top = 68
                Width = 33
                Height = 21
                DataField = 'CONTROL'
                DataSource = DMTerceros2.DSQMBancos
                TabOrder = 7
                OnChange = DBEFEntidadChange
              end
              object DBCBActiva: TLFDBCheckBox
                Left = 440
                Top = 91
                Width = 69
                Height = 17
                Caption = 'Activa'
                ClicksDisabled = False
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 14
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ACTIVA'
                DataSource = DMTerceros2.DSQMBancos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBRG_B_Uso: TDBRadioGroup
                Left = 104
                Top = 157
                Width = 127
                Height = 85
                Caption = 'Uso'
                DataField = 'MODO'
                DataSource = DMTerceros2.DSQMBancos
                Items.Strings = (
                  'Compras y Ventas'
                  'S'#243'lo Compras'
                  'S'#243'lo Ventas')
                TabOrder = 16
                Values.Strings = (
                  '0'
                  '1'
                  '2')
              end
              object DBSE_B_Orden: TDBSpinEdit
                Left = 464
                Top = 111
                Width = 45
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 15
                Value = 3
                OnChange = DBSE_B_OrdenChange
                DataField = 'ORDEN'
                DataSource = DMTerceros2.DSQMBancos
              end
              object DBEBIC: TLFDbedit
                Tag = 2
                Left = 106
                Top = 112
                Width = 255
                Height = 21
                DataField = 'BIC'
                DataSource = DMTerceros2.DSQMBancos
                TabOrder = 10
              end
              object DBEIBAN: TLFDbedit
                Tag = 2
                Left = 106
                Top = 90
                Width = 255
                Height = 21
                DataField = 'IBAN'
                DataSource = DMTerceros2.DSQMBancos
                TabOrder = 9
                OnChange = DBEIBANChange
                OnEnter = DBEIBANEnter
              end
              object DBEFirmaSEPA: TLFDbedit
                Left = 106
                Top = 246
                Width = 135
                Height = 21
                DataField = 'FIRMA'
                DataSource = DMTerceros2.DSQMBancos
                TabOrder = 18
              end
              object DBDEFechaFirmaSEPA: TLFDBDateEdit
                Left = 388
                Top = 246
                Width = 121
                Height = 21
                DataField = 'FECHA_FIRMA'
                DataSource = DMTerceros2.DSQMBancos
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 19
              end
              object DBRGTipoAdeudo: TDBRadioGroup
                Left = 106
                Top = 268
                Width = 403
                Height = 36
                Hint = 
                  #218'nico - Autorizacion '#250'nico recibo'#13#10'Primero - Primer recibo de au' +
                  'torizacion recurrente'#13#10'Recurrente - Autorizaci'#243'n recurrente'#13#10'Fin' +
                  'al - '#218'ltimo recibo de autorizaci'#243'n recurrente'
                Caption = 'Tipo Adeudo'
                Columns = 5
                DataField = 'TIPO_ADEUDO_SEPA'
                DataSource = DMTerceros2.DSQMBancos
                Items.Strings = (
                  'Ninguno'
                  #218'nico'
                  'Primero'
                  'Recurrente'
                  'Final')
                ParentShowHint = False
                ShowHint = True
                TabOrder = 20
                Values.Strings = (
                  'NONE'
                  'OOFF'
                  'FRST'
                  'RCUR'
                  'FNAL')
              end
              object DBRGTipoContrato: TDBRadioGroup
                Left = 106
                Top = 304
                Width = 403
                Height = 36
                Caption = 'Tipo Contrato'
                Columns = 5
                DataField = 'TIPO_CONTRATO_SEPA'
                DataSource = DMTerceros2.DSQMBancos
                Items.Strings = (
                  'Ninguno'
                  'CORE'
                  'COR1'
                  'B2B')
                TabOrder = 21
                Values.Strings = (
                  'NONE'
                  'CORE'
                  'COR1'
                  'B2B')
              end
              object DBEFTipoCuenta: TLFDBEditFind2000
                Tag = 4
                Left = 105
                Top = 134
                Width = 45
                Height = 21
                DataField = 'TIPO_CUENTA'
                DataSource = DMTerceros2.DSQMBancos
                TabOrder = 12
                OnChange = DBEFTipoCuentaChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_TIPO_CUENTA_BANCO'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO'
                CampoStr = 'DESCRIPCION'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object EDescripcionTipoCuenta: TLFEdit
                Left = 151
                Top = 134
                Width = 357
                Height = 21
                Color = clInfoBk
                Enabled = False
                ReadOnly = True
                TabOrder = 13
              end
              object DBEFPaisBanco: TLFDBEditFind2000
                Tag = 4
                Left = 106
                Top = 24
                Width = 45
                Height = 21
                DataField = 'PAIS'
                DataSource = DMTerceros2.DSQMBancos
                TabOrder = 2
                OnChange = DBEFPaisBancoChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_PAISES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'PAIS'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'PAIS')
                Filtros = []
              end
              object EPaisBanco: TLFEdit
                Left = 152
                Top = 24
                Width = 357
                Height = 21
                TabStop = False
                Color = clInfoBk
                Enabled = False
                ReadOnly = True
                TabOrder = 3
              end
              object BObtenerBIC: TButton
                Left = 362
                Top = 112
                Width = 72
                Height = 22
                Hint = 'Obtener BIC de un registro previo con la misma entidad'
                Caption = 'Obtener BIC'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 11
                Visible = False
                OnClick = BObtenerBICClick
              end
            end
          end
          object TSCu_Tabla: TTabSheet
            Caption = 'T&abla'
            ImageIndex = 1
            OnShow = TSCu_TablaShow
            object DBG_Cuentas: THYTDBGrid
              Left = 0
              Top = 0
              Width = 570
              Height = 269
              Align = alClient
              Color = clInfoBk
              DataSource = DMTerceros2.DSQMBancos
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
              IniStorage = FSMain
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = False
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              TabFicha = TSCu_Ficha
              PermutaPaneles = True
              CamposAOrdenar.Strings = (
                'ACTIVA'
                'BANCO'
                'CONTROL'
                'CUENTA'
                'ENTIDAD'
                'MODO'
                'ORDEN'
                'SUCURSAL')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'BANCO'
                  Width = 42
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 186
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENTIDAD'
                  Width = 55
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUCURSAL'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONTROL'
                  Width = 24
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CUENTA'
                  Width = 72
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ACTIVA'
                  Width = 22
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODO'
                  Width = 23
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORDEN'
                  Width = 19
                  Visible = True
                end>
            end
          end
        end
        object PInfoCuentas: TLFPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 2
          object LBancoTercero: TLFLabel
            Left = 7
            Top = 4
            Width = 37
            Height = 13
            Caption = 'Tercero'
          end
          object DBE_CB_InfoCod: TLFDbedit
            Left = 48
            Top = 0
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TERCERO'
            DataSource = DMTerceros2.DSQMTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBE_CB_InfoTit: TLFDbedit
            Left = 113
            Top = 0
            Width = 340
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMTerceros2.DSQMTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object TSImagenes: TTabSheet [5]
        Caption = '&Im'#225'genes'
        ImageIndex = 6
        OnShow = TSImagenesShow
        object TBImagenes: TLFToolBar
          Left = 0
          Top = 0
          Width = 718
          Height = 22
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PInfoImagenes: TLFPanel
            Left = 0
            Top = 0
            Width = 453
            Height = 21
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LImagenesTercero: TLFLabel
              Left = 7
              Top = 4
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tercero'
            end
            object DBE_I_InfoCod: TLFDbedit
              Left = 48
              Top = 0
              Width = 64
              Height = 21
              Color = clInfoBk
              DataField = 'TERCERO'
              DataSource = DMTerceros2.DSQMTerceros
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBE_I_InfoTit: TLFDbedit
              Left = 113
              Top = 0
              Width = 340
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMTerceros2.DSQMTerceros
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton1: TToolButton
            Left = 453
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavImagenes: THYMNavigator
            Left = 461
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMTerceros2.DSQMTerceros
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEImagenesPMEdit
            ShowHint = True
            TabOrder = 1
            OnClick = NavImagenesClick
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEFImagen
            InsertaControl = DBEFImagen
            Exclusivo = True
            ControlEdit = CEImagenes
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavImagenesClickAfterAdjust
          end
        end
        object PEditImagenes: TLFPanel
          Left = 0
          Top = 22
          Width = 718
          Height = 43
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object LBLImagen: TLFLabel
            Left = 50
            Top = 13
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 90
            Top = 10
            Width = 50
            Height = 21
            DataField = 'IMAGEN'
            DataSource = DMTerceros2.DSQMTerceros
            TabOrder = 0
            OnChange = DBEFImagenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IMAGENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object ETituloImagen: TLFEdit
            Left = 141
            Top = 10
            Width = 363
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object BCargarImagen: TButton
            Left = 456
            Top = 11
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 2
            Visible = False
            OnClick = BCargarImagenClick
          end
          object BClipboard: TButton
            Left = 479
            Top = 11
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 3
            Visible = False
            OnClick = BClipboardClick
          end
        end
        object ScrBImagen: TScrollBox
          Left = 0
          Top = 65
          Width = 718
          Height = 402
          HorzScrollBar.Visible = False
          VertScrollBar.Visible = False
          Align = alClient
          AutoScroll = False
          BorderStyle = bsNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          object Imagen: TImage
            Left = 0
            Top = 0
            Width = 718
            Height = 402
            Align = alClient
            AutoSize = True
            IncrementalDisplay = True
            Proportional = True
          end
        end
      end
      object TSMails: TTabSheet [6]
        Caption = '&Mails'
        ImageIndex = 7
        OnShow = TSMailsShow
        object DBGMail: TNsDBGrid
          Left = 0
          Top = 0
          Width = 718
          Height = 453
          Align = alClient
          DataSource = DMTerceros2.DSxEmails
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'USUARIO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TERCERO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Width = 139
              Visible = True
            end>
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 718
          Height = 467
          OnColEnter = DBGMainColEnter
          OnKeyUp = DBGMainKeyUp
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CARNET_APLICADOR'
            'CLIENTE_POTENCIAL'
            'CODIGO_EDI'
            'CODIGO_POSTAL'
            'COLONIA'
            'DIR_LOCALIDAD'
            'DIR_NOMBRE'
            'DIR_NOMBRE_2'
            'EMAIL'
            'FECHA_ALTA'
            'FECHA_NACIMIENTO'
            'FECHA_VALIDEZ_CARNET_APLICADOR'
            'NIF'
            'NOMBRE_COMERCIAL'
            'NOMBRE_R_SOCIAL'
            'REGISTRO_MERCANTIL'
            'TELEFAX'
            'TELEFONO01'
            'TELEFONO02'
            'TERCERO'
            'TIPO_RAZON'
            'TIT_LOCALIDAD'
            'WEB')
          Columns = <
            item
              Expanded = False
              FieldName = 'TERCERO'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_COMERCIAL'
              Width = 380
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NIF'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIT_LOCALIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_PROVINCIA_LOC'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 525
    Width = 730
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDirecciones
    Left = 0
    Top = 160
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 32
    Top = 160
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 0
    Top = 128
    object AVisualizarListado: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado Terceros'
      Hint = 'Visualizar Listado Terceros'
      ImageIndex = 14
      OnExecute = AVisualizarListadoExecute
    end
    object ACliente: TAction
      Category = 'Otros'
      Caption = 'Cliente'
      Hint = 'Genera un Cliente con los datos del Tercero'
      ImageIndex = 104
      OnExecute = AClienteExecute
    end
    object ADirDefecto: TLFDatasetAction
      Category = 'Especiales'
      Caption = 'Establece esta direcci'#243'n como principal para el Tercero'
      Hint = 'Establece esta direcci'#243'n como principal para el Tercero'
      ImageIndex = 81
      OnExecute = ADirDefectoExecute
      DataSource = DMTerceros2.DSQMDirecciones
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del tercero'
      ImageIndex = 59
      OnExecute = AAdjuntosTerceroExecute
    end
    object AProveedor: TAction
      Category = 'Otros'
      Caption = 'Proveedor'
      Hint = 'Genera un Proveedor con los datos del Tercero'
      ImageIndex = 64
      OnExecute = AProveedorExecute
    end
    object AAcreedor: TAction
      Category = 'Otros'
      Caption = 'Acreedor'
      Hint = 'Genera un Acreedor con los datos del Tercero'
      ImageIndex = 63
      OnExecute = AAcreedorExecute
    end
    object AAgente: TAction
      Category = 'Otros'
      Caption = 'Agente'
      Hint = 'Genera un Agente con los datos del Tercero'
      ImageIndex = 106
      OnExecute = AAgenteExecute
    end
    object AVerificaNIF: TAction
      Category = 'Otros'
      Caption = 'Verifica NIFs'
      Hint = 'Verifica los NIFs de los terceros filtrados'
      ImageIndex = 19
      OnExecute = AVerificaNIFExecute
    end
    object AResDirDefecto: TLFDatasetAction
      Category = 'Especiales'
      Caption = 'Restablece la direcci'#243'n principal'
      Hint = 'Restablece la direcci'#243'n principal'
      ImageIndex = 17
      OnExecute = AResDirDefectoExecute
      DataSource = DMTerceros2.DSQMDirecciones
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Especiales'
      Caption = 'Especiales'
      ImageIndex = 58
    end
    object AImprimirListado: TAction
      Category = 'Listados'
      Caption = 'Imprimir Listado Terceros'
      Hint = 'Imprimir Listado Terceros'
      ImageIndex = 14
      OnExecute = AImprimirListadoExecute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AListConfig: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida del Listado de Terceros'
      Hint = 'Configuraci'#243'n R'#225'pida del Listado de Terceros'
      ImageIndex = 77
      OnExecute = AListConfigExecute
    end
    object AImprimirNotas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Notas'
      Hint = 'Imprimir Notas'
      ImageIndex = 14
      OnExecute = AImprimirNotasExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object ACreaTercerosRandom: TAction
      Category = 'Otros'
      Caption = 'Crea Terceros al Azar'
      Hint = 'Crea terceros y clientes al azar'
      ImageIndex = 54
      OnExecute = ACreaTercerosRandomExecute
    end
    object AImprimirCartaSEPA: TAction
      Category = 'Listados;"SEPA"'
      Caption = 'Imprimir Carta SEPA'
      Hint = 'Imprimir carta de autorizaci'#243'n SEPA'
      ImageIndex = 14
      OnExecute = AImprimirCartaSEPAExecute
    end
    object AVisualizarCartaSEPA: TAction
      Category = 'Listados;"SEPA"'
      Caption = 'Visualizar Carta SEPA'
      Hint = 'Visualizar carta de autorizaci'#243'n SEPA'
      ImageIndex = 125
      OnExecute = AVisualizarCartaSEPAExecute
    end
    object AListConfigCartaSEPA: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n Carta SEPA'
      Hint = 'Configuraci'#243'n carta de autorizaci'#243'n SEPA'
      ImageIndex = 77
      OnExecute = AListConfigCartaSEPAExecute
    end
    object AImprimirCartaSpeedLock: TAction
      Category = 'Listados;"SpeedLock"'
      Caption = 'Imprimir Carta SpeedLock'
      Hint = 'Imprimir carta SpeedLock'
      ImageIndex = 14
      OnExecute = AImprimirCartaSpeedLockExecute
    end
    object AVisualizarCartaSpeedLock: TAction
      Category = 'Listados;"SpeedLock"'
      Caption = 'Visualizar Carta SpeedLock'
      Hint = 'Visualizar carta SpeedLock'
      ImageIndex = 125
      OnExecute = AVisualizarCartaSpeedLockExecute
    end
    object AListConfigCartaSpeedLock: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n Carta SpeedLock'
      Hint = 'Configuraci'#243'n carta SpeedLock'
      ImageIndex = 77
      OnExecute = AListConfigCartaSpeedLockExecute
    end
    object AReemplazaCarateres: TAction
      Category = 'Otros'
      Caption = 'Reemplaza Caracteres'
      ImageIndex = 19
      OnExecute = AReemplazaCarateresExecute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AEnviarEmailCartaSEPA: TAction
      Category = 'Listados;"SEPA"'
      Caption = 'Enviar por email Carta SEPA (Directo)'
      Hint = 'Envia por email la carta de autorizaci'#243'n SEPA'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaSEPAExecute
    end
    object AEnviarEmailCartaSpeedLock: TAction
      Category = 'Listados;"SpeedLock"'
      Caption = 'Enviar por email Carta SpeedLock (Directo)'
      Hint = 'Envia por email la carta SpeedLock'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaSpeedLockExecute
    end
    object LFCategoryAction6: TLFCategoryAction
      Category = 'Listados;"SEPA"'
      Caption = 'SEPA'
      ImageIndex = 14
    end
    object ACalculaIBAN: TAction
      Category = 'Otros'
      Caption = 'Calcula IBAN'
      Hint = 
        'Calcula IBAN de las cuentas que no lo tengan informado de los te' +
        'rceros filtrados'
      ImageIndex = 3
      OnExecute = ACalculaIBANExecute
    end
    object ARenombraTercerosRandom: TAction
      Category = 'Otros'
      Caption = 'Renombra Terceros'
      Hint = 'Renombra Terceros con valores aleatorios'
      ImageIndex = 119
      OnExecute = ARenombraTercerosRandomExecute
    end
    object AImprimirCartaLOPD: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Imprimir Carta LOPD'
      Hint = 'Imprimir Carta LOPD'
      ImageIndex = 14
      OnExecute = AImprimirCartaLOPDExecute
    end
    object LFCategoryAction7: TLFCategoryAction
      Category = 'Listados;"LOPD"'
      Caption = 'LOPD'
      ImageIndex = 14
    end
    object AVisualizarCartaLOPD: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Visualizar Carta LOPD'
      Hint = 'Visualizar Carta LOPD'
      ImageIndex = 125
      OnExecute = AVisualizarCartaLOPDExecute
    end
    object AEnviarEmailCartaLOPD: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Enviar por email Carta LOPD (Directo)'
      Hint = 'Enviar por email Carta LOPD'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaLOPDExecute
    end
    object AListConfigCartaLOPD: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n Carta LOPD'
      ImageIndex = 77
      OnExecute = AListConfigCartaLOPDExecute
    end
    object AEnviarEmailCartaLOPD2: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Enviar por email Carta LOPD (Mensaje)'
      Hint = 'Enviar por email Carta LOPD utilizando cliente de correo'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaLOPD2Execute
    end
    object AEnviarEmailCartaSEPA2: TAction
      Category = 'Listados;"SEPA"'
      Caption = 'Enviar por email Carta SEPA (Mensaje)'
      Hint = 
        'Envia por email la carta de autorizaci'#243'n SEPA utilizando cliente' +
        ' de correo'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaSEPA2Execute
    end
    object AEnviarEmailCartaSpeedLock2: TAction
      Category = 'Listados;"SpeedLock"'
      Caption = 'Enviar por email Carta SpeedLock (Mensaje)'
      Hint = 'Envia por email la carta SpeedLock utilizando cliente de correo'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaSpeedLock2Execute
    end
    object AEmpleado: TAction
      Category = 'Otros'
      Caption = 'Empleado'
      Hint = 'Genera un Empleado con los datos del Tercero'
      ImageIndex = 54
      OnExecute = AEmpleadoExecute
    end
    object ACRM: TAction
      Category = 'Otros'
      Caption = 'Contacto CRM'
      Hint = 'Genera un Contacto CRM con los datos del Tercero'
      ImageIndex = 104
      OnExecute = ACRMExecute
    end
    object APedirFirma: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Pedir Firma'
      Hint = 'Pedir Firma'
      ImageIndex = 124
      OnExecute = APedirFirmaExecute
    end
    object ABorrarFirma: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Borrar Firma'
      Hint = 'Borrar Firma'
      ImageIndex = 124
      OnExecute = ABorrarFirmaExecute
    end
    object AEmpresasChile: TAction
      Category = 'Otros'
      Caption = 'Empresas Chile'
      Hint = 'Empresas Chile'
      ImageIndex = 21
      OnExecute = AEmpresasChileExecute
    end
    object LFCategoryAction8: TLFCategoryAction
      Category = 'Listados;"SpeedLock"'
      Caption = 'SpeedLock'
      ImageIndex = 14
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 32
    Top = 128
  end
  object CEDirecciones: TControlEdit
    EnlazadoA = CEInfo
    FichaEdicion = TSDi_Ficha
    FichaExclusiva = TSDireccion
    PanelEdicion = PEditDirecciones
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEDireccionesPMEdit
    Teclas = DMMain.Teclas
    Top = 192
  end
  object CEContactos: TControlEdit
    EnlazadoA = CECuentas
    FichaEdicion = TSCo_Ficha
    FichaExclusiva = TSContactos
    PanelEdicion = PEditContactos
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEContactosPMEdit
    Teclas = DMMain.Teclas
    Top = 256
  end
  object CECuentas: TControlEdit
    EnlazadoA = CEImagenes
    FichaEdicion = TSCu_Ficha
    FichaExclusiva = TSCuentas
    PanelEdicion = PEditCuentas
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CECuentasPMEdit
    Teclas = DMMain.Teclas
    Top = 288
  end
  object CEInfo: TControlEdit
    EnlazadoA = CEContactos
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PEditInfo
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEInfoPMEdit
    Teclas = DMMain.Teclas
    Top = 224
  end
  object CEInfoPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 32
    Top = 224
    object CEInfoMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEInfoMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEInfoMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEInfoMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEInfoMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEInfoMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEInfoMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEInfoMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEInfoMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEInfoMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEContactosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 32
    Top = 256
    object CEContactosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEContactosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEContactosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEContactosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEContactosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEContactosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEContactosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEContactosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEContactosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEContactosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEDireccionesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 32
    Top = 192
    object CEDireccionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDireccionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDireccionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDireccionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDireccionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDireccionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDireccionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDireccionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDireccionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDireccionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECuentasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 32
    Top = 288
    object CECuentasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECuentasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECuentasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECuentasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECuentasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECuentasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECuentasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECuentasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECuentasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECuentasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEImagenes: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSImagenes
    FichaExclusiva = TSImagenes
    PanelEdicion = PEditImagenes
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEImagenesPMEdit
    Teclas = DMMain.Teclas
    Top = 320
  end
  object CEImagenesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 32
    Top = 320
    object CEImagenesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEImagenesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEImagenesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEImagenesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEImagenesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEImagenesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEImagenesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImagenesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImagenesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImagenesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
