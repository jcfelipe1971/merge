inherited ProFMTrabExtE: TProFMTrabExtE
  Left = 532
  Top = 284
  BorderIcons = [biMinimize]
  Caption = 'Entrada Trabajos Externos'
  ClientHeight = 428
  ClientWidth = 704
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 704
    Height = 404
    object Label7: TLFLabel [0]
      Left = 522
      Top = 370
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Albaran'
    end
    object Label9: TLFLabel [1]
      Left = 90
      Top = 40
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object LProveedor: TLFLabel [2]
      Left = 71
      Top = 190
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
      Visible = False
    end
    object LArticulo: TLFLabel [3]
      Left = 85
      Top = 212
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Articulo'
      Visible = False
    end
    object LAlmacen: TLFLabel [4]
      Left = 39
      Top = 112
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen Entrada'
    end
    object LFLabel1: TLFLabel [5]
      Left = 40
      Top = 90
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen Externo'
    end
    object LUnidadesCalculo: TLFLabel [6]
      Left = 75
      Top = 234
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidades'
      Visible = False
    end
    object LFLabel3: TLFLabel [7]
      Left = 47
      Top = 62
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Operaci'#243'n'
      Visible = False
    end
    object LCompuestoComponente: TLFLabel [8]
      Left = 2
      Top = 140
      Width = 118
      Height = 13
      Alignment = taRightJustify
      Caption = 'Compuesto/Componente'
    end
    object LKilos: TLFLabel [9]
      Left = 98
      Top = 162
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kilos'
    end
    object LPeso: TLFLabel [10]
      Left = 547
      Top = 162
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Peso'
    end
    object LAlbaranProveedor: TLFLabel [11]
      Left = 32
      Top = 266
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Albar'#225'n Proveedor'
    end
    object LUnidadesCompuestoComponente: TLFLabel [12]
      Left = 228
      Top = 162
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidades'
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
      object TButtPeticion: TToolButton
        Left = 139
        Top = 0
        Hint = 'Grabar Pedido'
        Caption = 'TButtPeticion'
        ImageIndex = 62
        Visible = False
      end
      object TButtFinal: TToolButton
        Left = 162
        Top = 0
        Caption = 'TButtFinal'
        Visible = False
      end
    end
    object ETituloProveedor: TLFEdit
      Left = 221
      Top = 186
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 14
      Visible = False
    end
    object ETituloArticulo: TLFEdit
      Left = 221
      Top = 208
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 16
      Visible = False
    end
    object ETituloAlmacenP: TLFEdit
      Left = 221
      Top = 108
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 6
    end
    object EFProveedor: TDBEditFind2000
      Left = 125
      Top = 186
      Width = 95
      Height = 21
      Hint = 'Proveedor'
      DataField = 'PROVEEDOR'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 13
      Visible = False
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
      Top = 208
      Width = 95
      Height = 21
      Hint = 'Art'#237'culo'
      DataField = 'ARTICULO'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 15
      Visible = False
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
    object DBEFAlmacenP: TDBEditFind2000
      Left = 125
      Top = 108
      Width = 95
      Height = 21
      Hint = 'Almac'#233'n Entrada'
      DataField = 'ALMACEN_PERPARACION'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 5
      OnChange = DBEFAlmacenPChange
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
      Top = 86
      Width = 95
      Height = 21
      Hint = 'Almac'#233'n Externo'
      DataField = 'ALMACEN_TEX'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 2
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
      Top = 86
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
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
    object DBEUnidadesCalculo: TLFDbedit
      Left = 125
      Top = 230
      Width = 95
      Height = 21
      Hint = 'Unidades'
      DataField = 'UNIDADES'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 17
      Visible = False
    end
    object EFTipoOperacion: TLFDbedit
      Left = 125
      Top = 58
      Width = 95
      Height = 21
      Hint = 'Tipo Operaci'#243'n'
      TabStop = False
      Color = clInfoBk
      DataField = 'TIPO_OPERACION'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      Enabled = False
      TabOrder = 1
      Visible = False
    end
    object EFIdDoc: TLFDbedit
      Left = 578
      Top = 366
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
      Top = 136
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
      Top = 136
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 9
    end
    object DBEKilos: TLFDbedit
      Left = 125
      Top = 158
      Width = 95
      Height = 21
      Hint = 'Unidades'
      DataField = 'KILOS'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 10
      OnChange = DBEKilosChange
    end
    object EPeso: TLFEdit
      Left = 578
      Top = 158
      Width = 95
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 12
    end
    object EStockAlmacenP: TLFEdit
      Left = 504
      Top = 108
      Width = 56
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 7
    end
    object EStockAlmacenE: TLFEdit
      Left = 504
      Top = 86
      Width = 56
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 4
    end
    object DBEAlbaranProveedor: TLFDbedit
      Left = 125
      Top = 262
      Width = 375
      Height = 21
      Hint = 'Unidades'
      DataField = 'ALBARAN_PROVEEDOR'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 18
    end
    object DBEUnidadesCompuestoComponente: TLFDbedit
      Left = 278
      Top = 158
      Width = 95
      Height = 21
      Hint = 'Unidades'
      DataField = 'UNIDADES_COMPUESTO_COMPONENTE'
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
      TabOrder = 11
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
