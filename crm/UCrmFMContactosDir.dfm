object CrmFMContactosDir: TCrmFMContactosDir
  Left = 664
  Top = 105
  Width = 480
  Height = 300
  Caption = 'Desglosar direcci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TLFPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 273
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LNumero: TLFLabel
      Left = 281
      Top = 151
      Width = 44
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'N'#250'm.'
    end
    object LPuerta: TLFLabel
      Left = 413
      Top = 151
      Width = 43
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Puerta'
    end
    object LBloqueEscalera: TLFLabel
      Left = 326
      Top = 151
      Width = 51
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Bloq./Esc.'
    end
    object LPiso: TLFLabel
      Left = 378
      Top = 151
      Width = 34
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Piso'
    end
    object LblNombreDireccion: TLFLabel
      Left = 11
      Top = 130
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Direcci'#243'n'
    end
    object LDireccionContacto: TLFLabel
      Left = 11
      Top = 18
      Width = 107
      Height = 13
      Caption = 'Direcci'#243'n del contacto'
    end
    object LblLocalidad: TLFLabel
      Left = 9
      Top = 64
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Localidad'
    end
    object LblProvincia: TLFLabel
      Left = 10
      Top = 86
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Provincia'
    end
    object LblTipoDir: TLFLabel
      Left = 49
      Top = 151
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo dir.'
    end
    object LblCalle: TLFLabel
      Left = 88
      Top = 151
      Width = 192
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Calle'
    end
    object EDirBloqEsc: TLFEdit
      Left = 326
      Top = 167
      Width = 51
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object EDireccion2: TLFEdit
      Left = 58
      Top = 127
      Width = 398
      Height = 21
      TabOrder = 0
    end
    object EDirNombre: TLFEdit
      Left = 88
      Top = 167
      Width = 192
      Height = 21
      TabOrder = 2
    end
    object EDirNumero: TLFEdit
      Left = 281
      Top = 167
      Width = 44
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object EDirPiso: TLFEdit
      Left = 378
      Top = 167
      Width = 34
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object EDirPuerta: TLFEdit
      Left = 413
      Top = 167
      Width = 43
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object EFTipoDir: TLFEditFind2000
      Left = 58
      Top = 167
      Width = 29
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoADevolver = 'TIPO'
      CampoNum = 'TIPO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_TIPO_DIRECCION'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'TIPO')
      Filtros = []
    end
    object DBEDireccionContacto: TLFDbedit
      Left = 9
      Top = 38
      Width = 447
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'DIR_NOMBRE'
      DataSource = CrmDMContactos.DSQMContactos
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
    object DBELocalidad: TLFDbedit
      Left = 58
      Top = 60
      Width = 80
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'DIR_LOCALIDAD'
      DataSource = CrmDMContactos.DSQMContactos
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 10
    end
    object DBELocalidadNombre: TLFDbedit
      Left = 139
      Top = 60
      Width = 185
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = CrmDMContactos.DSxLocalidad
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object DBECpostal: TLFDbedit
      Left = 325
      Top = 60
      Width = 131
      Height = 21
      Color = clInfoBk
      DataField = 'CODPOSTAL'
      DataSource = CrmDMContactos.DSxLocalidad
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object DBEPais: TLFDbedit
      Left = 208
      Top = 82
      Width = 248
      Height = 21
      Color = clInfoBk
      DataField = 'PAIS'
      DataSource = CrmDMContactos.DSxLocalidad
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object DBEProvincia: TLFDbedit
      Left = 58
      Top = 82
      Width = 149
      Height = 21
      Color = clInfoBk
      DataField = 'PROVINCIA'
      DataSource = CrmDMContactos.DSxLocalidad
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object BBAceptar: TBitBtn
      Left = 123
      Top = 214
      Width = 81
      Height = 30
      Caption = '&Aceptar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 7
      OnClick = BBAceptarClick
    end
    object BBCancelar: TBitBtn
      Left = 247
      Top = 214
      Width = 81
      Height = 30
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 8
      OnClick = BBCancelarClick
    end
  end
end
