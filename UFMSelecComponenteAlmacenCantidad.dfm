inherited FMSelecComponenteAlmacenCantidad: TFMSelecComponenteAlmacenCantidad
  Caption = 'Selecion de Componente, Almacen y Cantidad'
  ClientHeight = 255
  ClientWidth = 573
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 573
    Height = 231
    object LAlmacenOri: TLFLabel [0]
      Left = 30
      Top = 120
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen Orig.'
    end
    object LCantidad: TLFLabel [1]
      Left = 54
      Top = 163
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad'
    end
    object LAlmacenDst: TLFLabel [2]
      Left = 27
      Top = 142
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen Dest.'
    end
    object LComponente: TLFLabel [3]
      Left = 36
      Top = 98
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Componente'
    end
    object LComentario: TLFLabel [4]
      Left = 43
      Top = 184
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Comentario'
    end
    inherited TBMain: TLFToolBar
      Width = 569
      TabOrder = 9
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
      Left = 101
      Top = 117
      Width = 81
      Height = 21
      MaxLength = 3
      TabOrder = 3
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
      Left = 183
      Top = 117
      Width = 342
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 4
    end
    object ECantidad: TLFEdit
      Left = 101
      Top = 161
      Width = 81
      Height = 21
      TabOrder = 7
      Text = '0'
    end
    object EFAlmacenDst: TLFEditFind2000
      Left = 101
      Top = 139
      Width = 81
      Height = 21
      MaxLength = 3
      TabOrder = 5
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
      Left = 183
      Top = 139
      Width = 342
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 6
    end
    object EFComponente: TLFEditFind2000
      Left = 101
      Top = 95
      Width = 81
      Height = 21
      MaxLength = 3
      TabOrder = 1
      OnChange = EFComponenteChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'COMPONENTE'
      CampoStr = 'DESC_COMPONENTE'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_MATERIALES_ORDEN_TYC'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFComponenteBusqueda
      OrdenadoPor.Strings = (
        'COMPONENTE')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloComponente: TLFEdit
      Left = 183
      Top = 95
      Width = 342
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 2
    end
    object RGTipoMovimiento: TRadioGroup
      Left = 40
      Top = 40
      Width = 497
      Height = 49
      Caption = 'Tipo Mov.'
      Columns = 3
      Items.Strings = (
        'Entrada'
        'Salida'
        'Traspaso entre Almacenes')
      TabOrder = 0
    end
    object EComentario: TLFEdit
      Left = 101
      Top = 183
      Width = 425
      Height = 21
      TabOrder = 8
      Text = '0'
    end
  end
  inherited TBActions: TLFToolBar
    Top = 231
    Width = 573
  end
  inherited CEMain: TControlEdit
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 4
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
    Top = 4
  end
  inherited FSMain: TLFFibFormStorage
    Left = 392
    Top = 4
  end
end
