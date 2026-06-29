inherited FMSeleccionKit: TFMSeleccionKit
  Caption = 'FMSeleccionKit'
  ClientHeight = 193
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 169
    object LRefProveedor: TLFLabel [0]
      Left = 48
      Top = 67
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modelo'
    end
    object LColor: TLFLabel [1]
      Left = 59
      Top = 90
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Color'
    end
    object LKit: TLFLabel [2]
      Left = 71
      Top = 112
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kit'
    end
    object LCantidad: TLFLabel [3]
      Left = 41
      Top = 135
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad'
    end
    object LModelo: TLFLabel [4]
      Left = 48
      Top = 67
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modelo'
    end
    inherited TBMain: TLFToolBar
      TabOrder = 4
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Visible = False
      end
      object TButtOk: TToolButton
        Left = 80
        Top = 0
        Hint = 'Ok'
        Caption = 'Ok'
        ImageIndex = 19
        OnClick = TButtOkClick
      end
      object TButtCancelar: TToolButton
        Left = 103
        Top = 0
        Hint = 'Cancelar'
        Caption = 'Cancelar'
        ImageIndex = 20
        OnClick = TButtCancelarClick
      end
    end
    object EFModelo: TLFEditFind2000
      Left = 88
      Top = 65
      Width = 81
      Height = 21
      TabOrder = 0
      OnChange = EFModeloChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'REF_PROVEEDOR'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS_MODELOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'REF_PROVEEDOR')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloModelo: TLFEdit
      Left = 170
      Top = 65
      Width = 287
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 5
    end
    object ECantidad: TLFEdit
      Left = 88
      Top = 131
      Width = 81
      Height = 21
      TabOrder = 3
      Text = '1'
    end
    object ETituloColor: TLFEdit
      Left = 170
      Top = 87
      Width = 287
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 6
    end
    object EFColor: TLFEditFind2000
      Left = 88
      Top = 87
      Width = 81
      Height = 21
      TabOrder = 1
      OnChange = EFColorChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'COD_COLOR'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_COLORES'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFColorBusqueda
      OrdenadoPor.Strings = (
        'COD_COLOR')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloKit: TLFEdit
      Left = 170
      Top = 109
      Width = 287
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 7
    end
    object EFKit: TLFEditFind2000
      Left = 88
      Top = 109
      Width = 81
      Height = 21
      TabOrder = 2
      OnChange = EFKitChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'KIT'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_KIT'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFKitBusqueda
      OrdenadoPor.Strings = (
        'KIT')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  inherited TBActions: TLFToolBar
    Top = 169
  end
end
