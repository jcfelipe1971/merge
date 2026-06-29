inherited ProFMTrabExt: TProFMTrabExt
  Caption = 'Tarea de Trabajo Externo'
  ClientHeight = 416
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 392
    object Label1: TLFLabel [0]
      Left = 26
      Top = 48
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ejercicio'
    end
    object Label2: TLFLabel [1]
      Left = 189
      Top = 49
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Canal'
    end
    object Label3: TLFLabel [2]
      Left = 346
      Top = 49
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie'
    end
    object Label4: TLFLabel [3]
      Left = 22
      Top = 70
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Orden'
    end
    object Label5: TLFLabel [4]
      Left = 14
      Top = 93
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Linea Fase'
    end
    object Label6: TLFLabel [5]
      Left = 9
      Top = 115
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Linea Tarea'
    end
    object Label7: TLFLabel [6]
      Left = 18
      Top = 215
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Pedido'
    end
    object Label9: TLFLabel [7]
      Left = 158
      Top = 215
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Prev.'
    end
    object Label10: TLFLabel [8]
      Left = 320
      Top = 215
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Fin.'
    end
    object Label8: TLFLabel [9]
      Left = 19
      Top = 244
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Albaranes'
    end
    object LProveedor: TLFLabel [10]
      Left = 17
      Top = 138
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
    end
    object LArticulo: TLFLabel [11]
      Left = 31
      Top = 181
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Articulo'
    end
    object LAlmacen: TLFLabel [12]
      Left = 25
      Top = 158
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almacen'
    end
    inherited TBMain: TLFToolBar
      object TButtPeticion: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Petici'#243'n de Trabajo Externo'
        Caption = 'Petici'#243'n de Trabajo Externo'
        ImageIndex = 57
        OnClick = TButtPeticionClick
      end
      object TButtFinal: TToolButton [1]
        Left = 23
        Top = 0
        Hint = 'Finalizaci'#243'n de Trabajo Externo'
        Caption = 'Finalizaci'#243'n de Trabajo Externo'
        ImageIndex = 36
        OnClick = TButtFinalClick
      end
      object ToolButton4: TToolButton [2]
        Left = 46
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRefrescaDatos: TToolButton [3]
        Left = 54
        Top = 0
        Hint = 'Refrescar Datos'
        Caption = 'Refrescar Datos'
        ImageIndex = 26
        OnClick = TButtRefrescaDatosClick
      end
      object ToolButton6: TToolButton [4]
        Left = 77
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 85
        Width = 41
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object DBEEjercicio: TLFDbedit
      Left = 71
      Top = 45
      Width = 57
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'EJERCICIO'
      DataSource = ProDMTrabExt.DSQMTrabExt
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBECanal: TLFDbedit
      Left = 221
      Top = 45
      Width = 74
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'CANAL'
      DataSource = ProDMTrabExt.DSQMTrabExt
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBESerie: TLFDbedit
      Left = 375
      Top = 45
      Width = 74
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'SERIE'
      DataSource = ProDMTrabExt.DSQMTrabExt
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
    object DBENumOrden: TLFDbedit
      Left = 71
      Top = 67
      Width = 57
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'RIG_OF'
      DataSource = ProDMTrabExt.DSQMTrabExt
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
    object DBEFase: TLFDbedit
      Left = 71
      Top = 89
      Width = 57
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'LINEA_FASE'
      DataSource = ProDMTrabExt.DSQMTrabExt
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBETarea: TLFDbedit
      Left = 71
      Top = 111
      Width = 57
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'LINEA_TAREA'
      DataSource = ProDMTrabExt.DSQMTrabExt
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object DBENumPedido: TLFDbedit
      Left = 71
      Top = 211
      Width = 57
      Height = 21
      TabStop = False
      Color = clAqua
      DataField = 'RIG'
      DataSource = ProDMTrabExt.DSxPedido
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
      OnDblClick = DBENumPedidoDblClick
    end
    object DBEDescFase: TLFDbedit
      Left = 129
      Top = 89
      Width = 57
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'FASE'
      DataSource = ProDMTrabExt.DSxFase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBEDescTarea: TLFDbedit
      Left = 129
      Top = 111
      Width = 57
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TAREA'
      DataSource = ProDMTrabExt.DSxTarea
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
    object DBEFechaPrev: TLFDbedit
      Left = 221
      Top = 211
      Width = 74
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'FECHA_PRE_CAB'
      DataSource = ProDMTrabExt.DSxPedido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 18
    end
    object DBEFechaFin: TLFDbedit
      Left = 375
      Top = 211
      Width = 74
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'FECHA_REC_CAB'
      DataSource = ProDMTrabExt.DSxPedido
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 19
    end
    object DBGFAlbaranes: TDBGridFind2000
      Left = 71
      Top = 240
      Width = 378
      Height = 117
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      DataSource = ProDMTrabExt.DSxAlbaranes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 20
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGFAlbaranesDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Color = clAqua
          Expanded = False
          FieldName = 'RIG'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Visible = True
        end>
    end
    object ETituloFase: TLFEdit
      Left = 187
      Top = 89
      Width = 262
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 7
    end
    object ETituloTarea: TLFEdit
      Left = 187
      Top = 111
      Width = 262
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 10
    end
    object ETituloProveedor: TLFEdit
      Left = 170
      Top = 133
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 12
    end
    object ETituloArticulo: TLFEdit
      Left = 170
      Top = 177
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 16
    end
    object ETituloAlmacen: TLFEdit
      Left = 170
      Top = 155
      Width = 279
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 14
    end
    object EFProveedor: TLFEditFind2000
      Left = 71
      Top = 133
      Width = 98
      Height = 21
      TabOrder = 11
      OnChange = EFProveedorChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'PROVEEDOR'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_PROVEEDORES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'PROVEEDOR')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFArticulo: TLFEditFind2000
      Left = 71
      Top = 177
      Width = 98
      Height = 21
      MaxLength = 15
      TabOrder = 15
      OnChange = EFArticuloChange
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
      Tabla_a_buscar = 'VER_ARTICULOS_EF'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFAlmacen: TLFEditFind2000
      Left = 71
      Top = 155
      Width = 98
      Height = 21
      MaxLength = 3
      TabOrder = 13
      OnChange = EFAlmacenChange
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
  end
  inherited TBActions: TLFToolBar
    Top = 392
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
    Top = 5
  end
  inherited FSMain: TLFFibFormStorage
    Top = 5
  end
end
