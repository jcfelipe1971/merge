inherited FPregCPostal: TFPregCPostal
  Left = 388
  Top = 242
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado por C'#243'digos Postales'
  ClientHeight = 289
  ClientWidth = 504
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 289
    object Label1: TLFLabel [0]
      Left = 41
      Top = 83
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label2: TLFLabel [1]
      Left = 44
      Top = 104
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object LblOrden: TLFLabel [2]
      Left = 78
      Top = 128
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ordenado por'
    end
    inherited TBMain: TLFToolBar
      Width = 504
      TabOrder = 5
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object EFCPDesde: TLFEditFind2000
      Left = 79
      Top = 80
      Width = 70
      Height = 21
      MaxLength = 10
      TabOrder = 0
      OnChange = EFCPDesdeChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = True
      CampoNum = 'CODIGO_POSTAL'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_LOCALIDADES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CODIGO_POSTAL')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object EFCPHasta: TLFEditFind2000
      Left = 79
      Top = 102
      Width = 70
      Height = 21
      MaxLength = 10
      TabOrder = 1
      OnChange = EFCPHastaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CODIGO_POSTAL'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_LOCALIDADES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CODIGO_POSTAL')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object DBECPDesde: TLFDbedit
      Left = 150
      Top = 80
      Width = 300
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLSTClientes.DSQMCPDesde
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
    object DBECPHasta: TLFDbedit
      Left = 150
      Top = 102
      Width = 300
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLSTClientes.DSQMCPHasta
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
    object CBOrden: TLFComboBox
      Left = 150
      Top = 124
      Width = 135
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'C'#243'digo de Cliente/Proveedor'
        'Nombre'
        'C'#243'digo Postal'
        'Poblaci'#243'n'
        'Provincia'
        'Tel'#233'fono'
        'NIF')
    end
  end
  inherited ALMain: TLFActionList
    inherited ARecargar: TAction
      Visible = False
    end
  end
end
