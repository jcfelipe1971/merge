inherited FMInfoTercero: TFMInfoTercero
  Left = 444
  Top = 252
  HelpContext = 1301
  Caption = 'Informaci'#243'n'
  ClientHeight = 373
  ClientWidth = 504
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 349
    inherited TBMain: TLFToolBar
      Width = 500
      EdgeBorders = [ebBottom]
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 500
      Height = 319
      ActivePage = TSFicha
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFicha: TTabSheet
        Caption = 'Ficha'
        object PEdit: TLFPanel
          Left = 0
          Top = 0
          Width = 492
          Height = 291
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LBLTercero: TLFLabel
            Left = 35
            Top = 13
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
            FocusControl = DBETercero
          end
          object LBLNombre: TLFLabel
            Left = 35
            Top = 57
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
            FocusControl = DBENombre
          end
          object LBLNIF: TLFLabel
            Left = 10
            Top = 79
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'C.I.F. / N.I.F.'
            FocusControl = DBECif
          end
          object LBLDireccion: TLFLabel
            Left = 27
            Top = 141
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object LBLLocalidad: TLFLabel
            Left = 26
            Top = 162
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Localidad'
          end
          object LBLTelefono: TLFLabel
            Left = 25
            Top = 205
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tel'#233'fonos'
            FocusControl = DBETelefono1
          end
          object LBLEMail: TLFLabel
            Left = 45
            Top = 227
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'e-mail'
            FocusControl = DBEEmail
          end
          object LBLWeb: TLFLabel
            Left = 49
            Top = 249
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Web'
            FocusControl = DBEWeb
          end
          object LBLProvincia: TLFLabel
            Left = 28
            Top = 183
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Provincia'
          end
          object LBLFax: TLFLabel
            Left = 338
            Top = 205
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fax'
            FocusControl = DBETelefono1
          end
          object LBLNum: TLFLabel
            Left = 342
            Top = 121
            Width = 22
            Height = 13
            Caption = 'N'#250'm'
          end
          object LBLBloqEsc: TLFLabel
            Left = 375
            Top = 121
            Width = 44
            Height = 13
            Caption = 'Bloq/Esc'
          end
          object LBLPiso: TLFLabel
            Left = 426
            Top = 121
            Width = 20
            Height = 13
            Caption = 'Piso'
          end
          object LBLFechaAlta: TLFLabel
            Left = 21
            Top = 270
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Alta'
            FocusControl = DBEWeb
          end
          object LBLPta: TLFLabel
            Left = 458
            Top = 121
            Width = 19
            Height = 13
            Caption = 'Pta.'
          end
          object LBLNComercial: TLFLabel
            Left = 12
            Top = 35
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'N. Comercial'
          end
          object DBT_TipDir_T: TDBText
            Left = 266
            Top = 122
            Width = 69
            Height = 13
            AutoSize = True
            Color = clBtnFace
            DataField = 'TITULO'
            DataSource = DMInfoTercero.DSxTipDir_T
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object LClase: TLFLabel
            Left = 46
            Top = 103
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clase'
          end
          object LBLDireccion2: TLFLabel
            Left = 113
            Top = 101
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cabecera'
          end
          object DBT_ClasDir_T: TDBText
            Left = 266
            Top = 81
            Width = 74
            Height = 13
            AutoSize = True
            Color = clBtnFace
            DataField = 'TITULO'
            DataSource = DMInfoTercero.DSxClasDir_T
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object DBETercero: TLFDbedit
            Left = 76
            Top = 9
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TERCERO'
            DataSource = DMInfoTercero.DSxTercero
            Enabled = False
            TabOrder = 0
          end
          object DBENombre: TLFDbedit
            Left = 76
            Top = 53
            Width = 405
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMInfoTercero.DSxTercero
            Enabled = False
            TabOrder = 3
          end
          object DBECif: TLFDbedit
            Left = 76
            Top = 75
            Width = 129
            Height = 21
            Color = clInfoBk
            DataField = 'NIF'
            DataSource = DMInfoTercero.DSxTercero
            Enabled = False
            TabOrder = 4
          end
          object DBETelefono1: TLFDbedit
            Left = 76
            Top = 202
            Width = 111
            Height = 21
            Color = clInfoBk
            DataField = 'TELEFONO01'
            DataSource = DMInfoTercero.DSxTercero
            Enabled = False
            TabOrder = 15
          end
          object DBETelefono2: TLFDbedit
            Left = 188
            Top = 202
            Width = 111
            Height = 21
            Color = clInfoBk
            DataField = 'TELEFONO02'
            DataSource = DMInfoTercero.DSxTercero
            Enabled = False
            TabOrder = 16
          end
          object DBETelefax: TLFDbedit
            Left = 360
            Top = 202
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'TELEFAX'
            DataSource = DMInfoTercero.DSxTercero
            Enabled = False
            TabOrder = 17
          end
          object DBEEmail: TLFDbedit
            Left = 76
            Top = 224
            Width = 405
            Height = 21
            Color = clInfoBk
            DataField = 'EMAIL'
            DataSource = DMInfoTercero.DSxTercero
            Enabled = False
            TabOrder = 18
          end
          object DBEWeb: TLFDbedit
            Left = 76
            Top = 246
            Width = 405
            Height = 21
            Color = clInfoBk
            DataField = 'WEB'
            DataSource = DMInfoTercero.DSxTercero
            Enabled = False
            TabOrder = 19
          end
          object DBELocalidadNombre: TLFDbedit
            Left = 154
            Top = 158
            Width = 183
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMInfoTercero.DSxLocalidad
            Enabled = False
            TabOrder = 11
          end
          object DBECpostal: TLFDbedit
            Left = 338
            Top = 158
            Width = 143
            Height = 21
            Color = clInfoBk
            DataField = 'CODPOSTAL'
            DataSource = DMInfoTercero.DSxLocalidad
            Enabled = False
            TabOrder = 12
          end
          object DBEProvincia: TLFDbedit
            Left = 76
            Top = 180
            Width = 149
            Height = 21
            Color = clInfoBk
            DataField = 'PROVINCIA'
            DataSource = DMInfoTercero.DSxLocalidad
            Enabled = False
            TabOrder = 13
          end
          object DBEPais: TLFDbedit
            Left = 226
            Top = 180
            Width = 255
            Height = 21
            Color = clInfoBk
            DataField = 'PAIS'
            DataSource = DMInfoTercero.DSxLocalidad
            Enabled = False
            TabOrder = 14
          end
          object DBEFLocalidad: TLFDBEditFind2000
            Left = 76
            Top = 158
            Width = 77
            Height = 21
            Color = clInfoBk
            DataField = 'DIR_LOCALIDAD'
            DataSource = DMInfoTercero.DSxDireccionPrincipal
            Enabled = False
            TabOrder = 10
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_LOCALIDADES                '
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'provincia'
              'pais')
            CampoNum = 'CODIGO_POSTAL'
            CampoStr = 'TITULO'
            CampoADevolver = 'LOCALIDAD'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            Filtros = []
          end
          object DBE_TitRazones: TLFDbedit
            Left = 276
            Top = 9
            Width = 205
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMInfoTercero.DSxTituloRazon
            Enabled = False
            TabOrder = 1
          end
          object DBEDirNombre: TLFDbedit
            Left = 116
            Top = 136
            Width = 221
            Height = 21
            Color = clInfoBk
            DataField = 'DIR_NOMBRE'
            DataSource = DMInfoTercero.DSxDireccionPrincipal
            Enabled = False
            TabOrder = 6
          end
          object DBEDirBloqEsc: TLFDbedit
            Left = 372
            Top = 136
            Width = 51
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'DIR_BLOQUE_ESCALERA'
            DataSource = DMInfoTercero.DSxDireccionPrincipal
            Enabled = False
            TabOrder = 8
          end
          object DBEDirPiso: TLFDbedit
            Left = 424
            Top = 136
            Width = 28
            Height = 21
            Color = clInfoBk
            DataField = 'DIR_PISO'
            DataSource = DMInfoTercero.DSxDireccionPrincipal
            Enabled = False
            TabOrder = 9
          end
          object DBEDirNumero: TLFDbedit
            Left = 338
            Top = 136
            Width = 33
            Height = 21
            Color = clInfoBk
            DataField = 'DIR_NUMERO'
            DataSource = DMInfoTercero.DSxDireccionPrincipal
            Enabled = False
            TabOrder = 7
          end
          object DBEInfoAlta: TLFDbedit
            Left = 76
            Top = 268
            Width = 114
            Height = 21
            Color = clInfoBk
            DataField = 'FECHA_ALTA'
            DataSource = DMInfoTercero.DSxTercero
            Enabled = False
            TabOrder = 20
          end
          object DBETipoDir: TLFDBEditFind2000
            Left = 76
            Top = 136
            Width = 39
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'DIR_TIPO'
            DataSource = DMInfoTercero.DSxDireccionPrincipal
            Enabled = False
            TabOrder = 5
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
            SalirSiVacio = True
            Filtros = []
          end
          object DBEPuerta: TLFDbedit
            Left = 453
            Top = 136
            Width = 28
            Height = 21
            Color = clInfoBk
            DataField = 'DIR_PUERTA'
            DataSource = DMInfoTercero.DSxDireccionPrincipal
            Enabled = False
            TabOrder = 21
          end
          object DBENComercial: TLFDbedit
            Left = 76
            Top = 31
            Width = 405
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_COMERCIAL'
            DataSource = DMInfoTercero.DSxTercero
            Enabled = False
            TabOrder = 2
          end
          object DBEClaseDir: TLFDBEditFind2000
            Left = 76
            Top = 97
            Width = 29
            Height = 21
            Color = clInfoBk
            DataField = 'DIR_CLASE'
            DataSource = DMInfoTercero.DSxDireccionPrincipal
            TabOrder = 22
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_CLASE_DIRECCION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLASE'
            CampoStr = 'TITULO'
            CampoADevolver = 'CLASE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEDireccion2: TLFDbedit
            Left = 163
            Top = 97
            Width = 317
            Height = 21
            Color = clInfoBk
            DataField = 'DIR_NOMBRE_2'
            DataSource = DMInfoTercero.DSxDireccionPrincipal
            Enabled = False
            TabOrder = 23
          end
        end
      end
      object TSInformacion: TTabSheet
        Caption = 'Informaci'#243'n'
        object PCabeceraInfo: TLFPanel
          Left = 0
          Top = 0
          Width = 492
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object DBTTerceroInfo: TDBText
            Left = 32
            Top = 8
            Width = 77
            Height = 13
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'TERCERO'
            DataSource = DMInfoTercero.DSxTercero
          end
          object DBTTituloInfo: TDBText
            Left = 116
            Top = 8
            Width = 66
            Height = 13
            AutoSize = True
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMInfoTercero.DSxTercero
          end
        end
        object DBMMNotas: TLFDBMemo
          Left = 0
          Top = 29
          Width = 492
          Height = 262
          Align = alClient
          Color = clInfoBk
          DataField = 'NOTAS'
          DataSource = DMInfoTercero.DSxTercero
          ReadOnly = True
          TabOrder = 1
        end
      end
      object TSDirecciones: TTabSheet
        Caption = 'Direcciones'
        ImageIndex = 2
        object PNLDirecciones: TLFPanel
          Left = 0
          Top = 0
          Width = 492
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object DBTTerceroDir: TDBText
            Left = 36
            Top = 8
            Width = 72
            Height = 13
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'TERCERO'
            DataSource = DMInfoTercero.DSxTercero
          end
          object DBTTituloDir: TDBText
            Left = 116
            Top = 8
            Width = 61
            Height = 13
            AutoSize = True
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMInfoTercero.DSxTercero
          end
        end
        object DBGDirecciones: TDBGrid
          Left = 0
          Top = 29
          Width = 492
          Height = 262
          Align = alClient
          Color = clInfoBk
          DataSource = DMInfoTercero.DSxDirecciones
          Options = [dgTitles, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DIR_CLASE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIR_NOMBRE_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIR_COMPLETA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIR_LOCALIDAD'
              Width = 123
              Visible = True
            end>
        end
      end
      object TSContactos: TTabSheet
        Caption = 'Contactos'
        ImageIndex = 1
        object PNLContactos: TLFPanel
          Left = 0
          Top = 0
          Width = 492
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object DBTTerceroContactos: TDBText
            Left = 1
            Top = 8
            Width = 107
            Height = 13
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'TERCERO'
            DataSource = DMInfoTercero.DSxTercero
          end
          object DBTTituloContactos: TDBText
            Left = 116
            Top = 8
            Width = 96
            Height = 13
            AutoSize = True
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMInfoTercero.DSxTercero
          end
        end
        object DBGContactos: TDBGrid
          Left = 0
          Top = 29
          Width = 492
          Height = 262
          Align = alClient
          Color = clInfoBk
          DataSource = DMInfoTercero.DSxContactos
          Options = [dgTitles, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 114
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APELLIDOS'
              Width = 228
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOVIL'
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CORREO'
              Visible = True
            end>
        end
      end
      object TSBancos: TTabSheet
        Caption = 'Bancos'
        ImageIndex = 3
        object PNLBancos: TLFPanel
          Left = 0
          Top = 0
          Width = 492
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object DBTTerceroBancos: TDBText
            Left = 14
            Top = 8
            Width = 95
            Height = 13
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'TERCERO'
            DataSource = DMInfoTercero.DSxTercero
          end
          object DBTTituloBancos: TDBText
            Left = 116
            Top = 8
            Width = 84
            Height = 13
            AutoSize = True
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMInfoTercero.DSxTercero
          end
        end
        object DBGBancos: TDBGrid
          Left = 0
          Top = 29
          Width = 492
          Height = 262
          Align = alClient
          Color = clInfoBk
          DataSource = DMInfoTercero.DSxBancos
          Options = [dgTitles, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUCURSAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTROL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IBAN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BIC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVA'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODO'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 349
    Width = 504
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 324
    Top = 6
  end
end
