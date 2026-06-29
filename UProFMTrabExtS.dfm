inherited ProFMTrabExtS: TProFMTrabExtS
  Left = 532
  Top = 284
  BorderIcons = [biMinimize]
  Caption = 'Salida Trabajos Externos'
  ClientHeight = 428
  ClientWidth = 704
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 704
    Height = 404
    object LNPedido: TLFLabel [0]
      Left = 541
      Top = 387
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Pedido'
    end
    object LFecha: TLFLabel [1]
      Left = 90
      Top = 40
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object LProveedor: TLFLabel [2]
      Left = 71
      Top = 196
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
    end
    object LTratamiento: TLFLabel [3]
      Left = 64
      Top = 218
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tratamiento'
    end
    object LAlmacen: TLFLabel [4]
      Left = 19
      Top = 90
      Width = 101
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen Preparaci'#243'n'
    end
    object LAlmacenExterno: TLFLabel [5]
      Left = 40
      Top = 112
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen Externo'
    end
    object LUnidades: TLFLabel [6]
      Left = 75
      Top = 240
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidades'
    end
    object LTipoOrientacion: TLFLabel [7]
      Left = 47
      Top = 62
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Operaci'#243'n'
      Visible = False
    end
    object LTipoDocumento: TLFLabel [8]
      Left = 510
      Top = 365
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Documento'
    end
    object LCompuestoComponente: TLFLabel [9]
      Left = 2
      Top = 142
      Width = 118
      Height = 13
      Alignment = taRightJustify
      Caption = 'Compuesto/Componente'
    end
    object LUnidadesCompuestoComponente: TLFLabel [10]
      Left = 75
      Top = 164
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidades'
    end
    object LPeso: TLFLabel [11]
      Left = 563
      Top = 164
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Peso'
    end
    object LCajas: TLFLabel [12]
      Left = 94
      Top = 280
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cajas'
    end
    inherited TBMain: TLFToolBar
      Width = 700
      TabOrder = 20
      inherited NavMain: THYMNavigator
        Width = 72
        VisibleButtons = [nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        OnClick = NavMainClick
      end
      inherited EPMain: THYMEditPanel [1]
        Left = 72
        Width = 28
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton [2]
        Left = 100
      end
      inherited TSepTerc: TToolButton
        Left = 108
      end
      inherited TbuttComp: TToolButton
        Left = 116
      end
    end
    object ETituloProveedor: TLFEdit
      Left = 221
      Top = 192
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 13
    end
    object ETituloArticulo: TLFEdit
      Left = 221
      Top = 214
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 15
    end
    object ETituloAlmacenP: TLFEdit
      Left = 221
      Top = 86
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
    object EFProveedor: TDBEditFind2000
      Left = 125
      Top = 192
      Width = 95
      Height = 21
      Hint = 'Proveedor'
      DataField = 'PROVEEDOR'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 12
      OnChange = EFProveedorChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'VER_PROVEEDORES'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'PROVEEDOR'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = True
      OrdenadoPor.Strings = (
        'PROVEEDOR')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFArticulo: TDBEditFind2000
      Left = 125
      Top = 214
      Width = 95
      Height = 21
      Hint = 'Art'#237'culo'
      DataField = 'ARTICULO'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 14
      OnChange = EFArticuloChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'VER_ARTICULOS_EF'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = True
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFAlmacenP: TDBEditFind2000
      Left = 125
      Top = 86
      Width = 95
      Height = 21
      Hint = 'Almac'#233'n Preparaci'#243'n'
      DataField = 'ALMACEN_PERPARACION'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 2
      OnChange = EFAlmacenPChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'VER_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'ALMACEN'
      CampoStr = 'AL_TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = True
      OrdenadoPor.Strings = (
        'ALMACEN')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFAlmacenE: TDBEditFind2000
      Left = 125
      Top = 108
      Width = 95
      Height = 21
      Hint = 'Almac'#233'n Externo'
      DataField = 'ALMACEN_TEX'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 5
      OnChange = EFAlmacenEChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'VER_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'ALMACEN'
      CampoStr = 'AL_TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = True
      OrdenadoPor.Strings = (
        'ALMACEN')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object ETituloAlmacenE: TLFEdit
      Left = 221
      Top = 108
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 6
    end
    object EFecha: TDBDateEdit
      Left = 125
      Top = 36
      Width = 95
      Height = 21
      Hint = 'Fecha'
      DataField = 'FECHA'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 0
    end
    object EFUnidades: TLFDbedit
      Left = 125
      Top = 236
      Width = 95
      Height = 21
      Hint = 'Unidades'
      DataField = 'UNIDADES'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 16
    end
    object EFTipoOperacion: TLFDbedit
      Left = 125
      Top = 58
      Width = 95
      Height = 21
      Hint = 'Tipo Operaci'#243'n'
      Color = clInfoBk
      DataField = 'TIPO_OPERACION'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      Enabled = False
      TabOrder = 1
      Visible = False
    end
    object EFTipoDoc: TLFDbedit
      Left = 594
      Top = 361
      Width = 95
      Height = 21
      Hint = 'Tipo Documento'
      TabStop = False
      Color = clInfoBk
      DataField = 'TIPO_DOC'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      Enabled = False
      TabOrder = 18
    end
    object EFIdDoc: TLFDbedit
      Left = 594
      Top = 383
      Width = 95
      Height = 21
      Hint = 'Pedido'
      TabStop = False
      Color = clInfoBk
      DataField = 'RIG_DOC'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      Enabled = False
      TabOrder = 19
    end
    object DBEFCompuestoComponente: TDBEditFind2000
      Left = 125
      Top = 138
      Width = 95
      Height = 21
      Hint = 'Art'#237'culo'
      DataField = 'COMPUESTO_COMPONENTE'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 8
      OnChange = DBEFCompuestoComponenteChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'VER_ARTICULOS_EF'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = True
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object ECompuestoComponente: TLFEdit
      Left = 221
      Top = 138
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 9
    end
    object DBEUnidadesCompuestoComponente: TLFDbedit
      Left = 125
      Top = 160
      Width = 95
      Height = 21
      Hint = 'Unidades'
      DataField = 'UNIDADES_COMPUESTO_COMPONENTE'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 10
      OnChange = DBEUnidadesCompuestoComponenteChange
    end
    object EPeso: TLFEdit
      Left = 594
      Top = 160
      Width = 95
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 11
    end
    object EStockAlmacenE: TLFEdit
      Left = 504
      Top = 108
      Width = 56
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 7
    end
    object EStockAlmacenP: TLFEdit
      Left = 504
      Top = 86
      Width = 56
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 4
    end
    object DBECajas: TLFDbedit
      Left = 125
      Top = 276
      Width = 95
      Height = 21
      Hint = 'Unidades'
      DataField = 'CAJAS'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 17
    end
  end
  inherited TBActions: TLFToolBar
    Top = 404
    Width = 704
  end
  inherited CEMain: TControlEdit
    Left = 264
    Top = 348
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 300
    Top = 348
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
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
    Left = 336
    Top = 348
  end
  inherited FSMain: TLFFibFormStorage
    Left = 372
    Top = 348
  end
end
