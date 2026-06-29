object FMAlbDeposito: TFMAlbDeposito
  Left = 547
  Top = 236
  Width = 400
  Height = 247
  Caption = 'Dep'#243'sito Albar'#225'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 392
    Height = 26
    EdgeBorders = [ebBottom]
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TButtCrear: TToolButton
      Left = 0
      Top = 0
      Hint = 'Crear dep'#243'sito de Albar'#225'n'
      Caption = 'Crear'
      ImageIndex = 19
      OnClick = TButtCrearClick
    end
    object TButtEliminar: TToolButton
      Left = 23
      Top = 0
      Hint = 'Eliminar Dep'#243'sito'
      Caption = 'Eliminar'
      ImageIndex = 27
      OnClick = TButtEliminarClick
    end
    object TButtSalir: TToolButton
      Left = 46
      Top = 0
      Hint = 'Abandonar esta ventana'
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TButtSalirClick
    end
    object TButtSep: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object LRigAlbaran: TLFLabel
      Left = 77
      Top = 0
      Width = 62
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'Albar'#225'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object LFDBERigAlb: TLFDbedit
      Left = 139
      Top = 0
      Width = 103
      Height = 22
      TabStop = False
      AutoSize = False
      Color = clInfoBk
      DataField = 'RIG'
      DataSource = DMAlbaranes.DSQMCabecera
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object PMain: TLFPanel
    Left = 0
    Top = 26
    Width = 392
    Height = 194
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object LAlmacen: TLFLabel
      Left = 50
      Top = 73
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alm. Dep'#243'sito'
    end
    object LMovDeposito: TLFLabel
      Left = 47
      Top = 96
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Mov. Dep'#243'sito'
    end
    object SBVerMovStock: TSpeedButton
      Left = 121
      Top = 94
      Width = 54
      Height = 21
      Hint = 'Doble click para ver el movimiento generado'
      GroupIndex = -1
      Down = True
      OnDblClick = SBVerMovStockDblClick
    end
    object EFAlmacen: TLFEditFind2000
      Left = 121
      Top = 69
      Width = 55
      Height = 21
      TabOrder = 0
      OnChange = EFAlmacenChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      Campos_Desplegar.Strings = (
        'ALMACEN'
        'TITULO')
      CampoADevolver = 'ALMACEN'
      CampoNum = 'ALMACEN'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'DEPOSITO=1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ALMACEN')
      Filtros = [obEmpresa]
      Entorno = DMAlbaranes.EntornoDoc
    end
    object LFEAlmacenTit: TLFEdit
      Left = 177
      Top = 69
      Width = 162
      Height = 21
      TabStop = False
      Color = clInfoBk
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
    object LFDBEMovDeposito: TLFDbedit
      Left = 121
      Top = 94
      Width = 54
      Height = 21
      TabStop = False
      Color = clAqua
      DataField = 'NUM_MOV_DEPOSITO'
      DataSource = DMAlbaranes.DSQMCabecera
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
  end
end
