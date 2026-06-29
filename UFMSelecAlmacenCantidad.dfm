inherited FMSelecAlmacenCantidad: TFMSelecAlmacenCantidad
  Caption = 'Selecion de Almacen y Cantidad'
  ClientHeight = 188
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 164
    object LAlmacenOri: TLFLabel [0]
      Left = 41
      Top = 47
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen Orig.'
    end
    object LCantidad: TLFLabel [1]
      Left = 65
      Top = 90
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad'
    end
    object LAlmacenDst: TLFLabel [2]
      Left = 38
      Top = 69
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen Dest.'
    end
    inherited TBMain: TLFToolBar
      TabOrder = 3
      object TBOk: TToolButton [0]
        Left = 0
        Top = 0
        Caption = 'Ok'
        ImageIndex = 25
        OnClick = TBOkClick
      end
      object ToolButton1: TToolButton [1]
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 31
        Width = 26
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object EFAlmacenOri: TLFEditFind2000
      Left = 112
      Top = 44
      Width = 81
      Height = 21
      MaxLength = 3
      TabOrder = 0
      OnChange = EFAlmacenOriChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ALMACEN'
      CampoStr = 'AL_TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ALMACEN')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloAlmacenOri: TLFEdit
      Left = 194
      Top = 44
      Width = 287
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 4
    end
    object ECantidad: TLFEdit
      Left = 112
      Top = 88
      Width = 81
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object EFAlmacenDst: TLFEditFind2000
      Left = 112
      Top = 66
      Width = 81
      Height = 21
      MaxLength = 3
      TabOrder = 1
      OnChange = EFAlmacenDstChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ALMACEN'
      CampoStr = 'AL_TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ALMACEN')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloAlmacenDst: TLFEdit
      Left = 194
      Top = 66
      Width = 287
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 5
    end
  end
  inherited TBActions: TLFToolBar
    Top = 164
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
