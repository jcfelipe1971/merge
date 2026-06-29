inherited FMCreaClienteRapido: TFMCreaClienteRapido
  Caption = 'Creacion Rapida de Cliente'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    object LBLNif: TLFLabel [0]
      Left = 44
      Top = 72
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = 'NIF'
    end
    object LDireccion: TLFLabel [1]
      Left = 16
      Top = 94
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Direcci'#243'n'
    end
    object LCodPostal: TLFLabel [2]
      Left = 8
      Top = 160
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'd. Postal'
    end
    object LProvincia: TLFLabel [3]
      Left = 165
      Top = 161
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Provincia'
    end
    object LBLNombre: TLFLabel [4]
      Left = 24
      Top = 50
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre'
    end
    object LBLPais: TLFLabel [5]
      Left = 41
      Top = 204
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pais'
    end
    object LLocalidad: TLFLabel [6]
      Left = 16
      Top = 138
      Width = 46
      Height = 13
      Caption = 'Localidad'
    end
    object LTelefono01: TLFLabel [7]
      Left = 19
      Top = 226
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tel'#233'fono'
    end
    object LTelefono02: TLFLabel [8]
      Left = 174
      Top = 226
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tel'#233'fono 2'
    end
    object LTelefax: TLFLabel [9]
      Left = 352
      Top = 226
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefax'
    end
    object LEmail: TLFLabel [10]
      Left = 34
      Top = 248
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'e-mail'
    end
    object LNotas: TLFLabel [11]
      Left = 33
      Top = 270
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Notas'
    end
    object LColonia: TLFLabel [12]
      Left = 26
      Top = 183
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Colonia'
    end
    object LMensajeErrorNIF: TLFLabel [13]
      Left = 212
      Top = 72
      Width = 85
      Height = 13
      Caption = 'Mensaje Error NIF'
    end
    object LDireccion2: TLFLabel [14]
      Left = 17
      Top = 116
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Direcci'#243'n'
    end
    inherited TBMain: TLFToolBar
      TabOrder = 16
      object ButtCrearCliente: TToolButton [0]
        Left = 0
        Top = 0
        Caption = 'Crear Cliente'
        ImageIndex = 104
        OnClick = ButtCrearClienteClick
      end
      inherited EPMain: THYMEditPanel
        Left = 23
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object ENif: TLFEdit
      Left = 68
      Top = 68
      Width = 135
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 1
      OnChange = ENifChange
    end
    object EDireccion: TLFEdit
      Left = 68
      Top = 90
      Width = 430
      Height = 21
      MaxLength = 40
      TabOrder = 2
    end
    object EPais: TLFEdit
      Left = 68
      Top = 200
      Width = 63
      Height = 21
      Color = clInfoBk
      Enabled = False
      MaxLength = 5
      TabOrder = 9
    end
    object EProvincia: TLFEdit
      Left = 216
      Top = 156
      Width = 282
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 7
    end
    object ENombre: TLFEdit
      Left = 68
      Top = 46
      Width = 430
      Height = 21
      MaxLength = 60
      TabOrder = 0
    end
    object EFLocalidad: TLFEditFind2000
      Left = 68
      Top = 134
      Width = 93
      Height = 21
      AutoSize = False
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 4
      OnChange = EFLocalidadChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      Campos_Desplegar.Strings = (
        'PROVINCIA'
        'C_PAIS')
      CampoNum = 'LOCALIDAD'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_LOCALIDADES'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = []
      Entorno = DMFacturas.EntornoDoc
    end
    object ETituloPais: TLFEdit
      Left = 131
      Top = 200
      Width = 367
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object ELocalidad: TLFEdit
      Left = 162
      Top = 134
      Width = 336
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 5
    end
    object ETelefono01: TLFEdit
      Left = 68
      Top = 222
      Width = 101
      Height = 21
      MaxLength = 15
      TabOrder = 11
    end
    object ETelefono02: TLFEdit
      Left = 232
      Top = 222
      Width = 101
      Height = 21
      MaxLength = 15
      TabOrder = 12
    end
    object ETelefax: TLFEdit
      Left = 393
      Top = 222
      Width = 105
      Height = 21
      MaxLength = 15
      TabOrder = 13
    end
    object EEmail: TLFEdit
      Left = 68
      Top = 244
      Width = 430
      Height = 21
      MaxLength = 100
      TabOrder = 14
    end
    object MNotas: TLFMemo
      Left = 68
      Top = 266
      Width = 430
      Height = 53
      TabOrder = 15
    end
    object DBEColonia: TLFEdit
      Left = 68
      Top = 178
      Width = 430
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 8
    end
    object ECodigoPostal: TLFEdit
      Left = 68
      Top = 156
      Width = 63
      Height = 21
      Color = clInfoBk
      Enabled = False
      MaxLength = 5
      TabOrder = 6
    end
    object EDireccion2: TLFEdit
      Left = 68
      Top = 112
      Width = 430
      Height = 21
      MaxLength = 40
      TabOrder = 3
    end
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
end
