inherited FMCreaLocalidad: TFMCreaLocalidad
  Left = 480
  Top = 268
  Caption = 'Crea localidad'
  ClientHeight = 174
  ClientWidth = 464
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 464
    Height = 150
    object LPais: TLFLabel [0]
      Left = 51
      Top = 55
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pais'
    end
    object LProvincia: TLFLabel [1]
      Left = 27
      Top = 77
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Provincia'
    end
    object LCodigoPostal: TLFLabel [2]
      Left = 7
      Top = 99
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Codigo postal'
    end
    object LLocalidad: TLFLabel [3]
      Left = 25
      Top = 121
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Localidad'
    end
    inherited TBMain: TLFToolBar
      Width = 460
      TabOrder = 6
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object SBCreaLocalidad: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Caption = 'SBCreaLocalidad'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object TBCreaLocalidad: TToolButton
        Left = 33
        Top = 0
        Hint = 'Crea localidad'
        Caption = 'Crea localidad'
        ImageIndex = 19
        OnClick = TBCreaLocalidadClick
      end
    end
    object EFPais: TLFEditFind2000
      Left = 77
      Top = 50
      Width = 57
      Height = 21
      TabOrder = 0
      OnChange = EFPaisChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoADevolver = 'PAIS'
      CampoNum = 'PAIS'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_PAISES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'PAIS')
      Filtros = []
    end
    object EPaisTitulo: TLFEdit
      Left = 135
      Top = 50
      Width = 313
      Height = 21
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object EFProvincia: TLFEditFind2000
      Left = 77
      Top = 72
      Width = 57
      Height = 21
      MaxLength = 2
      TabOrder = 1
      OnExit = EFProvinciaExit
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoADevolver = 'PROVINCIA'
      CampoNum = 'PROVINCIA'
      CampoStr = 'PR_TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_PROVINCIAS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFProvinciaBusqueda
      OrdenadoPor.Strings = (
        'PROVINCIA')
      Filtros = []
    end
    object EProvinciaTitulo: TLFEdit
      Left = 135
      Top = 72
      Width = 313
      Height = 21
      MaxLength = 40
      TabOrder = 2
    end
    object ENombreLocalidad: TLFEdit
      Left = 77
      Top = 116
      Width = 371
      Height = 21
      MaxLength = 40
      TabOrder = 5
    end
    object ECodigoPostal: TLFEdit
      Left = 77
      Top = 94
      Width = 108
      Height = 21
      MaxLength = 10
      TabOrder = 4
    end
    object BCrearProvincia: TButton
      Left = 424
      Top = 73
      Width = 22
      Height = 19
      Hint = 'Crear Provincia'
      Caption = '+'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BCrearProvinciaClick
    end
  end
  inherited TBActions: TLFToolBar
    Top = 150
    Width = 464
  end
  inherited CEMain: TControlEdit
    Left = 296
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 328
    Top = 0
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
  inherited ALMain: TLFActionList
    Left = 360
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 392
    Top = 0
  end
end
