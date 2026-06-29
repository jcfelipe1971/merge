inherited ProFMCostesTOrden: TProFMCostesTOrden
  Left = 303
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Resumen costes totales'
  ClientHeight = 358
  ClientWidth = 504
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 334
    object LFLabel1: TLFLabel [0]
      Left = 300
      Top = 218
      Width = 71
      Height = 13
      Caption = 'Coste Compras'
    end
    object Label1: TLFLabel [1]
      Left = 36
      Top = 48
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Orden'
      FocusControl = DBEdit1
    end
    object Label11: TLFLabel [2]
      Left = 242
      Top = 48
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Linea Pedido'
    end
    object Label12: TLFLabel [3]
      Left = 365
      Top = 48
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Pedido'
    end
    object Label13: TLFLabel [4]
      Left = 39
      Top = 96
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Uds. Pedido'
      FocusControl = DBEdit13
    end
    object Label14: TLFLabel [5]
      Left = 37
      Top = 120
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Uds. Manual'
      FocusControl = DBEdit14
    end
    object Label15: TLFLabel [6]
      Left = 232
      Top = 96
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Uds. Total'
      FocusControl = DBEdit15
    end
    object Label18: TLFLabel [7]
      Left = 202
      Top = 120
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Uds. Producci'#243'n'
      FocusControl = DBEdit18
    end
    object Label23: TLFLabel [8]
      Left = 136
      Top = 48
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pedido'
    end
    object Label24: TLFLabel [9]
      Left = 26
      Top = 145
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste Fijo Previsto'
      FocusControl = DBEdit44
    end
    object Label25: TLFLabel [10]
      Left = 13
      Top = 170
      Width = 100
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste Varios Previsto'
      FocusControl = DBEdit45
    end
    object Label26: TLFLabel [11]
      Left = 5
      Top = 194
      Width = 108
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste Material Previsto'
      FocusControl = DBEdit46
    end
    object Label27: TLFLabel [12]
      Left = 25
      Top = 219
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste MO Previsto'
      FocusControl = DBEdit47
    end
    object Label28: TLFLabel [13]
      Left = 18
      Top = 244
      Width = 95
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste M'#225'q. Previsto'
      FocusControl = DBEdit48
    end
    object Label29: TLFLabel [14]
      Left = 18
      Top = 267
      Width = 95
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste Text. Previsto'
      FocusControl = DBEdit49
    end
    object Label30: TLFLabel [15]
      Left = 18
      Top = 290
      Width = 95
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste Total Previsto'
      FocusControl = DBEdit50
    end
    object Label31: TLFLabel [16]
      Left = 300
      Top = 146
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste Fijo Real'
      FocusControl = DBEdit51
    end
    object Label32: TLFLabel [17]
      Left = 287
      Top = 170
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste Varios Real'
      FocusControl = DBEdit52
    end
    object Label33: TLFLabel [18]
      Left = 295
      Top = 194
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cotes Mat. Real'
      FocusControl = DBEdit53
    end
    object Label34: TLFLabel [19]
      Left = 299
      Top = 241
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste MO Real'
      FocusControl = DBEdit54
    end
    object Label35: TLFLabel [20]
      Left = 292
      Top = 265
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste M'#225'q. Real'
      FocusControl = DBEdit55
    end
    object Label36: TLFLabel [21]
      Left = 292
      Top = 290
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste Text. Real'
      FocusControl = DBEdit56
    end
    object Label37: TLFLabel [22]
      Left = 292
      Top = 314
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coste Total Real'
      FocusControl = DBEdit57
    end
    object Label7: TLFLabel [23]
      Left = 33
      Top = 72
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
    end
    inherited TBMain: TLFToolBar
      Width = 500
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object LFDbedit1: TLFDbedit
      Left = 378
      Top = 215
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_COMPRAS'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBEditFind20008: TLFDBEditFind2000
      Left = 69
      Top = 68
      Width = 54
      Height = 21
      Color = clInfoBk
      DataField = 'CLIENTE'
      DataSource = ProDMOrden.DSQMProOrd
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'VER_CLIENTES'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'CLIENTE'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      Filtros = []
    end
    object DBEditFind20007: TLFDBEditFind2000
      Left = 308
      Top = 44
      Width = 48
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'LINEA_PED'
      DataSource = ProDMOrden.DSQMProOrd
      Enabled = False
      ReadOnly = True
      TabOrder = 3
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'GES_DETALLES_S'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'LINEA'
      CampoStr = 'ARTICULO'
      CampoADevolver = 'LINEA'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      Filtros = []
    end
    object DBEditFind20006: TLFDBEditFind2000
      Left = 176
      Top = 44
      Width = 57
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'PEDIDO'
      DataSource = ProDMOrden.DSQMProOrd
      Enabled = False
      ReadOnly = True
      TabOrder = 4
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'GES_CABECERAS_S'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'RIG'
      CampoStr = 'FECHA'
      CampoADevolver = 'RIG'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = False
      Filtros = []
    end
    object DBEdit57: TLFDbedit
      Left = 378
      Top = 310
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_TOT_REAL'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit56: TLFDbedit
      Left = 378
      Top = 286
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_TEX_REAL'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit55: TLFDbedit
      Left = 378
      Top = 262
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_MAQ_REAL'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit54: TLFDbedit
      Left = 378
      Top = 238
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_MO_REAL'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit53: TLFDbedit
      Left = 378
      Top = 192
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_MAT_REAL'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit52: TLFDbedit
      Left = 378
      Top = 168
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_VAR_REAL'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 10
    end
    object DBEdit51: TLFDbedit
      Left = 378
      Top = 144
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_FIJO_REAL'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 11
    end
    object DBEdit50: TLFDbedit
      Left = 120
      Top = 288
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_TOT_PRE'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 12
    end
    object DBEdit49: TLFDbedit
      Left = 120
      Top = 264
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_TEX_PRE'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 13
    end
    object DBEdit48: TLFDbedit
      Left = 120
      Top = 240
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_MAQ_PRE'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 14
    end
    object DBEdit47: TLFDbedit
      Left = 120
      Top = 216
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_MO_PRE'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 15
    end
    object DBEdit46: TLFDbedit
      Left = 120
      Top = 192
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_MAT_PRE'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 16
    end
    object DBEdit45: TLFDbedit
      Left = 120
      Top = 168
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_VAR_PRE'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 17
    end
    object DBEdit44: TLFDbedit
      Left = 120
      Top = 144
      Width = 124
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'COSTE_FIJO_PRE'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 18
    end
    object DBEdit4: TLFDbedit
      Left = 125
      Top = 69
      Width = 377
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      Enabled = False
      ReadOnly = True
      TabOrder = 19
    end
    object DBEdit3: TLFDbedit
      Left = 437
      Top = 44
      Width = 65
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'FECHA_PED'
      DataSource = ProDMOrden.DSQMProOrd
      Enabled = False
      ReadOnly = True
      TabOrder = 20
    end
    object DBEdit18: TLFDbedit
      Left = 288
      Top = 120
      Width = 65
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'UNI_PRODUC'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 21
    end
    object DBEdit15: TLFDbedit
      Left = 288
      Top = 95
      Width = 65
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'UNI_TOTAL'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 22
    end
    object DBEdit14: TLFDbedit
      Left = 104
      Top = 118
      Width = 65
      Height = 21
      Color = clInfoBk
      DataField = 'UNI_MANUAL'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 23
    end
    object DBEdit13: TLFDbedit
      Left = 104
      Top = 93
      Width = 65
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'UNI_PEDID'
      DataSource = ProDMOrden.DSxCostesTOrden
      Enabled = False
      ReadOnly = True
      TabOrder = 24
    end
    object DBEdit1: TLFDbedit
      Left = 69
      Top = 45
      Width = 54
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'RIG_OF'
      DataSource = ProDMOrden.DSQMProOrd
      Enabled = False
      ReadOnly = True
      TabOrder = 25
    end
  end
  inherited TBActions: TLFToolBar
    Top = 334
    Width = 504
  end
end
