inherited FMTerceros: TFMTerceros
  Left = 300
  Top = 110
  Width = 1177
  Height = 771
  HelpContext = 35
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Terceros'
  Constraints.MinHeight = 740
  FormStyle = fsNormal
  PopupMenu = CEImagenesPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1167
    Height = 718
    inherited TBMain: TLFToolBar
      Width = 1163
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
      inherited TbuttComp: TToolButton
        ImageIndex = 0
      end
      object TBNet2Phone: TToolButton
        Left = 339
        Top = 0
        Hint = 'Selector de telefono para llamar mediante Net2Phone'
        Caption = 'Net2Phone'
        DropdownMenu = PMNet2Phone
        ImageIndex = 47
        Style = tbsDropDown
        OnClick = TBNet2PhoneClick
      end
      object BAbreCliente: TBitBtn
        Left = 375
        Top = 0
        Width = 70
        Height = 22
        Action = ACliente
        Caption = 'Cliente'
        TabOrder = 8
      end
      object TSepProveedor: TToolButton
        Left = 445
        Top = 0
        Width = 8
        ImageIndex = 1
        Style = tbsSeparator
      end
      object BAbreProveedor: TBitBtn
        Left = 453
        Top = 0
        Width = 70
        Height = 22
        Action = AProveedor
        Caption = 'Proveedor'
        TabOrder = 3
      end
      object TSepAcreedor: TToolButton
        Left = 523
        Top = 0
        Width = 8
        ImageIndex = 1
        Style = tbsSeparator
      end
      object BAbreAcreedor: TBitBtn
        Left = 531
        Top = 0
        Width = 70
        Height = 22
        Action = AAcreedor
        Caption = 'Acreedor'
        TabOrder = 4
      end
      object TSepAgente: TToolButton
        Left = 601
        Top = 0
        Width = 8
        ImageIndex = 1
        Style = tbsSeparator
      end
      object BAbreAgente: TBitBtn
        Left = 609
        Top = 0
        Width = 70
        Height = 22
        Action = AAgente
        Caption = 'Agente'
        TabOrder = 5
      end
      object TSepEmpleado: TToolButton
        Left = 679
        Top = 0
        Width = 8
        ImageIndex = 2
        Style = tbsSeparator
      end
      object BAbreEmpleado: TBitBtn
        Left = 687
        Top = 0
        Width = 70
        Height = 22
        Hint = 'Genera un Empleado con los datos del Tercero'
        Action = AEmpleado
        Caption = 'Empleado'
        TabOrder = 6
      end
      object TSepCRM: TToolButton
        Left = 757
        Top = 0
        Width = 10
        ImageIndex = 1
        Style = tbsSeparator
      end
      object BAbreCRM: TBitBtn
        Left = 767
        Top = 0
        Width = 70
        Height = 22
        Hint = 'Genera un Contacto CRM con los datos del Tercero'
        Action = ACRM
        Caption = 'CRM'
        TabOrder = 7
      end
      object TSepLocalizacion: TToolButton
        Left = 837
        Top = 0
        Width = 8
        ImageIndex = 3
        Style = tbsSeparator
      end
      object CBVerMapa: TLFCheckBox
        Left = 845
        Top = 0
        Width = 72
        Height = 22
        Caption = 'Ver Mapa'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 9
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBVerMapaChange
      end
      object PNLBusqueda: TLFPanel
        Left = 917
        Top = 0
        Width = 251
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LNombreCom_Soc: TLFLabel
          Left = 0
          Top = 0
          Width = 83
          Height = 20
          Alignment = taCenter
          AutoSize = False
          Caption = 'N. Comercial'
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
          Left = 84
          Top = 0
          Width = 156
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
        Left = 1168
        Top = 0
        Width = 8
        ImageIndex = 4
        Style = tbsSeparator
      end
      object TBEmpresasChile: TToolButton
        Left = 1176
        Top = 0
        Action = AEmpresasChile
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1163
      Height = 688
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
          Left = 83
          Top = 124
          Width = 410
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
          Left = 83
          Top = 146
          Width = 410
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAWebDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1155
          Height = 660
          inherited G2KTableLoc: TG2KTBLoc
            Left = 37
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
          object GBDireccion: TGroupBox
            Left = 0
            Top = 177
            Width = 1155
            Height = 417
            Align = alClient
            Caption = 'Direcci'#243'n'
            Color = clBtnFace
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              1155
              417)
            object LPaisDireccion: TLFLabel
              Left = 287
              Top = 40
              Width = 20
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pais'
            end
            object LNumero: TLFLabel
              Left = 91
              Top = 83
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#250'mero'
            end
            object LBLoqueEscalera: TLFLabel
              Left = 194
              Top = 83
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bloq./Esc.'
            end
            object LPiso: TLFLabel
              Left = 313
              Top = 83
              Width = 20
              Height = 13
              Alignment = taRightJustify
              Caption = 'Piso'
            end
            object DBT_TipDir_T: TDBText
              Left = 5
              Top = 61
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Color = clBtnFace
              DataField = 'TITULO'
              DataSource = DMTerceros.DSxTipDir_T
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object LPuerta: TLFLabel
              Left = 401
              Top = 83
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Puerta'
            end
            object LDirClase: TLFLabel
              Left = 135
              Top = 39
              Width = 26
              Height = 13
              Caption = 'Clase'
            end
            object LTelefonos: TLFLabel
              Left = 27
              Top = 18
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tel'#233'fonos'
            end
            object LDireccion2: TLFLabel
              Left = 14
              Top = 106
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dir. Compl. 2'
            end
            object LTransportistaTercero: TLFLabel
              Left = 12
              Top = 262
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'Transportista'
            end
            object LNotas: TLFLabel
              Left = 4
              Top = 356
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'Notas Tercero'
            end
            object LEAN13: TLFLabel
              Left = 299
              Top = 260
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'EAN 13'
              FocusControl = DBEEAN13
            end
            object LColonia: TLFLabel
              Left = 39
              Top = 238
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Colonia'
              FocusControl = DBEColonia
            end
            object LDireccion3: TLFLabel
              Left = 14
              Top = 128
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dir. Compl. 3'
            end
            object LNumeroDireccion: TLFLabel
              Left = 14
              Top = 40
              Width = 60
              Height = 13
              Caption = 'Direcci'#243'n N'#186
            end
            object PnlDireccion2: TLFPanel
              Left = 1
              Top = 146
              Width = 490
              Height = 88
              BevelOuter = bvNone
              TabOrder = 17
              object LPoblacion: TLFLabel
                Left = 25
                Top = 48
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Poblaci'#243'n'
              end
              object LRegion: TLFLabel
                Left = 36
                Top = 4
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Regi'#243'n'
              end
              object LCodigoPostal: TLFLabel
                Left = 8
                Top = 70
                Width = 64
                Height = 13
                Alignment = taRightJustify
                Caption = 'Codigo postal'
              end
              object LProvinciaDireccion: TLFLabel
                Left = 28
                Top = 26
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Provincia'
              end
              object ETituloPoblacion: TLFEdit
                Left = 159
                Top = 44
                Width = 329
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
                TabOrder = 5
              end
              object DBERegion: TLFDBEditFind2000
                Left = 78
                Top = 0
                Width = 80
                Height = 21
                DataField = 'REGION_DIRECCION'
                DataSource = DMTerceros.DSQMTerceros
                TabOrder = 0
                OnChange = DBERegionChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_REGIONES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'REGION'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OnBusqueda = DBERegionBusqueda
                OrdenadoPor.Strings = (
                  'REGION')
                Filtros = [obPais]
              end
              object ETituloRegion: TLFEdit
                Left = 159
                Top = 0
                Width = 329
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
                TabOrder = 1
              end
              object ETituloCodigoPostal: TLFEdit
                Left = 159
                Top = 66
                Width = 329
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
                TabOrder = 7
              end
              object EFPoblacion: TLFDBEditFind2000
                Left = 78
                Top = 44
                Width = 80
                Height = 21
                DataField = 'POBLACION_DIRECCION'
                DataSource = DMTerceros.DSQMTerceros
                TabOrder = 4
                OnChange = EFPoblacionChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_POBLACION'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'POBLACION'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OnBusqueda = EFPoblacionBusqueda
                OrdenadoPor.Strings = (
                  'POBLACION')
                Filtros = [obPais]
              end
              object EFCodigoPostal: TLFDBEditFind2000
                Left = 78
                Top = 66
                Width = 80
                Height = 21
                Color = clSkyBlue
                DataField = 'DIRECCION_CODIGO_POSTAL'
                DataSource = DMTerceros.DSQMTerceros
                TabOrder = 6
                OnChange = EFCodigoPostalChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_CODIGOS_POSTALES'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO_POSTAL'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OnBusqueda = EFCodigoPostalBusqueda
                OrdenadoPor.Strings = (
                  'CODIGO_POSTAL')
                Filtros = []
              end
              object ETituloProvinciaTercero: TLFEdit
                Left = 159
                Top = 22
                Width = 329
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
                TabOrder = 3
              end
              object DBEProvinciaDireccion: TLFDBEditFind2000
                Left = 78
                Top = 22
                Width = 80
                Height = 21
                CharCase = ecUpperCase
                DataField = 'PROVINCIA_DIRECCION'
                DataSource = DMTerceros.DSQMTerceros
                TabOrder = 2
                OnChange = DBEProvinciaDireccionChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_PROVINCIAS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'PROVINCIA'
                CampoStr = 'PR_TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OnBusqueda = DBEProvinciaDireccionBusqueda
                OrdenadoPor.Strings = (
                  'PROVINCIA')
                Filtros = []
              end
            end
            object PnlDireccion: TLFPanel
              Left = 1
              Top = 146
              Width = 490
              Height = 88
              BevelOuter = bvNone
              TabOrder = 16
              object LLocalidad: TLFLabel
                Left = 27
                Top = 4
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'Localidad'
              end
              object LProvincia: TLFLabel
                Left = 29
                Top = 26
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Provincia'
              end
              object SBNuevaLocalidadFicha: TSpeedButton
                Left = 22
                Top = 0
                Width = 56
                Height = 21
                Hint = 'Crea una nueva localidad'
                Caption = 'Nueva'
                ParentShowHint = False
                ShowHint = True
                Visible = False
                OnClick = SBNuevaLocalidadFichaClick
              end
              object DBEProvincia: TLFDbedit
                Left = 78
                Top = 22
                Width = 212
                Height = 21
                Color = clInfoBk
                DataField = 'PROVINCIA'
                DataSource = DMTerceros.DSxLoc_T
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object EFLocalidad: TLFDBEditFind2000
                Left = 78
                Top = 0
                Width = 77
                Height = 21
                DataField = 'DIR_LOCALIDAD'
                DataSource = DMTerceros.DSQMTerceros
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_LOCALIDADES'
                Tabla_asociada.DesplegarBusqueda = False
                Campos_Desplegar.Strings = (
                  'PROVINCIA'
                  'C_PAIS'
                  'TITULO')
                CampoNum = 'CODPOSTAL'
                CampoADevolver = 'LOCALIDAD'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OnBusqueda = EFLocalidadBusqueda
                OrdenadoPor.Strings = (
                  'LOCALIDAD')
                Filtros = []
              end
              object DBELocalidadNombre: TLFDbedit
                Left = 156
                Top = 0
                Width = 185
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMTerceros.DSxLoc_T
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object DBECpostal: TLFDbedit
                Left = 342
                Top = 0
                Width = 146
                Height = 21
                Color = clInfoBk
                DataField = 'CODPOSTAL'
                DataSource = DMTerceros.DSxLoc_T
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object DBEPais: TLFDbedit
                Left = 291
                Top = 22
                Width = 197
                Height = 21
                Color = clInfoBk
                DataField = 'PAIS'
                DataSource = DMTerceros.DSxLoc_T
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
            end
            object ETituloPaisDireccion: TLFEdit
              Left = 352
              Top = 36
              Width = 137
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
              TabOrder = 7
            end
            object DBEPaisDireccion: TLFDBEditFind2000
              Left = 311
              Top = 36
              Width = 40
              Height = 21
              DataField = 'PAIS_DIRECCION'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 6
              OnChange = DBEPaisDireccionChange
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
            object DBEDirNombre: TLFDbedit
              Left = 131
              Top = 58
              Width = 358
              Height = 21
              DataField = 'DIR_NOMBRE'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 9
            end
            object DBEDirBloqEsc: TLFDbedit
              Left = 247
              Top = 80
              Width = 55
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DIR_BLOQUE_ESCALERA'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 11
            end
            object DBEDirPiso: TLFDbedit
              Left = 335
              Top = 80
              Width = 55
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DIR_PISO'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 12
            end
            object DBEDirNumero: TLFDbedit
              Left = 131
              Top = 80
              Width = 55
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DIR_NUMERO'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 10
            end
            object DBETipoDir: TLFDBEditFind2000
              Left = 79
              Top = 58
              Width = 51
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DIR_TIPO'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 8
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
              Left = 434
              Top = 80
              Width = 55
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DIR_PUERTA'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 13
            end
            object DBENombreDireccion: TLFDbedit
              Left = 79
              Top = 36
              Width = 51
              Height = 21
              Color = clInfoBk
              DataField = 'DIRECCION'
              DataSource = DMTerceros.DSQMTerceros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object DBEDirClase: TLFDBEditFind2000
              Left = 164
              Top = 36
              Width = 38
              Height = 21
              DataField = 'DIR_CLASE'
              DataSource = DMTerceros.DSQMTerceros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              OnChange = DBEDirClaseChange
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
              Filtros = []
            end
            object EDirClaseTitulo: TLFEdit
              Left = 203
              Top = 36
              Width = 79
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
              TabOrder = 5
            end
            object DBETelefax: TLFDbedit
              Left = 353
              Top = 14
              Width = 136
              Height = 21
              Hint = 'Tel'#233'fono 3'
              DataField = 'TELEFAX'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 2
            end
            object DBETelefono2: TLFDbedit
              Left = 216
              Top = 14
              Width = 136
              Height = 21
              Hint = 'Tel'#233'fono 2'
              DataField = 'TELEFONO02'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 1
            end
            object DBETelefono1: TLFDbedit
              Left = 79
              Top = 14
              Width = 136
              Height = 21
              Hint = 'Tel'#233'fono 1'
              DataField = 'TELEFONO01'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 0
            end
            object EDIRNombre2: TLFDbedit
              Left = 79
              Top = 102
              Width = 410
              Height = 21
              DataField = 'DIR_NOMBRE_2'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 14
            end
            object DBMDireccion: TLFDBMemo
              Left = 498
              Top = 14
              Width = 652
              Height = 53
              Anchors = [akLeft, akTop, akRight]
              DataField = 'DIRECCION_LITERAL'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 23
              OnChange = DBMDireccionChange
            end
            object DBEFTransportistaFicha: TLFDBEditFind2000
              Left = 79
              Top = 256
              Width = 51
              Height = 21
              DataField = 'DIR_TRANSPORTISTA'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 19
              OnChange = DBEFTransportistaFichaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_TRANSPORTISTAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'TRANSPORTISTA'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = []
            end
            object ETransportistaFichaTitulo: TLFEdit
              Left = 131
              Top = 256
              Width = 164
              Height = 21
              TabStop = False
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 20
              Text = 'ETransportistaFichaTitulo'
            end
            object DBMNotasTercero: TLFDBMemo
              Left = 79
              Top = 350
              Width = 410
              Height = 58
              Anchors = [akLeft, akTop, akBottom]
              DataField = 'NOTAS'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 22
            end
            object DBEEAN13: TLFDbedit
              Left = 340
              Top = 256
              Width = 148
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODIGO_EDI'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 21
            end
            object DBEColonia: TLFDbedit
              Left = 79
              Top = 234
              Width = 410
              Height = 21
              DataField = 'COLONIA'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 18
            end
            object PLocalizacion: TLFPanel
              Left = 498
              Top = 68
              Width = 650
              Height = 343
              Anchors = [akLeft, akTop, akRight, akBottom]
              BevelOuter = bvNone
              TabOrder = 24
              object LTituloSinMapa: TLabel
                Left = 0
                Top = 323
                Width = 650
                Height = 20
                Align = alBottom
                Alignment = taCenter
                AutoSize = False
                Caption = 'Localizacion desactivada o no disponible'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
              end
              object ImgMapaFicha: TImage
                Left = 0
                Top = 0
                Width = 650
                Height = 323
                Align = alClient
                Center = True
                IncrementalDisplay = True
                Proportional = True
              end
            end
            object EDIRNombre3: TLFDbedit
              Left = 79
              Top = 124
              Width = 410
              Height = 21
              DataField = 'DIR_NOMBRE_3'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 15
            end
          end
          object GBOtros: TGroupBox
            Left = 0
            Top = 594
            Width = 1155
            Height = 66
            Align = alBottom
            Caption = 'Otros'
            Color = clBtnFace
            ParentColor = False
            TabOrder = 2
            object LFechaValidezCarnet: TLFLabel
              Left = 505
              Top = 41
              Width = 92
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fec. Validez Carnet'
            end
            object LCarnetAplicador: TLFLabel
              Left = 20
              Top = 40
              Width = 78
              Height = 13
              Alignment = taRightJustify
              Caption = 'Carnet Aplicador'
              FocusControl = DBECarnetAplicador
            end
            object LRegistroMercantil: TLFLabel
              Left = 12
              Top = 18
              Width = 85
              Height = 13
              Alignment = taRightJustify
              Caption = 'Registro Mercantil'
              FocusControl = DBERegistroMercantil
            end
            object LFechaNacimiento: TLFLabel
              Left = 970
              Top = 40
              Width = 77
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fec. Nacimiento'
            end
            object LDBLCComoNosConocieron: TLFLabel
              Left = 493
              Top = 18
              Width = 106
              Height = 13
              Alignment = taRightJustify
              Caption = 'Como Nos Conocieron'
              FocusControl = DBECarnetAplicador
            end
            object DBCBCLientePotencialKRI: TLFDBCheckBox
              Left = 762
              Top = 38
              Width = 169
              Height = 17
              Caption = '&Cliente Potencial No Prioritario'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'CLIENTE_POTENCIAL'
              DataSource = DMTerceros.DSQMTerceros
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBDTPFechaValidezCarnet: TLFDBDateEdit
              Left = 603
              Top = 36
              Width = 95
              Height = 21
              DataField = 'FECHA_VALIDEZ_CARNET_APLICADOR'
              DataSource = DMTerceros.DSQMTerceros
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 3
            end
            object DBECarnetAplicador: TLFDbedit
              Left = 103
              Top = 36
              Width = 386
              Height = 21
              DataField = 'CARNET_APLICADOR'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 1
            end
            object DBERegistroMercantil: TLFDbedit
              Left = 103
              Top = 14
              Width = 386
              Height = 21
              DataField = 'REGISTRO_MERCANTIL'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 0
            end
            object DBEFechaNacimiento: TLFDBDateEdit
              Left = 1053
              Top = 36
              Width = 95
              Height = 21
              DataField = 'FECHA_NACIMIENTO'
              DataSource = DMTerceros.DSQMTerceros
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 5
            end
            object DBLCComoNosConocieron: TRxDBLookupCombo
              Left = 603
              Top = 14
              Width = 395
              Height = 21
              DropDownCount = 12
              DataField = 'COMO_NOS_CONOCIERON'
              DataSource = DMTerceros.DSQMTerceros
              LookupField = 'MODO'
              LookupDisplay = 'TITULO'
              LookupSource = DMTerceros.DSQMComoNosConocieron
              TabOrder = 2
            end
          end
          object PNLDatosTercero: TLFPanel
            Left = 0
            Top = 0
            Width = 1155
            Height = 177
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              1155
              177)
            object LWeb: TLFLabel
              Left = 53
              Top = 160
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Web'
              FocusControl = DBEWeb
            end
            object LBLRazonSocial: TLFLabel
              Left = 177
              Top = 4
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Raz'#243'n Social'
              FocusControl = DBETercero
            end
            object LContactos: TLFLabel
              Left = 501
              Top = 4
              Width = 48
              Height = 13
              Caption = 'Contactos'
            end
            object LEmail: TLFLabel
              Left = 52
              Top = 138
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'e-mail'
              FocusControl = DBEEmail
            end
            object LFechaAlta: TLFLabel
              Left = 998
              Top = 4
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = 'Fecha Alta'
            end
            object LNombre: TLFLabel
              Left = 15
              Top = 48
              Width = 63
              Height = 13
              Alignment = taRightJustify
              Caption = 'Raz'#243'n Social'
              FocusControl = DBENombre
            end
            object LNombreComercial: TLFLabel
              Left = 18
              Top = 26
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'N. Comercial'
              FocusControl = DBENombre
            end
            object LPaisTercero: TLFLabel
              Left = 56
              Top = 69
              Width = 20
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pais'
            end
            object LTercero: TLFLabel
              Left = 41
              Top = 4
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tercero'
              FocusControl = DBETercero
            end
            object LTipoDocumento: TLFLabel
              Left = 34
              Top = 92
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Doc.'
            end
            object LValidacionDocumento: TLFLabel
              Left = 29
              Top = 109
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Validacion'
            end
            object DBTValidacionResultado: TDBText
              Left = 83
              Top = 110
              Width = 350
              Height = 12
              DataField = 'RESULTADO'
              DataSource = DMTerceros.DSxValidacionDoc
              ParentShowHint = False
              ShowHint = True
            end
            object DBTValidacionNombre: TDBText
              Left = 83
              Top = 122
              Width = 410
              Height = 12
              DataField = 'RESULTADO_NOMBRE'
              DataSource = DMTerceros.DSxValidacionDoc
              ParentShowHint = False
              ShowHint = True
            end
            object DBTValidacionFechaCombrobacion: TDBText
              Left = 428
              Top = 110
              Width = 65
              Height = 12
              DataField = 'FECHA_COMPROBACION'
              DataSource = DMTerceros.DSxValidacionDoc
            end
            object ETituloPaisTercero: TLFEdit
              Left = 135
              Top = 66
              Width = 358
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
              TabOrder = 6
            end
            object DBE_TitRazones: TLFDbedit
              Left = 327
              Top = 0
              Width = 166
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMTerceros.DSxRazones
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBECif: TLFDbedit
              Left = 348
              Top = 88
              Width = 145
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NIF'
              DataSource = DMTerceros.DSQMTerceros
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
              OnChange = DBECifChange
              OnExit = DBECifExit
            end
            object DBEEmail: TLFDbedit
              Left = 83
              Top = 134
              Width = 410
              Height = 21
              DataField = 'EMAIL'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 10
            end
            object DBEInfoAlta: TLFDbedit
              Left = 1058
              Top = 0
              Width = 95
              Height = 21
              TabStop = False
              Anchors = [akTop, akRight]
              Color = clInfoBk
              DataField = 'FECHA_ALTA'
              DataSource = DMTerceros.DSQMTerceros
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
            end
            object DBENombre: TLFDbedit
              Left = 83
              Top = 44
              Width = 410
              Height = 21
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 4
              OnExit = DBENombreExit
            end
            object DBENombreComercial: TLFDbedit
              Left = 83
              Top = 22
              Width = 410
              Height = 21
              DataField = 'NOMBRE_COMERCIAL'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 3
              OnExit = DBENombreExit
            end
            object DBEPaisTercero: TLFDBEditFind2000
              Left = 83
              Top = 66
              Width = 51
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PAIS_TERCERO'
              DataSource = DMTerceros.DSQMTerceros
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
            object DBETercero: TLFDbedit
              Left = 83
              Top = 0
              Width = 64
              Height = 21
              Color = clInfoBk
              DataField = 'TERCERO'
              DataSource = DMTerceros.DSQMTerceros
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
            object DBETipoDocumento: TLFDBEditFind2000
              Left = 83
              Top = 88
              Width = 51
              Height = 21
              DataField = 'TIPO_DOC_IDENT'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 7
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
            object DBETipoRazon: TLFDBEditFind2000
              Left = 269
              Top = 0
              Width = 57
              Height = 21
              DataField = 'TIPO_RAZON'
              DataSource = DMTerceros.DSQMTerceros
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
            object DBEWeb: TLFDbedit
              Left = 83
              Top = 156
              Width = 410
              Height = 21
              DataField = 'WEB'
              DataSource = DMTerceros.DSQMTerceros
              TabOrder = 11
            end
            object ETipoDocumentoTitulo: TLFEdit
              Left = 135
              Top = 88
              Width = 211
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
              TabOrder = 8
            end
          end
        end
        object DBGContactos: THYTDBGrid
          Left = 502
          Top = 32
          Width = 651
          Height = 145
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataSource = DMTerceros.DSQMContactos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
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
          PermutaPaneles = False
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APELLIDOS'
              Width = 141
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CORREO'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONO'
              Visible = True
            end>
        end
      end
      object TSDireccion: TTabSheet [1]
        Caption = '&Direcciones'
        ImageIndex = 2
        OnShow = TSDireccionesShow
        DesignSize = (
          1155
          660)
        object P_Info_Cb: TLFPanel
          Left = 0
          Top = 0
          Width = 1155
          Height = 153
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 0
          object LDireccionesTercero: TLFLabel
            Left = 54
            Top = 13
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LDirNComercial: TLFLabel
            Left = 7
            Top = 36
            Width = 85
            Height = 13
            Caption = 'Nombre comercial'
          end
          object LDirRSocial: TLFLabel
            Left = 31
            Top = 57
            Width = 61
            Height = 13
            Caption = 'Raz'#243'n social'
          end
          object LDirPais: TLFLabel
            Left = 72
            Top = 79
            Width = 20
            Height = 13
            Caption = 'Pais'
          end
          object LDirEmail: TLFLabel
            Left = 64
            Top = 101
            Width = 28
            Height = 13
            Caption = 'E-mail'
          end
          object LDirWeb: TLFLabel
            Left = 69
            Top = 123
            Width = 23
            Height = 13
            Caption = 'Web'
          end
          object LDireccionContactos: TLFLabel
            Left = 506
            Top = 14
            Width = 48
            Height = 13
            Caption = 'Contactos'
          end
          object DBE_U_InfoCod: TLFDbedit
            Left = 97
            Top = 9
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TERCERO'
            DataSource = DMTerceros.DSQMTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBDirPais: TLFDbedit
            Left = 97
            Top = 75
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'PAIS_TERCERO'
            DataSource = DMTerceros.DSQMTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            OnChange = DBDirPaisChange
          end
          object EDirTituloPais: TLFEdit
            Left = 162
            Top = 75
            Width = 335
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Text = 'EDirTituloPais'
          end
          object DBEDirEmail: TLFDbedit
            Left = 97
            Top = 97
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'EMAIL'
            DataSource = DMTerceros.DSQMTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEDirWeb: TLFDbedit
            Left = 97
            Top = 119
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'WEB'
            DataSource = DMTerceros.DSQMTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEDirNombreComercial: TLFDbedit
            Left = 97
            Top = 31
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_COMERCIAL'
            DataSource = DMTerceros.DSQMTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBEDirRazonSocail: TLFDbedit
            Left = 97
            Top = 53
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMTerceros.DSQMTerceros
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
        object PCDirecciones: TLFPageControl
          Left = 0
          Top = 153
          Width = 1155
          Height = 485
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
            DesignSize = (
              1147
              459)
            object PEditDirecciones: TLFPanel
              Left = 0
              Top = 0
              Width = 1147
              Height = 459
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              DesignSize = (
                1147
                459)
              object Lbl_Num: TLFLabel
                Left = 93
                Top = 74
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'N'#250'mero'
              end
              object Lbl_Blq: TLFLabel
                Left = 199
                Top = 74
                Width = 50
                Height = 13
                Alignment = taRightJustify
                Caption = 'Bloq./Esc.'
              end
              object Lbl_Piso: TLFLabel
                Left = 316
                Top = 74
                Width = 20
                Height = 13
                Alignment = taRightJustify
                Caption = 'Piso'
              end
              object DBT_TipDir_D: TDBText
                Left = 4
                Top = 52
                Width = 70
                Height = 13
                Alignment = taRightJustify
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
                Left = 400
                Top = 74
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Puerta'
              end
              object LDireccionesTelefonos: TLFLabel
                Left = 26
                Top = 8
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tel'#233'fonos'
                FocusControl = DBETel01
              end
              object LClaseDireccion: TLFLabel
                Left = 138
                Top = 29
                Width = 26
                Height = 13
                Alignment = taRightJustify
                Caption = 'Clase'
              end
              object LNotasDireccion: TLFLabel
                Left = 25
                Top = 426
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Notas Dir.'
              end
              object LDireccionesEAN13: TLFLabel
                Left = 246
                Top = 274
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'EAN 13'
                FocusControl = DBECodigoEdiDireccion
              end
              object LTransportista: TLFLabel
                Left = 12
                Top = 274
                Width = 61
                Height = 13
                Alignment = taRightJustify
                Caption = 'Transportista'
              end
              object LDireccionesColonia: TLFLabel
                Left = 37
                Top = 228
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Colonia'
                FocusControl = DBEDireccionesColonia
              end
              object LIdForceManagerDrieccion: TLFLabel
                Left = 12
                Top = 316
                Width = 63
                Height = 13
                Hint = 'Id ForceManager'
                Alignment = taRightJustify
                Caption = 'Id ForceMng.'
                FocusControl = DBEIdForceManagerDrieccion
                ParentShowHint = False
                ShowHint = True
              end
              object LDireccionPais: TLFLabel
                Left = 326
                Top = 29
                Width = 22
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pa'#237's'
              end
              object LDirDireccion2: TLFLabel
                Left = 14
                Top = 96
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'Dir. Compl. 2'
              end
              object LBancoDireccion: TLFLabel
                Left = 43
                Top = 295
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Banco'
              end
              object LDirDireccion3: TLFLabel
                Left = 14
                Top = 118
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'Dir. Compl. 3'
              end
              object LDirNumeroDireccion: TLFLabel
                Left = 15
                Top = 30
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'Direcci'#243'n N'#186
              end
              object LHorario: TLFLabel
                Left = 38
                Top = 340
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Horario'
                FocusControl = DBEHorario
              end
              object LMedios: TLFLabel
                Left = 38
                Top = 362
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Medios'
                FocusControl = DBEMedios
              end
              object LDirCorreo: TLFLabel
                Left = 41
                Top = 384
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Correo'
                FocusControl = DBEDirCorreo
              end
              object LDirContacto: TLFLabel
                Left = 29
                Top = 406
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Contacto'
                FocusControl = DBEDirContacto
              end
              object DBE_D_Calle: TLFDbedit
                Left = 134
                Top = 48
                Width = 356
                Height = 21
                DataField = 'DIR_NOMBRE'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 9
              end
              object DBE_D_Num: TLFDbedit
                Left = 134
                Top = 70
                Width = 61
                Height = 21
                DataField = 'DIR_NUMERO'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 10
              end
              object DBE_D_BloqEsc: TLFDbedit
                Left = 253
                Top = 70
                Width = 55
                Height = 21
                DataField = 'DIR_BLOQUE_ESCALERA'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 11
              end
              object DBE_D_Piso: TLFDbedit
                Left = 340
                Top = 70
                Width = 55
                Height = 21
                DataField = 'DIR_PISO'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 12
              end
              object DBE_D_Direccion: TLFDbedit
                Left = 78
                Top = 26
                Width = 55
                Height = 21
                Color = clInfoBk
                DataField = 'DIRECCION'
                DataSource = DMTerceros.DSQMDirecciones
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object DBE_D_Tipo: TLFDBEditFind2000
                Left = 78
                Top = 48
                Width = 55
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DIR_TIPO'
                DataSource = DMTerceros.DSQMDirecciones
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
                Left = 435
                Top = 70
                Width = 55
                Height = 21
                DataField = 'DIR_PUERTA'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 13
              end
              object DBE_D_Direccion2: TLFDbedit
                Left = 78
                Top = 92
                Width = 412
                Height = 21
                DataField = 'DIR_NOMBRE_2'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 14
              end
              object DBETel01: TLFDbedit
                Left = 78
                Top = 4
                Width = 136
                Height = 21
                DataField = 'DIR_TELEFONO01'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 0
              end
              object DBETel02: TLFDbedit
                Left = 215
                Top = 4
                Width = 136
                Height = 21
                DataField = 'DIR_TELEFONO02'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 1
              end
              object DBEFax: TLFDbedit
                Left = 352
                Top = 4
                Width = 138
                Height = 21
                DataField = 'DIR_TELEFAX'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 2
              end
              object DBEFClaseDireccion: TLFDBEditFind2000
                Left = 168
                Top = 26
                Width = 40
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DIR_CLASE'
                DataSource = DMTerceros.DSQMDirecciones
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
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
                Left = 78
                Top = 424
                Width = 412
                Height = 31
                Anchors = [akLeft, akTop, akBottom]
                DataField = 'NOTAS'
                DataSource = DMTerceros.DSQMDirecciones
                ScrollBars = ssVertical
                TabOrder = 32
              end
              object DBECodigoEdiDireccion: TLFDbedit
                Left = 289
                Top = 270
                Width = 201
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CODIGO_EDI'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 24
              end
              object DBCBDefecto: TLFDBCheckBox
                Left = 79
                Top = 249
                Width = 60
                Height = 17
                Hint = 'Es la direcci'#243'n por defecto'
                Caption = 'Principal'
                ClicksDisabled = False
                Color = clBtnFace
                ColorCheck = 57088
                Enabled = False
                ParentColor = False
                ShowHint = True
                TabOrder = 19
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'DIR_DEFECTO'
                DataSource = DMTerceros.DSQMDirecciones
                ParentShowHint = False
                ReadOnly = True
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEFTransportistaDir: TLFDBEditFind2000
                Left = 78
                Top = 270
                Width = 55
                Height = 21
                DataField = 'DIR_TRANSPORTISTA'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 21
                OnChange = DBEFTransportistaDirChange
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
              object ETransportistaDirTitulo: TLFEdit
                Left = 134
                Top = 270
                Width = 107
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 22
              end
              object DBEDireccionesColonia: TLFDbedit
                Left = 78
                Top = 224
                Width = 412
                Height = 21
                DataField = 'COLONIA'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 18
              end
              object DBCBDirActiva: TLFDBCheckBox
                Left = 190
                Top = 249
                Width = 100
                Height = 17
                Hint = 'Esta la direcci'#243'n esta activa'
                Caption = 'Direcci'#243'n activa'
                AllowGrayed = True
                ClicksDisabled = False
                Color = clBtnFace
                ColorCheck = 57088
                ParentColor = False
                ShowHint = True
                TabOrder = 20
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ACTIVO'
                DataSource = DMTerceros.DSQMDirecciones
                ParentShowHint = False
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEIdForceManagerDrieccion: TLFDbedit
                Left = 78
                Top = 314
                Width = 229
                Height = 21
                DataField = 'ID_FORCEMANAGER'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 27
              end
              object EClaseDireccion: TLFEdit
                Left = 209
                Top = 26
                Width = 116
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 5
              end
              object DBEDireccionPais: TLFDBEditFind2000
                Left = 352
                Top = 26
                Width = 45
                Height = 21
                DataField = 'PAIS_DIRECCION'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 6
                OnChange = DBEDireccionPaisChange
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
              object EDireccionPais: TLFEdit
                Left = 398
                Top = 26
                Width = 92
                Height = 21
                Color = clInfoBk
                ReadOnly = True
                TabOrder = 7
              end
              object DBDireccionDireccionLiteral: TLFDBMemo
                Left = 499
                Top = 1
                Width = 643
                Height = 53
                Anchors = [akLeft, akTop, akRight]
                DataField = 'DIRECCION_LITERAL'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 33
                OnChange = DBDireccionDireccionLiteralChange
              end
              object DBEFBancoDireccion: TLFDBEditFind2000
                Left = 78
                Top = 292
                Width = 55
                Height = 21
                DataField = 'BANCO'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 25
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
                Left = 134
                Top = 292
                Width = 356
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 26
              end
              object PnlDirDireccion2: TPanel
                Left = 0
                Top = 136
                Width = 492
                Height = 88
                BevelOuter = bvNone
                TabOrder = 16
                object LDireccionesProvincia: TLFLabel
                  Left = 28
                  Top = 26
                  Width = 44
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Provincia'
                end
                object LDireccionRegion: TLFLabel
                  Left = 38
                  Top = 4
                  Width = 34
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Regi'#243'n'
                end
                object LDireccionPoblacion: TLFLabel
                  Left = 25
                  Top = 48
                  Width = 47
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Poblaci'#243'n'
                end
                object LDireccionCodigoPostal: TLFLabel
                  Left = 8
                  Top = 70
                  Width = 64
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Codigo postal'
                end
                object DBEDireccionRegion: TLFDBEditFind2000
                  Left = 78
                  Top = 0
                  Width = 55
                  Height = 21
                  DataField = 'REGION'
                  DataSource = DMTerceros.DSQMDirecciones
                  TabOrder = 0
                  OnChange = DBEDireccionRegionChange
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = False
                  Tabla_a_buscar = 'SYS_REGIONES'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'REGION'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OnBusqueda = DBEDireccionRegionBusqueda
                  Filtros = []
                end
                object DBEDireccionProvincia: TLFDBEditFind2000
                  Left = 78
                  Top = 22
                  Width = 55
                  Height = 21
                  DataField = 'PROVINCIA'
                  DataSource = DMTerceros.DSQMDirecciones
                  TabOrder = 2
                  OnChange = DBEDireccionProvinciaChange
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = False
                  Tabla_a_buscar = 'VER_PROVINCIAS'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'PROVINCIA'
                  CampoStr = 'PR_TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OnBusqueda = DBEDireccionProvinciaBusqueda
                  Filtros = []
                end
                object EDireccionRegion: TLFEdit
                  Left = 134
                  Top = 0
                  Width = 356
                  Height = 21
                  Color = clInfoBk
                  ReadOnly = True
                  TabOrder = 1
                end
                object EDireccionProvincia: TLFEdit
                  Left = 134
                  Top = 22
                  Width = 356
                  Height = 21
                  Color = clInfoBk
                  ReadOnly = True
                  TabOrder = 3
                end
                object DBEDireccionPoblacion: TLFDBEditFind2000
                  Left = 78
                  Top = 44
                  Width = 55
                  Height = 21
                  DataField = 'POBLACION'
                  DataSource = DMTerceros.DSQMDirecciones
                  TabOrder = 4
                  OnChange = DBEDireccionPoblacionChange
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = False
                  Tabla_a_buscar = 'SYS_POBLACION'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'POBLACION'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OnBusqueda = DBEDireccionPoblacionBusqueda
                  Filtros = []
                end
                object DBEDireccionCodigoPostal: TLFDBEditFind2000
                  Left = 78
                  Top = 66
                  Width = 55
                  Height = 21
                  Color = clSkyBlue
                  DataField = 'CODIGO_POSTAL'
                  DataSource = DMTerceros.DSQMDirecciones
                  TabOrder = 6
                  OnChange = DBEDireccionCodigoPostalChange
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = False
                  Tabla_a_buscar = 'SYS_CODIGOS_POSTALES'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'CODIGO_POSTAL'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OnBusqueda = DBEDireccionCodigoPostalBusqueda
                  Filtros = []
                end
                object EDireccionPoblacion: TLFEdit
                  Left = 134
                  Top = 44
                  Width = 356
                  Height = 21
                  Color = clInfoBk
                  ReadOnly = True
                  TabOrder = 5
                end
                object EDireccionCodigoPostal: TLFEdit
                  Left = 134
                  Top = 66
                  Width = 356
                  Height = 21
                  Color = clInfoBk
                  ReadOnly = True
                  TabOrder = 7
                end
              end
              object PnlDirDireccion: TPanel
                Left = 0
                Top = 136
                Width = 492
                Height = 88
                BevelOuter = bvNone
                TabOrder = 17
                object LDirDireccionesLocalidad: TLFLabel
                  Left = 27
                  Top = 4
                  Width = 46
                  Height = 13
                  Caption = 'Localidad'
                end
                object LDirDireccionesProvincia: TLFLabel
                  Left = 29
                  Top = 26
                  Width = 44
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Provincia'
                end
                object SBNuevaLocalidadDireccion: TSpeedButton
                  Left = 21
                  Top = 0
                  Width = 56
                  Height = 21
                  Hint = 'Crea una nueva localidad'
                  Caption = 'Nueva'
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = SBNuevaLocalidadDireccionClick
                end
                object DBE_D_CodLocalidad: TLFDBEditFind2000
                  Left = 78
                  Top = 0
                  Width = 78
                  Height = 21
                  DataField = 'DIR_LOCALIDAD'
                  DataSource = DMTerceros.DSQMDirecciones
                  TabOrder = 0
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
                object DBE_D_TituloLocalidad: TLFDbedit
                  Left = 157
                  Top = 0
                  Width = 174
                  Height = 21
                  Color = clInfoBk
                  DataField = 'TITULO'
                  DataSource = DMTerceros.DSxLoc_D
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object DBE_D_CPLocalidad: TLFDbedit
                  Left = 332
                  Top = 0
                  Width = 158
                  Height = 21
                  Color = clInfoBk
                  DataField = 'CODPOSTAL'
                  DataSource = DMTerceros.DSxLoc_D
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
                object DBE_D_Provincia: TLFDbedit
                  Left = 78
                  Top = 22
                  Width = 217
                  Height = 21
                  Color = clInfoBk
                  DataField = 'PROVINCIA'
                  DataSource = DMTerceros.DSxLoc_D
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object DBE_D_Pais: TLFDbedit
                  Left = 296
                  Top = 22
                  Width = 194
                  Height = 21
                  Color = clInfoBk
                  DataField = 'PAIS'
                  DataSource = DMTerceros.DSxLoc_D
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
              end
              object TButtTransportistaSegunCP: TButton
                Left = 216
                Top = 272
                Width = 23
                Height = 18
                Hint = 'Selecciona transportista segun codigo postal'
                Caption = '...'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 23
                Visible = False
              end
              object DBE_D_Direccion3: TLFDbedit
                Left = 78
                Top = 114
                Width = 412
                Height = 21
                DataField = 'DIR_NOMBRE_3'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 15
              end
              object DBEHorario: TLFDbedit
                Left = 78
                Top = 336
                Width = 412
                Height = 21
                DataField = 'HORARIO'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 28
              end
              object DBEMedios: TLFDbedit
                Left = 78
                Top = 358
                Width = 412
                Height = 21
                DataField = 'MEDIOS'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 29
              end
              object DBEDirCorreo: TLFDbedit
                Left = 78
                Top = 380
                Width = 412
                Height = 21
                DataField = 'DIR_CORREO'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 30
              end
              object DBEDirContacto: TLFDbedit
                Left = 78
                Top = 402
                Width = 412
                Height = 21
                DataField = 'DIR_CONTACTO'
                DataSource = DMTerceros.DSQMDirecciones
                TabOrder = 31
              end
            end
            object PnlDireccionLocalizacion: TLFPanel
              Left = 499
              Top = 55
              Width = 643
              Height = 397
              Anchors = [akLeft, akTop, akRight, akBottom]
              BevelOuter = bvNone
              TabOrder = 1
              object LTituloDireccionSinMapa: TLFLabel
                Left = 0
                Top = 377
                Width = 643
                Height = 20
                Align = alBottom
                Alignment = taCenter
                AutoSize = False
                Caption = 'Localizacion desactivada o no disponible'
                Layout = tlCenter
              end
              object ImgMapaDireccion: TImage
                Left = 0
                Top = 0
                Width = 643
                Height = 377
                Align = alClient
                AutoSize = True
                IncrementalDisplay = True
                Proportional = True
              end
            end
          end
          object TSDi_Tabla: TTabSheet
            Caption = 'T&abla'
            ImageIndex = 1
            object DBG_Direcciones: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1147
              Height = 459
              Align = alClient
              Color = clInfoBk
              DataSource = DMTerceros.DSQMDirecciones
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
              CamposAOrdenar.Strings = (
                'DIR_LOCALIDAD')
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
                  FieldName = 'TITULO_COD_POSTAL'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_PAIS'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_POBLACION'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_PROVINCIA'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIT_PROVINCIA_LOC'
                  Width = 150
                  Visible = True
                end>
            end
          end
        end
        object TBDirecciones: TLFToolBar
          Left = 0
          Top = 638
          Width = 1155
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
            DataSource = DMTerceros.DSQMDirecciones
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDireccionesPMEdit
            ShowHint = True
            TabOrder = 0
            OnClick = NavDireccionesClick
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
        object DBDireccionContactos: THYTDBGrid
          Left = 504
          Top = 31
          Width = 645
          Height = 115
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataSource = DMTerceros.DSxContactosDireccion
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
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
          PermutaPaneles = False
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 169
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APELLIDOS'
              Width = 219
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONO'
              Width = 101
              Visible = True
            end>
        end
      end
      object TSNotas: TTabSheet [2]
        Caption = '&Notas'
        ImageIndex = 3
        OnShow = TSNotasShow
        object TBInfo: TLFToolBar
          Left = 0
          Top = 0
          Width = 1155
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
              DataSource = DMTerceros.DSQMTerceros
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
              DataSource = DMTerceros.DSQMTerceros
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
            DataSource = DMTerceros.DSQMTerceros
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
          Width = 1155
          Height = 638
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMINfo: TLFDBMemo
            Left = 0
            Top = 0
            Width = 1155
            Height = 638
            Align = alClient
            BevelInner = bvNone
            DataField = 'NOTAS'
            DataSource = DMTerceros.DSQMTerceros
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
          Width = 1155
          Height = 105
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LContactoTercero: TLFLabel
            Left = 69
            Top = 18
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LTerNComercial: TLabel
            Left = 19
            Top = 40
            Width = 85
            Height = 13
            Caption = 'Nombre comercial'
          end
          object LContRSocial: TLabel
            Left = 43
            Top = 62
            Width = 61
            Height = 13
            Caption = 'Raz'#243'n social'
          end
          object LContPais: TLabel
            Left = 548
            Top = 18
            Width = 20
            Height = 13
            Caption = 'Pais'
          end
          object LContEmail: TLabel
            Left = 541
            Top = 40
            Width = 28
            Height = 13
            Caption = 'E-mail'
          end
          object LContWeb: TLabel
            Left = 545
            Top = 62
            Width = 23
            Height = 13
            Caption = 'Web'
          end
          object DBE_C_InfoCod: TLFDbedit
            Left = 110
            Top = 14
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TERCERO'
            DataSource = DMTerceros.DSQMTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEContNombreComercial: TLFDbedit
            Left = 110
            Top = 36
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_COMERCIAL'
            DataSource = DMTerceros.DSQMTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEContRazonSocail: TLFDbedit
            Left = 110
            Top = 58
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMTerceros.DSQMTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBContPais: TLFDbedit
            Left = 572
            Top = 14
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'PAIS_TERCERO'
            DataSource = DMTerceros.DSQMTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            OnChange = DBContPaisChange
          end
          object DBEContEmail: TLFFibDBEditFind
            Left = 572
            Top = 36
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'EMAIL'
            DataSource = DMTerceros.DSQMTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            AutoCambiarFoco = False
            BuscarNums = False
            Tabla_asociada.DesplegarBusqueda = False
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
          end
          object DBEContWeb: TLFFibDBEditFind
            Left = 572
            Top = 58
            Width = 400
            Height = 21
            Color = clInfoBk
            DataField = 'WEB'
            DataSource = DMTerceros.DSQMTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            AutoCambiarFoco = False
            BuscarNums = False
            Tabla_asociada.DesplegarBusqueda = False
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
          end
          object EContTituloPais: TLFEdit
            Left = 637
            Top = 14
            Width = 335
            Height = 21
            Color = clInfoBk
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
        object PCContactos: TLFPageControl
          Left = 0
          Top = 105
          Width = 1155
          Height = 533
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
              Width = 1147
              Height = 507
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              DesignSize = (
                1147
                507)
              object LContactoNombre: TLFLabel
                Left = 64
                Top = 36
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Nombre'
                FocusControl = DBE_C_Nombre
              end
              object LContactoApellidos: TLFLabel
                Left = 59
                Top = 58
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Apellidos'
                FocusControl = DBE_C_Apellidos
              end
              object LContactoTelefono: TLFLabel
                Left = 59
                Top = 80
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tel'#233'fono'
                FocusControl = DBE_C_Telefono
              end
              object LContactoFAX: TLFLabel
                Left = 66
                Top = 124
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Telefax'
                FocusControl = DBE_C_TeleFax
              end
              object LContactoExtension: TLFLabel
                Left = 248
                Top = 80
                Width = 18
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ext.'
                FocusControl = DBE_C_Extension
              end
              object LContactoEmail: TLFLabel
                Left = 74
                Top = 146
                Width = 27
                Height = 13
                Alignment = taRightJustify
                Caption = 'e-mail'
                FocusControl = DBE_C_Email
              end
              object LContactoContacto: TLFLabel
                Left = 58
                Top = 14
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Contacto'
              end
              object LContactoMovil: TLFLabel
                Left = 76
                Top = 102
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'M'#243'vil'
                FocusControl = DBE_C_Telefono
              end
              object LFLAgenteKri: TLFLabel
                Left = 67
                Top = 168
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Agente'
              end
              object LContactoZona: TLFLabel
                Left = 76
                Top = 210
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Zona'
                FocusControl = LFDBEZona
              end
              object LContactoDireccion: TLFLabel
                Left = 56
                Top = 190
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Direccion'
              end
              object LContactoPadre: TLFLabel
                Left = 27
                Top = 234
                Width = 74
                Height = 13
                Alignment = taRightJustify
                Caption = 'Contacto Padre'
              end
              object LDepartamento: TLFLabel
                Left = 34
                Top = 256
                Width = 67
                Height = 13
                Alignment = taRightJustify
                Caption = 'Departamento'
              end
              object LIdForceManager: TLFLabel
                Left = 20
                Top = 276
                Width = 81
                Height = 13
                Alignment = taRightJustify
                Caption = 'Id ForceManager'
                FocusControl = DBEIdForceManager
              end
              object LContNotas: TLFLabel
                Left = 535
                Top = 14
                Width = 28
                Height = 13
                Caption = 'Notas'
              end
              object LIdUsuarioWeb: TLFLabel
                Left = 27
                Top = 300
                Width = 74
                Height = 13
                Alignment = taRightJustify
                Caption = 'Id Usuario Web'
                FocusControl = DBEIdUsuarioWeb
              end
              object DBE_C_Nombre: TLFDbedit
                Left = 106
                Top = 32
                Width = 400
                Height = 21
                DataField = 'NOMBRE'
                DataSource = DMTerceros.DSQMContactos
                TabOrder = 0
              end
              object DBE_C_Apellidos: TLFDbedit
                Left = 106
                Top = 54
                Width = 400
                Height = 21
                DataField = 'APELLIDOS'
                DataSource = DMTerceros.DSQMContactos
                TabOrder = 1
              end
              object DBE_C_Telefono: TLFDbedit
                Left = 106
                Top = 76
                Width = 129
                Height = 21
                DataField = 'TELEFONO'
                DataSource = DMTerceros.DSQMContactos
                TabOrder = 2
              end
              object DBE_C_TeleFax: TLFDbedit
                Left = 106
                Top = 120
                Width = 129
                Height = 21
                DataField = 'FAX'
                DataSource = DMTerceros.DSQMContactos
                TabOrder = 5
              end
              object DBE_C_Extension: TLFDbedit
                Left = 271
                Top = 76
                Width = 49
                Height = 21
                DataField = 'EXTENSION'
                DataSource = DMTerceros.DSQMContactos
                TabOrder = 3
              end
              object DBE_C_Email: TLFDbedit
                Left = 106
                Top = 142
                Width = 400
                Height = 21
                DataField = 'CORREO'
                DataSource = DMTerceros.DSQMContactos
                TabOrder = 6
              end
              object DBM_Co_Notas: TLFDBMemo
                Left = 534
                Top = 32
                Width = 603
                Height = 464
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataField = 'NOTAS'
                DataSource = DMTerceros.DSQMContactos
                TabOrder = 14
              end
              object DBE_C_Contacto: TLFDbedit
                Left = 106
                Top = 10
                Width = 87
                Height = 21
                CharCase = ecUpperCase
                Color = clInfoBk
                DataField = 'CONTACTO'
                DataSource = DMTerceros.DSQMContactos
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
                Top = 98
                Width = 129
                Height = 21
                DataField = 'MOVIL'
                DataSource = DMTerceros.DSQMContactos
                TabOrder = 4
              end
              object LFDBEAgenteKri: TLFDBEditFind2000
                Left = 106
                Top = 164
                Width = 64
                Height = 21
                AutoSize = False
                DataField = 'AGENTE'
                DataSource = DMTerceros.DSQMContactos
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
                Top = 164
                Width = 335
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
                Top = 208
                Width = 64
                Height = 21
                DataField = 'ZONA'
                DataSource = DMTerceros.DSQMContactos
                TabOrder = 9
              end
              object DBEFDireccion: TLFDBEditFind2000
                Left = 106
                Top = 186
                Width = 64
                Height = 21
                AutoSize = False
                DataField = 'DIRECCION'
                DataSource = DMTerceros.DSQMContactos
                TabOrder = 8
                OnChange = DBEFDireccionChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_TERCEROS_DIRECCION'
                Tabla_asociada.DesplegarBusqueda = False
                Campos_Desplegar.Strings = (
                  'TITULO_POBLACION'
                  'TITULO_PROVINCIA')
                CampoNum = 'DIRECCION'
                CampoStr = 'DIR_COMPLETA'
                ReemplazarCaracter = True
                SalirSiNoExiste = True
                SalirSiVacio = True
                OnBusqueda = DBEFDireccionBusqueda
                OrdenadoPor.Strings = (
                  'DIRECCION')
                Filtros = []
                Entorno = DMMain.EntornoBusqueda
              end
              object EDireccion: TLFEdit
                Left = 171
                Top = 186
                Width = 335
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
                Top = 230
                Width = 335
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
                Top = 230
                Width = 64
                Height = 21
                AutoSize = False
                DataField = 'PADRE'
                DataSource = DMTerceros.DSQMContactos
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
                Top = 252
                Width = 335
                Height = 21
                Color = clInfoBk
                Enabled = False
                ReadOnly = True
                TabOrder = 19
              end
              object DBEDepartamento: TLFDBEditFind2000
                Left = 106
                Top = 252
                Width = 64
                Height = 21
                DataField = 'DEPARTAMENTO'
                DataSource = DMTerceros.DSQMContactos
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
                Top = 274
                Width = 111
                Height = 21
                DataField = 'ID_FORCEMANAGER'
                DataSource = DMTerceros.DSQMContactos
                TabOrder = 12
              end
              object GBEmailVentas: TGroupBox
                Left = 54
                Top = 326
                Width = 445
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
                  DataSource = DMTerceros.DSQMContactos
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
                  DataSource = DMTerceros.DSQMContactos
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
                  DataSource = DMTerceros.DSQMContactos
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
                  DataSource = DMTerceros.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
              object GBEmailCompras: TGroupBox
                Left = 54
                Top = 374
                Width = 445
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
                  DataSource = DMTerceros.DSQMContactos
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
                  DataSource = DMTerceros.DSQMContactos
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
                  DataSource = DMTerceros.DSQMContactos
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
                  DataSource = DMTerceros.DSQMContactos
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
                  DataSource = DMTerceros.DSQMContactos
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
                  DataSource = DMTerceros.DSQMContactos
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
              object DBEIdUsuarioWeb: TLFDbedit
                Left = 106
                Top = 296
                Width = 111
                Height = 21
                DataField = 'ID_USUARIO_WEB'
                DataSource = DMTerceros.DSQMContactos
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
              Width = 1147
              Height = 507
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
            object DBG_Contactos: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1147
              Height = 476
              Align = alClient
              Color = clInfoBk
              DataSource = DMTerceros.DSQMContactos
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
                'EMAIL_PEP'
                'USUARIO_WEB')
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
                end
                item
                  Expanded = False
                  FieldName = 'USUARIO_WEB'
                  Visible = True
                end>
            end
          end
        end
        object TB_C_Main: TLFToolBar
          Left = 0
          Top = 638
          Width = 1155
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
            DataSource = DMTerceros.DSQMContactos
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
          Top = 637
          Width = 1155
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
            DataSource = DMTerceros.DSQMBancos
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
          Width = 1155
          Height = 615
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
              Width = 1147
              Height = 589
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              DesignSize = (
                1147
                589)
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
                Left = 431
                Top = 186
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
                Top = 248
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Firma'
              end
              object LFechaFirmaSEPA: TLFLabel
                Left = 325
                Top = 247
                Width = 58
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Firma'
              end
              object LTipoCuenta: TLFLabel
                Left = 28
                Top = 137
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
                DataSource = DMTerceros.DSQMBancos
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
                DataSource = DMTerceros.DSQMBancos
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
                DataSource = DMTerceros.DSQMBancos
                TabOrder = 8
                OnChange = DBEFEntidadChange
              end
              object DBM_B_Notas: TLFDBMemo
                Left = 516
                Top = 2
                Width = 629
                Height = 582
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataField = 'NOTAS'
                DataSource = DMTerceros.DSQMBancos
                TabOrder = 20
              end
              object DBE_B_TitEntidad: TLFDbedit
                Left = 152
                Top = 46
                Width = 357
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMTerceros.DSxBancos
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
                DataSource = DMTerceros.DSQMBancos
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
                DataSource = DMTerceros.DSQMBancos
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
                DataSource = DMTerceros.DSQMBancos
                TabOrder = 7
                OnChange = DBEFEntidadChange
              end
              object DBCBActiva: TLFDBCheckBox
                Left = 440
                Top = 163
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
                DataSource = DMTerceros.DSQMBancos
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBRG_B_Uso: TDBRadioGroup
                Left = 104
                Top = 155
                Width = 127
                Height = 85
                Caption = 'Uso'
                DataField = 'MODO'
                DataSource = DMTerceros.DSQMBancos
                Items.Strings = (
                  'Compras y Ventas'
                  'S'#243'lo Compras'
                  'S'#243'lo Ventas')
                TabOrder = 13
                Values.Strings = (
                  '0'
                  '1'
                  '2')
              end
              object DBSE_B_Orden: TDBSpinEdit
                Left = 464
                Top = 183
                Width = 45
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 15
                Value = 3
                OnChange = DBSE_B_OrdenChange
                DataField = 'ORDEN'
                DataSource = DMTerceros.DSQMBancos
              end
              object DBEBIC: TLFDbedit
                Tag = 2
                Left = 106
                Top = 112
                Width = 255
                Height = 21
                DataField = 'BIC'
                DataSource = DMTerceros.DSQMBancos
                TabOrder = 10
              end
              object DBEIBAN: TLFDbedit
                Tag = 2
                Left = 106
                Top = 90
                Width = 255
                Height = 21
                DataField = 'IBAN'
                DataSource = DMTerceros.DSQMBancos
                TabOrder = 9
                OnChange = DBEIBANChange
                OnEnter = DBEIBANEnter
              end
              object DBEFirmaSEPA: TLFDbedit
                Left = 106
                Top = 244
                Width = 135
                Height = 21
                DataField = 'FIRMA'
                DataSource = DMTerceros.DSQMBancos
                TabOrder = 16
              end
              object DBDEFechaFirmaSEPA: TLFDBDateEdit
                Left = 388
                Top = 244
                Width = 121
                Height = 21
                DataField = 'FECHA_FIRMA'
                DataSource = DMTerceros.DSQMBancos
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 17
              end
              object DBRGTipoAdeudo: TDBRadioGroup
                Left = 106
                Top = 266
                Width = 403
                Height = 36
                Hint = 
                  #218'nico - Autorizacion '#250'nico recibo'#13#10'Primero - Primer recibo de au' +
                  'torizacion recurrente'#13#10'Recurrente - Autorizaci'#243'n recurrente'#13#10'Fin' +
                  'al - '#218'ltimo recibo de autorizaci'#243'n recurrente'
                Caption = 'Tipo Adeudo'
                Columns = 5
                DataField = 'TIPO_ADEUDO_SEPA'
                DataSource = DMTerceros.DSQMBancos
                Items.Strings = (
                  'Ninguno'
                  #218'nico'
                  'Primero'
                  'Recurrente'
                  'Final')
                ParentShowHint = False
                ShowHint = True
                TabOrder = 18
                Values.Strings = (
                  'NONE'
                  'OOFF'
                  'FRST'
                  'RCUR'
                  'FNAL')
              end
              object DBRGTipoContrato: TDBRadioGroup
                Left = 106
                Top = 302
                Width = 403
                Height = 36
                Caption = 'Tipo Contrato'
                Columns = 5
                DataField = 'TIPO_CONTRATO_SEPA'
                DataSource = DMTerceros.DSQMBancos
                Items.Strings = (
                  'Ninguno'
                  'CORE'
                  'COR1'
                  'B2B')
                TabOrder = 19
                Values.Strings = (
                  'NONE'
                  'CORE'
                  'COR1'
                  'B2B')
              end
              object DBEFTipoCuenta: TLFDBEditFind2000
                Tag = 4
                Left = 106
                Top = 134
                Width = 45
                Height = 21
                DataField = 'TIPO_CUENTA'
                DataSource = DMTerceros.DSQMBancos
                TabOrder = 11
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
                Left = 152
                Top = 134
                Width = 357
                Height = 21
                Color = clInfoBk
                Enabled = False
                ReadOnly = True
                TabOrder = 12
              end
              object DBEFPaisBanco: TLFDBEditFind2000
                Tag = 4
                Left = 106
                Top = 24
                Width = 45
                Height = 21
                DataField = 'PAIS'
                DataSource = DMTerceros.DSQMBancos
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
                TabOrder = 21
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
              DataSource = DMTerceros.DSQMBancos
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
          Width = 1155
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
            DataSource = DMTerceros.DSQMTerceros
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
            DataSource = DMTerceros.DSQMTerceros
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
          Width = 1155
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
              DataSource = DMTerceros.DSQMTerceros
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
              DataSource = DMTerceros.DSQMTerceros
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
            DataSource = DMTerceros.DSQMTerceros
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
          Width = 1155
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
            DataSource = DMTerceros.DSQMTerceros
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
            Left = 478
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
          Width = 1155
          Height = 595
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
            Width = 1155
            Height = 595
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
          Width = 1155
          Height = 660
          Align = alClient
          DataSource = DMTerceros.DSxEmails
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
          Width = 1155
          Height = 660
          OnColEnter = DBGMainColEnter
          OnKeyUp = DBGMainKeyUp
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CARNET_APLICADOR'
            'CODIGO_EDI'
            'CODIGO_POSTAL'
            'COLONIA'
            'DIR_LOCALIDAD'
            'DIR_NOMBRE'
            'DIR_NOMBRE_2'
            'DIR_NOMBRE_3'
            'DIR_TRANSPORTISTA'
            'DIRECCION_CODIGO_POSTAL'
            'DIRECCION_LITERAL'
            'EMAIL'
            'FECHA_ALTA'
            'FECHA_NACIMIENTO'
            'FECHA_VALIDEZ_CARNET_APLICADOR'
            'NIF'
            'NOMBRE_COMERCIAL'
            'NOMBRE_R_SOCIAL'
            'POBLACION_DIRECCION'
            'PROVINCIA_DIRECCION'
            'REGION_DIRECCION'
            'REGISTRO_MERCANTIL'
            'TELEFAX'
            'TELEFONO01'
            'TELEFONO02'
            'TERCERO'
            'TIPO_DOC_IDENT'
            'TIPO_RAZON'
            'TIT_LOCALIDAD'
            'TITULO_CODIGO_POSTAL'
            'TITULO_POBLACION'
            'TITULO_PROVINCIA'
            'TITULO_REGION'
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
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 718
    Width = 1167
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDirecciones
    Left = 1040
    Top = 96
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 1072
    Top = 96
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 1040
    Top = 64
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
      DataSource = DMTerceros.DSQMDirecciones
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
      DataSource = DMTerceros.DSQMDirecciones
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
    object AEmpleado: TAction
      Category = 'Otros'
      Caption = 'Empleado'
      HelpKeyword = 'Genera un Empleado con los datos del Tercero'
      ImageIndex = 54
      OnExecute = AEmpleadoExecute
    end
    object ACRM: TAction
      Category = 'Otros'
      Caption = 'CRM'
      HelpKeyword = 'Genera un Contacto CRM con los datos del Tercero'
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
    object ABuscaDatosDireccion: TAction
      Category = 'Otros'
      Caption = 'ABuscaDatosDireccion'
      ImageIndex = 63
    end
    object AEmpresasChile: TAction
      Category = 'Otros'
      Caption = 'Empresas Chile'
      Hint = 'Empresas Chile'
      ImageIndex = 21
      OnExecute = AEmpresasChileExecute
    end
    object AActualizaCasillaDteDesdeCsv: TAction
      Category = 'Otros'
      Caption = 'Actualiza Casilla Dte Desde Csv'
      ImageIndex = 21
      OnExecute = AActualizaCasillaDteDesdeCsvExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBVerMapa.Checked')
    Left = 1072
    Top = 64
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
    Left = 1040
    Top = 128
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
    Left = 1040
    Top = 192
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
    Left = 1040
    Top = 224
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
    Left = 1040
    Top = 160
  end
  object CEInfoPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 1072
    Top = 160
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
    Left = 1072
    Top = 192
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
    Left = 1072
    Top = 128
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
    Left = 1072
    Top = 224
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
    Left = 1040
    Top = 256
  end
  object CEImagenesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 1072
    Top = 256
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
  object PMNet2Phone: TPopupMenu
    AutoHotkeys = maManual
    Left = 1120
    Top = 64
  end
  object TMRReferescoMapa: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TMRReferescoMapaTimer
    Left = 1040
    Top = 288
  end
end
