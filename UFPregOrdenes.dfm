inherited FPregOrdenes: TFPregOrdenes
  Left = 367
  Top = 209
  ActiveControl = EFAlmacen
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Ordenes'
  ClientHeight = 220
  ClientWidth = 392
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 220
    object LBLEscandallo: TLFLabel [0]
      Left = 43
      Top = 81
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object LBLOrden: TLFLabel [1]
      Left = 33
      Top = 59
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ordenes'
    end
    object LBLCantidad: TLFLabel [2]
      Left = 38
      Top = 125
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Articulo'
    end
    object Label1: TLFLabel [3]
      Left = 33
      Top = 103
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen'
    end
    object Label2: TLFLabel [4]
      Left = 39
      Top = 170
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pedido'
    end
    object Label3: TLFLabel [5]
      Left = 21
      Top = 147
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Escandallo'
    end
    object Label4: TLFLabel [6]
      Left = 249
      Top = 170
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object Label5: TLFLabel [7]
      Left = 249
      Top = 147
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object Label6: TLFLabel [8]
      Left = 249
      Top = 125
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object Label7: TLFLabel [9]
      Left = 249
      Top = 103
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object Label8: TLFLabel [10]
      Left = 249
      Top = 82
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object Label9: TLFLabel [11]
      Left = 249
      Top = 60
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object Label10: TLFLabel [12]
      Left = 106
      Top = 170
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label11: TLFLabel [13]
      Left = 106
      Top = 147
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label12: TLFLabel [14]
      Left = 106
      Top = 125
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label13: TLFLabel [15]
      Left = 106
      Top = 103
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label14: TLFLabel [16]
      Left = 106
      Top = 81
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object Label15: TLFLabel [17]
      Left = 106
      Top = 59
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LCantidad: TLFLabel [18]
      Left = 96
      Top = 193
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad'
    end
    inherited TBMain: TLFToolBar
      Width = 392
      TabOrder = 19
      inherited TButtRecargar: TToolButton
        Visible = False
      end
      object TButtConf: TToolButton
        Left = 288
        Top = 0
        Action = AConfiguracion
      end
    end
    object EFAlmacen: TLFEditFind2000
      Left = 144
      Top = 99
      Width = 87
      Height = 21
      TabOrder = 7
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ALMACEN'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFOrden: TLFEditFind2000
      Left = 144
      Top = 55
      Width = 87
      Height = 21
      TabOrder = 1
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ORDEN'
      CampoStr = 'ARTICULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS_ESC_ORDEN'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object DTPFecha: TLFDateEdit
      Left = 144
      Top = 77
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 4
    end
    object EFArticulo: TLFEditFind2000
      Left = 144
      Top = 121
      Width = 87
      Height = 21
      TabOrder = 10
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArticuloBusqueda
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object SpinEscandallo: TSpinEdit
      Left = 144
      Top = 143
      Width = 87
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 13
      Value = 1
    end
    object SpinPedido: TSpinEdit
      Left = 144
      Top = 166
      Width = 87
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 16
      Value = 1
    end
    object EFOrdenH: TLFEditFind2000
      Left = 285
      Top = 55
      Width = 87
      Height = 21
      TabOrder = 2
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ORDEN'
      CampoStr = 'ARTICULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS_ESC_ORDEN'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object DTPFechaH: TLFDateEdit
      Left = 285
      Top = 77
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 5
    end
    object EFAlmacenH: TLFEditFind2000
      Left = 285
      Top = 99
      Width = 87
      Height = 21
      TabOrder = 8
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ALMACEN'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFArticuloH: TLFEditFind2000
      Left = 285
      Top = 121
      Width = 87
      Height = 21
      TabOrder = 11
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArticuloBusqueda
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object SpinEscandalloH: TSpinEdit
      Left = 285
      Top = 143
      Width = 87
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 14
      Value = 1
    end
    object SpinPedidoH: TSpinEdit
      Left = 285
      Top = 166
      Width = 87
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 17
      Value = 1
    end
    object CBOrden: TLFCheckBox
      Left = 79
      Top = 58
      Width = 17
      Height = 17
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 0
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBFecha: TLFCheckBox
      Left = 79
      Top = 80
      Width = 17
      Height = 17
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 3
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBAlmacen: TLFCheckBox
      Left = 79
      Top = 102
      Width = 17
      Height = 17
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 6
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBArticulo: TLFCheckBox
      Left = 79
      Top = 124
      Width = 17
      Height = 17
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 9
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBEscandallo: TLFCheckBox
      Left = 79
      Top = 146
      Width = 17
      Height = 17
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 12
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBPedido: TLFCheckBox
      Left = 79
      Top = 169
      Width = 17
      Height = 17
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 15
      TabStop = True
      Alignment = taLeftJustify
    end
    object ECantidad: TLFEdit
      Left = 144
      Top = 189
      Width = 88
      Height = 21
      TabOrder = 18
      Text = '1'
    end
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 16
    object AConfiguracion: TAction
      Caption = '&Configurar'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfiguracionExecute
    end
  end
end
